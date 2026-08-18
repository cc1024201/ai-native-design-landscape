[CmdletBinding()]
param(
    [Parameter(Mandatory = $true)]
    [string]$BatchId,

    [Parameter(Mandatory = $true)]
    [ValidateCount(3, 5)]
    [string[]]$Query,

    [ValidateRange(1, 100)]
    [int]$PerQuery = 10,

    [switch]$Json
)

$ErrorActionPreference = 'Stop'

$repoRoot = Split-Path -Parent $PSScriptRoot
$candidatePath = Join-Path $repoRoot 'data/candidates.csv'

function Get-GitHubRepoKey {
    param([AllowEmptyString()][string]$Url)

    if ($Url -match '^https?://(?:www\.)?github\.com/([^/]+)/([^/?#]+)') {
        $owner = $matches[1].ToLowerInvariant()
        $repo = ($matches[2] -replace '\.git$', '').ToLowerInvariant()
        return "$owner/$repo"
    }
    return $null
}

function Add-CandidateRepoMapping {
    param(
        [hashtable]$Map,
        [object]$Candidate,
        [AllowEmptyString()][string]$Url
    )

    $key = Get-GitHubRepoKey $Url
    if ($null -eq $key) { return }
    if (-not $Map.ContainsKey($key)) {
        $Map[$key] = [System.Collections.Generic.List[object]]::new()
    }
    if (-not ($Map[$key].candidate_id -contains $Candidate.candidate_id)) {
        $Map[$key].Add($Candidate)
    }
}

if (-not (Get-Command gh -ErrorAction SilentlyContinue)) {
    throw 'GitHub CLI (gh) is required.'
}

$candidatesByRepo = @{}
foreach ($candidate in (Import-Csv $candidatePath)) {
    Add-CandidateRepoMapping -Map $candidatesByRepo -Candidate $candidate -Url $candidate.discovery_url

    if ($candidate.resolution_target -match '^census:(.+)$') {
        $slug = $matches[1]
        $slugPaths = @{}
        Get-Content -LiteralPath (Join-Path $repoRoot 'data/slug-paths.json') -Raw | ConvertFrom-Json | ForEach-Object {
            foreach ($prop in $_.PSObject.Properties) { $slugPaths[$prop.Name] = $prop.Value }
        }
        $dossierPath = if ($slugPaths.ContainsKey($slug)) {
            Join-Path (Join-Path $repoRoot 'projects') ($slugPaths[$slug] + '/README.md')
        } else {
            Join-Path $repoRoot "projects/$slug/README.md"
        }
        if (Test-Path $dossierPath) {
            foreach ($line in (Get-Content $dossierPath)) {
                if ($line -match '(?i)(canonical source repository|source repository|\[repository\]|^- repository|^- source).*(https?://github\.com/[^/\s)]+/[^/\s)#?]+)') {
                    Add-CandidateRepoMapping -Map $candidatesByRepo -Candidate $candidate -Url $matches[2]
                }
            }
        }
    }
}

$cardsByRepo = [ordered]@{}
foreach ($queryText in $Query) {
    $response = gh api -X GET search/repositories -f q=$queryText -f per_page=$PerQuery | ConvertFrom-Json
    $rank = 0
    foreach ($item in $response.items) {
        $rank++
        $key = $item.full_name.ToLowerInvariant()
        if (-not $cardsByRepo.Contains($key)) {
            $cardsByRepo[$key] = [ordered]@{
                repo = $item.full_name
                url = $item.html_url
                description = $item.description
                stars = $item.stargazers_count
                archived = $item.archived
                fork = $item.fork
                updated_at = $item.updated_at
                query_hits = [System.Collections.Generic.List[string]]::new()
                ranks = [System.Collections.Generic.List[int]]::new()
                known_candidate_id = $null
                known_status = $null
            }
        }
        $cardsByRepo[$key].query_hits.Add($queryText)
        $cardsByRepo[$key].ranks.Add($rank)
    }
}

$cards = @()
foreach ($entry in $cardsByRepo.GetEnumerator()) {
    $card = $entry.Value
    if ($candidatesByRepo.ContainsKey($entry.Key)) {
        $statusRank = @{ included = 0; pending = 1; duplicate = 2; excluded = 3 }
        $matchedCandidate = $candidatesByRepo[$entry.Key] |
            Sort-Object @{ Expression = { $statusRank[$_.status] } }, @{ Expression = { $_.first_seen_batch } } |
            Select-Object -First 1
        $card.known_candidate_id = $matchedCandidate.candidate_id
        $card.known_status = $matchedCandidate.status
    }
    $cards += [pscustomobject]$card
}

$known = @($cards | Where-Object known_candidate_id)
$unknown = @($cards | Where-Object { -not $_.known_candidate_id })
$result = [ordered]@{
    batch_id = $BatchId
    executed_on = (Get-Date).ToString('yyyy-MM-dd')
    queries = @($Query)
    per_query = $PerQuery
    result_cards_reviewed = $cards.Count
    repeat_candidate_refs = @($known.known_candidate_id | Sort-Object -Unique)
    known_cards = $known
    unknown_cards = $unknown
}

if ($Json) {
    $result | ConvertTo-Json -Depth 8
    exit 0
}

[pscustomobject]@{
    batch_id = $BatchId
    query_count = $Query.Count
    result_cards_reviewed = $cards.Count
    known_cards = $known.Count
    unknown_cards = $unknown.Count
}

'Known candidate cards:'
$known | Select-Object repo, known_candidate_id, known_status, query_hits | Format-Table -Wrap -AutoSize

'Unknown cards requiring screening:'
$unknown | Select-Object repo, stars, archived, fork, description, url, query_hits | Format-Table -Wrap -AutoSize
