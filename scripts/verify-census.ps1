[CmdletBinding()]
param(
    [switch]$Json
)

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

$repoRoot = Split-Path -Parent $PSScriptRoot
$censusPath = Join-Path $repoRoot 'data/census.csv'
$organizationsPath = Join-Path $repoRoot 'data/organizations.csv'
$identityMapPath = Join-Path $repoRoot 'data/identity-map.csv'
$taxonomyPath = Join-Path $repoRoot 'data/taxonomy.json'
$candidatesPath = Join-Path $repoRoot 'data/candidates.csv'
$discoveryBatchesPath = Join-Path $repoRoot 'data/discovery-batches.csv'
$verificationWavesPath = Join-Path $repoRoot 'data/verification-waves.csv'
$saturationStrataPath = Join-Path $repoRoot 'data/saturation-strata.csv'
$discoveryProtocolPath = Join-Path $repoRoot 'DISCOVERY.md'
$projectsPath = Join-Path $repoRoot 'projects'
$rootReadmePath = Join-Path $repoRoot 'README.md'

$records = @(Import-Csv -LiteralPath $censusPath)
$organizations = @(Import-Csv -LiteralPath $organizationsPath)
$identityMap = @(Import-Csv -LiteralPath $identityMapPath)
$candidates = @(Import-Csv -LiteralPath $candidatesPath)
$discoveryBatches = @(Import-Csv -LiteralPath $discoveryBatchesPath)
$verificationWaves = @(Import-Csv -LiteralPath $verificationWavesPath)
$saturationStrata = @(Import-Csv -LiteralPath $saturationStrataPath)
$taxonomy = Get-Content -LiteralPath $taxonomyPath -Raw | ConvertFrom-Json
$errors = [System.Collections.Generic.List[string]]::new()

function Split-Ids {
    param([AllowEmptyString()][string]$Value)

    if ([string]::IsNullOrWhiteSpace($Value)) {
        return @()
    }

    return @($Value.Split('|', [System.StringSplitOptions]::RemoveEmptyEntries))
}

function Split-Refs {
    param([AllowEmptyString()][string]$Value)

    if ([string]::IsNullOrWhiteSpace($Value)) {
        return @()
    }

    return @($Value.Split('|', [System.StringSplitOptions]::RemoveEmptyEntries))
}

function Test-KnownIds {
    param(
        [string]$Slug,
        [string]$Field,
        [string[]]$Ids,
        [string[]]$Allowed
    )

    foreach ($id in $Ids) {
        if ($id -notin $Allowed) {
            $errors.Add("$Slug has unknown $Field id '$id'.")
        }
    }

    $duplicates = @($Ids | Group-Object | Where-Object Count -gt 1)
    foreach ($duplicate in $duplicates) {
        $errors.Add("$Slug repeats $Field id '$($duplicate.Name)'.")
    }
}

$definitionIds = @($taxonomy.designDefinitions.id)
$productFormIds = @($taxonomy.productForms.id)
$architectureIds = @($taxonomy.architectureFamilies.id)
$evidenceDepths = @($taxonomy.evidenceDepths)
$lifecycles = @($taxonomy.lifecycles)
$censusBoundaryFields = @('includeWhen', 'excludeWhen', 'knownCoverageLimits')
foreach ($field in $censusBoundaryFields) {
    $values = @($taxonomy.censusBoundary.$field)
    if ($values.Count -eq 0 -or @($values | Where-Object { [string]::IsNullOrWhiteSpace($_) }).Count -gt 0) {
        $errors.Add("Taxonomy censusBoundary.$field must contain non-empty tests.")
    }
}
$organizationNames = @{}
foreach ($organization in $organizations) {
    $organizationNames[$organization.id] = $organization.name
}
$definitionNames = @{}
foreach ($definition in $taxonomy.designDefinitions) {
    $definitionNames[$definition.id] = $definition.title -replace '^Design as ', ''
}
$productFormNames = @{}
foreach ($form in $taxonomy.productForms) {
    $productFormNames[$form.id] = $form.title
}
$architectureNames = @{}
foreach ($architecture in $taxonomy.architectureFamilies) {
    $architectureNames[$architecture.id] = $architecture.title
}

$duplicateSlugs = @($records | Group-Object slug | Where-Object Count -gt 1)
foreach ($duplicate in $duplicateSlugs) {
    $errors.Add("Duplicate census slug '$($duplicate.Name)'.")
}

$duplicateOrganizationIds = @($organizations | Group-Object id | Where-Object Count -gt 1)
foreach ($duplicate in $duplicateOrganizationIds) {
    $errors.Add("Duplicate organization id '$($duplicate.Name)'.")
}

$organizationIds = @($organizations.id)
foreach ($unknown in @($records.organization | Sort-Object -Unique | Where-Object { $_ -notin $organizationIds })) {
    $errors.Add("Census organization '$unknown' is missing from data/organizations.csv.")
}
foreach ($unused in @($organizationIds | Where-Object { $_ -notin $records.organization })) {
    $errors.Add("Organization '$unused' has no census record.")
}

