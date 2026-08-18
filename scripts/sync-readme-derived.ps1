[CmdletBinding()]
param()

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

$repoRoot = Split-Path -Parent $PSScriptRoot
$readmePath = Join-Path $repoRoot 'README.md'
$records = @(Import-Csv -LiteralPath (Join-Path $repoRoot 'data/census.csv'))
$candidates = @(Import-Csv -LiteralPath (Join-Path $repoRoot 'data/candidates.csv'))
$organizations = @(Import-Csv -LiteralPath (Join-Path $repoRoot 'data/organizations.csv'))
$batches = @(Import-Csv -LiteralPath (Join-Path $repoRoot 'data/discovery-batches.csv'))
$waves = @(Import-Csv -LiteralPath (Join-Path $repoRoot 'data/verification-waves.csv'))
$saturation = @(Import-Csv -LiteralPath (Join-Path $repoRoot 'data/saturation-strata.csv'))
$taxonomy = Get-Content -LiteralPath (Join-Path $repoRoot 'data/taxonomy.json') -Raw | ConvertFrom-Json
$readme = (Get-Content -LiteralPath $readmePath -Raw) -replace "`r`n", "`n"

function Split-Ids {
    param([AllowEmptyString()][string]$Value)
    if ([string]::IsNullOrWhiteSpace($Value)) { return @() }
    return @($Value.Split('|', [StringSplitOptions]::RemoveEmptyEntries))
}

function Uppercase-First {
    param([string]$Value)
    if ([string]::IsNullOrEmpty($Value)) { return $Value }
    return $Value.Substring(0, 1).ToUpperInvariant() + $Value.Substring(1)
}

function Replace-One {
    param([string]$Pattern, [string]$Replacement, [string]$Label)
    $regex = [regex]::new($Pattern)
    $matches = $regex.Matches($script:readme)
    if ($matches.Count -ne 1) {
        throw "Expected one README match for $Label; found $($matches.Count)."
    }
    $script:readme = $regex.Replace($script:readme, $Replacement, 1)
}

function Set-BoldCountRow {
    param([string]$Label, [string]$Value)
    $escaped = [regex]::Escape($Label)
    Replace-One "(?m)^(\| $escaped \| )\*\*[^*]+\*\*( \|)" "`${1}**$Value**`${2}" "count row $Label"
}

function Set-TwoCountRow {
    param([string]$Label, [int]$Primary, [int]$Adoption)
    $escaped = [regex]::Escape($Label)
    Replace-One "(?m)^(\| $escaped \| )\d+( \| )\d+( \|)" "`${1}$Primary`${2}$Adoption`${3}" "two-count row $Label"
}

function Set-OneCountRow {
    param([string]$Label, [int]$Count)
    $escaped = [regex]::Escape($Label)
    Replace-One "(?m)^(\| $escaped \| )\d+( \|)$" "`${1}$Count`${2}" "one-count row $Label"
}

function Get-BatchStats {
    param([object[]]$Rows)

    $firstSeen = 0
    $repeated = 0
    foreach ($row in $Rows) {
        $firstSeen += @(Split-Ids $row.new_candidate_refs).Count
        $repeated += @(Split-Ids $row.repeat_candidate_refs).Count
    }

    return [pscustomobject]@{
        Batches = $Rows.Count
        Cards = [int](($Rows | Measure-Object result_cards_reviewed -Sum).Sum)
        FirstSeen = $firstSeen
        Repeated = $repeated
    }
}

function Set-ChannelStatsRow {
    param([string]$Label, [pscustomobject]$Stats)
    $escaped = [regex]::Escape($Label)
    Replace-One "(?m)^\| $escaped \| \d+ \| \d+ \| \d+ \| \d+ \|$" "| $Label | $($Stats.Batches) | $($Stats.Cards) | $($Stats.FirstSeen) | $($Stats.Repeated) |" "channel row $Label"
}

