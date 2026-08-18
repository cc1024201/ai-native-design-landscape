# AI-Native Design Landscape

> An open, evidence-backed research map of how teams define Design, turn those definitions into products, and implement them technically. It is not a global directory and not a finished census.

**Snapshot:** 2026-08-13 · **Schema:** v0.3 · **Verified records:** 1504 · **Candidate register:** 2402 · **Reproducible discovery batches:** 146

## What this repository is trying to establish

The project asks a question that no public registry currently answers:

> Across the world, how many teams are defining how many different kinds of Design, packaging those definitions into how many kinds of products, and realizing them through how many different technical arrangements?

That question cannot be answered by taking the first 63 researched projects and calling them the world. The original 63 records remain valuable product evidence, but their discovery route was not recorded. They are now explicitly treated as a **legacy seed sample**.

The repository has four coupled research outputs:

1. an open candidate register with reproducible discovery provenance;
2. verified product/project records with canonical identities and team lineages;
3. project-specific technical dossiers that trace the decisive artifact and mutation path;
4. a revisable taxonomy synthesized only from verified records.

This is not a Baidu Baike-style collection of profiles. A dossier matters because it establishes or challenges a field-level claim about Design, product form, artifact authority or implementation.

## The answer at this snapshot

| Question | Supported answer | What remains unknown |
|---|---|---|
| How many global teams or products exist? | **Not estimated.** This repository has 1504 verified records and 0 unresolved plausible candidates. | The global population and recall of every discovery channel. |
| How complete is discovery? | 146 reproducible batches reviewed 6801 result cards and retained 2339 candidates beyond the 63 seeds. | 26 of 27 declared strata remain active; a paused stratum is only a local stopping decision, never a global recall estimate. |
| How many definitions, forms and architectures exist? | The 1504 verified records currently require 10 Design definitions, 12 primary product forms and 10 architecture families. | Whether later verification will split, merge or add families. These are sample-derived, not global totals. |
| Where are the teams? | Only 742 of 2402 candidate rows currently have first-party region evidence; 1660 remain unknown. | Any defensible global geographic distribution. Query language and localized pages are not team-location evidence. |

The correct conclusion is therefore not “there are 1504 products worldwide.” It is:

> We have a reproducible, expanding observation system; its current verified sample contains 1504 records, its open candidate register contains 2402 rows, and its own novelty measurements show that the field boundary is still moving.

## Research flow

~~~mermaid
flowchart LR
    W["Unknown global population"] -. "cannot be enumerated directly" .-> S["Multi-channel discovery batches"]
    L["63 legacy seeds<br/>original discovery unknown"] --> C["Open candidate register"]
    S --> C
    C --> D["Pending, duplicate or excluded decisions"]
    C --> V["Maximum-variation verification waves"]
    V --> R["Verified dossiers and canonical records"]
    R --> T["Sample-derived definitions, forms and architectures"]
    T --> Q["New contradictions and search questions"]
    Q --> S
~~~

The dotted edge is deliberate: the process observes an unknown population but does not pretend to know its denominator.

## Discovery coverage

The protocol, screening boundary, metrics and stopping rules are in [DISCOVERY.md](DISCOVERY.md). Exact queries and denominators are preserved in [data/discovery-batches.csv](data/discovery-batches.csv); every retained object and decision is in [data/candidates.csv](data/candidates.csv).

### Current discovery ledger

| Observable | Count | Interpretation |
|---|---:|---|
| Legacy seed imports | **63** | Dossier-backed records whose original discovery queries and denominator are unknown |
| Reproducible discovery batches | **146** | Search batches plus explicit source, companion, migration and lineage follow-ups |
| Search result cards reviewed | **6801** | Batch denominator; a card can be irrelevant, duplicated or mention several candidates |
| First-seen candidates after the legacy import | **2339** | Distinct names or product claims retained for a decision |
| Candidate-register rows | **2402** | 63 legacy seeds plus 2339 reproducibly discovered candidates |
| Open plausible pool | **1504** | 1504 included and 0 pending canonical candidates at this snapshot |
| Verified records | **1504** | 63 legacy records plus 1441 records included through the reproducible protocol |
| Pending candidates | **0** | Plausibly in scope but missing decisive identity, artifact, lifecycle or authority evidence |
| Duplicate decisions | **262** | Aliases, forks or surfaces already represented elsewhere |
| Exclusion decisions | **636** | Boundary failures retained so the screening logic remains inspectable |
| Candidates with team-region evidence | **742** | Too sparse and selectively verified for any geographic distribution |
| Candidates with unknown team region | **1660** | The dominant geography result in this snapshot is “not yet audited” |