$duplicateEncounteredNames = @($identityMap | Group-Object encountered_name | Where-Object Count -gt 1)
foreach ($duplicate in $duplicateEncounteredNames) {
    $errors.Add("Identity map repeats encountered name '$($duplicate.Name)'.")
}

if (-not (Test-Path -LiteralPath $discoveryProtocolPath)) {
    $errors.Add('DISCOVERY.md is missing.')
}

$candidateStatuses = @('pending', 'included', 'duplicate', 'excluded')
$candidateEvidenceKinds = @('legacy-dossier', 'first-party', 'source-repository', 'package-registry', 'secondary-discovery', 'research-paper')
$candidateIds = @($candidates.candidate_id)
$batchIds = @($discoveryBatches.batch_id)

foreach ($duplicate in @($candidates | Group-Object candidate_id | Where-Object Count -gt 1)) {
    $errors.Add("Candidate register repeats id '$($duplicate.Name)'.")
}
foreach ($duplicate in @($discoveryBatches | Group-Object batch_id | Where-Object Count -gt 1)) {
    $errors.Add("Discovery batch ledger repeats id '$($duplicate.Name)'.")
}

foreach ($candidate in $candidates) {
    foreach ($requiredField in @('candidate_id', 'display_name', 'status', 'first_seen_batch', 'discovery_url', 'evidence_kind', 'team_region', 'reviewed_on', 'decision_reason')) {
        if ([string]::IsNullOrWhiteSpace($candidate.$requiredField)) {
            $errors.Add("Candidate '$($candidate.candidate_id)' has an empty required field '$requiredField'.")
        }
    }

    if ($candidate.status -notin $candidateStatuses) {
        $errors.Add("Candidate '$($candidate.candidate_id)' has unknown status '$($candidate.status)'.")
    }
    if ($candidate.evidence_kind -notin $candidateEvidenceKinds) {
        $errors.Add("Candidate '$($candidate.candidate_id)' has unknown evidence kind '$($candidate.evidence_kind)'.")
    }
    if ($candidate.first_seen_batch -notin $batchIds) {
        $errors.Add("Candidate '$($candidate.candidate_id)' references unknown first-seen batch '$($candidate.first_seen_batch)'.")
    }

    $reviewedDate = [datetime]::MinValue
    if (-not [datetime]::TryParseExact($candidate.reviewed_on, 'yyyy-MM-dd', [Globalization.CultureInfo]::InvariantCulture, [Globalization.DateTimeStyles]::None, [ref]$reviewedDate)) {
        $errors.Add("Candidate '$($candidate.candidate_id)' has invalid reviewed_on '$($candidate.reviewed_on)'.")
    }

    if ($candidate.team_region -ne 'unknown' -and [string]::IsNullOrWhiteSpace($candidate.region_evidence_url)) {
        $errors.Add("Candidate '$($candidate.candidate_id)' assigns team_region '$($candidate.team_region)' without region evidence.")
    }

    $target = $candidate.resolution_target
    if ($candidate.status -eq 'included') {
        if ($target -notmatch '^census:(.+)$') {
            $errors.Add("Included candidate '$($candidate.candidate_id)' must resolve to census:<slug>.")
        }
        elseif ($Matches[1] -notin $records.slug) {
            $errors.Add("Included candidate '$($candidate.candidate_id)' resolves to missing census slug '$($Matches[1])'.")
        }
    }
    elseif ($candidate.status -eq 'duplicate') {
        if ([string]::IsNullOrWhiteSpace($target)) {
            $errors.Add("Duplicate candidate '$($candidate.candidate_id)' has no resolution target.")
        }
        elseif ($target -match '^census:(.+)$') {
            if ($Matches[1] -notin $records.slug) {
                $errors.Add("Duplicate candidate '$($candidate.candidate_id)' resolves to missing census slug '$($Matches[1])'.")
            }
        }
        elseif ($target -match '^candidate:(.+)$') {
            if ($Matches[1] -notin $candidateIds) {
                $errors.Add("Duplicate candidate '$($candidate.candidate_id)' resolves to missing candidate '$($Matches[1])'.")
            }
            elseif ($Matches[1] -eq $candidate.candidate_id) {
                $errors.Add("Duplicate candidate '$($candidate.candidate_id)' resolves to itself.")
            }
        }
        else {
            $errors.Add("Duplicate candidate '$($candidate.candidate_id)' has invalid resolution target '$target'.")
        }
    }
    elseif (-not [string]::IsNullOrWhiteSpace($target)) {
        $errors.Add("Candidate '$($candidate.candidate_id)' with status '$($candidate.status)' must not have a resolution target.")
    }

    if ($candidate.discovery_url -notmatch '^[a-z]+://') {
        $candidateEvidencePath = Join-Path $repoRoot $candidate.discovery_url.Replace('/', [IO.Path]::DirectorySeparatorChar)
        if (-not (Test-Path -LiteralPath $candidateEvidencePath)) {
            $errors.Add("Candidate '$($candidate.candidate_id)' references missing local discovery evidence '$($candidate.discovery_url)'.")
        }
    }
}