$included = @($candidates | Where-Object status -eq 'included').Count
$pending = @($candidates | Where-Object status -eq 'pending').Count
$duplicates = @($candidates | Where-Object status -eq 'duplicate').Count
$excluded = @($candidates | Where-Object status -eq 'excluded').Count
$openPool = $included + $pending
$knownRegion = @($candidates | Where-Object team_region -ne 'unknown').Count
$unknownRegion = @($candidates | Where-Object team_region -eq 'unknown').Count
$legacy = @($candidates | Where-Object first_seen_batch -eq 'LEGACY-000').Count
$reproducibleBatches = @($batches | Where-Object batch_id -ne 'LEGACY-000').Count
$cards = ($batches | Where-Object batch_id -ne 'LEGACY-000' | Measure-Object result_cards_reviewed -Sum).Sum
$firstSeenAfterLegacy = $candidates.Count - $legacy
$includedAfterLegacy = $included - $legacy
$source = @($records | Where-Object evidence_depth -eq 'source').Count
$architecture = @($records | Where-Object evidence_depth -eq 'architecture').Count
$active = @($records | Where-Object lifecycle -eq 'active').Count
$transition = @($records | Where-Object lifecycle -eq 'active-transition').Count
$historical = @($records | Where-Object lifecycle -eq 'historical').Count
$sunsetting = @($records | Where-Object lifecycle -eq 'sunsetting').Count
$lineages = @($records.team_lineage | Sort-Object -Unique).Count
$waveCount = @($waves.wave_id | Sort-Object -Unique).Count
$activeStrata = @($saturation | Where-Object state -eq 'active').Count
$pausedStrata = @($saturation | Where-Object state -eq 'paused').Count
$blockedStrata = @($saturation | Where-Object state -eq 'blocked').Count
$totalStrata = $saturation.Count

$webStats = Get-BatchStats @($batches | Where-Object channel -in @('web-search', 'web-search-and-figma-forum'))
$githubStats = Get-BatchStats @($batches | Where-Object channel -in @('github-search', 'github-repository-search'))
$directoryStats = Get-BatchStats @($batches | Where-Object channel -eq 'product-directory-search')
$packageStats = Get-BatchStats @($batches | Where-Object channel -eq 'package-registry')
$followupStats = Get-BatchStats @($batches | Where-Object {
    $_.batch_id -ne 'LEGACY-000' -and
    $_.channel -notin @('web-search', 'web-search-and-figma-forum', 'github-search', 'github-repository-search', 'product-directory-search', 'package-registry')
})

Replace-One '(?m)^\*\*Snapshot:\*\* .+$' "**Snapshot:** $($taxonomy.snapshot) · **Schema:** v$($taxonomy.schemaVersion) · **Verified records:** $($records.Count) · **Candidate register:** $($candidates.Count) · **Reproducible discovery batches:** $reproducibleBatches" 'snapshot line'
Replace-One '(?m)^(\| How many global teams or products exist\? \| \*\*Not estimated\.\*\* This repository has )\d+( verified records and )\d+( unresolved plausible candidates\.)' "`${1}$($records.Count)`${2}$pending`${3}" 'global answer counts'
Replace-One '(?m)^\| How complete is discovery\? \|.*$' "| How complete is discovery? | $reproducibleBatches reproducible batches reviewed $cards result cards and retained $firstSeenAfterLegacy candidates beyond the $legacy seeds. | $activeStrata of $totalStrata declared strata remain active; a paused stratum is only a local stopping decision, never a global recall estimate. |" 'discovery completeness answer'
Replace-One '(?m)^(\| How many definitions, forms and architectures exist\? \| The )\d+( verified records currently require )' "`${1}$($records.Count)`${2}" 'taxonomy answer count'
Replace-One '(?m)^(\| Where are the teams\? \| Only )\d+( of )\d+( candidate rows currently have first-party region evidence; )\d+( remain unknown\.)' "`${1}$knownRegion`${2}$($candidates.Count)`${3}$unknownRegion`${4}" 'region answer counts'
Replace-One 'The correct conclusion is therefore not “there are \d+ products worldwide\.”' ('The correct conclusion is therefore not “there are {0} products worldwide.”' -f $records.Count) 'global conclusion count'
Replace-One '(?m)^(> We have a reproducible, expanding observation system; its current verified sample contains )\d+( records, its open candidate register contains )\d+( rows,)' "`${1}$($records.Count)`${2}$($candidates.Count) rows," 'observation-system counts'