### Channel behavior

| Discovery channel | Batches | Cards reviewed | First-seen candidates | Repeated candidates |
|---|---:|---:|---:|---:|
| General and language/domain web search | 31 | 1005 | 236 | 157 |
| GitHub README/repository search | 60 | 4835 | 1796 | 984 |
| Product launch directory | 1 | 12 | 9 | 6 |
| npm package registry | 1 | 100 | 7 | 5 |
| Recursive source and lineage follow-up | 53 | 849 | 291 | 107 |

These numbers describe the query surfaces, not global prevalence. A launch-directory card can mention more than one retained object; package search can return generic dependencies; web ranking and GitHub full-text search have different visibility biases.

### Why the current frame remains open

| Comparable run | Search stratum | Cards | First-seen | New yield | Known overlap | Result |
|---|---|---:|---:|---:|---:|---|
| SAT-DOM-UI-024 | UI, app and site builders | 68 | 26 | **38.24%** | 61.76% | nonqualifying |
| SAT-DOM-UI-025 | UI, app and site builders | 53 | 10 | **18.87%** | 81.13% | nonqualifying |
| SAT-DOM-UI-026 | UI, app and site builders | 58 | 23 | **39.66%** | 60.34% | nonqualifying |
| SAT-EN-FIGMA-005 | Figma Forum surface | 25 | 2 | **8.00%** | 84.62% | qualifying |
| SAT-EN-FIGMA-006 | Figma Forum surface | 24 | 0 | **0.00%** | 100.00% | qualifying |
| SAT-EN-FIGMA-007 | Figma Forum surface | 28 | 0 | **0.00%** | 100.00% | qualifying |

Only the narrowly defined Figma Forum surface has three successive comparable qualifying batches, so that one stratum is paused. The other 26 declared channel, language, region and product-domain strata remain active. Zero-result Japanese and Korean site-restricted batches remain search/index failures rather than evidence of local absence, and even a paused channel cannot establish global completion.

## Verification wave 1

[data/verification-waves.csv](data/verification-waves.csv) records why each candidate was selected and what evidence decided its status. The first wave is a maximum-variation test, not a random sample or prevalence estimator.

| Candidate | Stratum | Outcome | What the decision established |
|---|---|---|---|
| [Figma Design Agent](projects/01-active/01-commercial/01-fully-ai-native/established-visual-platform/figma-design-agent/) | native design canvas | included | the built-in agent mutates native layers inside the shared versioned Figma file |
| [TalkToFigma](projects/01-active/02-open-source/04-ai-tooling/agent-controllable-canvas/talktofigma/) | source-visible external bridge | included | MCP, WebSocket relay and Figma plugin provide ephemeral control over the host's native graph |
| [Calicat](projects/01-active/02-open-source/01-fully-ai-native/established-visual-platform/calicat/) | Chinese prototype workspace | included | AI and background agents edit a structured prototype/requirements/task file with snapshots and MCP handoff |
| [zCAD / Zixel 3D CAD](projects/01-active/02-open-source/03-ai-enhanced/ai-engineering-design-workspace/zcad/) | parametric engineering | included | editable constraints, features, topology, assemblies and PDM state require a new engineering authority model |
| [Gamma](projects/01-active/01-commercial/01-fully-ai-native/standalone-design-agent/gamma/) | presentation/document/site | included | AI and direct editing converge on a versioned card graph projected into several delivery formats |
| [Etlaq](projects/01-active/01-commercial/02-ai-first/ai-app-site-builder/etlaq/) | Arabic-first app builder | included | a Saudi product graph spans screens, logic, data, regional operations and deployment |
| Botlab.art | textile design | pending | the product and China team boundary are visible, but public evidence does not yet establish structured canvas persistence or version semantics |
| MANTIS CAD | agent-first CAD | pending | early-access claims are plausible, but installed behavior, durable project state and attributable team identity remain unverified |

