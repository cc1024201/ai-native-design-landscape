# Discovery protocol

This repository observes a field whose population is not published by any registry.
`data/candidates.csv` is the open candidate register; a candidate only enters
`data/census.csv` after its identity and artifact authority are established.

## Units

1. **result card** — one item returned by a search channel; the denominator of a batch.
2. **candidate** — a distinct name or product claim worth a screening decision.
3. **record** — an accepted row in `data/census.csv` with a dossier.
4. **batch** — a recorded search with fixed channel, language/region scope and queries.
5. **saturation stratum** — a declared channel × language/region × domain surface whose
   novelty is tracked; it may be paused locally, never treated as global recall.

## Discovery frame

Search strata (surfaces to cover, not fixed labels):

- agent-operated design/creative canvases;
- AI UI and prototyping workspaces;
- app and site builders with a visual refinement loop;
- code-native visual editors and runtime-correction overlays;
- design tools and canvases controllable through MCP, plugins, CLI or APIs;
- design-system / design-to-code bridges;
- established design, whiteboard, site and creative platforms with an agentic workspace;
- visual comparison, verification and candidate-promotion workspaces;
- editor kernels, artifact formats and rendering infrastructure usable independently;
- adjacent domains (presentation, brand, motion, game UI, physical, fashion) kept
  pending until a scope decision is supported.

No stratum is presumed complete. Channels with different visibility bias are combined:
general web, language/region web, GitHub, launch directories, official docs/changelogs,
and package/extension/protocol registries.

## Screening and statuses

A candidate has exactly one status: `pending`, `included`, `duplicate`, or `excluded`.
Inclusion requires an independently identifiable object with an ordinary-user loop in
which AI or an agent participates in visual or interactive creation, authoring,
correction, decision, governance, translation, delivery or coordination — and public
evidence of what holds working authority. Exclusions cover generic models/APIs/media
generators without an editable design artifact, generic coding agents without a visual
surface, services/agencies, libraries/prompts that guide style but own no artifact, and
research methods with no usable system.

A query's language is not evidence of a team's location; `team_region` stays `unknown`
until a first-party source establishes it.

## Verification

Resolve the product and lifecycle → identify aliases → establish the user loop →
identify the working artifact authority and mutation path → pin a source revision for
source-visible claims → write the dossier → then add census/organization/identity rows.
`data/verification-waves.csv` records selection stratum, reason, outcome and decisive
evidence per reviewed candidate. Verification waves are maximum-variation evidence
tests, not random samples or prevalence estimates.

## Saturation

`data/saturation-strata.csv` exposes the active frame. A stratum may move `active →
paused` only when three successive comparable batches qualify as low-novelty/high-overlap
(≥20 cards reviewed, ≥5 retained mentions, ≤10% new-candidate yield, ≥70% resolved).
A zero-result or access-failed batch cannot qualify. `blocked` means the surface produces
no reviewable evidence — never saturated.

`data/discovery-batches.csv` preserves the query surface and denominator; per-batch
new-candidate yield, candidate-hit yield and overlap are auditable without pretending
every card is a product.

## Reproduction and extension

Run the integrity check:

```bash
python3 scripts/verify-census.py
```

To extend discovery: add a batch row with exact queries and reviewed-card counts; add new
candidate rows and reference them from `new_candidate_refs`; reference existing IDs in
`repeat_candidate_refs`; make screening reasons explicit and retain evidence URLs; verify
before drawing any new field-level conclusion. Never overwrite an old batch to make a
later search look cleaner — add a new batch so changes stay visible over time.