Set-BoldCountRow 'Legacy seed imports' $legacy
Set-BoldCountRow 'Reproducible discovery batches' $reproducibleBatches
Set-BoldCountRow 'Search result cards reviewed' $cards
Set-BoldCountRow 'First-seen candidates after the legacy import' ($candidates.Count - $legacy)
Set-BoldCountRow 'Candidate-register rows' $candidates.Count
Set-BoldCountRow 'Open plausible pool' $openPool
Set-BoldCountRow 'Verified records' $included
Set-BoldCountRow 'Pending candidates' $pending
Set-BoldCountRow 'Duplicate decisions' $duplicates
Set-BoldCountRow 'Exclusion decisions' $excluded
Set-BoldCountRow 'Candidates with team-region evidence' $knownRegion
Set-BoldCountRow 'Candidates with unknown team region' $unknownRegion

Replace-One '(?m)^\| Reproducible discovery batches \| \*\*[^*]+\*\* \|.*$' "| Reproducible discovery batches | **$reproducibleBatches** | Search batches plus explicit source, companion, migration and lineage follow-ups |" 'discovery batch interpretation'
Replace-One '(?m)^\| Candidate-register rows \| \*\*[^*]+\*\* \|.*$' "| Candidate-register rows | **$($candidates.Count)** | $legacy legacy seeds plus $firstSeenAfterLegacy reproducibly discovered candidates |" 'candidate row interpretation'
Replace-One '(?m)^\| Open plausible pool \| \*\*[^*]+\*\* \|.*$' "| Open plausible pool | **$openPool** | $included included and $pending pending canonical candidates at this snapshot |" 'open pool interpretation'
Replace-One '(?m)^\| Verified records \| \*\*[^*]+\*\* \|.*$' "| Verified records | **$included** | $legacy legacy records plus $includedAfterLegacy records included through the reproducible protocol |" 'verified record interpretation'

Set-ChannelStatsRow 'General and language/domain web search' $webStats
Set-ChannelStatsRow 'GitHub README/repository search' $githubStats
Set-ChannelStatsRow 'Product launch directory' $directoryStats
Set-ChannelStatsRow 'npm package registry' $packageStats
Set-ChannelStatsRow 'Recursive source and lineage follow-up' $followupStats

Replace-One '(?m)^These counts describe the \d+ dossier-backed records only\.' "These counts describe the $($records.Count) dossier-backed records only." 'analytical-sample intro'
Set-BoldCountRow 'Canonical products / projects' $records.Count
Set-BoldCountRow 'Publicly attributable team units' "$($organizations.Count)–$lineages"
Replace-One '(?m)^(\| Publicly attributable team units \| \*\*[^*]+\*\* \| )[^|]+( \|)$' "`${1}$($organizations.Count) organization/maintainer umbrellas or $lineages product/maintainer lineages; not internal squad headcount`${2}" 'team-unit detail'
Set-BoldCountRow 'Product or maintainer lineages' $lineages
Set-BoldCountRow 'Organizations / maintainer umbrellas' $organizations.Count
Set-BoldCountRow 'Operational definitions of Design' $taxonomy.designDefinitions.Count
Set-BoldCountRow 'Primary product forms' $taxonomy.productForms.Count
Set-BoldCountRow 'Decisive architecture families' $taxonomy.architectureFamilies.Count
Set-BoldCountRow 'Source-level dossiers' $source
Set-BoldCountRow 'Architecture-level dossiers' $architecture
Set-BoldCountRow 'Active or actively transitioning records' ($active + $transition)
Set-BoldCountRow 'Historical or sunsetting records' ($historical + $sunsetting)
Replace-One '(?m)^(\| Active or actively transitioning records \| \*\*[^*]+\*\* \| )[^|]+( \|)$' "`${1}$active active and $transition active-transition records`${2}" 'active-lifecycle detail'
Replace-One '(?m)^(\| Historical or sunsetting records \| \*\*[^*]+\*\* \| )[^|]+( \|)$' "`${1}$historical historical and $sunsetting sunsetting records preserved as lineage evidence`${2}" 'historical-lifecycle detail'

$definitionNames = @{}
foreach ($definition in $taxonomy.designDefinitions) {
    $definitionNames[$definition.id] = Uppercase-First ($definition.title -replace '^Design as ', '')
    $primary = @($records | Where-Object primary_definition -eq $definition.id).Count
    $adoption = @($records | Where-Object {
        (@($_.primary_definition) + @(Split-Ids $_.additional_definitions)) -contains $definition.id
    }).Count
    Set-TwoCountRow $definitionNames[$definition.id] $primary $adoption
}