The wave changed the taxonomy. The old 9/11/9 result did not survive contact with parametric CAD: the verified sample now needs a tenth Design definition, a twelfth product form and a tenth architecture family. This is the intended behavior of the project—classification follows evidence rather than defending a fixed outline.

## Verification wave 2

The second wave resolves every candidate whose discovery evidence was primarily a research paper. It applies one boundary consistently: a paper can identify a candidate, but inclusion requires an independently inspectable current product or maintained implementation with a traceable artifact loop.

| Decision | Candidates | Decisive result |
|---|---|---|
| included as source-level | PPTAgent / DeepPresenter, SlideAgent / DynaSlide, Talk-to-Your-Slides, Auto-Slides, CADDesigner and VisCanvas | maintained public implementations expose the actual authoring authority, mutation path and persistence ceiling |
| included at closed architecture boundary | Morfis | the live product identity and first-party startup paper agree on editable parametric and manufacturable CAD continuation |
| excluded as paper-only | MAxPrototyper, PrototypeFlow, GameUIAgent, Intelligent Canvas, Kanvas AI, AgentsCAD, AADvark and DesignGPT | no independent maintained product or implementation was found for artifact-level verification |
| excluded on artifact boundary | AI2Apps and Cocoa | released work exists, but its primary artifact is respectively agent-application logic and scientific workflow co-execution rather than the Design workspace under study |

This wave also corrects two discovery identities. The Korean-query record called “PrototypeAgent” is the paper's **PrototypeFlow**. The CAD record called “AgentSCAD” is the paper **AgentsCAD**; it is not the separately discovered open-source AgentSCAD product, which must enter through its own discovery record and evidence chain.

## Verification wave 3

The third wave resolves every still-pending candidate first discovered through the GitHub and npm batches. It tests a different ambiguity from the paper wave: public source or a package name is not enough by itself. The project still needs an ordinary Design loop, a distinct identity and a traceable authority boundary.

| Decision | Candidates | Decisive result |
|---|---|---|
| included as source-level agent canvas or native host control | tldraw, OpenFlowKit, Penpot, AntV Infographic, Figma Console MCP, Figma Relai and Figma MCP Bridge | pinned code exposes the structured visual graph, exact agent bridge and mutation direction rather than only an integration claim |
| included as source-level file/HTML workflow | Frontend Slides, App Store Screenshots, HTML Video, HTML Anything, Framelink MCP for Figma, Primo and Silex Desktop AI | each project has a different durable authority: self-contained HTML, project JSON/assets, storyboard/frame sources, one-way Figma grounding, CMS/file round trip or local website source |
| included at architecture boundary | Uno Platform Studio / Hot Design and CSS Studio | first-party product contracts establish running-surface-to-source loops, while the decisive product implementation is not fully public |
| excluded | Open Canvas and FigmaToCode | Open Canvas ships writing/code artifacts rather than a visual Design artifact loop; FigmaToCode explicitly performs deterministic conversion with no AI inference |
| merged as duplicate lineage | 21st.dev Toolbar → stagewise | the pinned changelog identifies a stagewise fork followed by symbol and brand replacement without a different underlying artifact authority |

This wave also demonstrates why project dossiers cannot share a fixed ten-section outline. The decisive evidence ranges from tldraw's typed record graph and Primo's explicit pull/push convergence to Relai's file-carried enforcement policy and HTML Video's content-graph-to-browser-recording pipeline.

## Verification wave 4