$candidateNewBatchMentions = @{}
foreach ($batch in $discoveryBatches) {
    foreach ($requiredField in @('batch_id', 'executed_on', 'channel', 'language_scope', 'region_scope', 'query_count', 'result_cards_reviewed', 'queries', 'limitations')) {
        if ([string]::IsNullOrWhiteSpace($batch.$requiredField)) {
            $errors.Add("Discovery batch '$($batch.batch_id)' has an empty required field '$requiredField'.")
        }
    }

    $batchDate = [datetime]::MinValue
    if (-not [datetime]::TryParseExact($batch.executed_on, 'yyyy-MM-dd', [Globalization.CultureInfo]::InvariantCulture, [Globalization.DateTimeStyles]::None, [ref]$batchDate)) {
        $errors.Add("Discovery batch '$($batch.batch_id)' has invalid executed_on '$($batch.executed_on)'.")
    }

    $queryCount = 0
    $resultCount = 0
    if (-not [int]::TryParse($batch.query_count, [ref]$queryCount) -or $queryCount -lt 0) {
        $errors.Add("Discovery batch '$($batch.batch_id)' has invalid query_count '$($batch.query_count)'.")
    }
    if (-not [int]::TryParse($batch.result_cards_reviewed, [ref]$resultCount) -or $resultCount -lt 0) {
        $errors.Add("Discovery batch '$($batch.batch_id)' has invalid result_cards_reviewed '$($batch.result_cards_reviewed)'.")
    }

    if ($batch.batch_id -ne 'LEGACY-000') {
        $queries = @(Split-Refs $batch.queries)
        if ($queries.Count -ne $queryCount) {
            $errors.Add("Discovery batch '$($batch.batch_id)' declares $queryCount queries but records $($queries.Count).")
        }
    }

    $newRefs = @(Split-Refs $batch.new_candidate_refs)
    $repeatRefs = @(Split-Refs $batch.repeat_candidate_refs)
    foreach ($duplicate in @($newRefs | Group-Object | Where-Object Count -gt 1)) {
        $errors.Add("Discovery batch '$($batch.batch_id)' repeats new candidate ref '$($duplicate.Name)'.")
    }
    foreach ($duplicate in @($repeatRefs | Group-Object | Where-Object Count -gt 1)) {
        $errors.Add("Discovery batch '$($batch.batch_id)' repeats prior candidate ref '$($duplicate.Name)'.")
    }
    foreach ($overlap in @($newRefs | Where-Object { $_ -in $repeatRefs })) {
        $errors.Add("Discovery batch '$($batch.batch_id)' lists '$overlap' as both new and repeated.")
    }

    foreach ($ref in $newRefs) {
        if ($ref -notin $candidateIds) {
            $errors.Add("Discovery batch '$($batch.batch_id)' references unknown new candidate '$ref'.")
            continue
        }
        $candidate = $candidates | Where-Object candidate_id -eq $ref | Select-Object -First 1
        if ($candidate.first_seen_batch -ne $batch.batch_id) {
            $errors.Add("Candidate '$ref' says first seen in '$($candidate.first_seen_batch)' but is new in '$($batch.batch_id)'.")
        }
        if (-not $candidateNewBatchMentions.ContainsKey($ref)) {
            $candidateNewBatchMentions[$ref] = 0
        }
        $candidateNewBatchMentions[$ref]++
    }
    foreach ($ref in $repeatRefs) {
        if ($ref -notin $candidateIds) {
            $errors.Add("Discovery batch '$($batch.batch_id)' references unknown repeated candidate '$ref'.")
            continue
        }
        $candidate = $candidates | Where-Object candidate_id -eq $ref | Select-Object -First 1
        if ($candidate.first_seen_batch -eq $batch.batch_id) {
            $errors.Add("Candidate '$ref' cannot be both first seen and repeated within '$($batch.batch_id)'.")
        }
    }
}

