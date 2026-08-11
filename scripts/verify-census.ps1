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
$projectsPath = Join-Path $repoRoot 'projects'
$rootReadmePath = Join-Path $repoRoot 'README.md'

$records = @(Import-Csv -LiteralPath $censusPath)
$organizations = @(Import-Csv -LiteralPath $organizationsPath)
$identityMap = @(Import-Csv -LiteralPath $identityMapPath)
$taxonomy = Get-Content -LiteralPath $taxonomyPath -Raw | ConvertFrom-Json
$errors = [System.Collections.Generic.List[string]]::new()

function Split-Ids {
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
foreach ($identityDecision in $identityMap) {
    if ($identityDecision.canonical_slug -notin $records.slug) {
        $errors.Add("Identity map target '$($identityDecision.canonical_slug)' has no census record.")
    }
    if ([string]::IsNullOrWhiteSpace($identityDecision.decision) -or [string]::IsNullOrWhiteSpace($identityDecision.note)) {
        $errors.Add("Identity map entry '$($identityDecision.encountered_name)' is missing a decision or note.")
    }
}

$directorySlugs = @(Get-ChildItem -LiteralPath $projectsPath -Directory | Where-Object {
        Test-Path -LiteralPath (Join-Path $_.FullName 'README.md')
    } | Select-Object -ExpandProperty Name | Sort-Object)
$censusSlugs = @($records.slug | Sort-Object)

foreach ($missing in @($directorySlugs | Where-Object { $_ -notin $censusSlugs })) {
    $errors.Add("Project directory '$missing' is missing from data/census.csv.")
}
foreach ($extra in @($censusSlugs | Where-Object { $_ -notin $directorySlugs })) {
    $errors.Add("Census slug '$extra' has no projects/$extra/README.md.")
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

    $dossierReadmePath = Join-Path $projectsPath "$($record.slug)/README.md"
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
        $link = [regex]::Match($cells[0], '^\[([^\]]+)\]\(projects/([^/]+)/\)$')
        if (-not $link.Success) {
            $errors.Add("README registry row has an invalid project link: $line")
            continue
        }

        $slug = $link.Groups[2].Value
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

$teamBoundaryPattern = '^\| Publicly attributable team units \| \*\*' + $summary.organizations + '–' + $summary.teamLineages + '\*\* \|'
if (-not ($readmeLines | Where-Object { $_ -match $teamBoundaryPattern })) {
    $errors.Add("README snapshot table is missing the public team boundary '$($summary.organizations)–$($summary.teamLineages)'.")
}

if ($errors.Count -gt 0) {
    $errors | ForEach-Object { Write-Error $_ }
    throw "Census verification failed with $($errors.Count) error(s)."
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
    Write-Output 'Census verification passed.'
}