The fourth wave follows unresolved mechanism gaps rather than a discovery channel. It closes the two maximum-variation cases left open in wave 1, tests a source-visible agent-native prototype stack, and examines four hosted products plus one evaluation product whose public boundaries differ sharply.

| Decision | Candidates | Decisive result |
|---|---|---|
| included as source-level | Agent-Native Design | the pinned template exposes actions, data, skills and a browser bridge around a self-contained HTML prototype, with SQL-backed records, branches, visual/source edits and export |
| included as hosted product Design | Fleck, Paraflow, Dreamina and Botlab.art | first-party evidence establishes respectively a multi-screen React design canvas, spec-to-flow-to-UI convergence, a layered creative canvas with timeline delivery, and a textile-specific multi-image canvas plus material history |
| included as evidence infrastructure | Chordio / PX-bench | the current product evaluates agent-built product experiences across held-out host applications and eight explicit experience dimensions; it is not itself an authoring canvas |
| included as early engineering Design | MANTIS CAD | the Windows early-access contract establishes conversational parametric edits that preserve intent, manufacturing checks and engineering export, while installed internals and team region remain unknown |

Botlab.art and MANTIS CAD therefore move from wave-1 `pending` to `included`; the earlier rows remain a record of what the first evidence pass had and had not yet established. This wave adds no new taxonomy family: its value is showing that one existing family can contain textile, creative-media and parametric artifacts only when each dossier states a different native authority and evidence ceiling.

## Current verified analytical sample

These counts describe the 1504 dossier-backed records only. They are not global totals, market shares or estimates of unseen teams.

| Observable | Verified sample count | Meaning inside this repository |
|---|---:|---|
| Canonical products / projects | **1504** | Independently identifiable products, open-source projects or surfaced Design workspaces with dossiers |
| Publicly attributable team units | **1370–1502** | 1370 organization/maintainer umbrellas or 1502 product/maintainer lineages; not internal squad headcount |
| Product or maintainer lineages | **1502** | Distinct public product or maintainer histories represented in the sample |
| Organizations / maintainer umbrellas | **1370** | Canonical public homes used to consolidate related lineages |
| Operational definitions of Design | **10** | Sample-derived operational answers to what work counts as Design |
| Primary product forms | **12** | Mutually countable primary packaging forms in the verified sample |
| Decisive architecture families | **10** | Distinct authority, projection and mutation arrangements required by verified evidence |
| Source-level dossiers | **1219** | Public implementation pinned to a full source revision and traced through its decisive mechanism |
| Architecture-level dossiers | **285** | Closed/distributed systems researched to their available public evidence boundary |
| Active or actively transitioning records | **1476** | 1317 active and 159 active-transition records |
| Historical or sunsetting records | **28** | 24 historical and 4 sunsetting records preserved as lineage evidence |

### Ten observed definitions of Design

Primary counts sum to 1504. “Appears in” is multi-label adoption and overlaps. Neither distribution estimates the global field.

| Operational definition | Primary | Appears in | Operational distinction |
|---|---:|---:|---|
| Delegated creation | 206 | 1013 | intent or references lead an agent to create and iteratively refine an artifact |
| Native artifact authoring | 353 | 864 | a structured design, scene, page, site, timeline or comparable graph remains editable authority |
| Visual authoring of executable source | 283 | 636 | a visual projection returns changes to executable source or its owning workspace |
| Runtime correction | 40 | 850 | selection, annotation or demonstration on a running artifact directs source repair |
| Variant exploration and decision | 18 | 354 | alternatives coexist and one direction can be explicitly adopted |
| System governance | 144 | 598 | reusable components, tokens, rules or instructions constrain later work |
| Design-code translation and grounding | 70 | 318 | structured identity or semantics move between design and code authorities |
| End-to-end product delivery | 133 | 946 | Design is inseparable from behavior, data and release of an app or site |
| Visual coordination and evidence | 84 | 584 | visual artifacts coordinate or verify work while another authority owns implementation |
| Constraint-driven engineering | 173 | 226 | precise dimensions, constraints, features, topology and production fitness determine the artifact |