$batchById = @{}
foreach ($batch in $discoveryBatches) { $batchById[$batch.batch_id] = $batch }
$saturationDimensions = @('channel', 'language', 'region', 'product-domain')
$saturationStates = @('active', 'paused', 'blocked')
$saturationAssessment = [ordered]@{}
foreach ($duplicate in @($saturationStrata | Group-Object stratum_id | Where-Object Count -gt 1)) {
    $errors.Add("Saturation register repeats stratum '$($duplicate.Name)'.")
}
foreach ($stratum in $saturationStrata) {
    foreach ($requiredField in @('stratum_id', 'dimension', 'label', 'state', 'scope', 'decision_basis', 'limitations')) {
        if ([string]::IsNullOrWhiteSpace($stratum.$requiredField)) {
            $errors.Add("Saturation stratum '$($stratum.stratum_id)' has an empty required field '$requiredField'.")
        }
    }
    if ($stratum.dimension -notin $saturationDimensions) {
        $errors.Add("Saturation stratum '$($stratum.stratum_id)' has unknown dimension '$($stratum.dimension)'.")
    }
    if ($stratum.state -notin $saturationStates) {
        $errors.Add("Saturation stratum '$($stratum.stratum_id)' has unknown state '$($stratum.state)'.")
    }

    $refs = @(Split-Refs $stratum.qualifying_batch_refs)
    if ($stratum.state -eq 'paused' -and $refs.Count -ne 3) {
        $errors.Add("Paused saturation stratum '$($stratum.stratum_id)' must cite exactly three qualifying batches.")
    }
    if ($stratum.state -ne 'paused' -and $refs.Count -gt 0) {
        $errors.Add("Non-paused saturation stratum '$($stratum.stratum_id)' must not claim qualifying batches.")
    }
    if ($stratum.state -eq 'paused' -and [string]::IsNullOrWhiteSpace($stratum.assessed_on)) {
        $errors.Add("Paused saturation stratum '$($stratum.stratum_id)' must record assessed_on.")
    }

    $metrics = @()
    foreach ($ref in $refs) {
        if (-not $batchById.ContainsKey($ref)) {
            $errors.Add("Saturation stratum '$($stratum.stratum_id)' references missing batch '$ref'.")
            continue
        }
        $batch = $batchById[$ref]
        $resultCount = [int]$batch.result_cards_reviewed
        $newCount = @(Split-Refs $batch.new_candidate_refs).Count
        $repeatCount = @(Split-Refs $batch.repeat_candidate_refs).Count
        $retainedCount = $newCount + $repeatCount
        $newYield = if ($resultCount -eq 0) { 1 } else { $newCount / $resultCount }
        $overlap = if ($retainedCount -eq 0) { 0 } else { $repeatCount / $retainedCount }
        $qualifies = $resultCount -ge 20 -and $retainedCount -ge 5 -and $newYield -le 0.10 -and $overlap -ge 0.70
        if (-not $qualifies) {
            $errors.Add("Paused saturation stratum '$($stratum.stratum_id)' cites non-qualifying batch '$ref'.")
        }
        $metrics += [ordered]@{
            batch = $ref
            cards = $resultCount
            retainedMentions = $retainedCount
            newCandidateYield = [math]::Round($newYield, 4)
            retainedMentionOverlap = [math]::Round($overlap, 4)
            qualifies = $qualifies
        }
    }

    if ($refs.Count -eq 3) {
        $batches = @($refs | ForEach-Object { $batchById[$_] })
        foreach ($field in @('channel', 'language_scope', 'region_scope')) {
            if (@($batches.$field | Sort-Object -Unique).Count -ne 1) {
                $errors.Add("Paused saturation stratum '$($stratum.stratum_id)' cites batches with different $field values.")
            }
        }
        $queryCounts = @($batches | ForEach-Object { [int]$_.query_count })
        if (($queryCounts | Measure-Object -Maximum).Maximum - ($queryCounts | Measure-Object -Minimum).Minimum -gt 1) {
            $errors.Add("Paused saturation stratum '$($stratum.stratum_id)' cites batches with materially different query counts.")
        }
    }
    $saturationAssessment[$stratum.stratum_id] = [ordered]@{
        dimension = $stratum.dimension
        label = $stratum.label
        state = $stratum.state
        qualifyingBatches = $refs
        metrics = $metrics
    }
}

foreach ($candidate in @($candidates | Where-Object first_seen_batch -ne 'LEGACY-000')) {
    $mentionCount = if ($candidateNewBatchMentions.ContainsKey($candidate.candidate_id)) { $candidateNewBatchMentions[$candidate.candidate_id] } else { 0 }
    if ($mentionCount -ne 1) {
        $errors.Add("Candidate '$($candidate.candidate_id)' must appear exactly once in a batch new_candidate_refs list; found $mentionCount.")
    }
}

$legacyBatches = @($discoveryBatches | Where-Object batch_id -eq 'LEGACY-000')
$legacyCandidates = @($candidates | Where-Object first_seen_batch -eq 'LEGACY-000')
if ($legacyBatches.Count -ne 1) {
    $errors.Add("Discovery ledger must contain exactly one LEGACY-000 import batch; found $($legacyBatches.Count).")
}
else {
    $legacyCardCount = [int]$legacyBatches[0].result_cards_reviewed
    if ($legacyCardCount -ne $legacyCandidates.Count) {
        $errors.Add("LEGACY-000 declares $legacyCardCount imported records but candidate register contains $($legacyCandidates.Count) legacy seeds.")
    }
}
foreach ($candidate in $legacyCandidates) {
    if ($candidate.status -ne 'included' -or $candidate.evidence_kind -ne 'legacy-dossier') {
        $errors.Add("Legacy candidate '$($candidate.candidate_id)' must be an included legacy-dossier row.")
    }
}
foreach ($candidate in @($candidates | Where-Object first_seen_batch -ne 'LEGACY-000')) {
    if ($candidate.evidence_kind -eq 'legacy-dossier') {
        $errors.Add("Nonlegacy candidate '$($candidate.candidate_id)' cannot use legacy-dossier evidence.")
    }
}

