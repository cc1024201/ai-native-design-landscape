# Open discovery protocol

This repository is trying to observe a field whose population is not published by any registry. It therefore cannot start from the 63 records already researched and call that set global. Those records are a **legacy seed sample**. Their product evidence remains usable; their original discovery route is not recorded and must stay unknown.

The discovery system has two outputs:

- `data/candidates.csv` is the open candidate register. It contains the legacy seeds and every distinct object retained after a search result is screened.
- `data/discovery-batches.csv` records the searches that produced or re-encountered those candidates. It preserves the query surface and denominator needed to calculate batch yield.

`data/census.csv` remains the verified analytical sample. A candidate does not enter it until its identity, Design-relevant user loop and artifact authority are established in a dossier.

## Units that must not be collapsed

1. A **result card** is one item returned by a search channel. It is the denominator for a batch; it can be irrelevant, repeated or misleading.
2. A **candidate** is a distinct name or product claim worth a screening decision. One candidate can appear in many batches.
3. A **canonical record** is an included product, open-source project or independently surfaced Design workspace with a dossier and census row.
4. A **team lineage** is the independently attributable product or maintainer lineage behind a canonical record. It is not an inferred internal squad.
5. A **taxonomy family** is this repository's synthesis across verified records. It is not a vendor category and is never counted from pending candidates.

The observable candidate universe is the union of the legacy seed rows and reproducibly discovered candidates. The global population remains unknown.

## Discovery frame

Each discovery cycle should cover the following product and mechanism strata. These are search strata rather than fixed taxonomy labels:

- native design or creative canvases operated by an agent;
- AI UI and prototyping workspaces;
- app and site builders with a visual refinement loop;
- code-native visual editors and runtime correction overlays;
- agent-controllable design tools and canvases exposed through MCP, plugins, CLI or APIs;
- design-system and design-to-code/code-to-design bridges;
- established design, whiteboard, site and creative platforms with an agentic workspace;
- visual comparison, verification and candidate-promotion workspaces;
- editor kernels, artifact formats and rendering infrastructure that may constitute an independently usable project;
- adjacent domains encountered by the search, such as presentation, brand, motion, game UI, physical-product or fashion design. These stay pending until a scope decision is supported rather than being silently discarded as non-UI.

No stratum is presumed complete. A cycle combines several discovery channels because each has a different visibility bias:

- general web search;
- language- and region-oriented web search;
- GitHub repository and README search;
- product-launch directories used only for discovery;
- official product documentation and changelogs;
- package, extension and protocol registries.

## Language and regional coverage

The baseline cycle searches English, Simplified Chinese, Japanese, Korean, Spanish, Portuguese, French, German, Russian and Arabic terms. A query language is not evidence of a team's location. `language_scope` and `region_scope` in the batch ledger describe the discovery surface; `team_region` in the candidate register stays `unknown` until a first-party company, maintainer or registry source establishes it.

A low-yield language batch means only that the particular channel and queries returned few new candidates. It must never be translated into “that region has few teams.” Search-index coverage, localization, terminology and access restrictions are competing explanations.

## Batch execution

For every batch:

1. Assign a stable batch identifier before screening.
2. Record the date, channel, language/region orientation, exact queries and number of result cards actually reviewed.
3. Screen every returned card against the boundary below.
4. Add a new candidate row only for a distinct object not already in the register.
5. Put previously known candidate IDs in `repeat_candidate_refs`; do not create another candidate row.
6. Preserve false positives that clarify the boundary as `excluded` candidates. Do not retain every irrelevant search result.
7. Use discovery pages only to find candidates. A final inclusion decision requires first-party or source evidence.

Pipe-separated `new_candidate_refs` and `repeat_candidate_refs` make candidate-level yield auditable without pretending that every search card is a product. The verifier derives:

- **new-candidate yield** = first-seen candidates / result cards reviewed;
- **candidate-hit yield** = (first-seen + repeated candidates) / result cards reviewed;
- **overlap among retained candidate mentions** = repeated / (first-seen + repeated).

These are properties of a batch and its search interface. They are not estimates of recall against the unknown global population.

## Screening boundary and statuses

A candidate remains in the register with exactly one status:

- `pending` — plausibly in scope but product identity, user loop, artifact authority, lifecycle or evidence depth still needs review;
- `included` — accepted into `data/census.csv` with a canonical dossier;
- `duplicate` — an alias, feature, surface or result already represented by another candidate or canonical record;
- `excluded` — enough evidence shows that the object fails the current boundary.

An includable object must be independently identifiable and expose an ordinary-user loop in which AI or an agent participates in visual or interactive creation, authoring, correction, decision, governance, translation, delivery or coordination. The public evidence must establish what artifact or source holds working authority.

Typical exclusions are:

- generic models, APIs or media generators without a design-specific editable artifact loop;
- generic coding, browser or execution agents without a Design-specific surface;
- services or agencies rather than repeatable products/projects;
- tools for visually designing AI-agent logic when the word “design” is only the construction of the agent itself;
- libraries, prompts or static resource collections that guide style but do not own or operate a visual artifact;
- research methods with no independently usable system or released project.

Pending is the correct result when those facts are not yet established. It is not a weaker form of inclusion.

## Verification and canonicalization

Candidate verification proceeds in this order:

1. resolve the official product/project and current lifecycle;
2. identify aliases, rebrands, feature names and predecessors;
3. establish the ordinary-user Design loop;
4. identify the working artifact authority and decisive mutation path;
5. establish the team lineage and organization only to the available public boundary;
6. pin a source revision for source-derived claims;
7. write a project-specific dossier whose structure follows the product's decisive questions;
8. only then add the census, organization and identity-map rows and classify the verified record.

Closed products can reach an architecture-level boundary without invented internals. Source-visible projects require commit-pinned implementation tracing. Secondary pages can support discovery but cannot carry a final technical claim when primary evidence exists.

## Verification waves are maximum-variation tests

The candidate pool is too large and too unevenly evidenced to process as if the next row were automatically the most informative. A verification wave therefore selects candidates that differ on discovery language, artifact domain, product form, source visibility and suspected authority model. It is a maximum-variation evidence test, not a random sample and not an estimate of product prevalence.

`data/verification-waves.csv` records the selection stratum, reason, outcome and decisive evidence for each reviewed candidate. An `included` outcome must produce a dossier and census row. `pending` after verification is a substantive result: it means the public evidence established some identity or product facts but still could not carry the inclusion boundary. Newly discovered included candidates must appear in a verification wave; legacy seeds are exempt because this protocol did not exist when they were selected.

The first wave deliberately combines a native design agent, a source-visible external bridge, a Chinese prototype workspace, parametric CAD, structured presentation, an Arabic-first app builder and two domain-edge controls. Its purpose is to test whether the UI-heavy legacy taxonomy survives contact with different artifact authorities. It is not a claim that those candidates are globally representative.

## Saturation and stopping rules

There is no “global completion” flag. Three different signals are tracked:

- **discovery saturation**: new-candidate yield across successive comparable batches in the same channel/language/stratum;
- **identity saturation**: the share of retained mentions resolving to known candidates or canonical records;
- **classification saturation**: whether newly verified records fit existing definitions/forms/architectures without erasing a consequential difference.

A cycle may pause a channel after at least three comparable successive batches have low new-candidate yield and high overlap. That is only a channel-level stopping decision. New languages, registries, domains, time windows and query families remain open. A taxonomy can be provisionally stable while discovery is not saturated, and discovery can appear saturated while the public evidence is too weak to classify candidates.

The baseline batches in this snapshot are deliberately not treated as saturated: broad web and repository searches continue to return many first-seen candidates. Their purpose is to replace an unrecorded seed boundary with an inspectable starting frame.

## Reproduction and extension

Run the full integrity check from PowerShell:

```powershell
./scripts/verify-census.ps1 -Json
```

To extend the discovery:

1. add a batch row with exact queries and reviewed-result count;
2. add new candidate rows and reference them from `new_candidate_refs`;
3. reference existing IDs in `repeat_candidate_refs`;
4. make screening reasons explicit and retain evidence URLs;
5. verify the register before drawing any new field-level conclusion.

Never overwrite an old batch to make a later search look cleaner. Add a new batch so changes in search results, terminology and novelty remain visible over time.