The engineering definition is deliberately visible rather than smoothed away. Morfis and CADDesigner now test it against the original zCAD record using different closed and open implementation paths; future CAD, architecture, industrial and fashion verification may still split it or show that it should merge elsewhere.

### Twelve observed primary product forms

| Product form | Count |
|---|---:|
| Standalone design-agent workspace | 261 |
| Design surface inside an agent platform | 92 |
| General agent with visual tools | 162 |
| AI app or site builder | 205 |
| Code-native visual editor or IDE | 93 |
| Runtime overlay or context bridge | 20 |
| Agent-controllable canvas or domain editor | 196 |
| Design-code bridge | 100 |
| Established visual platform with AI | 76 |
| Visual decision or verification workspace | 53 |
| Visual-editor infrastructure | 21 |
| AI engineering-design workspace | 225 |

### Ten observed architecture families

Primary counts sum to 1504; “Appears in” includes hybrid mechanisms.

| Architecture family | Primary | Appears in | Decisive authority arrangement |
|---|---:|---:|---|
| Source-authority live projection | 272 | 613 | repository files own truth and a live projection returns edits or intent to them |
| Runtime-intent relay | 29 | 213 | a runtime bridge captures target context while another writer owns durable mutation |
| Native graph authority | 338 | 635 | a host-native structured graph owns the editable artifact |
| External-agent canvas | 140 | 335 | an external agent operates a separate native canvas through MCP, plugin, CLI or API |
| Hosted generated-artifact workspace | 69 | 224 | provider-managed artifacts and revisions converge with AI and visual/code editing |
| Managed application-project graph | 190 | 510 | UI, logic, data, configuration and release state live in one managed project |
| Design-code materialization | 107 | 516 | design/capture/system structure is compiled, exported, reconstructed or grounded into code |
| Filesystem agent with visual evidence | 224 | 537 | files and Git own truth while visual evidence coordinates or verifies the agent |
| Candidate isolation and promotion | 36 | 472 | alternatives are isolated and one is explicitly selected or applied |
| Parametric engineering-model authority | 99 | 138 | constraints, feature history, topology and PDM-governed versions own precise engineering state |

## What the verified evidence supports

1. **Design is not one object.** Within the sample it ranges from native layer authoring and runtime correction to product delivery and constraint-driven engineering.
2. **Similar visible features can hide different authority boundaries.** Figma Design Agent edits the host file from inside; TalkToFigma temporarily relays an external agent into that host; Figma Make owns a separate generated application workspace.
3. **Artifact authority is more explanatory than framework choice.** The decisive difference is whether truth lives in files, a native graph, a hosted app project, a version candidate or a parametric engineering model.
4. **Domain expansion can change the taxonomy.** Presentation and Arabic-product candidates fit existing mechanisms; verified CAD evidence required new tests.
5. **Open implementation evidence dominates this snapshot.** 1219 of 1504 records are source-level, reflecting repository-heavy expansion; the remaining closed systems must retain explicit internal unknowns.
6. **Geography is currently a research gap, not a result.** Team-location evidence exists for 742 candidate rows but remains absent for 1660 and is too uneven for geographic inference.

## Conclusions this repository cannot make

- It cannot state the total number of AI-native Design teams or products worldwide.
- It cannot treat 1504 verified records, 1504 open plausible objects or 2402 candidate rows as the global population.
- It cannot infer team origin from query language, domain suffix, translated marketing or user market.
- It cannot call the 10/12/10 taxonomy globally complete or use sample proportions as market prevalence.
- It cannot interpret a zero-result language query as absence of local teams.
- It cannot infer closed-source internals, atomicity, fidelity or persistence guarantees from a successful demo.
- It cannot infer global saturation from one paused Figma Forum stratum while 26 other declared strata remain active.

## Data and reproducibility