foreach ($duplicate in @($verificationWaves | Group-Object wave_id, candidate_id | Where-Object Count -gt 1)) {
    $errors.Add("Verification ledger repeats wave/candidate pair '$($duplicate.Name)'.")
}
foreach ($review in $verificationWaves) {
    foreach ($requiredField in @('wave_id', 'candidate_id', 'selection_stratum', 'selection_reason', 'outcome', 'reviewed_on', 'decisive_evidence')) {
        if ([string]::IsNullOrWhiteSpace($review.$requiredField)) {
            $errors.Add("Verification review '$($review.wave_id)/$($review.candidate_id)' has an empty required field '$requiredField'.")
        }
    }

    $candidate = $candidates | Where-Object candidate_id -eq $review.candidate_id | Select-Object -First 1
    if ($null -eq $candidate) {
        $errors.Add("Verification review '$($review.wave_id)' references missing candidate '$($review.candidate_id)'.")
        continue
    }
    if ($review.outcome -notin $candidateStatuses) {
        $errors.Add("Verification review '$($review.wave_id)/$($review.candidate_id)' has unknown outcome '$($review.outcome)'.")
    }
    elseif ($review.outcome -ne $candidate.status) {
        $errors.Add("Verification review '$($review.wave_id)/$($review.candidate_id)' outcome '$($review.outcome)' disagrees with candidate status '$($candidate.status)'.")
    }

    $reviewedDate = [datetime]::MinValue
    if (-not [datetime]::TryParseExact($review.reviewed_on, 'yyyy-MM-dd', [Globalization.CultureInfo]::InvariantCulture, [Globalization.DateTimeStyles]::None, [ref]$reviewedDate)) {
        $errors.Add("Verification review '$($review.wave_id)/$($review.candidate_id)' has invalid reviewed_on '$($review.reviewed_on)'.")
    }
}

foreach ($candidate in @($candidates | Where-Object { $_.status -eq 'included' -and $_.first_seen_batch -ne 'LEGACY-000' })) {
    $reviewCount = @($verificationWaves | Where-Object candidate_id -eq $candidate.candidate_id).Count
    if ($reviewCount -lt 1) {
        $errors.Add("Newly included candidate '$($candidate.candidate_id)' has no verification-wave record.")
    }
}

$includedCandidateTargets = @($candidates | Where-Object status -eq 'included' | ForEach-Object { $_.resolution_target -replace '^census:', '' })
foreach ($slug in $records.slug) {
    $targetCount = @($includedCandidateTargets | Where-Object { $_ -eq $slug }).Count
    if ($targetCount -ne 1) {
        $errors.Add("Census slug '$slug' must have exactly one included candidate-register row; found $targetCount.")
    }
}
foreach ($identityDecision in $identityMap) {
    if ($identityDecision.canonical_slug -notin $records.slug) {
        $errors.Add("Identity map target '$($identityDecision.canonical_slug)' has no census record.")
    }
    if ([string]::IsNullOrWhiteSpace($identityDecision.decision) -or [string]::IsNullOrWhiteSpace($identityDecision.note)) {
        $errors.Add("Identity map entry '$($identityDecision.encountered_name)' is missing a decision or note.")
    }
}

$slugPaths = @{}
Get-Content -LiteralPath (Join-Path $repoRoot 'data/slug-paths.json') -Raw | ConvertFrom-Json | ForEach-Object {
    foreach ($prop in $_.PSObject.Properties) { $slugPaths[$prop.Name] = $prop.Value }
}
$directorySlugs = @(Get-ChildItem -LiteralPath $projectsPath -Recurse -Directory | Where-Object {
        Test-Path -LiteralPath (Join-Path $_.FullName 'README.md')
    } | Select-Object -ExpandProperty Name | Sort-Object)
$censusSlugs = @($records.slug | Sort-Object)

foreach ($missing in @($directorySlugs | Where-Object { $_ -notin $censusSlugs })) {
    $errors.Add("Project directory '$missing' is missing from data/census.csv.")
}
foreach ($extra in @($censusSlugs | Where-Object { -not $slugPaths.ContainsKey($_) -or -not (Test-Path -LiteralPath (Join-Path $projectsPath $slugPaths[$_])) })) {
    $errors.Add("Census slug '$extra' has no dossier at projects/$($slugPaths[$extra]).")
}