$formNames = @{}
foreach ($form in $taxonomy.productForms) {
    $formNames[$form.id] = $form.title
    Set-OneCountRow $form.title @($records | Where-Object product_form -eq $form.id).Count
}

$architectureNames = @{}
foreach ($family in $taxonomy.architectureFamilies) {
    $architectureNames[$family.id] = $family.title
    $primary = @($records | Where-Object primary_architecture -eq $family.id).Count
    $adoption = @($records | Where-Object {
        (@($_.primary_architecture) + @(Split-Ids $_.additional_architectures)) -contains $family.id
    }).Count
    Set-TwoCountRow $family.title $primary $adoption
}

$sumPattern = 'Primary counts sum to \d+'
$sumMatches = [regex]::Matches($readme, $sumPattern)
if ($sumMatches.Count -ne 2) { throw "Expected two primary-count sum statements; found $($sumMatches.Count)." }
$readme = [regex]::Replace($readme, $sumPattern, "Primary counts sum to $($records.Count)")
Replace-One '(?m)^5\. \*\*Open implementation evidence[^\r\n]+$' "5. **Open implementation evidence dominates this snapshot.** $source of $($records.Count) records are source-level, reflecting repository-heavy expansion; the remaining closed systems must retain explicit internal unknowns." 'source-depth conclusion'
Replace-One '(It cannot treat )\d+( verified records, )\d+( open plausible objects or )\d+( candidate rows)' "`${1}$($records.Count)`${2}$openPool`${3}$($candidates.Count)`${4}" 'cannot-infer counts'
Replace-One '(?m)^This v0\.3 working snapshot contains[^\r\n]+$' "This v0.3 working snapshot contains $reproducibleBatches reproducible discovery batches, $waveCount verification-wave identifiers and $totalStrata declared saturation strata ($activeStrata active, $pausedStrata paused and $blockedStrata blocked). It does **not** complete the world landscape. The durable result is the research apparatus: seeds are labeled as seeds, candidates and negative decisions remain inspectable, discovery novelty is measurable, verification decisions are reproducible, taxonomies are allowed to change, and the report states what the evidence cannot yet support." 'current research status'

$organizationNames = @{}
foreach ($organization in $organizations) { $organizationNames[$organization.id] = $organization.name }
$registryHeader = '| Product | Organization | Primary Design definition | Primary product form | Primary architecture | Evidence · lifecycle |'
$headerIndex = $readme.IndexOf($registryHeader, [StringComparison]::Ordinal)
if ($headerIndex -lt 0) { throw 'README registry header not found.' }
$separatorEnd = $readme.IndexOf("`n", $readme.IndexOf("`n", $headerIndex) + 1)
if ($separatorEnd -lt 0) { throw 'README registry separator not found.' }
$rowsStart = $separatorEnd + 1
$rowsEnd = $readme.IndexOf("`n`n", $rowsStart)
if ($rowsEnd -lt 0) { throw 'README registry terminator not found.' }
$slugPaths = @{}
Get-Content -LiteralPath (Join-Path $repoRoot 'data/slug-paths.json') -Raw | ConvertFrom-Json | ForEach-Object {
    foreach ($prop in $_.PSObject.Properties) { $slugPaths[$prop.Name] = $prop.Value }
}
$registryRows = foreach ($record in $records) {
    $rel = if ($slugPaths.ContainsKey($record.slug)) { $slugPaths[$record.slug] } else { $record.slug }
    "| [$($record.product)](projects/$rel/) | $($organizationNames[$record.organization]) | $($definitionNames[$record.primary_definition]) | $($formNames[$record.product_form]) | $($architectureNames[$record.primary_architecture]) | $($record.evidence_depth) · $($record.lifecycle) |"
}
$readme = $readme.Substring(0, $rowsStart) + ($registryRows -join "`n") + $readme.Substring($rowsEnd)

[IO.File]::WriteAllText($readmePath, ($readme -replace "`n", "`r`n"), [Text.UTF8Encoding]::new($false))
Write-Output "Synchronized README derived data for $($records.Count) records and $($candidates.Count) candidates."