- [DISCOVERY.md](DISCOVERY.md) defines units, channels, screening, verification waves and stopping rules.
- [data/discovery-batches.csv](data/discovery-batches.csv) preserves exact queries, denominators, first-seen candidates and repeats.
- [data/candidates.csv](data/candidates.csv) is the open candidate and decision register.
- [data/verification-waves.csv](data/verification-waves.csv) records why candidates were deeply reviewed and what decided each outcome.
- [data/census.csv](data/census.csv) is the verified analytical sample.
- [data/organizations.csv](data/organizations.csv) resolves organization and maintainer umbrellas.
- [data/identity-map.csv](data/identity-map.csv) records aliases, surfaces, rebrands and lineage cutoffs.
- [data/taxonomy.json](data/taxonomy.json) defines every current unit and family test.
- [data/saturation-strata.csv](data/saturation-strata.csv) declares the active, paused and blocked discovery frame.
- [scripts/verify-census.ps1](scripts/verify-census.ps1) checks discovery ledgers, verification outcomes, dossiers, classifications, registry rows and derived counts.

Reproduce the snapshot from PowerShell:

~~~powershell
./scripts/verify-census.ps1 -Json
~~~

## Research and contribution rules

1. Add discovery provenance before claiming coverage.
2. Keep candidates open until identity, ordinary-user loop and artifact authority are evidenced.
3. Treat query language, user market and team geography as separate fields.
4. Let each dossier follow the project's decisive questions rather than a universal ten-section outline.
5. Pin full revisions for source-derived implementation claims; keep closed internals unknown.
6. Classify only after dossier evidence stabilizes, and add a family only when existing tests erase a consequential difference.
7. Preserve pending, duplicate and excluded decisions so later researchers can reproduce the boundary.
8. Report verified-sample findings, discovery coverage and unknown population separately.

Workflow: [CONTRIBUTING.md](CONTRIBUTING.md). The projects tree is the registry — see `projects/README.md`.

## Repository structure

~~~text
.
├── README.md                    # current research report and verified registry
├── DISCOVERY.md                 # discovery, verification and saturation protocol
├── CONTRIBUTING.md              # research and classification workflow
├── data/
│   ├── discovery-batches.csv    # reproducible searches and denominators
│   ├── candidates.csv           # open candidate and decision register
│   ├── verification-waves.csv   # deep-review selection and outcomes
│   ├── census.csv               # verified analytical sample
│   ├── organizations.csv        # organization/maintainer labels
│   ├── identity-map.csv         # alias and lineage decisions
│   ├── saturation-strata.csv    # declared search frame and local pause decisions
│   └── taxonomy.json            # units, definitions, forms and architecture tests
├── scripts/
│   ├── review-github-batch.ps1  # reproducible GitHub-card review helper
│   ├── sync-readme-derived.ps1  # refresh report counts and registry from ledgers
│   └── verify-census.ps1        # integrity and derived-count verification
└── projects/
    ├── 01-depth-analysis/       # 124 records worth deep analysis — the only analyzed set
    │   └── <lifecycle>/<layer>/<band>/<form>/<slug>/README.md
    └── 02-others/               # 1380 records classified as not worth analysis (archived index only)
        ├── INDEX.md             # registration table ("已归类为不值得分析")
        └── <slug>/README.md     # evidence dossiers, no analysis
~~~
Two tiers by quality screening: "worth deep analysis" (124, per-dossier custom analysis)
vs "others" (1380, registered-only). Placement: `data/quality-tiers.csv` + `data/slug-paths.json`;
indexes regenerated by `scripts/build-indexes.py`.

**The tree is self-describing.** The depth subtree carries layered `INDEX.md` reporting band
distribution, coverage gaps, defects (evidence gaps, disputed boundaries) and next steps.
`projects/README.md` holds the global status; `projects/02-others/INDEX.md` registers the
non-analyzed set.

## Current research status

This v0.3 working snapshot contains 146 reproducible discovery batches, 124 verification-wave identifiers and 27 declared saturation strata (26 active, 1 paused and 0 blocked). It does **not** complete the world landscape. The durable result is the research apparatus: seeds are labeled as seeds, candidates and negative decisions remain inspectable, discovery novelty is measurable, verification decisions are reproducible, taxonomies are allowed to change, and the report states what the evidence cannot yet support.