foreach ($record in $records) {
    foreach ($requiredField in @('slug', 'product', 'team_lineage', 'organization', 'primary_definition', 'product_form', 'primary_architecture', 'evidence_depth', 'lifecycle')) {
        if ([string]::IsNullOrWhiteSpace($record.$requiredField)) {
            $errors.Add("Census record '$($record.slug)' has an empty required field '$requiredField'.")
        }
    }

    $additionalDefinitions = @(Split-Ids $record.additional_definitions)
    $additionalArchitectures = @(Split-Ids $record.additional_architectures)

    Test-KnownIds $record.slug 'primary_definition' @($record.primary_definition) $definitionIds
    Test-KnownIds $record.slug 'additional_definitions' $additionalDefinitions $definitionIds
    Test-KnownIds $record.slug 'product_form' @($record.product_form) $productFormIds
    Test-KnownIds $record.slug 'primary_architecture' @($record.primary_architecture) $architectureIds
    Test-KnownIds $record.slug 'additional_architectures' $additionalArchitectures $architectureIds

    if ($record.primary_definition -in $additionalDefinitions) {
        $errors.Add("$($record.slug) repeats its primary design definition in additional_definitions.")
    }
    if ($record.primary_architecture -in $additionalArchitectures) {
        $errors.Add("$($record.slug) repeats its primary architecture in additional_architectures.")
    }
    if ($record.evidence_depth -notin $evidenceDepths) {
        $errors.Add("$($record.slug) has unknown evidence depth '$($record.evidence_depth)'.")
    }
    if ($record.lifecycle -notin $lifecycles) {
        $errors.Add("$($record.slug) has unknown lifecycle '$($record.lifecycle)'.")
    }

    $dossierReadmePath = if ($slugPaths.ContainsKey($record.slug)) {
        Join-Path (Join-Path $projectsPath $slugPaths[$record.slug]) 'README.md'
    } else {
        Join-Path $projectsPath "$($record.slug)/README.md"
    }
    if (Test-Path -LiteralPath $dossierReadmePath) {
        $dossierRaw = Get-Content -LiteralPath $dossierReadmePath -Raw
        $header = ((Get-Content -LiteralPath $dossierReadmePath -TotalCount 8) -join "`n")
        $documentDepth = if ($header -match 'Research status:\s*\*\*Source-level') {
            'source'
        }
        elseif ($header -match 'Research status:\s*\*\*Architecture-level') {
            'architecture'
        }
        else {
            $null
        }

        if ($null -eq $documentDepth) {
            $errors.Add("$($record.slug) has no recognized research-status header.")
        }
        elseif ($documentDepth -ne $record.evidence_depth) {
            $errors.Add("$($record.slug) census depth '$($record.evidence_depth)' disagrees with dossier depth '$documentDepth'.")
        }

        if ([regex]::Matches($dossierRaw, 'https?://').Count -lt 2) {
            $errors.Add("$($record.slug) dossier has fewer than two external evidence links.")
        }
        if ($record.evidence_depth -eq 'source' -and $dossierRaw -notmatch '(?i)\b[0-9a-f]{40}\b') {
            $errors.Add("$($record.slug) is Source-level but contains no full 40-character source revision.")
        }
    }
}

$markdownFiles = @(Get-ChildItem -LiteralPath $repoRoot -Recurse -File -Filter '*.md' | Where-Object {
        $_.FullName -notmatch '[\\/]\.git[\\/]'
    })
foreach ($markdownFile in $markdownFiles) {
    $markdownRaw = Get-Content -LiteralPath $markdownFile.FullName -Raw
    foreach ($match in [regex]::Matches($markdownRaw, '!?(?:\[[^\]]*\])\((?<target>[^)]+)\)')) {
        $target = $match.Groups['target'].Value.Trim()
        if ($target.StartsWith('<') -and $target.Contains('>')) {
            $target = $target.Substring(1, $target.IndexOf('>') - 1)
        }
        else {
            $target = ($target -split '\s+', 2)[0]
        }

        if ([string]::IsNullOrWhiteSpace($target) -or
            $target.StartsWith('#') -or
            $target.Contains(':')) {
            continue
        }

        $pathOnly = ($target -split '#', 2)[0]
        if ([string]::IsNullOrWhiteSpace($pathOnly)) {
            continue
        }

        try {
            $decodedPath = [Uri]::UnescapeDataString($pathOnly).Replace('/', [IO.Path]::DirectorySeparatorChar)
            $resolvedTarget = [IO.Path]::GetFullPath((Join-Path $markdownFile.DirectoryName $decodedPath))
            if (-not (Test-Path -LiteralPath $resolvedTarget)) {
                $relativeDocument = [IO.Path]::GetRelativePath($repoRoot, $markdownFile.FullName)
                $errors.Add("$relativeDocument has a missing local link target '$target'.")
            }
        }
        catch {
            $relativeDocument = [IO.Path]::GetRelativePath($repoRoot, $markdownFile.FullName)
            $errors.Add("$relativeDocument has an invalid local link target '$target'.")
        }
    }
}

$readmeLines = @(Get-Content -LiteralPath $rootReadmePath)
$registryHeaderLine = ($readmeLines | Select-String '^\| Product \| Organization \| Primary Design definition \| Primary product form \| Primary architecture \| Evidence · lifecycle \|').LineNumber
if ($null -eq $registryHeaderLine) {
    $errors.Add('README.md is missing the canonical evidence-registry table header.')
}
else {
    $registryRows = @{}
    for ($index = $registryHeaderLine + 1; $index -lt $readmeLines.Count; $index++) {
        $line = $readmeLines[$index]
        if ($line -notmatch '^\|') {
            break
        }
        if ($line -notmatch '^\| \[') {
            continue
        }

        $cells = @($line.Trim('|').Split('|') | ForEach-Object { $_.Trim() })
        $link = [regex]::Match($cells[0], '^\[([^\]]+)\]\((projects/[^)]+)/\)$')
        if (-not $link.Success) {
            $errors.Add("README registry row has an invalid project link: $line")
            continue
        }

        $slug = Split-Path -Leaf (Split-Path $link.Groups[2].Value)
        if ($registryRows.ContainsKey($slug)) {
            $errors.Add("README registry repeats '$slug'.")
            continue
        }
        $registryRows[$slug] = [ordered]@{
            product = $link.Groups[1].Value
            organization = $cells[1]
            definition = $cells[2]
            productForm = $cells[3]
            architecture = $cells[4]
            status = $cells[5]
        }
    }

    foreach ($record in $records) {
        if (-not $registryRows.ContainsKey($record.slug)) {
            $errors.Add("README registry is missing '$($record.slug)'.")
            continue
        }

        $row = $registryRows[$record.slug]
        $expected = [ordered]@{
            product = $record.product
            organization = $organizationNames[$record.organization]
            definition = $definitionNames[$record.primary_definition]
            productForm = $productFormNames[$record.product_form]
            architecture = $architectureNames[$record.primary_architecture]
            status = "$($record.evidence_depth) · $($record.lifecycle)"
        }
        foreach ($field in $expected.Keys) {
            if ($row[$field] -ne $expected[$field]) {
                $errors.Add("README registry '$($record.slug)' field '$field' is '$($row[$field])'; expected '$($expected[$field])'.")
            }
        }
    }

    foreach ($extra in @($registryRows.Keys | Where-Object { $_ -notin $censusSlugs })) {
        $errors.Add("README registry contains unknown slug '$extra'.")
    }
}

$allDefinitions = @(
    foreach ($record in $records) {
        $record.primary_definition
        Split-Ids $record.additional_definitions
    }
)
$allArchitectures = @(
    foreach ($record in $records) {
        $record.primary_architecture
        Split-Ids $record.additional_architectures
    }
)

$summary = [ordered]@{
    snapshot = $taxonomy.snapshot
    products = $records.Count
    productDirectories = $directorySlugs.Count
    teamLineages = @($records.team_lineage | Sort-Object -Unique).Count
    organizations = $organizations.Count
    publicTeamBoundary = [ordered]@{
        consolidatedOrganizations = $organizations.Count
        productOrMaintainerLineages = @($records.team_lineage | Sort-Object -Unique).Count
    }
    identityDecisions = $identityMap.Count
    discovery = [ordered]@{
        candidateRegisterRows = $candidates.Count
        openCanonicalPool = @($candidates | Where-Object status -in @('included', 'pending')).Count
        verifiedSample = @($candidates | Where-Object status -eq 'included').Count
        pending = @($candidates | Where-Object status -eq 'pending').Count
        duplicates = @($candidates | Where-Object status -eq 'duplicate').Count
        excluded = @($candidates | Where-Object status -eq 'excluded').Count
        batches = $discoveryBatches.Count
        reproducibleSearchBatches = @($discoveryBatches | Where-Object batch_id -ne 'LEGACY-000').Count
        searchResultCardsReviewed = ($discoveryBatches | Where-Object batch_id -ne 'LEGACY-000' | Measure-Object -Property result_cards_reviewed -Sum).Sum
        legacySeedImports = @($candidates | Where-Object first_seen_batch -eq 'LEGACY-000').Count
        unknownTeamRegion = @($candidates | Where-Object team_region -eq 'unknown').Count
        verificationWaves = @($verificationWaves.wave_id | Sort-Object -Unique).Count
        verificationReviews = $verificationWaves.Count
        verificationOutcomes = [ordered]@{}
        batchYield = [ordered]@{}
        saturation = [ordered]@{
            strata = $saturationStrata.Count
            active = @($saturationStrata | Where-Object state -eq 'active').Count
            paused = @($saturationStrata | Where-Object state -eq 'paused').Count
            blocked = @($saturationStrata | Where-Object state -eq 'blocked').Count
            qualification = 'cards>=20; retained>=5; newYield<=0.10; overlap>=0.70; three successive comparable batches'
            assessments = $saturationAssessment
        }
    }
    designDefinitionFamilies = $definitionIds.Count
    productFormFamilies = $productFormIds.Count
    architectureFamilies = $architectureIds.Count
    evidenceDepth = [ordered]@{}
    lifecycle = [ordered]@{}
    primaryDesignDefinitions = [ordered]@{}
    designDefinitionAdoption = [ordered]@{}
    productForms = [ordered]@{}
    primaryArchitectures = [ordered]@{}
    architectureAdoption = [ordered]@{}
}

foreach ($group in @($verificationWaves | Group-Object outcome | Sort-Object Name)) {
    $summary.discovery.verificationOutcomes[$group.Name] = $group.Count
}

foreach ($batch in @($discoveryBatches | Where-Object batch_id -ne 'LEGACY-000')) {
    $newCount = @(Split-Refs $batch.new_candidate_refs).Count
    $repeatCount = @(Split-Refs $batch.repeat_candidate_refs).Count
    $resultCount = [int]$batch.result_cards_reviewed
    $retainedMentions = $newCount + $repeatCount
    $summary.discovery.batchYield[$batch.batch_id] = [ordered]@{
        resultCardsReviewed = $resultCount
        firstSeenCandidates = $newCount
        repeatedCandidates = $repeatCount
        zeroResultBatch = $resultCount -eq 0
        newCandidateYield = if ($resultCount -eq 0) { 0 } else { [math]::Round($newCount / $resultCount, 4) }
        candidateHitYield = if ($resultCount -eq 0) { 0 } else { [math]::Round($retainedMentions / $resultCount, 4) }
        retainedMentionOverlap = if ($retainedMentions -eq 0) { 0 } else { [math]::Round($repeatCount / $retainedMentions, 4) }
    }
}

foreach ($group in @($records | Group-Object evidence_depth | Sort-Object Name)) {
    $summary.evidenceDepth[$group.Name] = $group.Count
}
foreach ($group in @($records | Group-Object lifecycle | Sort-Object Name)) {
    $summary.lifecycle[$group.Name] = $group.Count
}
foreach ($id in $definitionIds) {
    $summary.primaryDesignDefinitions[$id] = @($records | Where-Object primary_definition -eq $id).Count
    $summary.designDefinitionAdoption[$id] = @($allDefinitions | Where-Object { $_ -eq $id }).Count
}
foreach ($id in $productFormIds) {
    $summary.productForms[$id] = @($records | Where-Object product_form -eq $id).Count
}
foreach ($id in $architectureIds) {
    $summary.primaryArchitectures[$id] = @($records | Where-Object primary_architecture -eq $id).Count
    $summary.architectureAdoption[$id] = @($allArchitectures | Where-Object { $_ -eq $id }).Count
}

$requiredHeadlineCounts = [ordered]@{
    'Canonical products / projects' = $summary.products
    'Product or maintainer lineages' = $summary.teamLineages
    'Organizations / maintainer umbrellas' = $summary.organizations
    'Operational definitions of Design' = $summary.designDefinitionFamilies
    'Primary product forms' = $summary.productFormFamilies
    'Decisive architecture families' = $summary.architectureFamilies
    'Source-level dossiers' = $summary.evidenceDepth.source
    'Architecture-level dossiers' = $summary.evidenceDepth.architecture
}
foreach ($entry in $requiredHeadlineCounts.GetEnumerator()) {
    $pattern = '^\| ' + [regex]::Escape($entry.Key) + ' \| \*\*' + $entry.Value + '\*\* \|'
    if (-not ($readmeLines | Where-Object { $_ -match $pattern })) {
        $errors.Add("README snapshot table is missing '$($entry.Key) = $($entry.Value)'.")
    }
}

$requiredDiscoveryCounts = [ordered]@{
    'Legacy seed imports' = $summary.discovery.legacySeedImports
    'Reproducible discovery batches' = $summary.discovery.reproducibleSearchBatches
    'Search result cards reviewed' = $summary.discovery.searchResultCardsReviewed
    'First-seen candidates after the legacy import' = @($candidates | Where-Object first_seen_batch -ne 'LEGACY-000').Count
    'Candidate-register rows' = $summary.discovery.candidateRegisterRows
    'Open plausible pool' = $summary.discovery.openCanonicalPool
    'Verified records' = $summary.discovery.verifiedSample
    'Pending candidates' = $summary.discovery.pending
    'Duplicate decisions' = $summary.discovery.duplicates
    'Exclusion decisions' = $summary.discovery.excluded
    'Candidates with team-region evidence' = $summary.discovery.candidateRegisterRows - $summary.discovery.unknownTeamRegion
    'Candidates with unknown team region' = $summary.discovery.unknownTeamRegion
}
foreach ($entry in $requiredDiscoveryCounts.GetEnumerator()) {
    $pattern = '^\| ' + [regex]::Escape($entry.Key) + ' \| \*\*' + $entry.Value + '\*\* \|'
    if (-not ($readmeLines | Where-Object { $_ -match $pattern })) {
        $errors.Add("README discovery table is missing '$($entry.Key) = $($entry.Value)'.")
    }
}

$snapshotPattern = '^\*\*Snapshot:\*\* ' + [regex]::Escape($taxonomy.snapshot) +
    ' · \*\*Schema:\*\* v' + [regex]::Escape($taxonomy.schemaVersion) +
    ' · \*\*Verified records:\*\* ' + $summary.discovery.verifiedSample +
    ' · \*\*Candidate register:\*\* ' + $summary.discovery.candidateRegisterRows +
    ' · \*\*Reproducible discovery batches:\*\* ' + $summary.discovery.reproducibleSearchBatches + '$'
if (-not ($readmeLines | Where-Object { $_ -match $snapshotPattern })) {
    $errors.Add('README top-level snapshot line disagrees with the verified ledgers or taxonomy schema.')
}

$teamBoundaryPattern = '^\| Publicly attributable team units \| \*\*' + $summary.organizations + '–' + $summary.teamLineages + '\*\* \|'
if (-not ($readmeLines | Where-Object { $_ -match $teamBoundaryPattern })) {
    $errors.Add("README snapshot table is missing the public team boundary '$($summary.organizations)–$($summary.teamLineages)'.")
}

if ($errors.Count -gt 0) {
    $errors | ForEach-Object { Write-Error $_ }
    throw "Landscape verification failed with $($errors.Count) error(s)."
}

if ($Json) {
    $summary | ConvertTo-Json -Depth 8
}
else {
    $summary.GetEnumerator() | ForEach-Object {
        if ($_.Value -is [System.Collections.IDictionary]) {
            Write-Output "$($_.Key):"
            $_.Value.GetEnumerator() | ForEach-Object { Write-Output "  $($_.Key): $($_.Value)" }
        }
        else {
            Write-Output "$($_.Key): $($_.Value)"
        }
    }
    Write-Output 'Landscape verification passed.'
}
