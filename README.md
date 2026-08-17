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
| [Figma Design Agent](projects/figma-design-agent/) | native design canvas | included | the built-in agent mutates native layers inside the shared versioned Figma file |
| [TalkToFigma](projects/talktofigma/) | source-visible external bridge | included | MCP, WebSocket relay and Figma plugin provide ephemeral control over the host's native graph |
| [Calicat](projects/calicat/) | Chinese prototype workspace | included | AI and background agents edit a structured prototype/requirements/task file with snapshots and MCP handoff |
| [zCAD / Zixel 3D CAD](projects/zcad/) | parametric engineering | included | editable constraints, features, topology, assemblies and PDM state require a new engineering authority model |
| [Gamma](projects/gamma/) | presentation/document/site | included | AI and direct editing converge on a versioned card graph projected into several delivery formats |
| [Etlaq](projects/etlaq/) | Arabic-first app builder | included | a Saudi product graph spans screens, logic, data, regional operations and deployment |
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
- [HANDOFF.md](HANDOFF.md) gives the next maintainer an operational starting point and current open work.
- [EVIDENCE_ATLAS.md](EVIDENCE_ATLAS.md) preserves detailed mechanism synthesis from the legacy evidence pass; its mechanism evidence remains useful, but its coverage is not a global frame.
- [scripts/verify-census.ps1](scripts/verify-census.ps1) checks discovery ledgers, verification outcomes, dossiers, classifications, registry rows and derived counts.

Reproduce the snapshot from PowerShell:

~~~powershell
./scripts/verify-census.ps1 -Json
~~~

## Evidence registry

This table lists the **verified sample**, not every candidate. Hybrid labels are in [data/census.csv](data/census.csv), and each link opens the project-specific dossier that carries the evidence.

| Product | Organization | Primary Design definition | Primary product form | Primary architecture | Evidence · lifecycle |
|---|---|---|---|---|---|
| [Claude Design](projects/anthropic-claude-design/) | Anthropic | Delegated creation | Standalone design-agent workspace | Hosted generated-artifact workspace | architecture · active |
| [Codex](projects/openai-codex/) | OpenAI | Visual coordination and evidence | General agent with visual tools | Filesystem agent with visual evidence | source · active |
| [Cursor](projects/cursor/) | Anysphere | Visual authoring of executable source | Design surface inside an agent platform | Source-authority live projection | architecture · active |
| [TRAE Work](projects/trae-work/) | ByteDance | Delegated creation | Design surface inside an agent platform | Hosted generated-artifact workspace | architecture · active |
| [QoderWork Design](projects/qoderwork-design/) | Alibaba | Delegated creation | Design surface inside an agent platform | Hosted generated-artifact workspace | architecture · active |
| [Replit Design](projects/replit-design/) | Replit | Variant exploration and decision | Design surface inside an agent platform | Candidate isolation and promotion | architecture · active |
| [CodeBuddy](projects/tencent-codebuddy/) | Tencent | Design-code translation and grounding | General agent with visual tools | Design-code materialization | architecture · active |
| [Comate](projects/baidu-comate/) | Baidu | Design-code translation and grounding | General agent with visual tools | Design-code materialization | architecture · active |
| [Devin](projects/devin/) | Cognition | Runtime correction | General agent with visual tools | Filesystem agent with visual evidence | architecture · active |
| [v0](projects/vercel-v0/) | Vercel | End-to-end product delivery | AI app or site builder | Hosted generated-artifact workspace | architecture · active |
| [Lovable](projects/lovable/) | Lovable | End-to-end product delivery | AI app or site builder | Managed application-project graph | architecture · active |
| [Windsurf](projects/windsurf/) | Cognition | Runtime correction | General agent with visual tools | Filesystem agent with visual evidence | architecture · historical |
| [GitHub Spark](projects/github-spark/) | GitHub | End-to-end product delivery | AI app or site builder | Managed application-project graph | architecture · sunsetting |
| [Anything](projects/anything/) | Anything | End-to-end product delivery | AI app or site builder | Managed application-project graph | architecture · active |
| [Fusion](projects/builderio-fusion/) | Builder.io | Visual authoring of executable source | Code-native visual editor or IDE | Source-authority live projection | architecture · active |
| [Stitch](projects/google-stitch/) | Google | Delegated creation | Standalone design-agent workspace | Native graph authority | architecture · active |
| [Google Antigravity](projects/google-antigravity/) | Google | Visual coordination and evidence | General agent with visual tools | Filesystem agent with visual evidence | architecture · active |
| [Base44](projects/base44/) | Wix | End-to-end product delivery | AI app or site builder | Managed application-project graph | architecture · active |
| [Bolt.new](projects/bolt-new/) | StackBlitz | End-to-end product delivery | AI app or site builder | Managed application-project graph | architecture · active |
| [Atoms](projects/atoms/) | MetaGPT / Atoms | End-to-end product delivery | AI app or site builder | Managed application-project graph | architecture · active |
| [Subframe](projects/subframe/) | Subframe | System governance | Established visual platform with AI | Design-code materialization | architecture · active |
| [FlutterFlow](projects/flutterflow/) | FlutterFlow | Native artifact authoring | Established visual platform with AI | Managed application-project graph | architecture · active |
| [Figma Make](projects/figma-make/) | Figma | Delegated creation | AI app or site builder | Hosted generated-artifact workspace | architecture · active |
| [Alloy](projects/alloy/) | Alloy | Delegated creation | Standalone design-agent workspace | Hosted generated-artifact workspace | architecture · active |
| [Magic Patterns](projects/magic-patterns/) | Magic Patterns | Delegated creation | Standalone design-agent workspace | Hosted generated-artifact workspace | architecture · active |
| [Anima](projects/anima/) | Anima | Design-code translation and grounding | Design-code bridge | Design-code materialization | architecture · active |
| [Kombai](projects/kombai/) | Kombai | Design-code translation and grounding | Design surface inside an agent platform | Design-code materialization | architecture · active |
| [Miaoda](projects/baidu-miaoda/) | Baidu | End-to-end product delivery | AI app or site builder | Managed application-project graph | architecture · active |
| [Onlook](projects/onlook/) | Onlook | Visual authoring of executable source | Code-native visual editor or IDE | Source-authority live projection | source · active |
| [Tempo](projects/tempo/) | Tempo Labs | Visual authoring of executable source | Code-native visual editor or IDE | Source-authority live projection | architecture · active-transition |
| [stagewise](projects/stagewise/) | stagewise | Visual authoring of executable source | Code-native visual editor or IDE | Source-authority live projection | source · active |
| [Dosmos](projects/dosmos/) | Dosmos | Runtime correction | Code-native visual editor or IDE | Runtime-intent relay | source · active |
| [Retune](projects/retune/) | Retune contributors | Runtime correction | Runtime overlay or context bridge | Runtime-intent relay | source · active |
| [Tuna](projects/tuna/) | Tuna contributors | Runtime correction | Runtime overlay or context bridge | Runtime-intent relay | source · active |
| [onUI](projects/onui/) | onUI contributors | Runtime correction | Runtime overlay or context bridge | Runtime-intent relay | source · active |
| [Design Canvas](projects/design-canvas/) | Design Canvas | Visual coordination and evidence | Visual decision or verification workspace | Filesystem agent with visual evidence | architecture · active |
| [Rivet](projects/rivet-design/) | Rivet Design | Variant exploration and decision | Visual decision or verification workspace | Candidate isolation and promotion | architecture · active |
| [pen.dev](projects/pen-dev/) | High Agency | Native artifact authoring | Agent-controllable canvas or domain editor | External-agent canvas | architecture · active |
| [Paper](projects/paper/) | Lost Coast Labs | Native artifact authoring | Agent-controllable canvas or domain editor | External-agent canvas | architecture · active |
| [Clearly](projects/clearly/) | Clearly | Native artifact authoring | Agent-controllable canvas or domain editor | External-agent canvas | architecture · active |
| [MagicPath](projects/magicpath/) | NewCompute | Delegated creation | Agent-controllable canvas or domain editor | Hosted generated-artifact workspace | architecture · active |
| [Superdesign](projects/superdesign/) | Superdesign | Variant exploration and decision | Standalone design-agent workspace | External-agent canvas | source · active |
| [Nimbalyst](projects/nimbalyst/) | Nimbalyst | Visual coordination and evidence | Agent-controllable canvas or domain editor | Source-authority live projection | source · active |
| [OpenPencil](projects/open-pencil/) | OpenPencil | Native artifact authoring | Agent-controllable canvas or domain editor | External-agent canvas | source · active |
| [OpenPencil ZSeven](projects/openpencil-zseven/) | ZSeven-W contributors | Native artifact authoring | Agent-controllable canvas or domain editor | External-agent canvas | source · active |
| [Reframe](projects/reframe/) | Reframe contributors | Native artifact authoring | Agent-controllable canvas or domain editor | Native graph authority | source · active |
| [Open CoDesign](projects/open-codesign/) | OpenCoworkAI | Delegated creation | Standalone design-agent workspace | Source-authority live projection | source · active |
| [Open Design](projects/open-design/) | nexu-io | Delegated creation | Standalone design-agent workspace | Source-authority live projection | source · active |
| [Agentation](projects/agentation/) | Agentation contributors | Runtime correction | Runtime overlay or context bridge | Runtime-intent relay | source · active |
| [Code Inspector](projects/code-inspector/) | zh-lx contributors | Runtime correction | Runtime overlay or context bridge | Runtime-intent relay | source · active |
| [Puck](projects/puck/) | Puck contributors | Native artifact authoring | Visual-editor infrastructure | Native graph authority | source · active |
| [Figwright](projects/figwright/) | Roya / Figwright contributors | Design-code translation and grounding | Design-code bridge | Design-code materialization | source · active |
| [mcp_excalidraw](projects/mcp-excalidraw/) | yctimlin contributors | Native artifact authoring | Agent-controllable canvas or domain editor | External-agent canvas | source · active |
| [Monet](projects/monet/) | Het Patel / Monet contributors | Native artifact authoring | Agent-controllable canvas or domain editor | External-agent canvas | source · active |
| [Uizard](projects/uizard/) | Miro | Delegated creation | Established visual platform with AI | Native graph authority | architecture · active |
| [Galileo AI](projects/galileo-ai/) | Galileo AI | Delegated creation | Standalone design-agent workspace | Candidate isolation and promotion | architecture · historical |
| [Diagram](projects/diagram/) | Figma | Native artifact authoring | Established visual platform with AI | Native graph authority | architecture · historical |
| [Framer AI](projects/framer-ai/) | Framer | Native artifact authoring | Established visual platform with AI | Native graph authority | architecture · active |
| [Relume](projects/relume/) | Relume | Design-code translation and grounding | Established visual platform with AI | Design-code materialization | architecture · active |
| [Webflow AI](projects/webflow-ai/) | Webflow | Native artifact authoring | Established visual platform with AI | Native graph authority | architecture · active-transition |
| [Canva Magic Design](projects/canva-magic-design/) | Canva | Delegated creation | Established visual platform with AI | Native graph authority | architecture · active |
| [Firebase Studio](projects/firebase-studio/) | Google | End-to-end product delivery | AI app or site builder | Hosted generated-artifact workspace | architecture · sunsetting |
| [Motiff](projects/motiff/) | Motiff | Native artifact authoring | Established visual platform with AI | Native graph authority | architecture · historical |
| [TalkToFigma](projects/talktofigma/) | TalkToFigma maintainers | Native artifact authoring | Agent-controllable canvas or domain editor | External-agent canvas | source · active |
| [Figma Design Agent](projects/figma-design-agent/) | Figma | Native artifact authoring | Established visual platform with AI | Native graph authority | architecture · active |
| [Calicat](projects/calicat/) | Beijing Damaidi Information Technology | Native artifact authoring | Established visual platform with AI | Native graph authority | architecture · active |
| [zCAD / Zixel 3D CAD](projects/zcad/) | Zixel | Constraint-driven engineering | AI engineering-design workspace | Parametric engineering-model authority | architecture · active |
| [Gamma](projects/gamma/) | Gamma | Delegated creation | Standalone design-agent workspace | Native graph authority | architecture · active |
| [Etlaq](projects/etlaq/) | Etlaq (Saudi Arabia) | End-to-end product delivery | AI app or site builder | Managed application-project graph | architecture · active |
| [Morfis](projects/morfis/) | University of Luxembourg | Constraint-driven engineering | AI engineering-design workspace | Parametric engineering-model authority | architecture · active |
| [PPTAgent / DeepPresenter](projects/pptagent/) | Institute of Software Chinese Academy of Sciences | Delegated creation | Standalone design-agent workspace | Filesystem agent with visual evidence | source · active-transition |
| [SlideAgent / DynaSlide](projects/slideagent/) | Beijing Normal University | Native artifact authoring | Standalone design-agent workspace | Filesystem agent with visual evidence | source · active |
| [Talk-to-Your-Slides](projects/talk-to-your-slides/) | KAIST | Runtime correction | Agent-controllable canvas or domain editor | External-agent canvas | source · active |
| [Auto-Slides](projects/auto-slides/) | Westlake University | Delegated creation | Standalone design-agent workspace | Filesystem agent with visual evidence | source · active |
| [CADDesigner](projects/caddesigner/) | Zhejiang University | Constraint-driven engineering | AI engineering-design workspace | Parametric engineering-model authority | source · active |
| [VisCanvas](projects/viscanvas/) | Arizona State University | Native artifact authoring | Visual decision or verification workspace | Native graph authority | source · active |
| [tldraw SDK / Agent Starter Kit](projects/tldraw/) | tldraw | Native artifact authoring | Visual-editor infrastructure | Native graph authority | source · active |
| [Frontend Slides](projects/frontend-slides/) | Zara Zhangrui contributors | Delegated creation | Standalone design-agent workspace | Filesystem agent with visual evidence | source · active |
| [App Store Screenshots](projects/app-store-screenshots/) | Parth Jadhav contributors | Native artifact authoring | Code-native visual editor or IDE | Source-authority live projection | source · active |
| [HTML Video](projects/html-video/) | nexu-io | Delegated creation | Standalone design-agent workspace | Filesystem agent with visual evidence | source · active |
| [HTML Anything](projects/html-anything/) | nexu-io | Delegated creation | Standalone design-agent workspace | Filesystem agent with visual evidence | source · active |
| [Framelink MCP for Figma](projects/framelink-mcp/) | Framelink | Design-code translation and grounding | Design-code bridge | Design-code materialization | source · active |
| [Primo](projects/primo/) | Primo CMS | Visual authoring of executable source | Code-native visual editor or IDE | Source-authority live projection | source · active |
| [OpenFlowKit](projects/openflowkit/) | Vrun Design | Native artifact authoring | Agent-controllable canvas or domain editor | Native graph authority | source · active |
| [Uno Platform Studio / Hot Design](projects/uno-studio/) | Uno Platform | Visual authoring of executable source | Code-native visual editor or IDE | Source-authority live projection | architecture · active |
| [Penpot](projects/penpot/) | Penpot | Native artifact authoring | Established visual platform with AI | Native graph authority | source · active |
| [AntV Infographic](projects/antv-infographic/) | AntV | Native artifact authoring | Visual-editor infrastructure | Native graph authority | source · active |
| [Silex Desktop AI](projects/silex/) | Silex Labs | Visual authoring of executable source | Code-native visual editor or IDE | Source-authority live projection | source · active-transition |
| [Figma Console MCP](projects/figma-console-mcp/) | Southleft | Native artifact authoring | Agent-controllable canvas or domain editor | External-agent canvas | source · active |
| [Figma Relai](projects/figma-relai/) | Figma Relai contributors | System governance | Agent-controllable canvas or domain editor | External-agent canvas | source · active |
| [Figma MCP Bridge](projects/figma-mcp-bridge/) | Hopp | Native artifact authoring | Agent-controllable canvas or domain editor | External-agent canvas | source · active |
| [CSS Studio](projects/css-studio/) | Motion | Visual authoring of executable source | Runtime overlay or context bridge | Runtime-intent relay | architecture · active |
| [Dreamina](projects/dreamina/) | ByteDance | Delegated creation | Established visual platform with AI | Native graph authority | architecture · active |
| [Agent-Native Design](projects/agent-native-design/) | Builder.io | Delegated creation | Standalone design-agent workspace | Source-authority live projection | source · active |
| [Chordio / PX-bench](projects/chordio-px-bench/) | Chordio | Visual coordination and evidence | Visual decision or verification workspace | Filesystem agent with visual evidence | architecture · active-transition |
| [Fleck](projects/fleck/) | Fleck Agent | Delegated creation | Standalone design-agent workspace | Managed application-project graph | architecture · active |
| [Paraflow](projects/paraflow/) | Paraflow | Delegated creation | Standalone design-agent workspace | Managed application-project graph | architecture · active |
| [MANTIS CAD](projects/mantis-cad/) | MANTIS Software | Constraint-driven engineering | AI engineering-design workspace | Parametric engineering-model authority | architecture · active-transition |
| [Botlab.art](projects/botlab-art/) | Botlab.art | Native artifact authoring | Established visual platform with AI | Native graph authority | architecture · active |
| [Miro Prototypes](projects/miro-prototypes/) | Miro | Variant exploration and decision | Established visual platform with AI | Native graph authority | architecture · active |
| [Hostinger Horizons](projects/hostinger-horizons/) | Hostinger | End-to-end product delivery | AI app or site builder | Managed application-project graph | architecture · active |
| [UX Pilot](projects/ux-pilot/) | UX Pilot | Delegated creation | Standalone design-agent workspace | Native graph authority | architecture · active |
| [AI UI Designer](projects/ai-ui-designer/) | AI UI Designer | Delegated creation | Standalone design-agent workspace | Hosted generated-artifact workspace | architecture · active |
| [MasterGo AI](projects/mastergo-ai/) | MasterGo | System governance | Established visual platform with AI | Native graph authority | architecture · active |
| [墨刀 AI](projects/modao-ai/) | 墨刀 | Delegated creation | Established visual platform with AI | Native graph authority | architecture · active |
| [即时设计 AI](projects/jsdesign-ai/) | 即时设计 | Variant exploration and decision | Established visual platform with AI | Native graph authority | architecture · active |
| [boardmix AI](projects/boardmix-ai/) | boardmix | Native artifact authoring | Established visual platform with AI | Native graph authority | architecture · active |
| [Faísca](projects/faisca/) | Faísca | End-to-end product delivery | Standalone design-agent workspace | Managed application-project graph | architecture · active-transition |
| [Gloria](projects/gloria/) | Gloria | Native artifact authoring | Agent-controllable canvas or domain editor | Native graph authority | architecture · active |
| [Efecto](projects/efecto/) | Efecto | Native artifact authoring | Agent-controllable canvas or domain editor | Native graph authority | architecture · active |
| [SynthesisUI](projects/synthesisui/) | SynthesisUI | System governance | Design-code bridge | Source-authority live projection | architecture · active |
| [Adobe Firefly Creative Agent](projects/adobe-firefly-creative-agent/) | Adobe | Delegated creation | Established visual platform with AI | External-agent canvas | architecture · active-transition |
| [AIHouse](projects/aihouse/) | Sunvega / AIHouse | Constraint-driven engineering | AI engineering-design workspace | Native graph authority | architecture · active |
| [Bunyan](projects/bunyan/) | Bunyan | Constraint-driven engineering | AI engineering-design workspace | Managed application-project graph | architecture · active-transition |
| [Facade](projects/facade/) | Facade | Variant exploration and decision | AI engineering-design workspace | Candidate isolation and promotion | architecture · active |
| [Adly](projects/adly/) | Adly Technologies Ltd | End-to-end product delivery | Standalone design-agent workspace | Managed application-project graph | architecture · active |
| [M2 Canvas](projects/m2-canvas/) | Model Tool Labs Inc. | Visual authoring of executable source | Agent-controllable canvas or domain editor | Native graph authority | architecture · active |
| [Wonder](projects/wonder/) | Wonder | Visual authoring of executable source | Code-native visual editor or IDE | Source-authority live projection | architecture · active-transition |
| [Inspector](projects/inspector/) | Inspector | Runtime correction | Runtime overlay or context bridge | Runtime-intent relay | architecture · active |
| [Banani](projects/banani/) | Banani | Native artifact authoring | Standalone design-agent workspace | Native graph authority | architecture · active |
| [Dart AI Design Agent](projects/dart-design-agent/) | Dart | Visual coordination and evidence | Design surface inside an agent platform | External-agent canvas | architecture · active |
| [UXCanvas.ai](projects/uxcanvas/) | UXCanvas.ai | Delegated creation | Standalone design-agent workspace | Managed application-project graph | architecture · active |
| [Lovart](projects/lovart/) | Lovart | Native artifact authoring | Agent-controllable canvas or domain editor | Native graph authority | architecture · active |
| [dotGUI](projects/dotgui/) | dotGUI contributors | Design-code translation and grounding | Visual-editor infrastructure | Source-authority live projection | source · active |
| [FigSpecs](projects/figspecs/) | FigSpecs | System governance | Design-code bridge | Design-code materialization | architecture · active |
| [PlexUI AI Bridge](projects/plexui-bridge/) | Plex UI | System governance | Design-code bridge | External-agent canvas | architecture · active |
| [Program UI](projects/program-ui/) | Program UI / BuninUX | System governance | Design-code bridge | Design-code materialization | architecture · active-transition |
| [dMaya](projects/dmaya/) | dMaya | Delegated creation | Standalone design-agent workspace | Managed application-project graph | architecture · active |
| [DStoAI](projects/dstoai/) | DStoAI | Design-code translation and grounding | Design-code bridge | Design-code materialization | architecture · active |
| [YouWare](projects/youware/) | YouWare | End-to-end product delivery | AI app or site builder | Source-authority live projection | architecture · active |
| [Jeda.ai](projects/jeda/) | Jeda.ai | Native artifact authoring | Agent-controllable canvas or domain editor | Native graph authority | architecture · active |
| [Niki](projects/niki/) | Niki Studio | Native artifact authoring | Agent-controllable canvas or domain editor | Native graph authority | architecture · active-transition |
| [GenDesigns](projects/gendesigns/) | GenDesigns | Delegated creation | Standalone design-agent workspace | Hosted generated-artifact workspace | architecture · active |
| [Mimic AI](projects/mimic-ai/) | Mimic AI contributors | System governance | Design-code bridge | External-agent canvas | source · active |
| [Wix Harmony](projects/wix-harmony/) | Wix | End-to-end product delivery | AI app or site builder | Managed application-project graph | architecture · active |
| [Adalo AI](projects/adalo-ai/) | Adalo | End-to-end product delivery | AI app or site builder | Native graph authority | architecture · active |
| [Microsoft Designer](projects/microsoft-designer/) | Microsoft | Native artifact authoring | Established visual platform with AI | Native graph authority | architecture · active-transition |
| [Squarespace Blueprint AI](projects/squarespace-blueprint/) | Squarespace | End-to-end product delivery | AI app or site builder | Managed application-project graph | architecture · active |
| [one.com Aida](projects/one-aida/) | one.com | End-to-end product delivery | AI app or site builder | Managed application-project graph | architecture · active |
| [Brilliant](projects/brilliant-design/) | Brilliant Design Ltd | Native artifact authoring | Agent-controllable canvas or domain editor | Native graph authority | architecture · active |
| [Locofy](projects/locofy/) | Locofy Pte. Ltd. | Design-code translation and grounding | Design-code bridge | Design-code materialization | architecture · active |
| [Dualite](projects/dualite/) | Dualite | End-to-end product delivery | AI app or site builder | Managed application-project graph | architecture · active |
| [We0.ai](projects/we0/) | 蔚灵深度（杭州）科技有限公司 | End-to-end product delivery | AI app or site builder | Managed application-project graph | source · active-transition |
| [Visdiff](projects/visdiff/) | Visdiff | Runtime correction | Visual decision or verification workspace | Filesystem agent with visual evidence | architecture · active-transition |
| [Zigma](projects/zigma/) | Zigma by NextUI | System governance | Design-code bridge | Design-code materialization | architecture · historical |
| [Codejet](projects/codejet/) | Codejet | Design-code translation and grounding | Design-code bridge | Design-code materialization | architecture · active |
| [Rocket.new](projects/rocket-new/) | Rocket USA Inc. | End-to-end product delivery | AI app or site builder | Managed application-project graph | architecture · active-transition |
| [Serendie Design System AI](projects/serendie-ai/) | Mitsubishi Electric | System governance | Design-code bridge | External-agent canvas | source · active |
| [DESIGN.md Maker JP](projects/designmd-maker-jp/) | Elephancube Inc. | System governance | Standalone design-agent workspace | Hosted generated-artifact workspace | architecture · active |
| [AIDesigner](projects/aidesigner/) | AIDesigner Inc. | Native artifact authoring | Standalone design-agent workspace | Native graph authority | architecture · active |
| [HOZO](projects/hozo/) | Dentsu Digital Inc. | System governance | Design-code bridge | Design-code materialization | architecture · active-transition |
| [Layermate](projects/layermate/) | Layermate Inc. (Goodpatch group) | Native artifact authoring | Design-code bridge | External-agent canvas | architecture · active |
| [Musho](projects/musho/) | Musho | Delegated creation | Standalone design-agent workspace | External-agent canvas | architecture · historical |
| [Flato](projects/flato/) | Flato | Native artifact authoring | Agent-controllable canvas or domain editor | Native graph authority | architecture · active |
| [Komposo](projects/komposo/) | Komposo | Native artifact authoring | Standalone design-agent workspace | Native graph authority | architecture · active-transition |
| [Pixello](projects/pixello/) | Pixello | Visual authoring of executable source | Code-native visual editor or IDE | Source-authority live projection | architecture · active-transition |
| [DisenIA](projects/disenia/) | DisenIA | Native artifact authoring | Design-code bridge | Native graph authority | architecture · active |
| [Codia](projects/codia/) | Codia AI | Design-code translation and grounding | Design-code bridge | Design-code materialization | architecture · active |
| [Quby Weave](projects/quby-weave/) | Quby | Delegated creation | Standalone design-agent workspace | Native graph authority | architecture · active-transition |
| [ARTISO](projects/artiso/) | ARTISO AI | Constraint-driven engineering | AI engineering-design workspace | Managed application-project graph | architecture · active |
| [INESCOP footwear prototype](projects/inescop-footwear/) | INESCOP and ITI | Constraint-driven engineering | AI engineering-design workspace | Parametric engineering-model authority | architecture · historical |
| [Jenova UI prototype generator](projects/jenova/) | Jenova AI | Delegated creation | Standalone design-agent workspace | Hosted generated-artifact workspace | architecture · active |
| [UX Studio AI](projects/ux-studio-ai/) | UX Studio AI | Delegated creation | Standalone design-agent workspace | Hosted generated-artifact workspace | architecture · active |
| [Холст.ИИ](projects/holst-ai/) | Холст.ИИ | Delegated creation | Established visual platform with AI | Hosted generated-artifact workspace | architecture · active |
| [AI DESIGN SPACE](projects/ai-design-space/) | AI DESIGN SPACE | Native artifact authoring | Agent-controllable canvas or domain editor | Native graph authority | architecture · active |
| [Pippit AI Design](projects/pippit/) | ByteDance | Delegated creation | Established visual platform with AI | Hosted generated-artifact workspace | architecture · active |
| [EaseUI](projects/easeui/) | EaseUI | Visual authoring of executable source | Code-native visual editor or IDE | Source-authority live projection | architecture · active |
| [Appy Pie AI UI Generator](projects/appy-pie-ui/) | Appy Pie | End-to-end product delivery | AI app or site builder | Managed application-project graph | architecture · active |
| [Rosebud AI](projects/rosebud-ai/) | Rosebud AI | End-to-end product delivery | AI engineering-design workspace | Managed application-project graph | architecture · active |
| [Vidova](projects/vidova/) | DeepShot Inc. | Runtime correction | Established visual platform with AI | Native graph authority | architecture · active |
| [PPTCraft](projects/pptcraft/) | PPTCraft | Delegated creation | Standalone design-agent workspace | Design-code materialization | architecture · active-transition |
| [Influencer Studio](projects/influencer-studio/) | Influencer Studio | Native artifact authoring | Established visual platform with AI | Native graph authority | architecture · active |
| [Reel Studio](projects/reel-studio/) | Reel Studio | Delegated creation | Agent-controllable canvas or domain editor | Managed application-project graph | architecture · active |
| [OkkSlides](projects/okkslides/) | Autogent | Native artifact authoring | Agent-controllable canvas or domain editor | Native graph authority | architecture · active |
| [SlideX](projects/slidex/) | SlideX | Native artifact authoring | Standalone design-agent workspace | Native graph authority | architecture · active |
| [Zoea](projects/zoea/) | Zoea | Visual authoring of executable source | Code-native visual editor or IDE | Source-authority live projection | architecture · active |
| [Story AI Video Editor](projects/story-video-editor/) | Story.com | Runtime correction | Established visual platform with AI | Native graph authority | architecture · active |
| [Preso](projects/preso/) | Preso | Delegated creation | Agent-controllable canvas or domain editor | Native graph authority | architecture · active |
| [Visk](projects/visk/) | Visk | Design-code translation and grounding | Design-code bridge | Design-code materialization | architecture · active |
| [DeckScript](projects/deckscript/) | DeckScript | Native artifact authoring | Agent-controllable canvas or domain editor | Native graph authority | architecture · active |
| [Google Vids](projects/google-vids/) | Google | Native artifact authoring | Established visual platform with AI | Managed application-project graph | architecture · active |
| [Recraft](projects/recraft/) | Recraft | Native artifact authoring | Established visual platform with AI | Native graph authority | architecture · active |
| [Kittl](projects/kittl/) | Kittl | Native artifact authoring | Established visual platform with AI | Native graph authority | architecture · active |
| [CapCut](projects/capcut/) | ByteDance | Native artifact authoring | Established visual platform with AI | Native graph authority | architecture · active |
| [Dafty](projects/dafty/) | Dafty | System governance | Established visual platform with AI | Managed application-project graph | architecture · active |
| [Autodesk Flow Studio](projects/autodesk-flow-studio/) | Autodesk | Constraint-driven engineering | AI engineering-design workspace | Parametric engineering-model authority | architecture · active-transition |
| [Hemline](projects/hemline/) | Hemline | Constraint-driven engineering | AI engineering-design workspace | Managed application-project graph | architecture · active |
| [TextoCAD](projects/textocad/) | GadiDokan Pvt. Ltd. | Constraint-driven engineering | AI engineering-design workspace | Parametric engineering-model authority | architecture · active |
| [ArchGen](projects/archgen/) | ArchGen | Constraint-driven engineering | AI engineering-design workspace | Parametric engineering-model authority | architecture · active-transition |
| [Prompt2CAD](projects/prompt2cad/) | Prompt2CAD | Constraint-driven engineering | AI engineering-design workspace | Parametric engineering-model authority | architecture · active |
| [Forgent3D](projects/forgent3d/) | Forgent3D | Visual authoring of executable source | AI engineering-design workspace | Source-authority live projection | source · active-transition |
| [AdderCAD](projects/addercad/) | Adder Labs | Runtime correction | Runtime overlay or context bridge | Runtime-intent relay | architecture · active-transition |
| [42Maker](projects/42maker/) | 42Maker | Constraint-driven engineering | AI engineering-design workspace | Parametric engineering-model authority | architecture · active |
| [Mercer](projects/mercer-fashion/) | Mercer Design Studio Inc. | End-to-end product delivery | AI engineering-design workspace | Managed application-project graph | architecture · active-transition |
| [BuildCAD](projects/buildcad/) | BuildCAD AI | Constraint-driven engineering | AI engineering-design workspace | Parametric engineering-model authority | architecture · active |
| [CadCursor](projects/cadcursor/) | CadCursor | Constraint-driven engineering | AI engineering-design workspace | Parametric engineering-model authority | architecture · active-transition |
| [ARCHITEChTURES](projects/architechtures/) | ARCHITEChTURES | Constraint-driven engineering | AI engineering-design workspace | Parametric engineering-model authority | architecture · active |
| [Bezi](projects/bezi/) | Bezi | Visual authoring of executable source | Design surface inside an agent platform | Source-authority live projection | architecture · active-transition |
| [Unity AI tools](projects/unity-ai-tools/) | Unity | Visual authoring of executable source | Design surface inside an agent platform | Source-authority live projection | architecture · active-transition |
| [DRESSX AI Suite](projects/dressx-ai-suite/) | DRESSX / More Dash Inc. | End-to-end product delivery | Established visual platform with AI | Hosted generated-artifact workspace | architecture · active |
| [Pixso](projects/pixso/) | Shenzhen Bosi Yunchuang Technology | Native artifact authoring | Established visual platform with AI | Native graph authority | architecture · active |
| [Orbis](projects/orbis/) | Orbis | Visual authoring of executable source | Standalone design-agent workspace | Source-authority live projection | architecture · active |
| [TapCanvas](projects/tapcanvas/) | TapCanvas | End-to-end product delivery | Standalone design-agent workspace | Managed application-project graph | architecture · active-transition |
| [UXbot](projects/uxbot/) | UXbot | Delegated creation | Standalone design-agent workspace | Hosted generated-artifact workspace | architecture · active |
| [Autocraft](projects/autocraft/) | Autocraft | Visual authoring of executable source | Standalone design-agent workspace | Hosted generated-artifact workspace | architecture · active-transition |
| [Hyperplane](projects/hyperplane/) | Hyperplane | Variant exploration and decision | Visual decision or verification workspace | Candidate isolation and promotion | architecture · active |
| [Backdraft](projects/backdraft/) | Backdraft | Visual authoring of executable source | Code-native visual editor or IDE | Source-authority live projection | architecture · active |
| [VberAI Studio](projects/vberai-studio/) | Shanghai Xingyun Network Technology | Native artifact authoring | AI engineering-design workspace | Native graph authority | architecture · active |
| [FigCraft](projects/figcraft/) | QINAXIS TECHNOLOGY GROUP LIMITED | Delegated creation | Standalone design-agent workspace | Native graph authority | architecture · active |
| [Mowgli](projects/mowgli/) | Mowgli AI | Delegated creation | Standalone design-agent workspace | Candidate isolation and promotion | architecture · active |
| [Uitiful](projects/uitiful/) | Uitiful | Delegated creation | Standalone design-agent workspace | Hosted generated-artifact workspace | architecture · active-transition |
| [Websim](projects/websim/) | Websim Inc. | End-to-end product delivery | AI app or site builder | Hosted generated-artifact workspace | architecture · active |
| [gNucleus](projects/gnucleus/) | gNucleus AI | Constraint-driven engineering | AI engineering-design workspace | Parametric engineering-model authority | architecture · active |
| [GemDesign](projects/gemdesign/) | Hangzhou Yuantiao Technology | Delegated creation | Standalone design-agent workspace | Native graph authority | architecture · active |
| [灵境画布](projects/soulcanvas/) | 灵境画布 | Delegated creation | Standalone design-agent workspace | Native graph authority | architecture · active |
| [AIPTO](projects/aipto/) | AIPTO | Delegated creation | Standalone design-agent workspace | Native graph authority | architecture · active |
| [大腾智能 CAD](projects/datengcad/) | Shenzhen Dateng Information Technology | Constraint-driven engineering | AI engineering-design workspace | Parametric engineering-model authority | architecture · active |
| [Layout](projects/layout/) | Layout | System governance | Design-code bridge | Design-code materialization | architecture · active |
| [TypeUI](projects/typeui/) | TypeUI | System governance | Design-code bridge | Design-code materialization | architecture · active |
| [Windframe](projects/windframe/) | Devwares / Windframe | Visual authoring of executable source | Code-native visual editor or IDE | Source-authority live projection | architecture · active |
| [Step1](projects/step1/) | Step1 | Delegated creation | AI app or site builder | Hosted generated-artifact workspace | architecture · active |
| [OpenUI](projects/openui/) | Thesys / OpenUI contributors | Native artifact authoring | Visual-editor infrastructure | Native graph authority | source · active |
| [AgentSCAD](projects/agent-scad/) | AgentSCAD / Kevoyuan | Constraint-driven engineering | AI engineering-design workspace | Parametric engineering-model authority | source · active |
| [Gemcoder.AI](projects/gemcoder-ai/) | Hangzhou Yuantiao Technology | End-to-end product delivery | AI app or site builder | Managed application-project graph | architecture · active-transition |
| [AI Prototyper](projects/ai-prototyper/) | AI Prototyper research project | Delegated creation | Agent-controllable canvas or domain editor | Native graph authority | source · active |
| [Tokvista](projects/tokvista/) | Tokvista / Nibin Kurian | System governance | Design-code bridge | Design-code materialization | architecture · active |
| [Behavr](projects/behavr/) | Behavr | Visual coordination and evidence | Visual decision or verification workspace | Hosted generated-artifact workspace | architecture · active |
| [Dawn](projects/dawn-design/) | Dawnlabs Intelligence Ltd | Visual authoring of executable source | Standalone design-agent workspace | Source-authority live projection | architecture · active-transition |
| [MYDESIGN.MD](projects/mydesign-md/) | MYDESIGN.MD | System governance | Design-code bridge | Design-code materialization | architecture · active |
| [DESIGNmd](projects/designmd/) | DESIGNmd | System governance | Design-code bridge | Design-code materialization | architecture · active |
| [Prompt To App](projects/prompt-to-app/) | Prompt To App | End-to-end product delivery | AI app or site builder | Managed application-project graph | architecture · active |
| [Friction](projects/friction/) | Friction UX | Visual coordination and evidence | Visual decision or verification workspace | Hosted generated-artifact workspace | architecture · active |
| [Superinterface](projects/superinterface/) | Supercorp | Native artifact authoring | Visual-editor infrastructure | External-agent canvas | source · active |
| [Zinloop](projects/zinloop/) | Zinloop | Native artifact authoring | Agent-controllable canvas or domain editor | Native graph authority | architecture · active |
| [Sio](projects/sio/) | Sio | Visual coordination and evidence | Visual decision or verification workspace | Hosted generated-artifact workspace | architecture · active |
| [UserTesting](projects/usertesting/) | UserTesting | Visual coordination and evidence | Established visual platform with AI | Managed application-project graph | architecture · active |
| [Pega Blueprint](projects/pega-blueprint/) | Pegasystems | End-to-end product delivery | Standalone design-agent workspace | Managed application-project graph | architecture · active |
| [Open Generative UI](projects/open-generative-ui/) | CopilotKit | Delegated creation | Visual-editor infrastructure | Hosted generated-artifact workspace | source · active |
| [Draftbit](projects/draftbit/) | Draftbit | End-to-end product delivery | AI app or site builder | Source-authority live projection | architecture · active |
| [Statecraft](projects/statecraft/) | Statecraft | Visual authoring of executable source | Code-native visual editor or IDE | Source-authority live projection | architecture · active |
| [Marmo UI](projects/marmo-ui/) | Marmo UI / Mahmoud Ilyan | System governance | Design-code bridge | External-agent canvas | source · active |
| [DesignFlow](projects/designflow/) | DesignFlow / Jason | Visual authoring of executable source | Code-native visual editor or IDE | Source-authority live projection | source · active |
| [Figr](projects/figr/) | Figrfast Systems | Visual coordination and evidence | Standalone design-agent workspace | Hosted generated-artifact workspace | architecture · active |
| [Replay](projects/replay/) | Replay | Visual authoring of executable source | Design-code bridge | Source-authority live projection | architecture · active |
| [Zephyr Framework](projects/zephyr-framework/) | Zephyr Framework / Dalton Carr | Native artifact authoring | Visual-editor infrastructure | External-agent canvas | source · active |
| [A2UI](projects/a2ui/) | A2UI Project | Native artifact authoring | Visual-editor infrastructure | Native graph authority | source · active-transition |
| [Handle](projects/handle/) | Tonkotsu AI | Runtime correction | Runtime overlay or context bridge | Runtime-intent relay | source · active |
| [Caliper](projects/caliper/) | Caliper | Visual authoring of executable source | Code-native visual editor or IDE | Source-authority live projection | architecture · active-transition |
| [Design Mode](projects/design-mode-extension/) | Design Mode / Sandeep Baskaran | Runtime correction | Runtime overlay or context bridge | Runtime-intent relay | source · active |
| [CodeCanvas AI](projects/codecanvas-ai/) | CodeCanvas AI / Farid Garcia | Visual authoring of executable source | Code-native visual editor or IDE | Source-authority live projection | source · active |
| [Prefab](projects/prefab/) | Prefect | Native artifact authoring | Visual-editor infrastructure | Native graph authority | source · active |
| [QoQo](projects/qoqo/) | QoQo | Visual coordination and evidence | Standalone design-agent workspace | External-agent canvas | architecture · active |
| [BUX](projects/bux/) | BUX / independent creator | Native artifact authoring | Agent-controllable canvas or domain editor | External-agent canvas | architecture · active |
| [DreamUI](projects/dreamui/) | DreamUI / Noor Maqsood | Native artifact authoring | Standalone design-agent workspace | External-agent canvas | architecture · active |
| [Prompt.to.design](projects/prompt-to-design/) | Superun | Native artifact authoring | Agent-controllable canvas or domain editor | External-agent canvas | architecture · active |
| [Superun](projects/superun/) | Superun | End-to-end product delivery | AI app or site builder | Managed application-project graph | architecture · active |
| [1UI](projects/oneui/) | 1UI | Design-code translation and grounding | Design-code bridge | Hosted generated-artifact workspace | architecture · active |
| [Flaude](projects/flaude/) | Flaude / Ana Gigashvili | Native artifact authoring | Agent-controllable canvas or domain editor | External-agent canvas | source · active |
| [Worried Presenter](projects/worried-presenter/) | Worried Presenter | Visual coordination and evidence | Agent-controllable canvas or domain editor | External-agent canvas | architecture · active |
| [Design System Docs Generator](projects/design-system-docs-generator/) | Design System Docs Generator | System governance | Agent-controllable canvas or domain editor | External-agent canvas | architecture · active |
| [AI UX Writer](projects/ai-ux-writer/) | AI UX Writer / Ragnak8 | Native artifact authoring | Agent-controllable canvas or domain editor | External-agent canvas | architecture · active |
| [Buzzy](projects/buzzy/) | Buzzy | End-to-end product delivery | Design-code bridge | Managed application-project graph | architecture · active |
| [RocketPen](projects/rocketpen/) | RocketPen | Native artifact authoring | Agent-controllable canvas or domain editor | External-agent canvas | architecture · active |
| [Aesthetron AI](projects/aesthetron/) | Aesthetron AI | Native artifact authoring | Agent-controllable canvas or domain editor | External-agent canvas | architecture · active |
| [Dora AI](projects/dora-ai/) | Dora | Delegated creation | AI app or site builder | Hosted generated-artifact workspace | architecture · active |
| [AINaming](projects/ainaming/) | donghuc | System governance | Agent-controllable canvas or domain editor | Native graph authority | source · active |
| [Heuristic AI](projects/heuristic-ai/) | donghuc | Visual coordination and evidence | Visual decision or verification workspace | Filesystem agent with visual evidence | source · active |
| [Candor](projects/candor/) | Candor / independent creator | Visual coordination and evidence | Visual decision or verification workspace | Filesystem agent with visual evidence | architecture · active |
| [ExportFlow](projects/exportflow/) | ExportFlow / independent creator | Design-code translation and grounding | Design-code bridge | Design-code materialization | architecture · active |
| [Design Audit Lens](projects/design-audit-lens/) | Design Audit Lens / Muhammad Rahil | Visual coordination and evidence | Visual decision or verification workspace | Filesystem agent with visual evidence | architecture · active |
| [GlideDesign](projects/glide-design/) | GlideDesign / Brian Permut | Delegated creation | Standalone design-agent workspace | Hosted generated-artifact workspace | architecture · active |
| [Figma Variables Generator Ecosystem](projects/figma-variables-generator/) | Shanmugha Sundaram Srinivasan | System governance | Agent-controllable canvas or domain editor | External-agent canvas | source · active |
| [Fluvara](projects/fluvara/) | Fluvara | Native artifact authoring | Agent-controllable canvas or domain editor | External-agent canvas | architecture · active |
| [SVGenius for Figma](projects/svgenius-figma/) | SVGenius / Dmitrii Teleganov | Delegated creation | Agent-controllable canvas or domain editor | External-agent canvas | architecture · active |
| [Design System Sync](projects/design-system-sync/) | Alexander Burgos | System governance | Design-code bridge | Design-code materialization | architecture · active |
| [Atomic Component Generator](projects/atomic-component-generator/) | Alexander Burgos | Native artifact authoring | Agent-controllable canvas or domain editor | External-agent canvas | architecture · active-transition |
| [FigML](projects/figml/) | FigML / Piotr and Adrian | Design-code translation and grounding | Design-code bridge | Design-code materialization | architecture · active |
| [Taploop Studio](projects/taploop-studio/) | Taploop | Delegated creation | Standalone design-agent workspace | Native graph authority | architecture · active |
| [SyncPoint](projects/syncpoint/) | Axis Labs LLC | System governance | Design-code bridge | Design-code materialization | architecture · active-transition |
| [ThroughLine](projects/throughline/) | ThroughLine / Jordan Pease | System governance | Design-code bridge | External-agent canvas | source · active |
| [TokenIgnite](projects/tokenignite/) | Nico Brinkschröder | Runtime correction | Design-code bridge | Runtime-intent relay | architecture · active-transition |
| [SEO Image Renamer](projects/seo-image-renamer-figma/) | wwwhat | End-to-end product delivery | Agent-controllable canvas or domain editor | Native graph authority | architecture · active |
| [JMPY.me](projects/jmpy-me/) | JMPY.me | End-to-end product delivery | Agent-controllable canvas or domain editor | Managed application-project graph | architecture · active |
| [TypeCraft](projects/typecraft/) | TypeCraft / Jason | Delegated creation | Agent-controllable canvas or domain editor | External-agent canvas | architecture · active |
| [MKitFlow](projects/mkitflow/) | MKitPlug | Visual coordination and evidence | Agent-controllable canvas or domain editor | Runtime-intent relay | architecture · active |
| [FigPilot.ai](projects/figpilot-ai/) | Qutesoft / quill zhou | Delegated creation | Agent-controllable canvas or domain editor | External-agent canvas | architecture · active |
| [PicWise.ai](projects/picwise-ai/) | Qutesoft / quill zhou | Delegated creation | Agent-controllable canvas or domain editor | External-agent canvas | architecture · active |
| [Calino](projects/calino/) | Calino / Achmad Alimin | Delegated creation | Agent-controllable canvas or domain editor | External-agent canvas | architecture · active |
| [SparkUI](projects/sparkui/) | SparkUI / abbaas | Design-code translation and grounding | Design-code bridge | Design-code materialization | architecture · active |
| [ContentKit](projects/contentkit/) | Intersections Design Lab / Kai Magnus Müller | System governance | Agent-controllable canvas or domain editor | Managed application-project graph | architecture · active-transition |
| [Vibe Workflow](projects/vibe-workflow/) | MuAPI / SamurAIGPT / Anil Matcha | Native artifact authoring | Agent-controllable canvas or domain editor | Native graph authority | source · active |
| [Recombyn](projects/recombyn/) | Recombyn / TianMeng | Native artifact authoring | Agent-controllable canvas or domain editor | Native graph authority | source · active |
| [Superdesign MCP Server](projects/superdesign-mcp/) | jonthebeef | Delegated creation | Design-code bridge | Filesystem agent with visual evidence | source · active |
| [Jaaz](projects/jaaz/) | Jaaz / 11cafe | Native artifact authoring | Agent-controllable canvas or domain editor | Native graph authority | source · active |
| [ATV Design](projects/atv-design/) | All The Vibes | Delegated creation | Standalone design-agent workspace | Filesystem agent with visual evidence | source · active |
| [Stick](projects/stick/) | Atiqullah Naemi | Delegated creation | Standalone design-agent workspace | Managed application-project graph | source · active |
| [Syntropy](projects/syntropy/) | Prateet Mishra | Constraint-driven engineering | AI engineering-design workspace | Native graph authority | source · active |
| [Design Pro](projects/designpro/) | Onimix | Native artifact authoring | Agent-controllable canvas or domain editor | Native graph authority | source · active |
| [Canvas Copilot for Penpot](projects/canvas-copilot-penpot/) | Gede Sudimahendra | Native artifact authoring | Agent-controllable canvas or domain editor | External-agent canvas | source · active-transition |
| [Pen Editor](projects/pen-editor/) | Dan Rozhkov | Native artifact authoring | Agent-controllable canvas or domain editor | Native graph authority | source · active |
| [Cordyceps](projects/cordyceps/) | Brooks Talley | Constraint-driven engineering | AI engineering-design workspace | External-agent canvas | source · active |
| [Convey](projects/convey/) | Bitovi | Runtime correction | Runtime overlay or context bridge | Runtime-intent relay | source · active |
| [baoyu-design](projects/baoyu-design/) | Jim Liu / 宝玉 | Delegated creation | Standalone design-agent workspace | Filesystem agent with visual evidence | source · active |
| [Agent Game Forge](projects/agent-game-forge/) | 0xfunky | Visual authoring of executable source | Code-native visual editor or IDE | Source-authority live projection | source · active-transition |
| [Airship](projects/airship/) | Nayan / Airship | Runtime correction | Runtime overlay or context bridge | Runtime-intent relay | source · active-transition |
| [Open AI Design Agent](projects/open-ai-design-agent/) | MuAPI / SamurAIGPT / Anil Matcha | Delegated creation | Standalone design-agent workspace | Managed application-project graph | source · active |
| [claude-code-design](projects/claude-code-design/) | Vlad Kooklev / bluzir | Delegated creation | Standalone design-agent workspace | Filesystem agent with visual evidence | source · active |
| [Fudge](projects/fudge/) | Fudge / simdi jinkins | Visual coordination and evidence | Visual decision or verification workspace | Filesystem agent with visual evidence | architecture · active |
| [PageGen](projects/pagegen/) | MemFree / PageGen | End-to-end product delivery | AI app or site builder | Source-authority live projection | source · active |
| [App Club Design](projects/app-club-design/) | App Club Design / munonzito | Native artifact authoring | Agent-controllable canvas or domain editor | Native graph authority | source · active-transition |
| [Creative Forge](projects/creative-forge/) | Creative Forge / Harsh Solanki | Native artifact authoring | Agent-controllable canvas or domain editor | Native graph authority | source · active |
| [Proto-me](projects/protome/) | Proto-me | Visual coordination and evidence | Design surface inside an agent platform | Filesystem agent with visual evidence | source · active |
| [design-agent by NightGhost](projects/nightghost-design-agent/) | NightGhost4 / Tyler Norcross | Visual coordination and evidence | Visual decision or verification workspace | Filesystem agent with visual evidence | source · active-transition |
| [TypeUI DESIGN.md Extractor](projects/design-md-chrome/) | Bergside | System governance | Design-code bridge | Design-code materialization | source · active |
| [Dembrandt](projects/dembrandt/) | Dembrandt | System governance | Design-code bridge | Design-code materialization | source · active |
| [figma-cli](projects/figma-cli/) | Sil Bormüller / figma-cli | Native artifact authoring | Agent-controllable canvas or domain editor | External-agent canvas | source · active |
| [oh-my-design](projects/oh-my-design/) | oh-my-design / 곽성재 | System governance | Standalone design-agent workspace | Filesystem agent with visual evidence | source · active |
| [web-to-design-md](projects/web-to-design-md/) | Paidax | System governance | Design-code bridge | Filesystem agent with visual evidence | source · active-transition |
| [Ghost AI](projects/ghost-ai/) | JavaScript Mastery / Adrian Hajdin | Constraint-driven engineering | AI engineering-design workspace | Native graph authority | source · active-transition |
| [Node Canvas](projects/node-canvas/) | Node Canvas / ozoshanniao | Native artifact authoring | Agent-controllable canvas or domain editor | Native graph authority | source · active |
| [AI Canvas by Kaiyu Hsu](projects/kyh-ai-canvas/) | Kaiyu Hsu / AI Canvas | Native artifact authoring | Visual-editor infrastructure | Native graph authority | source · active |
| [Tutti](projects/tutti/) | Tutti | Visual coordination and evidence | Design surface inside an agent platform | Managed application-project graph | source · active |
| [Loomic](projects/loomic/) | Loomic / fancyboi999 | Native artifact authoring | Agent-controllable canvas or domain editor | Native graph authority | source · active |
| [AI Canvas Desktop](projects/ai-canvas-desktop/) | Nick Chadwick | Native artifact authoring | Agent-controllable canvas or domain editor | Native graph authority | source · active-transition |
| [AI Canvas Studio](projects/ai-canvas-studio/) | An Pham | Native artifact authoring | Agent-controllable canvas or domain editor | Native graph authority | source · active-transition |
| [NanoCanvas](projects/nanocanvas/) | An Hoang Vo | Native artifact authoring | Agent-controllable canvas or domain editor | Native graph authority | source · active-transition |
| [StoryFlow AI Canvas](projects/storyflow-ai-canvas/) | StoryFlow AI Canvas / luanluan-l | Native artifact authoring | Agent-controllable canvas or domain editor | Native graph authority | source · active-transition |
| [D2 Canvas](projects/d2-canvas/) | Aristos / D2 Canvas | Native artifact authoring | Agent-controllable canvas or domain editor | Source-authority live projection | source · active-transition |
| [figma-ui-mcp](projects/figma-ui-mcp/) | Trần Hoài Hưng / figma-ui-mcp | Native artifact authoring | Agent-controllable canvas or domain editor | Native graph authority | source · active |
| [HyperFrames](projects/hyperframes/) | HeyGen | Delegated creation | Code-native visual editor or IDE | Source-authority live projection | source · active |
| [Design Farmer](projects/design-farmer/) | Hak Lee / Design Farmer | System governance | General agent with visual tools | Filesystem agent with visual evidence | source · active |
| [DESIGN.md Extractor](projects/design-md-extractor/) | jpoindexter / DESIGN.md Extractor | System governance | Design-code bridge | Design-code materialization | source · active |
| [Picasso](projects/picasso/) | Viperr / Picasso | Delegated creation | Standalone design-agent workspace | Candidate isolation and promotion | source · active-transition |
| [DESIGN.md Generator](projects/design-md-generator/) | Jason HND / DESIGN.md Generator | System governance | Design-code bridge | Design-code materialization | source · active-transition |
| [Design System Extractor Skill](projects/design-system-extractor-skill/) | Simon Bloom / Design System Extractor | System governance | Design-code bridge | Design-code materialization | source · active-transition |
| [Claudesign](projects/claudesign/) | ClaudeMate / Claudesign | System governance | Standalone design-agent workspace | Filesystem agent with visual evidence | source · active-transition |
| [Awesome Design Extractor](projects/awesome-design-extractor/) | Myoji / Awesome Design Extractor | System governance | Design-code bridge | Design-code materialization | source · active-transition |
| [DESIGN.md Canvas](projects/designmd-canvas/) | Christopher Maneu / DESIGN.md Canvas | System governance | Agent-controllable canvas or domain editor | External-agent canvas | source · active-transition |
| [design.md Agent Skill](projects/design-md-agent-skill/) | Jeftar Mascarenhas / design.md | System governance | General agent with visual tools | Filesystem agent with visual evidence | source · active-transition |
| [AI UI Style Director](projects/ai-ui-style-director/) | BayesWang / AI UI Style Director | Variant exploration and decision | Standalone design-agent workspace | Candidate isolation and promotion | source · active |
| [Copy Design CLI](projects/copy-design-cli/) | lxcong / Copy Design CLI | Design-code translation and grounding | Design-code bridge | Design-code materialization | source · active-transition |
| [Plumb](projects/plumb-mcp/) | Tathagat Maitray / Plumb | Design-code translation and grounding | Design-code bridge | Design-code materialization | source · active |
| [HyCanvas](projects/hycanvas/) | HyScaler | Native artifact authoring | Standalone design-agent workspace | Native graph authority | source · active |
| [Sand](projects/sand-canvas/) | Sand / kno-raziel | Native artifact authoring | Agent-controllable canvas or domain editor | Native graph authority | source · active-transition |
| [Drawtir](projects/drawtir/) | Rantir | Native artifact authoring | Standalone design-agent workspace | Native graph authority | source · active-transition |
| [Djasha System](projects/djasha-system/) | Djasha System | System governance | Design-code bridge | Design-code materialization | source · active-transition |
| [Quill](projects/quill-design/) | Michael Hirst / Quill | Native artifact authoring | Standalone design-agent workspace | Native graph authority | source · active-transition |
| [Buildev](projects/buildev/) | Bryxnn / Buildev | Native artifact authoring | Agent-controllable canvas or domain editor | Native graph authority | source · active |
| [Designpowers](projects/designpowers/) | MC Dean / Designpowers | Delegated creation | General agent with visual tools | Filesystem agent with visual evidence | source · active |
| [design-for-ai](projects/design-for-ai/) | Ryan / design-for-ai | Delegated creation | General agent with visual tools | Candidate isolation and promotion | source · active |
| [stitch-kit](projects/stitch-kit/) | Booplex / stitch-kit | Delegated creation | Design-code bridge | External-agent canvas | source · active |
| [Whiteport Design Studio](projects/whiteport-design-studio/) | BMad Code / Whiteport Design Studio | End-to-end product delivery | General agent with visual tools | Filesystem agent with visual evidence | source · active |
| [Penpot MCP Server](projects/penpot-mcp-server/) | ZCube / Penpot MCP Server | Native artifact authoring | Agent-controllable canvas or domain editor | Native graph authority | source · active-transition |
| [Penpot AI Kit](projects/penpot-ai-kit/) | Penpot | Native artifact authoring | Design surface inside an agent platform | Native graph authority | source · active |
| [ExFig](projects/exfig/) | DesignPipe | Design-code translation and grounding | Design-code bridge | Design-code materialization | source · active |
| [Penpot Skills](projects/penpot-skills/) | Juan de la Cruz / Penpot Skills | Native artifact authoring | Design-code bridge | External-agent canvas | source · active-transition |
| [Design Ruler](projects/design-ruler/) | XiaoFeng / Design Ruler | Runtime correction | Runtime overlay or context bridge | Filesystem agent with visual evidence | source · active |
| [Visionary for Claude Code](projects/visionary-claude/) | GIT Webb & App Studio AB | Delegated creation | Standalone design-agent workspace | Candidate isolation and promotion | source · active |
| [UICanvas](projects/uicanvas/) | UICanvas / markvely | Native artifact authoring | Agent-controllable canvas or domain editor | External-agent canvas | source · active-transition |
| [PPT Master](projects/ppt-master/) | Hugo He / PPT Master | Delegated creation | Standalone design-agent workspace | Design-code materialization | source · active |
| [iPolloWork](projects/ipollowork/) | Devin AXIS / iPolloWork | Delegated creation | Design surface inside an agent platform | Managed application-project graph | source · active |
| [Pinvou Agent](projects/pinvou-agent/) | Pinvou | Delegated creation | Design surface inside an agent platform | Managed application-project graph | source · active |
| [cc-design](projects/cc-design/) | ZeroZ Lab / cc-design | Delegated creation | General agent with visual tools | Filesystem agent with visual evidence | source · active |
| [Agent Office Suite](projects/agent-office-suite/) | manpo / AOSE | Native artifact authoring | Design surface inside an agent platform | Native graph authority | source · active |
| [Abu Cowork](projects/abu-cowork/) | Shawn / Abu | Delegated creation | Design surface inside an agent platform | Managed application-project graph | source · active |
| [slides-grab](projects/slides-grab/) | NomaDamas | Native artifact authoring | Standalone design-agent workspace | Source-authority live projection | source · active |
| [kin3o](projects/kin3o/) | Andrés Romero / kin3o | Delegated creation | Standalone design-agent workspace | Source-authority live projection | source · active |
| [Aniya Studio](projects/aniya-studio/) | Dongshuai / Aniya Studio | Native artifact authoring | Standalone design-agent workspace | Source-authority live projection | source · active |
| [TractStack](projects/tractstack/) | At Risk Media | Native artifact authoring | AI app or site builder | Native graph authority | source · active |
| [Kleva](projects/kleva/) | Seun Bamidele / Kleva | Delegated creation | AI app or site builder | Source-authority live projection | source · active-transition |
| [Claude Design System Prompt](projects/claude-design-system-prompt/) | Trystan Sarrade / Claude Design System Prompt | Delegated creation | General agent with visual tools | Filesystem agent with visual evidence | source · active |
| [Garden Skills](projects/garden-skills/) | ConardLi / Garden Skills | Delegated creation | General agent with visual tools | Filesystem agent with visual evidence | source · active |
| [Vibma](projects/vibma/) | ufira.ai | Native artifact authoring | Agent-controllable canvas or domain editor | External-agent canvas | source · historical |
| [AionUi](projects/aionui/) | iOfficeAI | Delegated creation | Design surface inside an agent platform | Managed application-project graph | source · active |
| [OfficeCLI](projects/officecli/) | iOfficeAI | Native artifact authoring | General agent with visual tools | Design-code materialization | source · active |
| [ALLWEONE Presentation AI](projects/presentation-ai/) | ALLWEONE | Native artifact authoring | Standalone design-agent workspace | Managed application-project graph | source · active |
| [OpenMontage](projects/openmontage/) | Calesthio / OpenMontage | Delegated creation | Standalone design-agent workspace | Filesystem agent with visual evidence | source · active |
| [GenOffice](projects/genoffice/) | Genspark / GenOffice | Native artifact authoring | Design surface inside an agent platform | Native graph authority | source · active |
| [Claude Code Video Toolkit](projects/claude-code-video-toolkit/) | Digital Samba | Delegated creation | General agent with visual tools | Filesystem agent with visual evidence | source · active |
| [Design DNA](projects/design-dna/) | Zanwei Guo / Design DNA | System governance | General agent with visual tools | Filesystem agent with visual evidence | source · active |
| [Presentation Builder](projects/presentation-builder/) | Zane Cole / Presentation Builder | Delegated creation | General agent with visual tools | Source-authority live projection | source · active-transition |
| [AI Slide Editor](projects/ai-slide-editor/) | Josephine van Delden / AI Slide Editor | Native artifact authoring | Standalone design-agent workspace | Native graph authority | source · active-transition |
| [Pix](projects/pix/) | Aleksandr Skobeltcyn / Pix | Design-code translation and grounding | Design-code bridge | Design-code materialization | source · active |
| [uSpec](projects/uspec/) | Ian Guisard / uSpec | System governance | Design-code bridge | Filesystem agent with visual evidence | source · active |
| [Reqwise Figma MCP](projects/reqwise-figma-mcp/) | Hoang Phan / Reqwise | Native artifact authoring | Agent-controllable canvas or domain editor | External-agent canvas | source · active |
| [Prototype to Figma Skill](projects/prototype-to-figma-skill/) | Amy Lima / Prototype to Figma | Design-code translation and grounding | Design-code bridge | External-agent canvas | source · active |
| [Figma MCP Write Server](projects/figma-mcp-write-server/) | Olivier Ozoux / Figma MCP Write Server | Native artifact authoring | Agent-controllable canvas or domain editor | External-agent canvas | source · active-transition |
| [Claude Design Auditor Skill](projects/claude-design-auditor-skill/) | Ash J / Design Auditor | Runtime correction | Visual decision or verification workspace | Candidate isolation and promotion | source · active |
| [Claude2Figma](projects/claude2figma/) | Sen Lin / Claude2Figma | System governance | Design-code bridge | External-agent canvas | source · active |
| [UX UI Agent Skills](projects/ux-ui-agent-skills/) | Thientan Soparat / UX UI Agent Skills | System governance | General agent with visual tools | Filesystem agent with visual evidence | source · active |
| [Figma Design System Skills](projects/figma-design-system-skills/) | Edenspiekermann | System governance | General agent with visual tools | External-agent canvas | source · active |
| [The Design Project Agent Skills](projects/thedesign-agent-skills/) | The Design Project | Delegated creation | General agent with visual tools | Filesystem agent with visual evidence | source · active |
| [Naksha Studio](projects/naksha-studio/) | Aditya Raj / Naksha | Delegated creation | General agent with visual tools | Filesystem agent with visual evidence | source · active |
| [Bridge](projects/noemuch-bridge/) | Noe Chague / Bridge | System governance | Design-code bridge | Design-code materialization | source · active |
| [OpenPage](projects/openpage/) | Building Open | Native artifact authoring | AI app or site builder | Native graph authority | source · active |
| [Vibe Otter Lite](projects/vibe-otter-lite/) | Vibe Otter | Native artifact authoring | AI app or site builder | Source-authority live projection | source · active-transition |
| [CraftFlow](projects/craftflow/) | Akameredon / CraftFlow | Native artifact authoring | AI app or site builder | Source-authority live projection | source · active-transition |
| [IntelliBuild](projects/intellibuild/) | Upendra / IntelliBuild | Visual authoring of executable source | AI app or site builder | Source-authority live projection | source · active-transition |
| [Jihan AI Web Builder](projects/jihan-ai-web-builder/) | Jihan Gajjar | Native artifact authoring | AI app or site builder | Native graph authority | source · active-transition |
| [ShopNest](projects/shopnest/) | Karanvir Singh / ShopNest | Native artifact authoring | AI app or site builder | Native graph authority | source · active |
| [AI CMS](projects/ai-cms/) | Saksham Tyagi / AI CMS | Native artifact authoring | AI app or site builder | Native graph authority | source · active-transition |
| [Webora](projects/webora/) | Keenoy / Webora | Visual authoring of executable source | AI app or site builder | Source-authority live projection | source · active-transition |
| [LaunchLayer AI](projects/launchlayer-ai/) | Lukas Wilson / LaunchLayer AI | Native artifact authoring | AI app or site builder | Native graph authority | source · active-transition |
| [Figma to design.md](projects/figma-to-design-md/) | Albert Zhang / Figma to design.md | Design-code translation and grounding | Design-code bridge | Filesystem agent with visual evidence | source · active |
| [Agentic Design Canvas](projects/agentic-design-canvas/) | Hao Liu / Agentic Design Canvas | Native artifact authoring | Agent-controllable canvas or domain editor | Native graph authority | source · active-transition |
| [Floor Plan Interior Render](projects/floorplan-interior-render/) | Umair Khan / Interior Render | Constraint-driven engineering | Standalone design-agent workspace | Native graph authority | source · active |
| [Genable](projects/genable/) | Musec / Genable | Native artifact authoring | Agent-controllable canvas or domain editor | External-agent canvas | architecture · active |
| [EoStudio](projects/eostudio/) | EmbeddedOS Research Foundation | Native artifact authoring | AI engineering-design workspace | Native graph authority | source · active-transition |
| [Better Design](projects/better-design/) | Marvin Kaunda / Better Design | System governance | General agent with visual tools | Filesystem agent with visual evidence | architecture · active |
| [UI Craft](projects/ui-craft/) | Edu Calvo / UI Craft | System governance | General agent with visual tools | Candidate isolation and promotion | source · active |
| [Reveal Presentations](projects/reveal-presentations/) | Goda Go / Reveal Presentations | Delegated creation | General agent with visual tools | Source-authority live projection | source · active |
| [Design System Multi-Point Inspection Kit](projects/design-system-inspection-kit/) | Brad Frost Web | System governance | Visual decision or verification workspace | Candidate isolation and promotion | source · active |
| [AI Design System Agents](projects/design-system-agents/) | Kamil Ziemann / Design System Agents | Design-code translation and grounding | Standalone design-agent workspace | Managed application-project graph | source · active-transition |
| [Pilot Marketing AI Design System](projects/pilot-marketing-ai-design-system/) | Pilot Design Team | System governance | General agent with visual tools | Filesystem agent with visual evidence | source · active |
| [Master AI Design System](projects/master-ai-design-system/) | Mohamed Ahmed / Master AI Design System | System governance | General agent with visual tools | Filesystem agent with visual evidence | source · active |
| [CHIP](projects/chip/) | Elleta McDaniel / CHIP | Visual coordination and evidence | Visual decision or verification workspace | Managed application-project graph | source · active-transition |
| [Enterprise AI Design System](projects/enterprise-ai-design-system/) | DRAI Agent / Enterprise AI Design System | System governance | General agent with visual tools | Filesystem agent with visual evidence | source · active-transition |
| [Brand Booklet](projects/brand-booklet/) | Tillmann Vey / Brand Booklet | Delegated creation | General agent with visual tools | Filesystem agent with visual evidence | source · active |
| [MCP-Link for Autodesk Fusion](projects/mcp-link-fusion/) | Aura Friday | Native artifact authoring | AI engineering-design workspace | External-agent canvas | source · active |
| [Massing](projects/massing/) | Matthew M. Emma / Massing | Constraint-driven engineering | AI engineering-design workspace | Parametric engineering-model authority | source · active |
| [Codex Slides](projects/codex-slides/) | nexu-io | Delegated creation | Standalone design-agent workspace | Filesystem agent with visual evidence | source · active |
| [Brand Design Skill](projects/brand-design-skill/) | 子圭时安 / 灵矩绘境 | Delegated creation | General agent with visual tools | Filesystem agent with visual evidence | source · active |
| [StyleSeed](projects/styleseed/) | StyleSeed / bitjaru | System governance | General agent with visual tools | Filesystem agent with visual evidence | source · active |
| [PPT Design Prompt](projects/ppt-design-prompt/) | Russell-cell | Design-code translation and grounding | Design-code bridge | Design-code materialization | source · active |
| [RampStack Brand Build Skills](projects/rampstack-skills/) | RampStack | System governance | General agent with visual tools | Filesystem agent with visual evidence | source · active |
| [Pronghorn](projects/pronghorn/) | Government of Alberta | Native artifact authoring | Design surface inside an agent platform | Managed application-project graph | source · active |
| [Impeccable](projects/impeccable/) | Paul Bakaus | Runtime correction | Runtime overlay or context bridge | Source-authority live projection | source · active |
| [Kami](projects/kami/) | Tw93 | Delegated creation | General agent with visual tools | Filesystem agent with visual evidence | source · active |
| [Presenton](projects/presenton/) | Presenton | Native artifact authoring | Standalone design-agent workspace | Native graph authority | source · active |
| [HugoBlox](projects/hugoblox/) | HugoBlox | Visual authoring of executable source | AI app or site builder | Source-authority live projection | architecture · active |
| [PPTist](projects/pptist/) | LLzzZZ / PPTist | Native artifact authoring | Established visual platform with AI | Native graph authority | source · active |
| [DraftDeckAI](projects/draftdeckai/) | Muneer Ali / DraftDeckAI | Native artifact authoring | Standalone design-agent workspace | Native graph authority | source · active |
| [FluidCAD](projects/fluidcad/) | Fluid CAD | Constraint-driven engineering | AI engineering-design workspace | Parametric engineering-model authority | source · active |
| [vCAD](projects/vcad/) | Cam Pedersen / vCAD | Constraint-driven engineering | AI engineering-design workspace | Parametric engineering-model authority | source · active |
| [Onshape MCP](projects/onshape-mcp/) | Damond Hedley / Onshape MCP | Constraint-driven engineering | Agent-controllable canvas or domain editor | Parametric engineering-model authority | source · active |
| [Jarvis Onshape MCP](projects/jarvis-onshape-mcp/) | Reshef Elisha / Jarvis Onshape MCP | Constraint-driven engineering | Agent-controllable canvas or domain editor | Parametric engineering-model authority | source · active |
| [SolidWorks Automation Skill](projects/solidworks-automation-skill/) | Wzyn / SolidWorks Automation Skill | Constraint-driven engineering | AI engineering-design workspace | Parametric engineering-model authority | source · active |
| [SolidPilot](projects/solidpilot/) | Cagatay Bakan / SolidPilot | Constraint-driven engineering | Agent-controllable canvas or domain editor | Parametric engineering-model authority | source · active |
| [CAE Agent Hub](projects/cae-agent-hub/) | Cai / CAE Agent Hub | Constraint-driven engineering | AI engineering-design workspace | External-agent canvas | source · active |
| [CAD CAE Copilot](projects/cad-cae-copilot/) | Libin Mao / CAD CAE Copilot | Constraint-driven engineering | AI engineering-design workspace | Parametric engineering-model authority | source · active |
| [SketchForge](projects/sketchforge/) | Formsmith / SketchForge | Constraint-driven engineering | Agent-controllable canvas or domain editor | Parametric engineering-model authority | source · active |
| [PartMode](projects/partmode/) | BOMWiki / PartMode | Constraint-driven engineering | AI engineering-design workspace | Parametric engineering-model authority | source · active |
| [CLI-Anything](projects/cli-anything/) | HKU Data Intelligence Lab | Native artifact authoring | General agent with visual tools | External-agent canvas | source · active |
| [AFFiNE](projects/affine/) | Toeverything / AFFiNE | Native artifact authoring | Established visual platform with AI | Native graph authority | source · active |
| [ONLYOFFICE AI Editors](projects/onlyoffice-ai-editors/) | ONLYOFFICE | Native artifact authoring | Established visual platform with AI | Native graph authority | source · active |
| [Presentation App](projects/presentation-app/) | Jerry Liu / Presentation App | Delegated creation | Standalone design-agent workspace | Native graph authority | source · active |
| [StarryKit](projects/starrykit/) | StarryKit | Delegated creation | Standalone design-agent workspace | Hosted generated-artifact workspace | architecture · active |
| [SlideFinder](projects/slidefinder/) | Aymen / SlideFinder | Variant exploration and decision | Visual decision or verification workspace | Candidate isolation and promotion | source · active |
| [SeaSlides](projects/seaslides/) | Touying / SeaSlides | Visual authoring of executable source | General agent with visual tools | Source-authority live projection | source · active |
| [director](projects/director/) | Herman Haggerty / Director | Visual coordination and evidence | General agent with visual tools | Filesystem agent with visual evidence | source · active |
| [ChillDeck](projects/chilldeck/) | Isha Upadhyay / ChillDeck | Delegated creation | Standalone design-agent workspace | Managed application-project graph | source · active |
| [SlideFlow](projects/slideflow/) | Souljoy / SlideFlow | Delegated creation | General agent with visual tools | Filesystem agent with visual evidence | source · active |
| [PPT SaaS](projects/ppt-saas/) | Shibin P / PPT SaaS | Native artifact authoring | Standalone design-agent workspace | Native graph authority | source · active |
| [Zero-Build Slides](projects/zero-build-slides/) | deco CMS | Visual authoring of executable source | General agent with visual tools | Source-authority live projection | source · active |
| [Frontend Slides Editable](projects/frontend-slides-editable/) | Li Zheng / Frontend Slides Editable | Visual authoring of executable source | General agent with visual tools | Source-authority live projection | source · active |
| [RocketSmith](projects/rocketsmith/) | Peter Pak / RocketSmith | Constraint-driven engineering | AI engineering-design workspace | Parametric engineering-model authority | source · active |
| [FusionMCP](projects/fusionmcp/) | Jaskirat Singh / FusionMCP | Constraint-driven engineering | Agent-controllable canvas or domain editor | Parametric engineering-model authority | source · active |
| [SCAD WebMCP](projects/scad-webmcp/) | Jack Herrington / SCAD WebMCP | Constraint-driven engineering | Agent-controllable canvas or domain editor | Parametric engineering-model authority | source · active |
| [CAD Solver](projects/cad-solver/) | Lewis Valentine / CAD Solver | Constraint-driven engineering | AI engineering-design workspace | Parametric engineering-model authority | source · active |
| [OmniMCP](projects/omnimcp/) | Travor King / OmniMCP | Native artifact authoring | General agent with visual tools | External-agent canvas | source · active |
| [AI-CAD](projects/ai-cad/) | Vinnie Esposito / AI-CAD | Constraint-driven engineering | AI engineering-design workspace | Parametric engineering-model authority | source · active |
| [AI Parametric CAD Generator](projects/ai-parametric-cad/) | ZAKPRO786 / AI Parametric CAD | Constraint-driven engineering | AI engineering-design workspace | Parametric engineering-model authority | source · active |
| [Tylina](projects/tylina/) | Tylina | Visual authoring of executable source | Code-native visual editor or IDE | Source-authority live projection | architecture · active |
| [Mira Animator](projects/mira-animator/) | Sandeco | Delegated creation | Standalone design-agent workspace | Source-authority live projection | source · active |
| [Paper2Any](projects/paper2any/) | OpenDCAI | Delegated creation | Standalone design-agent workspace | Native graph authority | source · active |
| [Knowledge Cat PPT Skill](projects/knowledge-cat-ppt/) | gnipbao | Delegated creation | Standalone design-agent workspace | Filesystem agent with visual evidence | source · active |
| [RW Consulting PPT](projects/rw-consulting-ppt/) | Pikapika260214 | Delegated creation | Standalone design-agent workspace | Design-code materialization | source · active |
| [Sparo OS](projects/sparo-os/) | GCWing | Native artifact authoring | Design surface inside an agent platform | Native graph authority | source · active |
| [tellr](projects/tellr/) | Databricks | Delegated creation | Standalone design-agent workspace | Hosted generated-artifact workspace | source · active |
| [hands-on-deck](projects/hands-on-deck/) | Every Inc | Native artifact authoring | Agent-controllable canvas or domain editor | External-agent canvas | source · active |
| [PPT as Code](projects/ppt-as-code/) | Russell-cell | Visual authoring of executable source | Code-native visual editor or IDE | Source-authority live projection | source · active |
| [Deckestra](projects/deckestra/) | Sunweitao / Deckestra | Delegated creation | Standalone design-agent workspace | Filesystem agent with visual evidence | source · active |
| [Competition PPT Template-First](projects/competition-ppt-template/) | che626 | Delegated creation | Standalone design-agent workspace | Filesystem agent with visual evidence | source · active |
| [paper2slides](projects/paper2slides/) | Daniel Lee / paper2slides | Delegated creation | Standalone design-agent workspace | Source-authority live projection | source · active |
| [Codeck](projects/codeck/) | Codequest / Codeck | Visual authoring of executable source | Code-native visual editor or IDE | Source-authority live projection | source · active |
| [Amaroad](projects/amaroad/) | CORe Inc | Visual authoring of executable source | Code-native visual editor or IDE | Source-authority live projection | source · active |
| [Tiangong AI Decks](projects/tiangong-ai-decks/) | Nan Li / Tiangong AI Decks | Delegated creation | Standalone design-agent workspace | Filesystem agent with visual evidence | source · active |
| [Eigendeck](projects/eigendeck/) | David Gleich / Eigendeck | Native artifact authoring | Code-native visual editor or IDE | Native graph authority | source · active |
| [Editable Presentation Studio](projects/editable-presentation-studio/) | coille02 | Design-code translation and grounding | Standalone design-agent workspace | Design-code materialization | source · active |
| [cycleCAD](projects/cyclecad/) | xupeiwust / cycleCAD | Constraint-driven engineering | AI engineering-design workspace | Parametric engineering-model authority | source · active |
| [Embodied Scene Generation](projects/embodied-scene-generation/) | PudPawat | Constraint-driven engineering | AI engineering-design workspace | Native graph authority | source · active |
| [mcp-cad](projects/mcp-cad/) | Andrei Veliz | Constraint-driven engineering | Agent-controllable canvas or domain editor | External-agent canvas | source · active |
| [Resonance AI](projects/resonance-ai/) | Santanu Jana | Constraint-driven engineering | AI engineering-design workspace | Parametric engineering-model authority | source · active |
| [RUTH V3](projects/ruth-v3/) | Core Brim Tech | Constraint-driven engineering | General agent with visual tools | Parametric engineering-model authority | source · active |
| [Blender MCP for n8n](projects/blender-mcp-n8n/) | seehiong | Native artifact authoring | Agent-controllable canvas or domain editor | External-agent canvas | source · active |
| [Design OS](projects/design-os/) | Rudraksh Singh / Design OS | System governance | Standalone design-agent workspace | Filesystem agent with visual evidence | source · active |
| [Brand Manual App](projects/brand-manual-app/) | Brand Manual App | System governance | Standalone design-agent workspace | Native graph authority | source · active |
| [Milestone Designer](projects/milestone-designer/) | Multi-Threaded LLC / Milestone Designer | Native artifact authoring | Standalone design-agent workspace | Filesystem agent with visual evidence | source · active |
| [FigmaLint](projects/figmalint/) | Southleft | System governance | Established visual platform with AI | Native graph authority | source · active |
| [Paper to Any Studio / Nexus](projects/paper-to-any-studio/) | DeepThinkingZhouLiu / Paper to Any Studio | Delegated creation | Standalone design-agent workspace | Hosted generated-artifact workspace | architecture · active |
| [Reversa](projects/reversa/) | Sandeco | System governance | General agent with visual tools | Filesystem agent with visual evidence | source · active |
| [BitFun](projects/bitfun/) | GCWing | End-to-end product delivery | General agent with visual tools | Managed application-project graph | source · active |
| [Kanvas](projects/kanvas-obsidian/) | XMihura / Kanvas | Visual coordination and evidence | Agent-controllable canvas or domain editor | Native graph authority | source · active |
| [Review Gate](projects/review-gate/) | Lakshman Turlapati / Review Gate | Visual coordination and evidence | General agent with visual tools | Runtime-intent relay | source · active |
| [Instruckt](projects/instruckt/) | Josh Cirre / Instruckt | Runtime correction | Runtime overlay or context bridge | Runtime-intent relay | source · active |
| [ComfyUI EasyColorCorrector](projects/comfyui-easy-color-corrector/) | Regi Ellis / EasyColorCorrector | Runtime correction | Established visual platform with AI | Native graph authority | source · active |
| [genjutsu](projects/genjutsu/) | AThevon / genjutsu | System governance | Standalone design-agent workspace | Source-authority live projection | source · active |
| [OpenADA](projects/openada/) | Simra Tech | Constraint-driven engineering | AI engineering-design workspace | Parametric engineering-model authority | source · active |
| [Decibel Designer](projects/decibel-designer/) | Decibel Systems | System governance | Design-code bridge | Filesystem agent with visual evidence | source · active |
| [Get Shit Pretty](projects/get-shit-pretty/) | jubscodes / Get Shit Pretty | System governance | Standalone design-agent workspace | Filesystem agent with visual evidence | source · active |
| [lineforge](projects/lineforge/) | RFingAdam Engineering MCPs | Constraint-driven engineering | AI engineering-design workspace | Parametric engineering-model authority | source · active |
| [Draw.io Engineering MCP](projects/drawio-engineering-mcp/) | RFingAdam Engineering MCPs | Native artifact authoring | Agent-controllable canvas or domain editor | Native graph authority | source · active |
| [RFingAdam mcp-blender](projects/rfingadam-mcp-blender/) | RFingAdam Engineering MCPs | Native artifact authoring | Agent-controllable canvas or domain editor | External-agent canvas | source · active |
| [mcp-openems](projects/mcp-openems/) | RFingAdam Engineering MCPs | Constraint-driven engineering | AI engineering-design workspace | Parametric engineering-model authority | source · active |
| [mcp-nec2-antenna](projects/mcp-nec2-antenna/) | RFingAdam Engineering MCPs | Constraint-driven engineering | AI engineering-design workspace | Parametric engineering-model authority | source · active |
| [mcp-pcb-emcopilot](projects/mcp-pcb-emcopilot/) | RFingAdam Engineering MCPs | System governance | AI engineering-design workspace | Filesystem agent with visual evidence | source · active |
| [mcp-ltspice-qucs](projects/mcp-ltspice-qucs/) | RFingAdam Engineering MCPs | Constraint-driven engineering | AI engineering-design workspace | Parametric engineering-model authority | source · active |
| [mcp-cst-studio](projects/mcp-cst-studio/) | RFingAdam Engineering MCPs | Constraint-driven engineering | AI engineering-design workspace | Parametric engineering-model authority | source · active |
| [RFlect](projects/rflect/) | RFingAdam Engineering MCPs | Visual coordination and evidence | Visual decision or verification workspace | Filesystem agent with visual evidence | source · active |
| [Draw.io MCP](projects/drawio-mcp/) | JGraph / draw.io | Native artifact authoring | Agent-controllable canvas or domain editor | Native graph authority | source · active |
| [KiCAD MCP Server](projects/kicad-mcp-server/) | mixelpixx | Constraint-driven engineering | AI engineering-design workspace | External-agent canvas | source · active |
| [Konnect](projects/konnect/) | mixelpixx | Constraint-driven engineering | AI engineering-design workspace | Parametric engineering-model authority | source · active |
| [KiCad Analysis MCP](projects/kicad-analysis-mcp/) | Lama Al Rajih | Visual coordination and evidence | Visual decision or verification workspace | Filesystem agent with visual evidence | source · active |
| [Montevive Penpot MCP](projects/montevive-penpot-mcp/) | Montevive.ai | Design-code translation and grounding | Design-code bridge | External-agent canvas | source · active |
| [EDA Agent](projects/eda-agent/) | George Saliba / Salitronic | Constraint-driven engineering | AI engineering-design workspace | External-agent canvas | source · active |
| [Agents365 Draw.io Skill](projects/agents365-drawio-skill/) | Agents365.ai | Native artifact authoring | General agent with visual tools | Filesystem agent with visual evidence | source · active |
| [Next AI Draw.io](projects/next-ai-draw-io/) | Dayuan Jiang | Native artifact authoring | Standalone design-agent workspace | Native graph authority | source · active |
| [Diagram Design](projects/diagram-design/) | Cathryn Lavery | Native artifact authoring | General agent with visual tools | Filesystem agent with visual evidence | source · active |
| [Ladislav Gazo Draw.io MCP Server](projects/lgazo-drawio-mcp/) | Ladislav Gazo | Native artifact authoring | Agent-controllable canvas or domain editor | External-agent canvas | source · active |
| [Yank Note](projects/yank-note/) | Purocean / Yank Note | Visual authoring of executable source | Established visual platform with AI | Source-authority live projection | source · active |
| [drawio-ai-kit](projects/drawio-ai-kit/) | SparkLabX | Native artifact authoring | General agent with visual tools | Filesystem agent with visual evidence | source · active |
| [Scientific Illustrator](projects/scientific-illustrator/) | icebird1998 / Scientific Illustrator | Native artifact authoring | Agent-controllable canvas or domain editor | External-agent canvas | source · active |
| [DrawIO2Go](projects/drawio2go/) | Atlas Zeng | Native artifact authoring | Standalone design-agent workspace | Native graph authority | source · active |
| [Draw.io Diagram Builder Skill](projects/drawio-diagram-builder/) | Xiaowei Hua | Native artifact authoring | General agent with visual tools | Filesystem agent with visual evidence | source · active |
| [TerraVision](projects/terravision/) | Patrick Chugh | Visual coordination and evidence | Design-code bridge | Design-code materialization | source · active |
| [AWS Architecture Diagram Skill](projects/aws-architecture-diagram-skill/) | Alexey Vidanov | Native artifact authoring | General agent with visual tools | Filesystem agent with visual evidence | source · active |
| [ClawPhD](projects/clawphd/) | ZhihaoAIRobotic | Delegated creation | Standalone design-agent workspace | Filesystem agent with visual evidence | source · active |
| [FlowForge Skill](projects/flowforge-skill/) | wentong2022-arch / FlowForge | Native artifact authoring | General agent with visual tools | Filesystem agent with visual evidence | source · active |
| [OpenSCAD Agent](projects/openscad-agent/) | Ian C. Anderson | Constraint-driven engineering | AI engineering-design workspace | Source-authority live projection | source · active |
| [FigMirror](projects/figmirror/) | VILA-Lab | Delegated creation | Standalone design-agent workspace | Candidate isolation and promotion | source · active |
| [DeepDiagram](projects/deepdiagram/) | LingyiChen-AI | Delegated creation | Standalone design-agent workspace | Managed application-project graph | source · active |
| [OfficeBuddy](projects/officebuddy/) | Zhihui Chen | Runtime correction | General agent with visual tools | Filesystem agent with visual evidence | source · active |
| [Anthropic Agent Skills](projects/anthropic-agent-skills/) | Anthropic | Delegated creation | General agent with visual tools | Filesystem agent with visual evidence | source · active |
| [Blender MCP VXAI](projects/blender-mcp-vxai/) | VxAI | Native artifact authoring | Agent-controllable canvas or domain editor | External-agent canvas | source · active |
| [CAD Agent](projects/cad-agent/) | Svetlana DAO LLC | Constraint-driven engineering | AI engineering-design workspace | Parametric engineering-model authority | source · active |
| [3DCodeBench](projects/3dcodebench/) | Yipeng Gao | Visual coordination and evidence | Visual decision or verification workspace | Filesystem agent with visual evidence | source · active |
| [CADGenBench](projects/cadgenbench/) | Hugging Face | Visual coordination and evidence | Visual decision or verification workspace | Parametric engineering-model authority | source · active |
| [CADSmith](projects/cadsmith/) | Jesse Barkley | Constraint-driven engineering | AI engineering-design workspace | Parametric engineering-model authority | source · active |
| [OneRedOak Claude Code Workflows](projects/claude-code-workflows/) | OneRedOak / Patrick Ellis | Visual coordination and evidence | General agent with visual tools | Filesystem agent with visual evidence | source · active |
| [Jezweb Claude Skills](projects/jezweb-claude-skills/) | Jezweb / Jeremy Dawes | End-to-end product delivery | General agent with visual tools | Filesystem agent with visual evidence | source · active |
| [ArcKit](projects/arckit/) | ArcKit / tractorjuice | System governance | General agent with visual tools | Filesystem agent with visual evidence | source · active |
| [Optiaxiom](projects/optiaxiom/) | Optimizely Axiom | System governance | Design-code bridge | Design-code materialization | source · active |
| [GitHub Copilot Agent Skills by Thomas Thornton](projects/github-copilot-agent-skills/) | Thomas Thornton | Native artifact authoring | General agent with visual tools | External-agent canvas | source · active |
| [Poco](projects/poco/) | Poco AI | Visual coordination and evidence | Design surface inside an agent platform | Managed application-project graph | source · active |
| [Simon Kurtz Draw.io MCP Server](projects/simonkurtz-drawio-mcp/) | Simon Kurtz | Native artifact authoring | Agent-controllable canvas or domain editor | Filesystem agent with visual evidence | source · active |
| [MCPyATS](projects/mcpyats/) | Automate Your Network / John Capobianco | Visual coordination and evidence | Design surface inside an agent platform | External-agent canvas | source · active |
| [HeroUI](projects/heroui/) | HeroUI | System governance | Design-code bridge | Design-code materialization | source · active |
| [Blade](projects/blade/) | Razorpay | System governance | Design-code bridge | Design-code materialization | source · active |
| [Figma MCP Server](projects/figma-mcp-server/) | Figma | Native artifact authoring | Agent-controllable canvas or domain editor | External-agent canvas | architecture · active |
| [Reicon](projects/reicon/) | Dev Chauhan / Reicon | System governance | Design-code bridge | Design-code materialization | source · active |
| [TemPad Dev](projects/tempad-dev/) | Baidu EFE | Design-code translation and grounding | Design-code bridge | External-agent canvas | source · active |
| [ArchonDev](projects/archondev/) | ArchonDev | System governance | General agent with visual tools | Filesystem agent with visual evidence | architecture · active |
| [Claude Terminal](projects/claude-terminal/) | Sterll / Claude Terminal | Visual coordination and evidence | Design surface inside an agent platform | Filesystem agent with visual evidence | source · active |
| [Higgsfield Skills](projects/higgsfield-skills/) | Higgsfield Inc. | Delegated creation | General agent with visual tools | Filesystem agent with visual evidence | source · active |
| [Crafter](projects/crafter/) | Haozhe Zhao / Crafter | Native artifact authoring | Standalone design-agent workspace | Design-code materialization | source · active |
| [Agent Vision Toolkit](projects/agent-vision-toolkit/) | Anionex / Agent Vision Toolkit | Runtime correction | General agent with visual tools | Filesystem agent with visual evidence | source · active |
| [Skillstead](projects/skillstead/) | Kyungseo Park / Skillstead | Native artifact authoring | General agent with visual tools | Filesystem agent with visual evidence | source · active |
| [sci-figure](projects/sci-figure/) | xiao-yuling / sci-figure | Native artifact authoring | General agent with visual tools | Filesystem agent with visual evidence | source · active |
| [Paper Framework Figure Studio Pro](projects/paper-framework-figure-studio-pro/) | c-narcissus / Paper Framework Figure Studio Pro | Variant exploration and decision | Visual decision or verification workspace | Candidate isolation and promotion | architecture · active |
| [Premium Vector Icon Designer](projects/premium-vector-icon-designer/) | Suli / Premium Vector Icon Designer | Native artifact authoring | General agent with visual tools | Filesystem agent with visual evidence | source · active |
| [Layer-First Raster to SVG](projects/layer-first-raster-to-svg/) | pipi-22 / Layer-First Raster to SVG | Design-code translation and grounding | Design-code bridge | Design-code materialization | source · active |
| [PowerPoint Business](projects/powerpoint-business/) | Lizheng Wang / PowerPoint Business | Native artifact authoring | Standalone design-agent workspace | Source-authority live projection | source · active |
| [Shad Expo Studio](projects/shad-expo-studio/) | Limin Ge / Shad Expo Studio | Runtime correction | Visual decision or verification workspace | Candidate isolation and promotion | source · active |
| [Three.js Game Skills](projects/threejs-game-skills/) | Majid Manzarpour / Three.js Game Skills | End-to-end product delivery | General agent with visual tools | Source-authority live projection | source · active |
| [AI Agents Talk to Figma MCP](projects/claude-talk-to-figma-arinspunk/) | Xúlio Zé / AI Agents Talk to Figma | Native artifact authoring | Agent-controllable canvas or domain editor | External-agent canvas | source · active |
| [Qt Agent Skills](projects/qt-agent-skills/) | The Qt Company | Design-code translation and grounding | Design-code bridge | Design-code materialization | source · active |
| [extract-design-system](projects/extract-design-system/) | Arvind Ram Singh Kishore | System governance | Design-code bridge | Design-code materialization | source · active |
| [Multi-Agent CAD](projects/multi-agent-cad/) | Pan-Chera / Multi-Agent CAD | Constraint-driven engineering | AI engineering-design workspace | Parametric engineering-model authority | source · active |
| [Forma AI Agent Service](projects/forma-ai-service/) | Andreyka / Forma AI Agent Service | Constraint-driven engineering | AI engineering-design workspace | Parametric engineering-model authority | source · active |
| [CICADA](projects/cicada/) | Peng Ding / CICADA | Constraint-driven engineering | AI engineering-design workspace | Parametric engineering-model authority | source · active |
| [Millwright](projects/millwright/) | Raylan Lin / Millwright | Constraint-driven engineering | AI engineering-design workspace | Parametric engineering-model authority | source · active |
| [spark-to-paper-skills](projects/spark-to-paper-skills/) | Vast Intelligence Lab / spark-to-paper-skills | Native artifact authoring | General agent with visual tools | Filesystem agent with visual evidence | source · active |
| [nature-skills](projects/nature-skills/) | Nature Skills maintainers | Native artifact authoring | General agent with visual tools | Filesystem agent with visual evidence | source · active |
| [Circuit Weaver](projects/circuit-weaver/) | Matt Painter / Circuit Weaver | Constraint-driven engineering | AI engineering-design workspace | Parametric engineering-model authority | source · active |
| [Image to SVG](projects/image-to-svg/) | zyipeng / Image to SVG | Design-code translation and grounding | General agent with visual tools | Design-code materialization | source · active |
| [FigEdit](projects/figedit/) | giszzt / FigEdit | Design-code translation and grounding | Standalone design-agent workspace | Design-code materialization | source · active |
| [Image to Shape-Safe SVG](projects/image-to-shape-safe-svg/) | perpetualhui | Design-code translation and grounding | General agent with visual tools | Design-code materialization | source · active-transition |
| [Image to PPTX](projects/image-to-pptx/) | perpetualhui | Design-code translation and grounding | General agent with visual tools | Design-code materialization | source · active |
| [Figma Editable Dashboard Skill](projects/figma-editable-dashboard-skill/) | Fazal Shah / Figma Editable Dashboard | Native artifact authoring | Agent-controllable canvas or domain editor | External-agent canvas | source · active |
| [Nature Figure Studio](projects/nature-figure-studio/) | chenyuanfan / Nature Figure Studio | Native artifact authoring | Standalone design-agent workspace | External-agent canvas | source · active |
| [SciFig](projects/scifig/) | SciFig | Delegated creation | Standalone design-agent workspace | Hosted generated-artifact workspace | architecture · active |
| [Subcortex Visualization Skill](projects/subcortex-visualization-skill/) | Ma Qi / Subcortex Visualization Skill | Native artifact authoring | General agent with visual tools | Filesystem agent with visual evidence | source · active |
| [SVG Icon Skills](projects/svg-icon-skills/) | muxia0396 / SVG Icon Skills | Native artifact authoring | General agent with visual tools | Design-code materialization | source · active |
| [SVG Factory](projects/svg-factory/) | abdygaziev / SVG Factory | Native artifact authoring | General agent with visual tools | Source-authority live projection | source · active |
| [SVG Creation Skill](projects/svg-creation-skill/) | itayfi / SVG Creation Skill | Delegated creation | General agent with visual tools | Design-code materialization | source · active |
| [Ian Nuttall Skills](projects/ian-nuttall-skills/) | Ian Nuttall | Design-code translation and grounding | General agent with visual tools | Design-code materialization | source · active |
| [ProofShot](projects/proofshot/) | Julien Berthomier / ProofShot | Visual coordination and evidence | Visual decision or verification workspace | Candidate isolation and promotion | source · active |
| [game-creator](projects/game-creator/) | Playable Intelligence | End-to-end product delivery | General agent with visual tools | Source-authority live projection | source · active |
| [work-with-design-systems](projects/work-with-design-systems/) | natdexterra / work-with-design-systems | System governance | Agent-controllable canvas or domain editor | External-agent canvas | source · active |
| [Design System Extraction Skill](projects/design-system-extraction/) | tuotuo / Design System Extraction | System governance | Design-code bridge | Filesystem agent with visual evidence | source · active |
| [Design System Builder](projects/design-system-builder/) | Signer Labs | System governance | General agent with visual tools | Filesystem agent with visual evidence | source · active |
| [d2c](projects/d2c/) | d2c.ai | Design-code translation and grounding | Design-code bridge | Design-code materialization | source · active |
| [Claude Figma Kit](projects/claude-figma-kit/) | TuanNA / Claude Figma Kit | Native artifact authoring | Agent-controllable canvas or domain editor | External-agent canvas | source · active |
| [UI from References](projects/ui-from-references/) | jetray33 / UI from References | Visual authoring of executable source | General agent with visual tools | Source-authority live projection | source · active |
| [PRD to UI Automation Agent](projects/prd-to-ui-automation-agent/) | loinz-Max / PRD to UI Automation Agent | Delegated creation | Standalone design-agent workspace | Design-code materialization | source · active-transition |
| [Agentic UI Design Workflow POC](projects/agentic-ui-design-poc/) | Ramadhani Wasil / Agentic UI Design Workflow | Design-code translation and grounding | Design-code bridge | Design-code materialization | source · active-transition |
| [Claude-To-Print](projects/claude-to-print/) | Oz-AI / Claude-To-Print | Constraint-driven engineering | AI engineering-design workspace | Parametric engineering-model authority | source · active |
| [Resource2Skill](projects/resource2skill/) | Microsoft | Delegated creation | Design surface inside an agent platform | Managed application-project graph | source · active |
| [Image SVG PPTX Pro](projects/image-svg-pptx-pro/) | Zhe Kong | Native artifact authoring | Standalone design-agent workspace | Design-code materialization | source · active |
| [Consulting Deck](projects/consulting-deck/) | Zhizhu Zairui / Consulting Deck | Native artifact authoring | Standalone design-agent workspace | Native graph authority | source · active |
| [App Automaton Presentation](projects/appautomaton-presentation/) | App Automaton | Native artifact authoring | Standalone design-agent workspace | Design-code materialization | source · active |
| [Presentation Skill](projects/presentation-skill/) | Siril / Presentation Skill | Native artifact authoring | Standalone design-agent workspace | Source-authority live projection | source · active |
| [Image-PPT-King](projects/image-ppt-king/) | TateZhouSiu | Native artifact authoring | Standalone design-agent workspace | Design-code materialization | source · active |
| [ImageGen PPTX Pipeline](projects/imagegen-pptx-pipeline/) | Eddy Zhang | Delegated creation | Standalone design-agent workspace | Candidate isolation and promotion | source · active |
| [PradaSlides](projects/pradaslides/) | Prodige Project | Delegated creation | Standalone design-agent workspace | Candidate isolation and promotion | architecture · active |
| [img2pptx](projects/img2pptx/) | Wenxuan Xie | Native artifact authoring | Standalone design-agent workspace | Design-code materialization | architecture · active |
| [Aurelius](projects/aurelius/) | PMDevSolutions | Design-code translation and grounding | Design surface inside an agent platform | Source-authority live projection | source · active |
| [Figma to Astro Pipeline](projects/figma-to-astro-pipeline/) | WyeWorks | Design-code translation and grounding | Design-code bridge | Source-authority live projection | architecture · active-transition |
| [WhipUI](projects/whipui/) | WhipForAWeeb / WhipUI | System governance | General agent with visual tools | Filesystem agent with visual evidence | source · active |
| [Design Agents Flow](projects/design-agents-flow/) | Charlie Ellington | Visual coordination and evidence | General agent with visual tools | Filesystem agent with visual evidence | architecture · active |
| [Design Harness](projects/design-harness/) | KnuppeArt | System governance | Design-code bridge | External-agent canvas | architecture · active |
| [SDD-DE](projects/sdd-de/) | Roy Villasana | System governance | Design-code bridge | Source-authority live projection | source · active |
| [Figma to Webflow Starter](projects/figma-to-webflow-starter/) | Produlis | Design-code translation and grounding | Design-code bridge | External-agent canvas | architecture · active |
| [Vibe Design System Starter](projects/vibe-design-system-starter/) | airu | System governance | Design-code bridge | Source-authority live projection | source · active |
| [CX Design Agents](projects/cxdesign-agents/) | Bruno Eid | Visual coordination and evidence | Design surface inside an agent platform | Managed application-project graph | source · active |
| [Super Design Skills](projects/super-design-skills/) | Nick Vyhouski | Visual coordination and evidence | General agent with visual tools | Filesystem agent with visual evidence | architecture · active |
| [agent-svgtools](projects/agent-svgtools/) | Wyrd Company | Runtime correction | Visual-editor infrastructure | Filesystem agent with visual evidence | source · active |
| [Clean Vector Reconstruction](projects/clean-vector-reconstruction/) | lixin-design | Native artifact authoring | Standalone design-agent workspace | Design-code materialization | source · active |
| [Icon Design](projects/icon-design/) | Kalebtec Studio | Variant exploration and decision | Standalone design-agent workspace | Candidate isolation and promotion | source · active |
| [Jon Fermin cadsmith](projects/jonfermin-cadsmith/) | Jonathan Fermin | Constraint-driven engineering | AI engineering-design workspace | Parametric engineering-model authority | source · active |
| [Agentic 3D Printing](projects/agentic-3d-printing/) | Eric Davis | Constraint-driven engineering | AI engineering-design workspace | Parametric engineering-model authority | source · active |
| [3D Modeling Skill](projects/3d-modeling-skill/) | ghsi011 | Constraint-driven engineering | AI engineering-design workspace | Parametric engineering-model authority | source · active |
| [Slide ProMax](projects/slide-promax/) | Eng.Dinh / Slide ProMax | Delegated creation | Standalone design-agent workspace | Candidate isolation and promotion | source · active |
| [BMAD Slide Maker](projects/bmad-slide-maker/) | BMAD Labs | Native artifact authoring | Standalone design-agent workspace | Source-authority live projection | source · active |
| [BMAD Slides Generator](projects/bmad-slides-generator/) | BMAD Labs | Visual authoring of executable source | Standalone design-agent workspace | Source-authority live projection | architecture · active |
| [SimpleCORE SVG Diagrams](projects/simplecore-svg-diagrams/) | SimpleCORE | Visual authoring of executable source | General agent with visual tools | Source-authority live projection | source · active |
| [SimpleCORE Wireframe Boards](projects/simplecore-wireframe-boards/) | SimpleCORE | Native artifact authoring | General agent with visual tools | Source-authority live projection | source · active |
| [SimpleCORE Board Parity Walk](projects/simplecore-board-parity-walk/) | SimpleCORE | Runtime correction | Visual decision or verification workspace | Filesystem agent with visual evidence | architecture · active |
| [Text to CAD](projects/text-to-cad/) | earthtojake / Text to CAD | Constraint-driven engineering | AI engineering-design workspace | Parametric engineering-model authority | source · active |
| [Image Split](projects/image-split/) | TateZhouSiu | Native artifact authoring | Visual-editor infrastructure | Filesystem agent with visual evidence | source · active |
| [Delements Web Stack](projects/delements-web-stack/) | Delements | Design-code translation and grounding | Design-code bridge | Runtime-intent relay | source · active |
| [Webstudio MCP](projects/webstudio-mcp/) | Densrt | Native artifact authoring | Agent-controllable canvas or domain editor | External-agent canvas | source · active |
| [Webflow Project Template](projects/webflow-project-template/) | Samuel Gregory | Design-code translation and grounding | Design-code bridge | Design-code materialization | source · active |
| [Effective HTML](projects/effective-html/) | Plannotator | Visual authoring of executable source | General agent with visual tools | Source-authority live projection | source · active |
| [Meng To Agent Skills](projects/mengto-agent-skills/) | Meng To | Visual authoring of executable source | General agent with visual tools | Filesystem agent with visual evidence | source · active |
| [SWE Atlas](projects/swe-atlas/) | Syahiid Nur Kamil | End-to-end product delivery | Design surface inside an agent platform | Candidate isolation and promotion | source · active |
| [Design with Intent](projects/intent-design/) | Ghaida Zahran | End-to-end product delivery | General agent with visual tools | Candidate isolation and promotion | source · active |
| [Claude Design Skill by jiji262](projects/claude-design-skill-jiji/) | jiji262 | Delegated creation | Standalone design-agent workspace | Candidate isolation and promotion | source · active |
| [Power Platform Full Stack Skills](projects/power-platform-full-stack-skills/) | Scott Durow | End-to-end product delivery | Design surface inside an agent platform | Managed application-project graph | source · active |
| [Design Jarvis](projects/design-jarvis/) | renfei-design | Visual coordination and evidence | Design surface inside an agent platform | Candidate isolation and promotion | source · active |
| [Figma2Webflow-AW](projects/figma2webflow-aw/) | Khane0212 | Design-code translation and grounding | Design-code bridge | Runtime-intent relay | source · active |
| [CAD Coworker](projects/cad-coworker/) | karaage | Native artifact authoring | Visual-editor infrastructure | Parametric engineering-model authority | source · active |
| [CAD Khana](projects/cad-khana/) | CyberChitta | Constraint-driven engineering | AI engineering-design workspace | Parametric engineering-model authority | source · active |
| [FastBuild123d](projects/fastbuild123d/) | Devon Peroutky | Native artifact authoring | Visual-editor infrastructure | Source-authority live projection | source · active |
| [Flow CAD](projects/flow-cad/) | John Furr | Constraint-driven engineering | AI engineering-design workspace | Parametric engineering-model authority | source · active |
| [FreeCAD Modeling Skill](projects/freecad-modeling-skill/) | ranranjiang666 | Constraint-driven engineering | AI engineering-design workspace | Parametric engineering-model authority | architecture · active |
| [build123d-cad](projects/build123d-cad/) | rabbit on fire | Constraint-driven engineering | AI engineering-design workspace | Parametric engineering-model authority | source · active |
| [ALICE-SDF](projects/alice-sdf/) | ext-sakamoro | Constraint-driven engineering | AI engineering-design workspace | Parametric engineering-model authority | source · active |
| [Plannotator](projects/plannotator/) | Plannotator | Visual coordination and evidence | Visual decision or verification workspace | Runtime-intent relay | source · active |
| [Design Agent Skills](projects/design-agent-skills/) | Wang Yiyang | Visual authoring of executable source | General agent with visual tools | Source-authority live projection | source · active |
| [Self-Review](projects/self-review/) | MOTIFUL | Visual coordination and evidence | Visual decision or verification workspace | Filesystem agent with visual evidence | source · active |
| [Claw Design](projects/claw-design/) | xs | Delegated creation | Standalone design-agent workspace | Candidate isolation and promotion | source · active |
| [OpenDesign by Manal Kaff](projects/manalkaff-opendesign/) | Manal Kaff | Delegated creation | Standalone design-agent workspace | Candidate isolation and promotion | source · active |
| [AI Design Engineer](projects/ai-design-engineer/) | Agenisea | End-to-end product delivery | Design surface inside an agent platform | Candidate isolation and promotion | architecture · active |
| [Sumi](projects/sumi/) | Phazur Labs | End-to-end product delivery | General agent with visual tools | Candidate isolation and promotion | source · active |
| [Office Design Toolkit](projects/office-design-toolkit/) | Astro Alpha | Native artifact authoring | General agent with visual tools | Filesystem agent with visual evidence | architecture · active |
| [Design Engineering Skills](projects/design-eng-skills/) | Farming Labs | Visual authoring of executable source | General agent with visual tools | Source-authority live projection | source · active |
| [Carlos Cuellar Design Skills](projects/cuellar-design-skills/) | Carlos Cuellar | System governance | General agent with visual tools | Filesystem agent with visual evidence | architecture · active |
| [Claude Web Builder](projects/claude-webkit/) | Tododeia | End-to-end product delivery | AI app or site builder | Managed application-project graph | source · active |
| [gstack-game](projects/gstack-game/) | fagemx | Visual coordination and evidence | Visual decision or verification workspace | Filesystem agent with visual evidence | source · active |
| [Shain Designer Kit](projects/shain-designer-kit/) | Dmytro Shain | End-to-end product delivery | Design surface inside an agent platform | Filesystem agent with visual evidence | source · active |
| [Codex Game Studio](projects/codex-game-studio/) | jackli12 | End-to-end product delivery | Design surface inside an agent platform | Filesystem agent with visual evidence | architecture · active |
| [CAD-as-Code Template](projects/cad-as-code-template/) | Coffee2Bits | Constraint-driven engineering | AI engineering-design workspace | Parametric engineering-model authority | source · active |
| [3dmodel Skill](projects/3dmodel-skill/) | Fletcher Holt | Native artifact authoring | General agent with visual tools | Filesystem agent with visual evidence | architecture · active |
| [Text-to-CAD Coach](projects/text-to-cad-coach/) | Jon Williams | Constraint-driven engineering | AI engineering-design workspace | Parametric engineering-model authority | source · active |
| [ADA V2 by Nazir Louis](projects/ada-v2-nazir/) | Nazir Louis | Constraint-driven engineering | AI engineering-design workspace | Parametric engineering-model authority | source · active |
| [A.D.A by Syed Daiam](projects/ada-v2-syed/) | Syed Daiam | Constraint-driven engineering | AI engineering-design workspace | Parametric engineering-model authority | source · active |
| [OpenCAD](projects/opencad/) | CAID Technologies | Constraint-driven engineering | AI engineering-design workspace | Parametric engineering-model authority | source · active |
| [EE Circuit Design Skills](projects/ee-circuit-design-skills/) | Thanabordee Nammungkhun | Constraint-driven engineering | AI engineering-design workspace | Filesystem agent with visual evidence | source · active |
| [Emdash Skills](projects/emdash-skills/) | Megabyte Labs | End-to-end product delivery | Design surface inside an agent platform | Managed application-project graph | source · active |
| [Tonone](projects/tonone/) | tonone.ai | Visual coordination and evidence | Design surface inside an agent platform | Filesystem agent with visual evidence | source · active |
| [Atlas Design UX Team](projects/atlas-design-ux/) | Monumental Systems | Visual coordination and evidence | General agent with visual tools | Filesystem agent with visual evidence | architecture · active |
| [Atlas 3D Design Team](projects/atlas-3d-design/) | Monumental Systems | Native artifact authoring | General agent with visual tools | External-agent canvas | architecture · active |
| [Shain Design System Skill](projects/shain-design-system-skill/) | Dmytro Shain | System governance | General agent with visual tools | External-agent canvas | architecture · active |
| [SimCorrect](projects/simcorrect/) | CAID Technologies | Runtime correction | AI engineering-design workspace | Parametric engineering-model authority | source · active |
| [Claude Code Game Studios](projects/claude-code-game-studios/) | Donchitos | End-to-end product delivery | Design surface inside an agent platform | Filesystem agent with visual evidence | source · active |
| [Design-Driven Development](projects/design-driven-development/) | Moose Design | End-to-end product delivery | Design-code bridge | External-agent canvas | source · active |
| [Fabricio Telles Skills](projects/fabricio-skills/) | Fabricio Telles | System governance | General agent with visual tools | Filesystem agent with visual evidence | source · active |
| [UX Reviewer](projects/ux-reviewer/) | Swan Htet Aung | Visual coordination and evidence | Visual decision or verification workspace | Filesystem agent with visual evidence | source · active |
| [iOS Design Agent Skill](projects/ios-design-agent-skill/) | Josh Adams | Visual coordination and evidence | General agent with visual tools | Filesystem agent with visual evidence | source · active |
| [Scott's Dope Skills](projects/s-stack/) | Scott Tolinski | System governance | General agent with visual tools | Filesystem agent with visual evidence | source · active |
| [AI Design Skills](projects/ai-design-skills/) | Supercharge Growth | Design-code translation and grounding | General agent with visual tools | Filesystem agent with visual evidence | source · active |
| [ives](projects/ives/) | Antunes | System governance | General agent with visual tools | Filesystem agent with visual evidence | source · active |
| [Taste-Skills](projects/taste-skills/) | Dragoon | Visual coordination and evidence | Visual decision or verification workspace | Filesystem agent with visual evidence | source · active |
| [anti-ai-design](projects/anti-ai-design/) | huyhoangnhh98 | Visual authoring of executable source | General agent with visual tools | Source-authority live projection | source · active |
| [better-web-ui](projects/better-web-ui/) | Filip Aladic | Visual authoring of executable source | General agent with visual tools | Source-authority live projection | source · active |
| [Philip Senger AI Agent Skills](projects/psenger-agent-skills/) | Philip A Senger | Visual coordination and evidence | Visual decision or verification workspace | Filesystem agent with visual evidence | source · active |
| [ABVX Agent Skills](projects/abvx-agent-skills/) | ABVX | System governance | General agent with visual tools | Filesystem agent with visual evidence | source · active |
| [blender-mcp by vinhelysia](projects/blender-mcp-vinhelysia/) | Pham The Vinh | Native artifact authoring | Agent-controllable canvas or domain editor | External-agent canvas | source · active |
| [OpticalModeler](projects/opticalmodeler/) | k-telux | Constraint-driven engineering | AI engineering-design workspace | Parametric engineering-model authority | source · active |
| [VideoCoCo](projects/videococo/) | Haodong Li | Delegated creation | General agent with visual tools | Source-authority live projection | source · active |
| [TIMECODE-AGENT](projects/timecode-agent/) | Ash Stone | Visual coordination and evidence | Visual decision or verification workspace | Filesystem agent with visual evidence | source · active |
| [Bambu Studio AI](projects/bambu-studio-ai/) | Yixuan He | Constraint-driven engineering | AI engineering-design workspace | Parametric engineering-model authority | source · active |
| [OpenTopos](projects/opentopos/) | Yipeng Gao | Visual authoring of executable source | AI engineering-design workspace | Source-authority live projection | source · active |
| [auteur](projects/auteur/) | AGI White List | Visual authoring of executable source | General agent with visual tools | Source-authority live projection | source · active |
| [SceneConductor](projects/sceneconductor/) | Jeonghwan Kim | Delegated creation | AI engineering-design workspace | Filesystem agent with visual evidence | source · active |
| [Qwen MM Plugins Blender](projects/qwen-blender/) | Qwen | Native artifact authoring | Agent-controllable canvas or domain editor | External-agent canvas | source · active |
| [Qwen MM Plugins FreeCAD](projects/qwen-freecad/) | Qwen | Constraint-driven engineering | AI engineering-design workspace | External-agent canvas | source · active |
| [Qwen MM Plugins Video Edit](projects/qwen-video-edit/) | Qwen | Delegated creation | General agent with visual tools | Hosted generated-artifact workspace | source · active |
| [kicad-tools by Robb Walters](projects/rjwalters-kicad-tools/) | Robb Walters | Constraint-driven engineering | AI engineering-design workspace | Parametric engineering-model authority | source · active |
| [PCB-Agent-Teams](projects/pcb-agent-teams/) | Zane29222 | Constraint-driven engineering | AI engineering-design workspace | Filesystem agent with visual evidence | source · active |
| [Electronics Agent Kit](projects/electronics-agent-kit/) | o2scale | Constraint-driven engineering | AI engineering-design workspace | Filesystem agent with visual evidence | architecture · active |
| [Ki-Stack](projects/ki-stack/) | Milind Sharma | Constraint-driven engineering | AI engineering-design workspace | External-agent canvas | source · active |
| [KiCad Schematic Design Skill by Seahan](projects/kicad-agent-seahan/) | Han | Constraint-driven engineering | AI engineering-design workspace | Filesystem agent with visual evidence | source · active |
| [kicad-tools Agent Skill by Michal Protasowicki](projects/michpro-kicad-tools/) | Michal Protasowicki | Constraint-driven engineering | AI engineering-design workspace | Filesystem agent with visual evidence | source · active |
| [akcli](projects/akcli/) | Li Ching Yu | Constraint-driven engineering | AI engineering-design workspace | Parametric engineering-model authority | source · active |
| [Paper to Schematic](projects/paper-to-schematic/) | Alan Steremberg | Constraint-driven engineering | AI engineering-design workspace | Filesystem agent with visual evidence | source · active |
| [KiCad PCBA Engineering Skills](projects/kicad-pcba-engineering-skills/) | Tsukimori Dev | Constraint-driven engineering | AI engineering-design workspace | Filesystem agent with visual evidence | source · active |
| [PCBA Design Skills](projects/pcba-design-skills/) | Keitark | Constraint-driven engineering | AI engineering-design workspace | Filesystem agent with visual evidence | source · active |
| [kicad-schematic by Ken Chan](projects/kicad-schematic-kenchan/) | Ken Chan | Constraint-driven engineering | AI engineering-design workspace | Source-authority live projection | source · active |
| [kicad-cursor](projects/kicad-cursor/) | Elli Furedy | Constraint-driven engineering | AI engineering-design workspace | External-agent canvas | architecture · active |
| [KiSkill](projects/kiskill/) | AvatarSD | Constraint-driven engineering | AI engineering-design workspace | Parametric engineering-model authority | source · active |
| [circuits by Misko](projects/misko-circuits/) | Misko | Constraint-driven engineering | AI engineering-design workspace | Source-authority live projection | source · active |
| [KiCad Skills by mash](projects/mash-kicad-skills/) | Masakazu Ohtsuka | Constraint-driven engineering | AI engineering-design workspace | Parametric engineering-model authority | source · active |
| [KiClaw](projects/kiclaw/) | KiClaw | Runtime correction | AI engineering-design workspace | Runtime-intent relay | source · active |
| [KiCadAI](projects/kicadai/) | Davin Hills | Constraint-driven engineering | AI engineering-design workspace | Parametric engineering-model authority | source · active |
| [Engineering Design Agent Skills](projects/engineering-design-plugin/) | Straydog | Constraint-driven engineering | AI engineering-design workspace | Source-authority live projection | source · active |
| [Markdown Exporter](projects/markdown-exporter/) | Bowen Liang | Native artifact authoring | General agent with visual tools | Design-code materialization | source · active |
| [BrandDocs](projects/brand-docs/) | Ferdinando Bonsegna | Native artifact authoring | General agent with visual tools | Native graph authority | source · active |
| [Adeu](projects/adeu/) | Dealfluence | Runtime correction | Design-code bridge | Native graph authority | source · active |
| [Kimi Docs Sheets and Slides](projects/kimi-office/) | Moonshot AI | Delegated creation | Design surface inside an agent platform | Hosted generated-artifact workspace | architecture · active |
| [Video Shotcraft](projects/video-shotcraft/) | Yihao | Visual authoring of executable source | General agent with visual tools | Filesystem agent with visual evidence | source · active |
| [Pascal Skills](projects/pascal-skills/) | Pascal | Visual coordination and evidence | Visual decision or verification workspace | Filesystem agent with visual evidence | source · active |
| [UX Writing Skill](projects/ux-writing-skill/) | Content Designer | System governance | Design-code bridge | External-agent canvas | source · active |
| [YUV.AI Creative Skills](projects/yuv-ai-creative-skills/) | YUV.AI / Yuval Avidani | Delegated creation | General agent with visual tools | Filesystem agent with visual evidence | source · active |
| [StyleKit](projects/stylekit/) | Anx | System governance | General agent with visual tools | Design-code materialization | source · active |
| [Paper2Poster](projects/paper2poster/) | Paper2Poster | Delegated creation | Standalone design-agent workspace | Design-code materialization | source · active |
| [notebooklm-py](projects/notebooklm-py/) | Teng Lin | Delegated creation | General agent with visual tools | Hosted generated-artifact workspace | source · active |
| [dom-to-pptx](projects/dom-to-pptx/) | Atharva Jagtap | Design-code translation and grounding | Design-code bridge | Design-code materialization | source · active |
| [Claude for Financial Services](projects/claude-financial-services/) | Anthropic | End-to-end product delivery | Design surface inside an agent platform | Hosted generated-artifact workspace | source · active |
| [SenseNova Skills](projects/sensenova-skills/) | SenseNova | Delegated creation | Design surface inside an agent platform | Source-authority live projection | source · active |
| [KiCad MCP Pro](projects/kicad-mcp-pro/) | Osman Aslan | Constraint-driven engineering | AI engineering-design workspace | Parametric engineering-model authority | source · active |
| [KiCad Skills with IPC API](projects/kicad-skills-ipc/) | Hubert | Constraint-driven engineering | AI engineering-design workspace | Parametric engineering-model authority | source · active |
| [tinyStudio](projects/tinystudio/) | MR. INDUSTRIES | End-to-end product delivery | Code-native visual editor or IDE | Managed application-project graph | source · active |
| [ZapTrace](projects/zaptrace/) | Osman Aslan | Constraint-driven engineering | AI engineering-design workspace | Parametric engineering-model authority | source · active |
| [KiCad Copilot](projects/kicad-copilot/) | biosshot | Constraint-driven engineering | AI engineering-design workspace | Parametric engineering-model authority | source · active |
| [SparkBench](projects/sparkbench/) | photon-cat / Jacob Armstrong | End-to-end product delivery | AI engineering-design workspace | Managed application-project graph | source · active |
| [Unreal Agent Harness](projects/unreal-agent-harness/) | per-simmons | Native artifact authoring | Agent-controllable canvas or domain editor | External-agent canvas | source · active |
| [Unreal-Blender MCP](projects/unreal-blender-mcp/) | tahooki | Native artifact authoring | Agent-controllable canvas or domain editor | External-agent canvas | source · active |
| [ArtClaw Bridge](projects/artclaw-bridge/) | Ivan Yang | Native artifact authoring | Agent-controllable canvas or domain editor | External-agent canvas | source · active |
| [AI Forge MCP](projects/ai-forge-mcp/) | Hurtz Donut Studios | Delegated creation | AI engineering-design workspace | External-agent canvas | architecture · active |
| [Blender MCP Server by namurokuro](projects/blender-mcp-server-namurokuro/) | namurokuro | Native artifact authoring | Agent-controllable canvas or domain editor | External-agent canvas | source · active |
| [Agentic Blender Orchestrator](projects/blender-orchestrator/) | Matt Olson | Native artifact authoring | Agent-controllable canvas or domain editor | External-agent canvas | source · active |
| [Blockout](projects/blockout/) | Sam Wasserman | Native artifact authoring | Standalone design-agent workspace | Native graph authority | source · active |
| [DCC-MCP Blender](projects/dcc-mcp-blender/) | DCC-MCP | Native artifact authoring | Agent-controllable canvas or domain editor | External-agent canvas | source · active |
| [Blender Scene Agent](projects/blender-scene-agent/) | David Rousset | Delegated creation | Standalone design-agent workspace | Hosted generated-artifact workspace | source · active |
| [RhinoMCP](projects/rhino-mcp/) | REER | Constraint-driven engineering | Agent-controllable canvas or domain editor | Parametric engineering-model authority | source · active |
| [Serpentine3D](projects/serpentine3d/) | Chisomo Banzi | Constraint-driven engineering | AI engineering-design workspace | Parametric engineering-model authority | source · active |
| [Cr8-xyz](projects/cr8-xyz/) | Thamsanqa Dreem | Delegated creation | Standalone design-agent workspace | Hosted generated-artifact workspace | source · active |
| [Posecode](projects/posecode/) | Posecode | Visual authoring of executable source | Visual-editor infrastructure | Source-authority live projection | source · active |
| [Blender Agent Skill by Jithin Joseph](projects/jithin-blender-skill/) | Jithin Joseph | Visual coordination and evidence | General agent with visual tools | External-agent canvas | source · active |
| [DataEvolver](projects/dataevolver/) | PRIS-CV | Delegated creation | Standalone design-agent workspace | Filesystem agent with visual evidence | source · active |
| [adobepy](projects/adobepy/) | DCC-MCP | Native artifact authoring | Agent-controllable canvas or domain editor | External-agent canvas | source · active |
| [DCC AI OpenAI Image](projects/dcc-ai-openai-image/) | DCC-MCP | Delegated creation | General agent with visual tools | Filesystem agent with visual evidence | source · active |
| [dcc-cua](projects/dcc-cua/) | DCC-MCP | Runtime correction | Runtime overlay or context bridge | Runtime-intent relay | source · active |
| [DCC LookDev](projects/dcc-lookdev/) | DCC-MCP | Native artifact authoring | Agent-controllable canvas or domain editor | External-agent canvas | source · active |
| [DCC MaterialX](projects/dcc-materialx/) | DCC-MCP | Native artifact authoring | Agent-controllable canvas or domain editor | Source-authority live projection | source · active |
| [DCC-MCP 3ds Max](projects/dcc-mcp-3dsmax/) | DCC-MCP | Native artifact authoring | Agent-controllable canvas or domain editor | External-agent canvas | source · active |
| [DCC-MCP After Effects](projects/dcc-mcp-aftereffects/) | DCC-MCP | Native artifact authoring | Agent-controllable canvas or domain editor | External-agent canvas | source · active |
| [DCC-MCP Cinema 4D](projects/dcc-mcp-cinema4d/) | DCC-MCP | Native artifact authoring | Agent-controllable canvas or domain editor | External-agent canvas | source · active |
| [DCC-MCP ComfyUI](projects/dcc-mcp-comfyui/) | DCC-MCP | Native artifact authoring | Agent-controllable canvas or domain editor | External-agent canvas | source · active |
| [DCC-MCP Core](projects/dcc-mcp-core/) | DCC-MCP | End-to-end product delivery | General agent with visual tools | External-agent canvas | source · active |
| [DCC-MCP Flow Production Tracking](projects/dcc-mcp-fpt/) | DCC-MCP | Visual coordination and evidence | General agent with visual tools | Managed application-project graph | source · active |
| [DCC-MCP FreeCAD](projects/dcc-mcp-freecad/) | DCC-MCP | Constraint-driven engineering | AI engineering-design workspace | Parametric engineering-model authority | source · active |
| [DCC-MCP Godot](projects/dcc-mcp-godot/) | DCC-MCP | End-to-end product delivery | Agent-controllable canvas or domain editor | External-agent canvas | source · active |
| [DCC-MCP Houdini](projects/dcc-mcp-houdini/) | DCC-MCP | Native artifact authoring | Agent-controllable canvas or domain editor | External-agent canvas | source · active |
| [DCC-MCP Illustrator](projects/dcc-mcp-illustrator/) | DCC-MCP | Native artifact authoring | Agent-controllable canvas or domain editor | External-agent canvas | source · active |
| [DCC-MCP Mari](projects/dcc-mcp-mari/) | DCC-MCP | Native artifact authoring | Agent-controllable canvas or domain editor | External-agent canvas | source · active |
| [DCC-MCP Marmoset](projects/dcc-mcp-marmoset/) | DCC-MCP | Native artifact authoring | Agent-controllable canvas or domain editor | External-agent canvas | source · active |
| [DCC-MCP Maya](projects/dcc-mcp-maya/) | DCC-MCP | Native artifact authoring | Agent-controllable canvas or domain editor | External-agent canvas | source · active |
| [DCC-MCP Maya AdvancedSkeleton](projects/dcc-mcp-maya-advancedskeleton/) | DCC-MCP | Native artifact authoring | Agent-controllable canvas or domain editor | External-agent canvas | source · active |
| [DCC-MCP Maya mGear](projects/dcc-mcp-maya-mgear/) | DCC-MCP | Native artifact authoring | Agent-controllable canvas or domain editor | External-agent canvas | source · active |
| [DCC-MCP Maya Procedural Architecture](projects/dcc-mcp-maya-procedural-architecture/) | DCC-MCP | Delegated creation | Agent-controllable canvas or domain editor | External-agent canvas | source · active |
| [DCC-MCP Nuke](projects/dcc-mcp-nuke/) | DCC-MCP | Native artifact authoring | Agent-controllable canvas or domain editor | External-agent canvas | source · active |
| [DCC-MCP OpenSCAD](projects/dcc-mcp-openscad/) | DCC-MCP | Constraint-driven engineering | AI engineering-design workspace | Parametric engineering-model authority | source · active |
| [DCC-MCP OpenUSD](projects/dcc-mcp-openusd/) | DCC-MCP | Native artifact authoring | Agent-controllable canvas or domain editor | Filesystem agent with visual evidence | source · active |
| [DCC-MCP Photoshop](projects/dcc-mcp-photoshop/) | DCC-MCP | Native artifact authoring | Agent-controllable canvas or domain editor | External-agent canvas | source · active |
| [DCC-MCP RenderDoc](projects/dcc-mcp-renderdoc/) | DCC-MCP | Visual coordination and evidence | Visual decision or verification workspace | Filesystem agent with visual evidence | source · active |
| [DCC-MCP Substance 3D Designer](projects/dcc-mcp-substance3d-designer/) | DCC-MCP | Native artifact authoring | Agent-controllable canvas or domain editor | External-agent canvas | source · active |
| [DCC-MCP Substance 3D Painter](projects/dcc-mcp-substance3d-painter/) | DCC-MCP | Native artifact authoring | Agent-controllable canvas or domain editor | External-agent canvas | source · active |
| [DCC-MCP TouchDesigner](projects/dcc-mcp-touchdesigner/) | DCC-MCP | Native artifact authoring | Agent-controllable canvas or domain editor | External-agent canvas | source · active |
| [DCC-MCP Tracy](projects/dcc-mcp-tracy/) | DCC-MCP | Visual coordination and evidence | Visual decision or verification workspace | Filesystem agent with visual evidence | source · active |
| [DCC-MCP Unity](projects/dcc-mcp-unity/) | DCC-MCP | End-to-end product delivery | Agent-controllable canvas or domain editor | External-agent canvas | source · active |
| [DCC-MCP Unreal](projects/dcc-mcp-unreal/) | DCC-MCP | End-to-end product delivery | Agent-controllable canvas or domain editor | External-agent canvas | source · active |
| [DCC-MCP Wwise](projects/dcc-mcp-wwise/) | DCC-MCP | Native artifact authoring | Agent-controllable canvas or domain editor | External-agent canvas | source · active |
| [DCC-MCP ZBrush](projects/dcc-mcp-zbrush/) | DCC-MCP | Native artifact authoring | Agent-controllable canvas or domain editor | External-agent canvas | source · active |
| [DCC Pipeline Publish](projects/dcc-pipeline-publish/) | DCC-MCP | End-to-end product delivery | General agent with visual tools | Filesystem agent with visual evidence | source · active |
| [DCC Texture Pipeline](projects/dcc-texture-pipeline/) | DCC-MCP | System governance | General agent with visual tools | Filesystem agent with visual evidence | source · active |
| [DCC-MCP Qt UI Actions](projects/dcc-ui-qt-actions/) | DCC-MCP | Runtime correction | Runtime overlay or context bridge | Runtime-intent relay | source · active |
| [EasyEDA Copilot](projects/easyeda-copilot/) | biosshot | Constraint-driven engineering | AI engineering-design workspace | Native graph authority | source · active |
| [KiCad Happy](projects/kicad-happy/) | Andrew Klofas | System governance | Visual decision or verification workspace | Filesystem agent with visual evidence | source · active |
| [Motion Previs Studio](projects/motion-previs-studio/) | Sam Wasserman | Visual coordination and evidence | Visual decision or verification workspace | Filesystem agent with visual evidence | source · active |
| [BlenderMCP](projects/blendermcp/) | Siddharth / BlenderMCP | Native artifact authoring | Agent-controllable canvas or domain editor | External-agent canvas | source · active |
| [Preso AI](projects/preso-ai/) | Atharva Jagtap | Delegated creation | Standalone design-agent workspace | Native graph authority | source · active |
| [DeepPCB](projects/deeppcb/) | InstaDeep | Constraint-driven engineering | AI engineering-design workspace | Parametric engineering-model authority | architecture · active |
| [Unreal MCP](projects/unreal-mcp/) | Epic Games | Native artifact authoring | Established visual platform with AI | External-agent canvas | architecture · active |
| [Gemini Notebook](projects/gemini-notebook/) | Google | Delegated creation | Established visual platform with AI | Hosted generated-artifact workspace | architecture · active |
| [Office Raccoon](projects/office-raccoon/) | SenseNova | Delegated creation | Design surface inside an agent platform | Managed application-project graph | architecture · active |
| [Circle Take](projects/circle-take/) | Sam Wasserman | Variant exploration and decision | Visual decision or verification workspace | Candidate isolation and promotion | source · active |
| [Cork Board](projects/cork-board/) | Sam Wasserman | Native artifact authoring | Agent-controllable canvas or domain editor | Native graph authority | source · active |
| [Master Canvas](projects/master-canvas/) | Sam Wasserman | Native artifact authoring | Agent-controllable canvas or domain editor | Native graph authority | source · active |
| [Sam PDF Studio](projects/sam-pdf-studio/) | Sam Wasserman | Runtime correction | Agent-controllable canvas or domain editor | Native graph authority | source · active |
| [ScriptBreak](projects/scriptbreak/) | Sam Wasserman | System governance | Standalone design-agent workspace | Native graph authority | source · active |
| [Slate](projects/slate/) | Sam Wasserman | Native artifact authoring | Standalone design-agent workspace | Native graph authority | source · active |
| [Storyboard Reference Studio](projects/storyboard-reference-studio/) | Sam Wasserman | Native artifact authoring | Standalone design-agent workspace | Native graph authority | source · active |
| [Wasserman's Unofficial DaVinci MCP](projects/unofficial-davinci-mcp/) | Sam Wasserman | Runtime correction | Agent-controllable canvas or domain editor | External-agent canvas | source · active |
| [Quilter](projects/quilter/) | Quilter | Constraint-driven engineering | AI engineering-design workspace | Parametric engineering-model authority | architecture · active |
| [Seko](projects/seko/) | SenseNova | Delegated creation | Standalone design-agent workspace | Managed application-project graph | architecture · active |
| [DaVinci Resolve](projects/davinci-resolve/) | Blackmagic Design | Native artifact authoring | Established visual platform with AI | Native graph authority | architecture · active |
| [comfyui-mcp](projects/comfyui-mcp/) | Arthur R. Longbottom / comfyui-mcp | Native artifact authoring | Agent-controllable canvas or domain editor | External-agent canvas | source · active |
| [Figsor](projects/figsor/) | Asif Kabir | Native artifact authoring | Agent-controllable canvas or domain editor | External-agent canvas | source · active |
| [Trace](projects/trace-pcb/) | Trace | Constraint-driven engineering | AI engineering-design workspace | Source-authority live projection | architecture · active |
| [Clai](projects/clai/) | Eric Lee | Delegated creation | Standalone design-agent workspace | Managed application-project graph | source · active |
| [FableCut](projects/fablecut/) | Ronak Parmar | Native artifact authoring | Code-native visual editor or IDE | Source-authority live projection | source · active |
| [Code2Video](projects/code2video/) | Show Lab at the National University of Singapore | Delegated creation | Standalone design-agent workspace | Source-authority live projection | source · active |
| [Fluxwing Skills](projects/fluxwing-skills/) | Trabian | Native artifact authoring | General agent with visual tools | Filesystem agent with visual evidence | source · active |
| [UXSCII](projects/uxscii/) | Trabian | System governance | Visual-editor infrastructure | Source-authority live projection | source · active |
| [Kintsugi](projects/kintsugi/) | VeriTeknik | System governance | Runtime overlay or context bridge | Source-authority live projection | source · active |
| [cxDesinger](projects/cxdesigner/) | Sean Zhang | Native artifact authoring | Standalone design-agent workspace | Filesystem agent with visual evidence | source · active |
| [Pigcasso Canvas](projects/pigcasso-canvas/) | Kevin Lin | Native artifact authoring | Standalone design-agent workspace | Managed application-project graph | source · active |
| [ComfyUI](projects/comfyui/) | Comfy Org | Native artifact authoring | Established visual platform with AI | Native graph authority | source · active |
| [Comfy MCP](projects/comfy-mcp-official/) | Comfy Org | Native artifact authoring | Agent-controllable canvas or domain editor | External-agent canvas | architecture · active |
| [Comfy In-App Agent](projects/comfy-in-app-agent/) | Comfy Org | Native artifact authoring | Design surface inside an agent platform | Native graph authority | architecture · active-transition |
| [QuiverAI](projects/quiverai/) | QuiverAI | Delegated creation | Standalone design-agent workspace | Hosted generated-artifact workspace | architecture · active |
| [Trace Symbols and Footprints Libraries](projects/trace-component-libraries/) | Trace | Constraint-driven engineering | Visual-editor infrastructure | Hosted generated-artifact workspace | architecture · active |
| [Remotion](projects/remotion/) | Remotion | Visual authoring of executable source | Code-native visual editor or IDE | Source-authority live projection | source · active |
| [Canvoss](projects/canvoss/) | Shashank Bhat | Native artifact authoring | Visual-editor infrastructure | Native graph authority | source · active |
| [Huashu Design](projects/huashu-design/) | Huashu | Delegated creation | General agent with visual tools | Filesystem agent with visual evidence | source · active |
| [HomeVerse](projects/homeverse/) | Anisha Paturi | Native artifact authoring | Standalone design-agent workspace | Managed application-project graph | source · active |
| [Hangover](projects/hangover/) | Arnav Chhabra | Constraint-driven engineering | AI engineering-design workspace | Managed application-project graph | source · active |
| [Cova](projects/cova/) | Guizimo | Native artifact authoring | Standalone design-agent workspace | Native graph authority | source · active |
| [Logo Generator](projects/logo-generator-skill/) | Guicang | Delegated creation | General agent with visual tools | Filesystem agent with visual evidence | source · active |
| [Remotion Prompt to Motion Graphics](projects/remotion-prompt-to-motion-graphics/) | Remotion | Visual authoring of executable source | Standalone design-agent workspace | Source-authority live projection | source · active |
| [Remotion AI Video Template](projects/remotion-ai-video-template/) | Remotion | Delegated creation | Standalone design-agent workspace | Filesystem agent with visual evidence | source · active |
| [AI Media Canvas](projects/ai-media-canvas/) | Tutti OS | Native artifact authoring | Standalone design-agent workspace | Native graph authority | source · active |
| [Nika Character Studio](projects/nika-character-studio/) | HiUnikitty | Native artifact authoring | Standalone design-agent workspace | Managed application-project graph | source · active |
| [UIX AI Agent](projects/uix-ai-agent/) | seeb4coding | Visual authoring of executable source | Standalone design-agent workspace | Source-authority live projection | source · active |
| [Rhino Grasshopper MCP](projects/rhino-grasshopper-mcp/) | Dongwoo Suk | Constraint-driven engineering | AI engineering-design workspace | Parametric engineering-model authority | source · active |
| [Homemaker](projects/homemaker/) | bayllama | Visual authoring of executable source | Standalone design-agent workspace | Filesystem agent with visual evidence | source · active |
| [Lunima](projects/lunima/) | Max Aigner / Lunima | Constraint-driven engineering | AI engineering-design workspace | Parametric engineering-model authority | source · active |
| [Shape](projects/shape/) | Shape | Visual authoring of executable source | Code-native visual editor or IDE | Source-authority live projection | source · active |
| [Data Formulator](projects/data-formulator/) | Microsoft | Native artifact authoring | Standalone design-agent workspace | Managed application-project graph | source · active |
| [Resume Matcher](projects/resume-matcher/) | Resume Matcher | Native artifact authoring | Standalone design-agent workspace | Managed application-project graph | source · active |
| [Clypra](projects/clypra/) | AIEraDev | Native artifact authoring | Established visual platform with AI | Native graph authority | source · active |
| [Caret](projects/caret/) | Caret | Visual authoring of executable source | Code-native visual editor or IDE | Source-authority live projection | source · active |
| [Vextra MCP](projects/vextra-mcp/) | KCAI Technology | Design-code translation and grounding | Design-code bridge | External-agent canvas | source · active |
| [BurnGuard Design](projects/burnguard-design/) | GwangHoonMoon / BurnGuard Design | Visual authoring of executable source | Standalone design-agent workspace | Source-authority live projection | source · active |
| [AI Creative Studio](projects/ai-creative-studio/) | Saoussen Chaabnia | Visual coordination and evidence | General agent with visual tools | Hosted generated-artifact workspace | source · active |
| [Diamond Design AI](projects/diamond-design-ai/) | Queue Solutions | Delegated creation | Standalone design-agent workspace | Hosted generated-artifact workspace | source · active |
| [DesignFlow AI](projects/designflow-ai/) | Ganjayela Peddanna | Native artifact authoring | Standalone design-agent workspace | Native graph authority | source · active |
| [Substrata](projects/substrata/) | Daniel Joaquin Trujillo / Gantasmo | Constraint-driven engineering | AI engineering-design workspace | Parametric engineering-model authority | source · active |
| [AKO Visual Design Agent](projects/ako-visual-design-agent/) | AKO Studio | Delegated creation | General agent with visual tools | Filesystem agent with visual evidence | source · active |
| [DraftWalk](projects/draftwalk/) | Sammsamy02 / DraftWalk | Constraint-driven engineering | AI engineering-design workspace | Parametric engineering-model authority | source · active |
| [Visual Agent Designer](projects/visual-agent-designer/) | Zullllkar / Visual Agent Designer | Delegated creation | Standalone design-agent workspace | Filesystem agent with visual evidence | source · active |
| [Manim Explainer Agent](projects/manim-agent/) | Murtaza Nikzad | Visual authoring of executable source | Standalone design-agent workspace | Source-authority live projection | source · active |
| [Integrated SaaS Design Agent](projects/integrated-saas-design-agent/) | Ashish Bishnoi | Variant exploration and decision | Visual decision or verification workspace | Candidate isolation and promotion | source · active |
| [AI UI Generator / Design Engine](projects/ai-ui-generator/) | Dhruv Suyal | Visual authoring of executable source | Standalone design-agent workspace | Source-authority live projection | source · active |
| [AI Design Studio](projects/ai-design-studio/) | Abhinav Raj | Delegated creation | Standalone design-agent workspace | Hosted generated-artifact workspace | source · active |
| [AI Design Workspace](projects/ai-design-workspace-catalog/) | JUN CAO | Visual authoring of executable source | General agent with visual tools | Filesystem agent with visual evidence | source · active-transition |
| [DesignCanvas](projects/designcanvas/) | poer2023 / DesignCanvas | Native artifact authoring | Agent-controllable canvas or domain editor | Native graph authority | source · active |
| [UX Planner](projects/ux-planner/) | Viachesav Kuznetsov | Visual coordination and evidence | General agent with visual tools | Filesystem agent with visual evidence | source · active |
| [BuildGraph](projects/buildgraph/) | MB / BuildGraph | Constraint-driven engineering | AI engineering-design workspace | Native graph authority | source · active |
| [Virtuoso Bridge Lite](projects/virtuoso-bridge-lite/) | Arcadia-1 | Constraint-driven engineering | AI engineering-design workspace | Parametric engineering-model authority | source · active |
| [pbi-cli](projects/pbi-cli/) | Mina Saad | Visual authoring of executable source | General agent with visual tools | Source-authority live projection | source · active |
| [OWOX Model Canvas](projects/owox-model-canvas/) | OWOX | Native artifact authoring | Agent-controllable canvas or domain editor | Source-authority live projection | source · active |
| [AutoCkt](projects/autockt/) | AutoCkt research team | Constraint-driven engineering | AI engineering-design workspace | Parametric engineering-model authority | source · active |
| [RTL-CLAW](projects/rtl-claw/) | Tongji University | Constraint-driven engineering | AI engineering-design workspace | Filesystem agent with visual evidence | source · active-transition |
| [EDACraft](projects/edacraft/) | ephonic / EDACraft | Constraint-driven engineering | AI engineering-design workspace | Source-authority live projection | source · active |
| [CAP / CAD-GPT](projects/cad-gpt-cap/) | BlueAsuka / CAP | Constraint-driven engineering | AI engineering-design workspace | Source-authority live projection | source · active-transition |
| [claude-eda](projects/claude-eda/) | l3wi | System governance | General agent with visual tools | Filesystem agent with visual evidence | source · active |
| [AI Revit Family Maker](projects/ai-revit-family-maker/) | blueray32 | Constraint-driven engineering | AI engineering-design workspace | Parametric engineering-model authority | source · active-transition |
| [Chipster](projects/chipster/) | Bandung Institute of Technology | Constraint-driven engineering | AI engineering-design workspace | Parametric engineering-model authority | source · active |
| [Visual Authoring](projects/visual-authoring/) | Vibeworkers | Visual coordination and evidence | General agent with visual tools | Filesystem agent with visual evidence | source · active |
| [Neo Studio V2](projects/neo-studio/) | MoodPixel | Native artifact authoring | Standalone design-agent workspace | Managed application-project graph | source · active |
| [IceZone Studio](projects/icezone-studio/) | IceZone | Native artifact authoring | Standalone design-agent workspace | Native graph authority | source · active |
| [QBIC](projects/qbic/) | QBIC | Native artifact authoring | Agent-controllable canvas or domain editor | External-agent canvas | source · active |
| [PixelRuller](projects/pixelruller/) | kalotrapezis | Native artifact authoring | Agent-controllable canvas or domain editor | Source-authority live projection | source · active |
| [Gia-co-Design](projects/gia-co-design/) | alpha-1-design | Visual authoring of executable source | Standalone design-agent workspace | Source-authority live projection | source · active |
| [brawt](projects/brawt/) | brawt / Bernardo Forcillo | Native artifact authoring | Agent-controllable canvas or domain editor | Native graph authority | source · active-transition |
| [UML Tool](projects/uml-tool/) | goodmorningcoffee | Native artifact authoring | Agent-controllable canvas or domain editor | Source-authority live projection | source · active |
| [Agent Diagram Tool](projects/agent-diagram-tool/) | thebobrovs | Native artifact authoring | Standalone design-agent workspace | Native graph authority | source · active |
| [Co-Design Canvas](projects/co-design-canvas/) | Utopia5327 | Native artifact authoring | Standalone design-agent workspace | Native graph authority | source · historical |
| [Boutiqaat Creative Studio](projects/boutiqaat-creative-studio/) | Boutiqaat Creative Studio | Delegated creation | Standalone design-agent workspace | Hosted generated-artifact workspace | source · active |
| [LocalOffice](projects/localoffice/) | Zohaib Usmani | Native artifact authoring | Design surface inside an agent platform | Source-authority live projection | source · active |
| [Computational Design Skills](projects/computational-design-skills/) | Abhinav Bhardwaj | Constraint-driven engineering | General agent with visual tools | Filesystem agent with visual evidence | source · active |
| [Agent Skills for Autodesk Platform Services](projects/autodesk-platform-services-skills/) | Autodesk | System governance | General agent with visual tools | Filesystem agent with visual evidence | source · active |
| [Claude Engineering Skills Library](projects/claude-engineering-skills/) | Soljourner | Constraint-driven engineering | General agent with visual tools | Filesystem agent with visual evidence | source · active |
| [AMS-IO-Agent](projects/ams-io-agent/) | Arcadia-1 | Constraint-driven engineering | AI engineering-design workspace | Parametric engineering-model authority | source · active |
| [SymXplorer](projects/symxplorer/) | MacAnalog | Constraint-driven engineering | AI engineering-design workspace | Parametric engineering-model authority | source · active-transition |
| [FPGA Design Agent](projects/fpga-design-agent/) | Jacobo Forero | Constraint-driven engineering | AI engineering-design workspace | Filesystem agent with visual evidence | source · active |
| [Chili Chiplets](projects/chili-chiplets/) | Chili Chiplets | Constraint-driven engineering | AI engineering-design workspace | Parametric engineering-model authority | source · active |
| [Specula Method](projects/specula-method/) | Specula Future Crafting | System governance | General agent with visual tools | Filesystem agent with visual evidence | source · active |
| [Hype](projects/hype/) | Loki's Minions / Michael Weingartner | Native artifact authoring | Code-native visual editor or IDE | Native graph authority | source · active |
| [inLUMEN](projects/inlumen/) | DATAPACT | Native artifact authoring | Agent-controllable canvas or domain editor | Native graph authority | source · active |
| [Monogatari](projects/monogatari/) | Sakalio Labs | Native artifact authoring | Standalone design-agent workspace | Native graph authority | source · active |
| [Forge Projects](projects/forge-projects/) | NaphatPound | Native artifact authoring | Standalone design-agent workspace | Native graph authority | source · active |
| [Local Design Canvas](projects/local-design-canvas/) | Nguyen Yen Linh | Visual authoring of executable source | Standalone design-agent workspace | Source-authority live projection | source · active |
| [Delft AI Toolkit](projects/delft-ai-toolkit/) | Phil van Allen / Delft AI Toolkit | Native artifact authoring | Agent-controllable canvas or domain editor | Native graph authority | source · historical |
| [SpiceXplorer](projects/spicexplorer/) | MacAnalog | Constraint-driven engineering | AI engineering-design workspace | Parametric engineering-model authority | source · active-transition |
| [Specula BOS](projects/specula-bos/) | Specula Future Crafting | System governance | General agent with visual tools | Managed application-project graph | architecture · active |
| [SPECULA Framework](projects/specula-framework/) | Specula Future Crafting | System governance | General agent with visual tools | Filesystem agent with visual evidence | source · active |
| [SPECULA Skill](projects/specula-skill/) | Specula Future Crafting | System governance | General agent with visual tools | Filesystem agent with visual evidence | source · active |
| [OWOX Data Marts](projects/owox-data-marts/) | OWOX | System governance | Design surface inside an agent platform | Managed application-project graph | source · active |
| [ContextCypher](projects/contextcypher/) | Threat Vector Security | Constraint-driven engineering | AI engineering-design workspace | Native graph authority | source · active |
| [WriterFlow](projects/writerflow/) | Pruthviraj Gavhane | Native artifact authoring | Design surface inside an agent platform | Managed application-project graph | source · active |
| [MarkdownFlows](projects/markdownflows/) | EliteCoders / dotnetfactory | Visual authoring of executable source | Code-native visual editor or IDE | Source-authority live projection | source · active |
| [Gitary](projects/gitary/) | Peiiii | Native artifact authoring | Design surface inside an agent platform | Source-authority live projection | source · active |
| [Asciitecture](projects/asciitecture/) | Anima Digital Solutions | Native artifact authoring | General agent with visual tools | Filesystem agent with visual evidence | source · active |
| [AI Diagram Hub / AI Draw Nexus](projects/ai-draw-nexus/) | hkxiaoyao | Native artifact authoring | Standalone design-agent workspace | Managed application-project graph | source · active |
| [Smart Mermaid Assistance](projects/smart-mermaid-assistance/) | Daewu Bintara | Visual authoring of executable source | Code-native visual editor or IDE | Source-authority live projection | source · active |
| [Vibe Mermaid Editor](projects/vibe-mermaid/) | Huang Pufan | Visual authoring of executable source | Code-native visual editor or IDE | Source-authority live projection | source · active |
| [Mermaid Live Desktop](projects/mermaid-live-desktop/) | Çağrı Çatık | Visual authoring of executable source | Code-native visual editor or IDE | Source-authority live projection | source · active |
| [Architect Studio X](projects/architect-studio-x/) | Bala / Balchandar | Native artifact authoring | Agent-controllable canvas or domain editor | Native graph authority | source · active |
| [Loom Architecture Weaver](projects/loom-architecture/) | Flying Cat Studio | Constraint-driven engineering | AI engineering-design workspace | Native graph authority | source · active |
| [Graphini](projects/graphini/) | Magnova Research | Visual authoring of executable source | Code-native visual editor or IDE | Source-authority live projection | source · active |
| [drawloop-skill](projects/drawloop-skill/) | Sashika Suraweera | Native artifact authoring | Agent-controllable canvas or domain editor | Filesystem agent with visual evidence | source · active |
| [OpenDiagram](projects/opendiagram/) | Rupam Golui | Native artifact authoring | Standalone design-agent workspace | Native graph authority | source · active |
| [Diagram AI](projects/diagram-ai/) | Mohamed Ahmed Omar Ali Badwy | Visual authoring of executable source | Code-native visual editor or IDE | Source-authority live projection | source · active |
| [Codigram](projects/codigram/) | Mohammad Ahmad | Native artifact authoring | Standalone design-agent workspace | Native graph authority | source · active |
| [AI Diagrams](projects/ai-diagrams/) | Kavishan Nipun | Visual authoring of executable source | Code-native visual editor or IDE | Source-authority live projection | source · active |
| [AI Diagrammer](projects/ai-diagrammer/) | Eric Tech | Native artifact authoring | Standalone design-agent workspace | Native graph authority | source · active |
| [AG0 Diagramming Agent](projects/ag0-diagramming-agent/) | CoreSpeed | Native artifact authoring | Agent-controllable canvas or domain editor | Filesystem agent with visual evidence | source · active |
| [TechDraw](projects/techdraw/) | Sai Dhinakar | Native artifact authoring | Standalone design-agent workspace | Native graph authority | source · active |
| [Diagrams](projects/diagrams-bunlong/) | Bunlong Heng | Visual authoring of executable source | Code-native visual editor or IDE | Source-authority live projection | source · active |
| [FlowForge](projects/flowforge/) | Krish Jain | Native artifact authoring | Standalone design-agent workspace | Native graph authority | source · active |
| [AI Diagram / Sketch.chat](projects/sketch-chat/) | Vishal Maheshkumar | Native artifact authoring | Agent-controllable canvas or domain editor | Source-authority live projection | source · active |
| [SilverCraft AI](projects/silvercraft-ai/) | Yathik / RyVerse | Constraint-driven engineering | AI engineering-design workspace | Native graph authority | source · active |
| [HTML AI Diagram Editor](projects/html-ai-diagram-editor/) | Pulipuli Chen | Visual authoring of executable source | Code-native visual editor or IDE | Source-authority live projection | source · active |
| [Draw.io Figure Replicator](projects/drawio-figure-replicator/) | ai-jiaqian | Native artifact authoring | General agent with visual tools | Filesystem agent with visual evidence | source · active |
| [AI Diagrams Toolkit](projects/ai-diagrams-toolkit/) | Jose R. Prieto | Visual authoring of executable source | General agent with visual tools | Filesystem agent with visual evidence | source · active |
| [UML Flow](projects/uml-flow/) | Josa Pratama | Visual authoring of executable source | Code-native visual editor or IDE | Source-authority live projection | source · active |
| [Sirelia](projects/sirelia/) | Aaron Gonzalez | Visual authoring of executable source | General agent with visual tools | Filesystem agent with visual evidence | source · active |
| [AuricIDE](projects/auricide/) | Jörg Amelunxen | System governance | Design surface inside an agent platform | Managed application-project graph | source · active |
| [Author](projects/author-autograph/) | Autograph | Native artifact authoring | Design surface inside an agent platform | Managed application-project graph | source · active-transition |
| [MermaidGen](projects/mermaidgen/) | adimaryanto | Visual authoring of executable source | Code-native visual editor or IDE | Source-authority live projection | source · active |
| [Apo](projects/apo/) | Shaurya Gupta | Native artifact authoring | Design surface inside an agent platform | Native graph authority | source · active-transition |
| [Synthezy](projects/synthezy/) | Pritam | Native artifact authoring | Standalone design-agent workspace | Native graph authority | source · active |
| [Flowbase](projects/flowbase/) | rrs301 / Flowbase | Native artifact authoring | Design surface inside an agent platform | Native graph authority | source · active |
| [DiagramAI / text2diagram](projects/text2diagram/) | Ad1tyaD | Visual authoring of executable source | Code-native visual editor or IDE | Source-authority live projection | source · active-transition |
| [DiagAI](projects/diagai/) | Manas More | Native artifact authoring | General agent with visual tools | Native graph authority | source · active |
| [DiagramAI by Nihal](projects/diagramai-nihal/) | Nihal Choutapelly | Visual authoring of executable source | Code-native visual editor or IDE | Source-authority live projection | source · active-transition |
| [Flow2Go](projects/flow2go/) | Gusgoooo | Native artifact authoring | Standalone design-agent workspace | Native graph authority | source · active |
| [AI Diagram Generator / Draw.io Codex](projects/drawio-codex/) | Jinseo Lee | Visual authoring of executable source | Design-code bridge | Design-code materialization | source · active |
| [LLMO AI Diagram Architect](projects/llmo-diagram-generator/) | Chris / NovaCX23 | Visual authoring of executable source | Code-native visual editor or IDE | Source-authority live projection | source · active |
| [Thoth Blueprint](projects/thoth-blueprint/) | AHS12 | Native artifact authoring | Standalone design-agent workspace | Native graph authority | source · active |
| [Viso MCP](projects/viso-mcp/) | Florian Wisi | Native artifact authoring | Agent-controllable canvas or domain editor | Source-authority live projection | source · active |
| [CareerVivid](projects/careervivid/) | CareerVivid Maintainers | Native artifact authoring | Standalone design-agent workspace | Native graph authority | source · active |
| [Architecture Draw.io Automation](projects/architecture-drawio-automation/) | Debajyoti Mukhopadhyay | Native artifact authoring | Design-code bridge | External-agent canvas | source · active |
| [Cloud Architecture Diagrams](projects/cloud-architecture-diagrams/) | Hansraj Singh Thakur | Delegated creation | Design surface inside an agent platform | Filesystem agent with visual evidence | source · active |
| [Azure Diagram MCP Server](projects/azure-diagram-mcp-server/) | Jah-yee | Delegated creation | General agent with visual tools | Design-code materialization | source · active |
| [Interactive Architecture Diagrams](projects/interactive-architecture-diagrams/) | Konrad Dzbik | Visual authoring of executable source | Design surface inside an agent platform | Source-authority live projection | source · active |
| [Mermaid Chart for VS Code](projects/mermaid-chart-vscode/) | Mermaid Chart | Visual authoring of executable source | Code-native visual editor or IDE | Source-authority live projection | source · active |
| [STRIDE GPT](projects/stride-gpt/) | Matt Adams | Visual coordination and evidence | Visual decision or verification workspace | Native graph authority | source · active |
| [Diagram Creator](projects/diagram-creator-pramit/) | Pramit De | Delegated creation | Design-code bridge | Filesystem agent with visual evidence | source · active |
| [AI Diagram Copilot by Pranav](projects/ai-diagram-copilot-pranav/) | Pranav Learner | Native artifact authoring | Standalone design-agent workspace | Native graph authority | source · active |
| [Swark](projects/swark/) | Swark.io | Visual coordination and evidence | Code-native visual editor or IDE | Filesystem agent with visual evidence | source · active |
| [Archify](projects/archify/) | TT-A1I | Visual authoring of executable source | Design surface inside an agent platform | Source-authority live projection | source · active |
| [Product Diagram Copilot](projects/product-diagram-copilot/) | TUARAN | Delegated creation | Standalone design-agent workspace | Managed application-project graph | source · active |
| [Diagram Copilot by xidoke](projects/diagram-copilot-xidoke/) | xidoke | Visual authoring of executable source | Agent-controllable canvas or domain editor | Source-authority live projection | source · active |
| [InterviewForge](projects/interview-forge/) | azaddon | Visual coordination and evidence | Visual decision or verification workspace | Managed application-project graph | source · active |
| [NoteGen](projects/note-gen/) | CodeXU | Native artifact authoring | Established visual platform with AI | Source-authority live projection | source · active |
| [Litho](projects/litho/) | sopaco | Visual coordination and evidence | Design surface inside an agent platform | Filesystem agent with visual evidence | source · active |
| [CodeWiki](projects/codewiki/) | FSoft AI4Code | Visual coordination and evidence | Design surface inside an agent platform | Filesystem agent with visual evidence | source · active |
| [OpenMAIC](projects/openmaic/) | THU-MAIC | Native artifact authoring | Established visual platform with AI | Native graph authority | source · active |
| [ChartDB](projects/chartdb/) | ChartDB | Design-code translation and grounding | Established visual platform with AI | Native graph authority | source · active |
| [CodeBoarding](projects/codeboarding/) | CodeBoarding | Visual coordination and evidence | Design surface inside an agent platform | Filesystem agent with visual evidence | source · active |
| [BloxAI](projects/bloxai/) | Subhadeep Roy | Variant exploration and decision | Established visual platform with AI | Native graph authority | source · active |
| [DreamForge](projects/dreamforge/) | DreamForge Maintainers | Visual coordination and evidence | AI engineering-design workspace | Native graph authority | source · active |
| [Live Diagramming Copilot](projects/live-diagramming-copilot/) | Ben Feely | Visual authoring of executable source | Design surface inside an agent platform | Filesystem agent with visual evidence | source · active |
| [Marp Slides Template](projects/marp-slides-template/) | Chris Ayers | Visual authoring of executable source | Design surface inside an agent platform | Filesystem agent with visual evidence | source · active |
| [SDD Diagram Copilot](projects/sdd-diagram-copilot/) | Ryan Davis | Visual coordination and evidence | AI engineering-design workspace | Source-authority live projection | source · active |
| [Agon](projects/agon/) | Simon Holmes | Variant exploration and decision | Visual decision or verification workspace | Native graph authority | source · active |
| [SRE Design](projects/sre-design/) | Latent SRE | System governance | AI engineering-design workspace | Source-authority live projection | source · active |
| [Azure Diagram Skill](projects/azure-diagram-skill/) | Sriram Sundaresan | Delegated creation | Design surface inside an agent platform | Filesystem agent with visual evidence | source · active |
| [Strands Agents Diagram Tool](projects/strands-tools-diagram/) | Strands Agents | Delegated creation | General agent with visual tools | Design-code materialization | source · sunsetting |
| [LearnHouse](projects/learnhouse/) | LearnHouse | Delegated creation | Established visual platform with AI | Managed application-project graph | source · active |
| [Builder Skills System Architect](projects/builder-skills-system-architect/) | Tharun Kumar | System governance | Design surface inside an agent platform | Filesystem agent with visual evidence | source · active |
| [Copilot SDD Skills](projects/copilot-sdd-skills/) | Maximilian Mayr | System governance | Design surface inside an agent platform | Filesystem agent with visual evidence | source · active |
| [AI Factory](projects/ai-factory/) | Lee-to | System governance | AI engineering-design workspace | Filesystem agent with visual evidence | source · active |
| [Excalidraw Plugin](projects/excalidraw-plugin/) | aryxenv | Delegated creation | Design surface inside an agent platform | External-agent canvas | source · active |
| [KnowForge](projects/knowforge/) | Khusbu Rai | Visual coordination and evidence | General agent with visual tools | Hosted generated-artifact workspace | source · active |
| [AI Consulting Workflow](projects/ai-consulting-soyeon/) | Soyeon Ahn | System governance | AI engineering-design workspace | Filesystem agent with visual evidence | source · active |
| [DBX](projects/dbx/) | DBX Maintainers | Design-code translation and grounding | Established visual platform with AI | Native graph authority | source · active |
| [Tabularis](projects/tabularis/) | Tabularis | Design-code translation and grounding | Established visual platform with AI | Native graph authority | source · active |
| [MerMark Editor](projects/mermark-editor/) | Vesperino | Visual authoring of executable source | Code-native visual editor or IDE | Source-authority live projection | source · active |
| [Grok Build](projects/grok-build/) | xAI | Visual coordination and evidence | General agent with visual tools | Runtime-intent relay | source · active |
| [ArchiGen](projects/archigen/) | Adarsh Puri | Delegated creation | Agent-controllable canvas or domain editor | Native graph authority | source · active |
| [YuzuDraw](projects/yuzudraw/) | Almog Gavra | Visual authoring of executable source | Code-native visual editor or IDE | Source-authority live projection | source · active |
| [Archie](projects/archie-ea/) | Anioko | System governance | AI engineering-design workspace | Native graph authority | source · active |
| [Sylang Studio](projects/sylang-studio/) | Balaji Boominathan | Constraint-driven engineering | AI engineering-design workspace | Source-authority live projection | source · active |
| [Archischema](projects/archischema/) | c0st1nus | Design-code translation and grounding | Established visual platform with AI | Native graph authority | source · active |
| [MermaidStudio by CatFoxVoyager](projects/mermaid-studio-catfox/) | CatFoxVoyager | Visual authoring of executable source | Code-native visual editor or IDE | Source-authority live projection | source · active |
| [RPAForge](projects/rpaforge/) | Vyacheslav Chelischev | Constraint-driven engineering | AI engineering-design workspace | Native graph authority | source · active |
| [LZBot 5000](projects/lzbot-5000/) | chungos | System governance | General agent with visual tools | Filesystem agent with visual evidence | source · active |
| [Codoptic](projects/codoptic/) | Codoptic | Visual authoring of executable source | Code-native visual editor or IDE | Source-authority live projection | source · active |
| [Unkode](projects/unkode/) | DeepCoders | System governance | Standalone design-agent workspace | Filesystem agent with visual evidence | source · active |
| [Canopy](projects/canopy/) | Dipesh Bhardwaj | Visual authoring of executable source | Runtime overlay or context bridge | Runtime-intent relay | source · active |
| [Mermaid Agent](projects/mermaid-agent/) | Himanshu Gupta | Visual authoring of executable source | Code-native visual editor or IDE | Source-authority live projection | source · active |
| [Cloud Visualizer Pro](projects/cloud-visualizer-pro/) | Error505 | System governance | AI engineering-design workspace | Native graph authority | source · active |
| [Foblex Flow](projects/foblex-flow/) | Foblex | Native artifact authoring | Visual-editor infrastructure | Native graph authority | source · active |
| [Mermalaid](projects/mermalaid/) | Dario Novoa | Visual authoring of executable source | Code-native visual editor or IDE | Source-authority live projection | source · active |
| [MermaidGenie](projects/mermaidgenie/) | Son Nguyen Hoang | Visual authoring of executable source | Code-native visual editor or IDE | Source-authority live projection | source · active |
| [Idem](projects/idem/) | Idem AI | End-to-end product delivery | AI app or site builder | Managed application-project graph | source · active |
| [CloudArchGen](projects/cloudarchgen/) | Jai Deep | System governance | AI engineering-design workspace | Native graph authority | source · active |
| [Draw.io Live Editor](projects/drawio-live-editor/) | Jerry Kwan | Native artifact authoring | Runtime overlay or context bridge | Runtime-intent relay | source · active |
| [WAM Diagram Editor](projects/wam-studio/) | Juho Lee and WAM project team | Native artifact authoring | Agent-controllable canvas or domain editor | Native graph authority | source · active |
| [Easy UML](projects/easy-uml/) | LilZee | Visual authoring of executable source | Code-native visual editor or IDE | Source-authority live projection | source · active |
| [LiveDiagram](projects/livediagram/) | LiveDiagram | Native artifact authoring | Agent-controllable canvas or domain editor | Native graph authority | source · active |
| [MindGraph](projects/mindgraph/) | Wang Cunchi | Visual coordination and evidence | Agent-controllable canvas or domain editor | Native graph authority | source · active |
| [BlueLens](projects/bluelens/) | Nathan Kamokoue | System governance | Visual decision or verification workspace | Source-authority live projection | source · active |
| [AI JointJS Diagram Editor](projects/diagram-designer-jointjs/) | Navid | Native artifact authoring | Agent-controllable canvas or domain editor | Native graph authority | source · active |
| [OWASP ThreatAtlas](projects/threatatlas/) | OWASP | System governance | Visual decision or verification workspace | Native graph authority | source · active |
| [Nuxt AI Draw.io](projects/nuxt-ai-drawio/) | Ray Tien | Native artifact authoring | Agent-controllable canvas or domain editor | Runtime-intent relay | source · active |
| [UML Transcoder](projects/uml-transcoder/) | Rohan Dey | Design-code translation and grounding | Design-code bridge | Native graph authority | source · active |
| [NanaDraw](projects/nanadraw/) | Shannon Science | Delegated creation | Agent-controllable canvas or domain editor | Native graph authority | source · active |
| [DiPeO](projects/dipeo/) | Seunghyun Ji | Constraint-driven engineering | AI engineering-design workspace | Native graph authority | source · active |
| [GenAI DrawIO Creator](projects/genai-drawio-creator/) | Yujinze | Native artifact authoring | Agent-controllable canvas or domain editor | Runtime-intent relay | source · active |
| [Turbo EA](projects/turbo-ea/) | Vincent Verdet | System governance | Established visual platform with AI | Native graph authority | source · active |
| [SysVis.AI](projects/sysvis-ai/) | vndangkhoa | Native artifact authoring | Agent-controllable canvas or domain editor | Native graph authority | source · active |
| [IntelliDraw](projects/intellidraw/) | IntelliDraw maintainers | Native artifact authoring | Established visual platform with AI | Native graph authority | source · active |
| [Mermaid Studio on Workers](projects/mermaid-studio-workers/) | Wang Yaomin | Visual authoring of executable source | Code-native visual editor or IDE | Source-authority live projection | source · active |
| [Werilog](projects/werilog/) | Werispace | Constraint-driven engineering | AI engineering-design workspace | Source-authority live projection | source · active |
| [Software Design Mermaid MCP](projects/software-design-mermaid-mcp/) | Harry Wu | Visual authoring of executable source | Agent-controllable canvas or domain editor | Source-authority live projection | source · active |
| [ScyllaDB Diagram Skill](projects/scylla-diagram-skill/) | Attila Toth | System governance | Standalone design-agent workspace | Filesystem agent with visual evidence | source · active |
| [Claude Cowork for Office](projects/claude-cowork-office/) | Cowork Studio | Delegated creation | General agent with visual tools | Filesystem agent with visual evidence | source · active |
| [ArchiFlow](projects/archiflow/) | Pabasara Palihena and ArchiFlow team | System governance | Agent-controllable canvas or domain editor | Native graph authority | source · active |
| [Zukai](projects/zukai/) | Satoru Ogura | Native artifact authoring | Agent-controllable canvas or domain editor | Native graph authority | source · active |
| [CloudMap](projects/cloudmap/) | Zeradam Fantaye | System governance | AI engineering-design workspace | Native graph authority | source · active-transition |
| [Diagram X](projects/diagram-x/) | Narihito | Native artifact authoring | Agent-controllable canvas or domain editor | Native graph authority | source · active |
| [KronEditor](projects/kroneditor/) | Krontek | Constraint-driven engineering | AI engineering-design workspace | Parametric engineering-model authority | source · active |
| [Visual Diagram Editor by Roman Zabolotin](projects/visual-diagram-editor-rzabolotin/) | Roman Zabolotin | Native artifact authoring | Agent-controllable canvas or domain editor | Native graph authority | source · active |
| [Agent Architecture by Shivraj](projects/agent-setup/) | Shivraj | System governance | Design surface inside an agent platform | Filesystem agent with visual evidence | source · active |
| [MedPaper Assistant](projects/medpaper-assistant/) | Tz Ping Gau | Visual coordination and evidence | Design surface inside an agent platform | Filesystem agent with visual evidence | source · active |
| [X-FluxAgent](projects/x-fluxagent/) | X School Academy | Visual authoring of executable source | Agent-controllable canvas or domain editor | Native graph authority | source · active |
| [AgentGo](projects/agentgo/) | AgentGo maintainers | Constraint-driven engineering | AI engineering-design workspace | Native graph authority | source · active |
| [MimoCanvas](projects/mimo-canvas/) | Maris Ibrahim | Native artifact authoring | Agent-controllable canvas or domain editor | Native graph authority | source · active |
| [FIGS](projects/figs/) | Zhilei Zheng | System governance | Visual decision or verification workspace | Native graph authority | source · active |
| [Open Agent Builder](projects/open-agent-builder/) | 01.AI | Constraint-driven engineering | AI engineering-design workspace | Native graph authority | source · active |
| [AgentFlow](projects/agentflow/) | Darshit Sharma | Constraint-driven engineering | AI engineering-design workspace | Native graph authority | source · active |
| [ZeroNode](projects/zeronode/) | Aniruddha Pratap Singh | Visual coordination and evidence | Agent-controllable canvas or domain editor | Native graph authority | source · active |
| [MyN8N](projects/myn8n/) | Ali Amin | Visual authoring of executable source | AI engineering-design workspace | Native graph authority | source · active |
| [Fluxus](projects/fluxus/) | LachPawel | Visual authoring of executable source | Agent-controllable canvas or domain editor | Native graph authority | source · active |
| [Vibe Automation Studio](projects/vibe-automation/) | Omar Borhom | Visual authoring of executable source | AI engineering-design workspace | Native graph authority | source · active |
| [Story Blocks](projects/story-blocks/) | Taiye James Babatunde | Native artifact authoring | Agent-controllable canvas or domain editor | Native graph authority | source · active |
| [WebNode Framework](projects/webnode/) | LifelessAK | Visual authoring of executable source | Code-native visual editor or IDE | Source-authority live projection | source · active |
| [NLJ Platform](projects/nlj-platform/) | NLJ Platform maintainers | Native artifact authoring | Agent-controllable canvas or domain editor | Native graph authority | source · active |
| [Agentic Signal](projects/agentic-signal/) | Agentic Signal maintainers | Constraint-driven engineering | AI engineering-design workspace | Native graph authority | source · active |
| [Calcstack](projects/calcstack/) | Calcstack | Native artifact authoring | Established visual platform with AI | Managed application-project graph | architecture · active |
| [ClaudeKit Marketing](projects/claudekit-marketing/) | ClaudeKit Marketing maintainers | Delegated creation | General agent with visual tools | Filesystem agent with visual evidence | source · active |
| [Figma Weave](projects/figma-weave/) | Figma | Native artifact authoring | Established visual platform with AI | Native graph authority | architecture · active-transition |
| [Velocity](projects/velocity/) | OptimiLabs | Constraint-driven engineering | General agent with visual tools | Source-authority live projection | source · active |
| [WorkflowOS](projects/workflowos/) | Production AI Institute | Constraint-driven engineering | Visual decision or verification workspace | Native graph authority | source · active |
| [OpenCanvas](projects/opencanvas-ai/) | OpenCanvas AI | Native artifact authoring | Agent-controllable canvas or domain editor | Native graph authority | source · active |
| [OpenFlow](projects/openflow-ai-studio/) | Nazih Khelifa | Native artifact authoring | Agent-controllable canvas or domain editor | Native graph authority | source · active |
| [WZRDFLOW](projects/wzrdflow/) | 5-Dee Studios | Native artifact authoring | Agent-controllable canvas or domain editor | Native graph authority | source · active |
| [AutoGPT Platform](projects/autogpt/) | AutoGPT | Constraint-driven engineering | AI engineering-design workspace | Native graph authority | source · active |
| [ToolJet](projects/tooljet/) | ToolJet | Visual authoring of executable source | AI app or site builder | Managed application-project graph | architecture · active |
| [Langflow](projects/langflow/) | Langflow | Constraint-driven engineering | AI engineering-design workspace | Native graph authority | source · active |
| [Inkeep Agents](projects/inkeep-agents/) | Inkeep | Constraint-driven engineering | AI engineering-design workspace | Source-authority live projection | source · active |
| [Open Agent Builder by Firecrawl](projects/firecrawl-open-agent-builder/) | Firecrawl | Constraint-driven engineering | AI engineering-design workspace | Native graph authority | source · active |
| [RocketRide](projects/rocketride/) | RocketRide | Constraint-driven engineering | Code-native visual editor or IDE | Source-authority live projection | source · active |
| [Dograh](projects/dograh/) | Dograh | Constraint-driven engineering | AI engineering-design workspace | Native graph authority | source · active |
| [Refly](projects/refly/) | Refly AI | Delegated creation | Design surface inside an agent platform | Native graph authority | source · active |
| [ClaraVerse](projects/claraverse/) | ClaraVerse | Visual coordination and evidence | Design surface inside an agent platform | Managed application-project graph | source · active |
| [agents-ui](projects/agents-ui/) | Tung Lam Nguyen Ba | System governance | General agent with visual tools | Filesystem agent with visual evidence | source · active |
| [ChatDev 2.0 and DevAll](projects/chatdev/) | OpenBMB | Constraint-driven engineering | AI engineering-design workspace | Source-authority live projection | source · active-transition |
| [Open Gumloop](projects/open-gumloop/) | Composio | Constraint-driven engineering | AI engineering-design workspace | Native graph authority | source · active |
| [Archon by Cole Medin](projects/archon-workflows/) | Cole Medin | Constraint-driven engineering | AI engineering-design workspace | Source-authority live projection | source · active |
| [Astron RPA](projects/astron-rpa/) | iFLYTEK | Constraint-driven engineering | AI engineering-design workspace | Native graph authority | source · active |
| [ChatbotX](projects/chatbotx/) | ChatbotX | Constraint-driven engineering | AI engineering-design workspace | Native graph authority | source · active |
| [SmythOS Studio](projects/smythos-studio/) | SmythOS | Constraint-driven engineering | AI engineering-design workspace | Native graph authority | source · active |
| [Flock](projects/flock-agent-orchestrator/) | Flock maintainers | Visual coordination and evidence | Visual decision or verification workspace | Native graph authority | source · active |
| [Tesslate Agent Builder](projects/tesslate-agent-builder/) | TesslateAI | Constraint-driven engineering | AI engineering-design workspace | Native graph authority | source · active |
| [Fireworks Tech Graph](projects/fireworks-tech-graph/) | Yizhiyanhua AI Community | Native artifact authoring | General agent with visual tools | Filesystem agent with visual evidence | source · active |
| [Automotive Skills Suite](projects/automotive-skills-suite/) | Jherrod Thomas | Constraint-driven engineering | General agent with visual tools | Parametric engineering-model authority | source · active |
| [Teable](projects/teable/) | Teable | End-to-end product delivery | AI app or site builder | Managed application-project graph | architecture · active |
| [Budibase](projects/budibase/) | Budibase | Visual authoring of executable source | Established visual platform with AI | Managed application-project graph | source · active |
| [Vercel AI Workflow Builder Template](projects/vercel-workflow-builder-template/) | Vercel | Visual authoring of executable source | AI engineering-design workspace | Native graph authority | source · active |
| [WrenAI](projects/wrenai/) | Canner | System governance | AI engineering-design workspace | Source-authority live projection | source · active |
| [n8n Workflow Builder MCP Server](projects/n8n-workflow-builder-mcp/) | Yasin Boelhouwer | Visual authoring of executable source | Design-code bridge | External-agent canvas | source · active |
| [Orca IDE](projects/orca-ide/) | Stably | Visual coordination and evidence | General agent with visual tools | Filesystem agent with visual evidence | source · active |
| [Tersa](projects/tersa/) | Vercel | Native artifact authoring | Agent-controllable canvas or domain editor | Native graph authority | source · active |
| [Buzz](projects/buzz-workspace/) | Block Open Source | Visual coordination and evidence | Design surface inside an agent platform | Managed application-project graph | source · active |
| [FluxorAI](projects/fluxorai/) | Priyanshu Paul | Visual authoring of executable source | AI engineering-design workspace | Native graph authority | source · active |
| [Ledgyx](projects/ledgyx/) | Ineron | Native artifact authoring | AI app or site builder | Managed application-project graph | architecture · active |
| [Agent Canvas](projects/agent-canvas-randomvibecoder/) | randomvibecoder | Native artifact authoring | Agent-controllable canvas or domain editor | Native graph authority | source · active |
| [TimeCapsule SLM](projects/timecapsule-slm/) | microcandella | Visual authoring of executable source | Code-native visual editor or IDE | Source-authority live projection | source · active |
| [Canvas AI Page Context Generation Skill](projects/canvas-ai-page-context-generation/) | Akhil Babu | System governance | General agent with visual tools | Filesystem agent with visual evidence | source · active |
| [Varbase AI Figma](projects/varbase-ai-figma/) | Vardot | Design-code translation and grounding | Design-code bridge | Native graph authority | source · active |
| [Drup-AID](projects/drup-aid/) | Drelf | Delegated creation | Design surface inside an agent platform | External-agent canvas | source · active |
| [AI Shortfilm Studio](projects/ai-shortfilm-studio/) | Dcongthinh | Native artifact authoring | Agent-controllable canvas or domain editor | Managed application-project graph | source · active |
| [AI Workflow Generator by Wafiq](projects/wafiq-ai-workflow-generator/) | Wafiq | Visual authoring of executable source | AI engineering-design workspace | Design-code materialization | source · active |
| [AI Game LaunchPad](projects/ai-game-launchpad/) | Oplooins | Delegated creation | AI app or site builder | Hosted generated-artifact workspace | source · active |
| [AI Workflow Studio by Kedar Vartak](projects/kedar-ai-workflow-studio/) | Kedar Vartak | Visual authoring of executable source | AI engineering-design workspace | Native graph authority | source · active |
| [AI Workflow Studio by Erin](projects/erin-ai-workflow-studio/) | Erin AI Workflow Studio team | Constraint-driven engineering | AI engineering-design workspace | Native graph authority | source · active |
| [WorkflowAI by Dresar](projects/workflowai-dresar/) | Eka Syarif Maulana | Visual coordination and evidence | Design surface inside an agent platform | Managed application-project graph | source · active |
| [Wallbit Workflows](projects/wallbit-workflows/) | Jeremy | Visual authoring of executable source | AI engineering-design workspace | Filesystem agent with visual evidence | source · active |
| [HomeBrain](projects/homebrain/) | mefree2098 | Constraint-driven engineering | AI engineering-design workspace | Native graph authority | source · active |
| [ComfyUI Workflow Studio](projects/comfyui-workflow-studio/) | ketle-man | Native artifact authoring | Design surface inside an agent platform | Native graph authority | source · active |
| [SmartModeler](projects/smartmodeler/) | Yusuf Eminoğlu | Constraint-driven engineering | AI engineering-design workspace | Parametric engineering-model authority | source · active |
| [Drupal Canvas](projects/drupal-canvas/) | Drupal community | Native artifact authoring | Established visual platform with AI | Native graph authority | source · active |
| [Drupal Canvas Plugin](projects/drupal-canvas-plugin/) | Alphons Jaimon | Design-code translation and grounding | General agent with visual tools | Filesystem agent with visual evidence | source · active |
| [Canvas AI Migrations](projects/canvas-ai-migrations/) | Alphons Jaimon | Design-code translation and grounding | AI engineering-design workspace | Filesystem agent with visual evidence | source · active |
| [AI Figma](projects/ai-figma/) | Vardot | Design-code translation and grounding | Design-code bridge | External-agent canvas | source · active |
| [MAF Agent Builder Canvas](projects/maf-agent-builder-canvas/) | Sakthivel Nachimuthu | Visual authoring of executable source | AI engineering-design workspace | Native graph authority | source · active |
| [AI Agent Builder by Leon](projects/leon-ai-agent-builder/) | Leon-HyperS | Visual authoring of executable source | AI engineering-design workspace | Source-authority live projection | source · active |
| [Aidemyst AgentStudio](projects/aidemyst-agentstudio/) | Aidemyst | Constraint-driven engineering | AI engineering-design workspace | Native graph authority | source · active |
| [Trinity Creative Canvas](projects/trinity-creative-canvas/) | Mathias Engel | Native artifact authoring | Agent-controllable canvas or domain editor | Native graph authority | source · active |
| [Quill AI](projects/quill-ai/) | tovrr | Visual authoring of executable source | AI engineering-design workspace | Design-code materialization | source · active |
| [FRACTA Visual Agent Builder](projects/fracta-agent-builder/) | asheesh109 | Visual coordination and evidence | Design surface inside an agent platform | Native graph authority | source · active |
| [Agentix](projects/agentix/) | Pruthviraj75 | Visual authoring of executable source | AI engineering-design workspace | Design-code materialization | source · active |
| [NodeMind](projects/nodemind/) | kashyapv45 | Visual authoring of executable source | AI engineering-design workspace | Native graph authority | source · active |
| [ForgeLang](projects/forgelang/) | cloud9ops | Constraint-driven engineering | AI engineering-design workspace | Managed application-project graph | source · active-transition |
| [Voiceblox](projects/voiceblox/) | okanaganrusty | Constraint-driven engineering | AI engineering-design workspace | Native graph authority | source · active |
| [DonkeyWork Agents](projects/donkeywork-agents/) | andyjmorgan | Constraint-driven engineering | AI engineering-design workspace | Native graph authority | source · active |
| [OpenCode Flow](projects/opencode-flow/) | Igor Warzocha | Visual coordination and evidence | General agent with visual tools | Filesystem agent with visual evidence | source · historical |
| [Gemini Resume Builder](projects/gemini-resume-builder/) | Om Kshirsagar | Delegated creation | Standalone design-agent workspace | Candidate isolation and promotion | source · active |
| [Voice AI Workflow Builder](projects/voice-ai-workflow-builder/) | QuantAI3113 | Visual authoring of executable source | AI engineering-design workspace | Native graph authority | source · active |
| [ADK Studio](projects/adk-studio/) | Zavora AI | Constraint-driven engineering | AI engineering-design workspace | Native graph authority | source · active |
| [OpenAI Agent Builder](projects/openai-agent-builder/) | OpenAI | Constraint-driven engineering | AI engineering-design workspace | Native graph authority | architecture · sunsetting |
| [Sim](projects/sim/) | Sim | Visual authoring of executable source | AI engineering-design workspace | Native graph authority | source · active |
| [RAGFlow](projects/ragflow/) | InfiniFlow | Visual authoring of executable source | AI engineering-design workspace | Native graph authority | source · active |
| [Google ADK Web / Visual Agent Builder](projects/google-adk-web/) | Google | Visual authoring of executable source | AI engineering-design workspace | Design-code materialization | source · active |
| [Nyno](projects/nyno/) | flowagi.eu | Visual authoring of executable source | AI engineering-design workspace | Design-code materialization | source · active |
| [Flowise](projects/flowise/) | FlowiseAI | Visual authoring of executable source | Established visual platform with AI | Native graph authority | source · active |
| [FlowForge AI by Daniel](projects/flowforge-ai-daniiel/) | Daniel | Visual authoring of executable source | AI engineering-design workspace | Native graph authority | source · active |
| [Nextflow by Aadithyan A.S](projects/nextflow-aadithyanas/) | Aadithyan A.S | Visual authoring of executable source | AI engineering-design workspace | Native graph authority | source · active |
| [No-Code ADK Interface](projects/google-adk-nocode/) | Abhishek Kumar | Design-code translation and grounding | Design-code bridge | Design-code materialization | source · active |
| [I Love Agents](projects/i-love-agents/) | Aditthya S.S Varma | Visual authoring of executable source | AI engineering-design workspace | Managed application-project graph | source · active |
| [AISpirit Agent](projects/aispirit-agent/) | AISpirit Labs | Visual authoring of executable source | AI engineering-design workspace | Native graph authority | source · active |
| [NextFlow AI Workflow Builder](projects/nextflow-ai-workflow-builder/) | Aman Kaliramna | Visual authoring of executable source | AI engineering-design workspace | Native graph authority | source · active |
| [Local Visual Agent Workflow](projects/local-visual-agent-workflow/) | Amitesh | Visual authoring of executable source | AI engineering-design workspace | Native graph authority | source · active |
| [AI Tutors Hub Visual Agent Builder](projects/visual-agent-builder-amrsaeed/) | AMR Saeed Badway | Visual authoring of executable source | AI engineering-design workspace | Native graph authority | source · active |
| [AI Workflow Builder by Anshi Jain](projects/ai-workflow-builder-anshii/) | Anshi Jain | System governance | AI engineering-design workspace | Managed application-project graph | source · active |
| [Agent Mesh on Streaming World](projects/agent-mesh-sre/) | Aswin A | Visual coordination and evidence | Visual decision or verification workspace | Native graph authority | source · active |
| [Tessra](projects/tessra/) | Tessra contributors | Design-code translation and grounding | Design-code bridge | Design-code materialization | source · active |
| [Orchestral AI](projects/orchestral-ai/) | Shreyansh Saurabh | Visual authoring of executable source | AI engineering-design workspace | Native graph authority | source · active |
| [Visual Agent Builder by Brahim Abdelbeki](projects/visual-agent-builder-brahim/) | Brahim Abdelbeki | Design-code translation and grounding | Design-code bridge | Design-code materialization | source · active |
| [Brainfuel Agent Builder](projects/brainfuel-agent-builder/) | Brainfuel | Constraint-driven engineering | AI engineering-design workspace | Native graph authority | source · active |
| [AI Workflow Builder by Burhan086](projects/burhan-ai-workflow-builder/) | Burhan086 | Delegated creation | AI engineering-design workspace | Native graph authority | source · active |
| [Naaviq](projects/naaviq/) | Chandradot99 | Visual authoring of executable source | AI engineering-design workspace | Native graph authority | source · active |
| [AgentBuilder by Chebale Omkar](projects/agentbuilder-chebale/) | Chebale Omkar | System governance | Design surface inside an agent platform | Managed application-project graph | source · active |
| [AI Workflow Builder by Codexnever](projects/no-code-ai-workflow-codexnever/) | Codexnever | Visual authoring of executable source | AI engineering-design workspace | Native graph authority | source · active |
| [System Prompt](projects/system-prompt/) | Cody Adam | Visual authoring of executable source | AI engineering-design workspace | Native graph authority | source · active |
| [ContextUI](projects/contextui/) | ContextUI | Visual authoring of executable source | Code-native visual editor or IDE | Source-authority live projection | source · active |
| [AETHEROS](projects/aetheros/) | DaFum | Native artifact authoring | Agent-controllable canvas or domain editor | Native graph authority | source · active |
| [ADK Playground](projects/adk-playground/) | Dan Rob Lewis | Constraint-driven engineering | AI engineering-design workspace | Source-authority live projection | source · active |
| [FloAgenticAI](projects/floagenticai/) | Dear Zubi | Visual authoring of executable source | AI engineering-design workspace | Native graph authority | source · active |
| [OpenAgent by DeepFlowAI](projects/openagent/) | DeepFlowAI | System governance | Design surface inside an agent platform | Managed application-project graph | source · active |
| [AI Workflow Builder by Demilade01](projects/ai-workflow-demilade/) | Demilade01 | Visual authoring of executable source | AI engineering-design workspace | Native graph authority | source · active |
| [Planet AI Workflow Builder](projects/planet-ai-workflow/) | Dhanu81-DEV | Visual authoring of executable source | AI engineering-design workspace | Runtime-intent relay | source · active |
| [PolySynergy](projects/polysynergy/) | Dion Snoeijen | Visual authoring of executable source | Established visual platform with AI | Native graph authority | source · active |
| [Drag-and-Swap](projects/drag-and-swap/) | Farrell Joswara | Visual authoring of executable source | AI engineering-design workspace | Native graph authority | source · active |
| [ai-workflow-builder by fuleinist](projects/ai-workflow-builder-fuleinist/) | Fuleinist | Design-code translation and grounding | Design-code bridge | Design-code materialization | source · active |
| [Giselle](projects/giselle/) | Giselle | Visual authoring of executable source | Design surface inside an agent platform | Native graph authority | source · active |
| [AIOS](projects/aios/) | Harsh Chavan | Native artifact authoring | AI engineering-design workspace | Native graph authority | source · active |
| [Heym](projects/heym/) | Heym | Visual authoring of executable source | Established visual platform with AI | Native graph authority | source · active |
| [CRIMETRYX AI](projects/crimetryx-ai/) | Anjana Rangarajan / CRIMETRYX AI | Visual coordination and evidence | Visual decision or verification workspace | Managed application-project graph | source · active |
| [Workshop Buddy](projects/workshop-buddy/) | Microsoft | Delegated creation | Design surface inside an agent platform | Managed application-project graph | source · active |
| [TaskStream](projects/taskstream/) | Jiazhen Zhu | Visual authoring of executable source | AI engineering-design workspace | Native graph authority | source · active |
| [JoySafeter](projects/joysafeter/) | JD.com | Visual authoring of executable source | AI engineering-design workspace | Native graph authority | source · active |
| [Quorve](projects/quorve/) | Jedidiah Onyekachi | Native artifact authoring | AI engineering-design workspace | Native graph authority | source · active |
| [Froglips](projects/froglips/) | Jeritano | Visual authoring of executable source | Code-native visual editor or IDE | Native graph authority | source · active |
| [Agent Workflow Canvas](projects/agent-workflow-canvas/) | Kevin Astuhuaman | System governance | Visual decision or verification workspace | Native graph authority | source · active |
| [Human Control Plane](projects/human-control-plane/) | Kevin Astuhuaman | System governance | Visual decision or verification workspace | Managed application-project graph | source · active |
| [Kyndryl Consult Agent Builder for Modernization](projects/kyndryl-agent-builder/) | Kyndryl | Design-code translation and grounding | Design-code bridge | Design-code materialization | source · active-transition |
| [AgentForge](projects/agentforge/) | Lanekingkong | Visual coordination and evidence | AI engineering-design workspace | Native graph authority | source · active-transition |
| [FlowSpect](projects/flowspect/) | Lonkins | Constraint-driven engineering | Visual decision or verification workspace | Filesystem agent with visual evidence | source · active |
| [BrokieAI](projects/brokieai/) | Djason Gadiou / BrokieAI | Visual authoring of executable source | AI engineering-design workspace | Native graph authority | source · active-transition |
| [ABC Agent Builder Console](projects/abc-agent-builder-console/) | Magpiefelt / ABC Agent Builder Console | Visual authoring of executable source | Established visual platform with AI | Native graph authority | source · active |
| [Ghosted](projects/ghosted/) | MegaSuperSoft | Visual authoring of executable source | Code-native visual editor or IDE | Filesystem agent with visual evidence | source · active |
| [Melaya Agent Builder](projects/melaya/) | Melaya | Visual authoring of executable source | Design surface inside an agent platform | Managed application-project graph | architecture · active |
| [Graph AI](projects/graph-ai/) | Josef Mazan | Visual authoring of executable source | Established visual platform with AI | Native graph authority | source · active |
| [AI Workflow Builder by Nidhi Sarda](projects/ai-workflow-builder-nids12/) | Nidhi Sarda | Visual authoring of executable source | AI engineering-design workspace | Native graph authority | source · active-transition |
| [Forge by Nihal A. Shetty](projects/forge-nihalashetty/) | Nihal A. Shetty | Visual authoring of executable source | Established visual platform with AI | Native graph authority | source · active |
| [NodeBase AI Workflow Builder](projects/nodebase-ai-workflow-builder/) | Nikhil VS | Visual authoring of executable source | AI engineering-design workspace | Native graph authority | source · active |
| [Hustl3](projects/hustl3/) | Nisarg Patel | Visual authoring of executable source | Design surface inside an agent platform | Native graph authority | source · active-transition |
| [Sutradhar AI](projects/sutradhar-ai/) | Team Yurei | Visual coordination and evidence | Design surface inside an agent platform | Native graph authority | source · active-transition |
| [Soniq](projects/soniq/) | Rachit | Visual authoring of executable source | Established visual platform with AI | Native graph authority | source · active |
| [LightLang AI Workflow Builder](projects/lightlang-workflow-builder/) | Dmitriy Vasilyuk / LightLang | Visual authoring of executable source | Design surface inside an agent platform | Native graph authority | source · active-transition |
| [Visual Agent Builder by Reed Richardson](projects/visual-agent-builder-reedrich12/) | Reed Richardson | Visual authoring of executable source | AI engineering-design workspace | Native graph authority | source · active |
| [NextFlow by Richa Sharma](projects/nextflow-richa-sharma/) | Richa Sharma | Visual authoring of executable source | Design surface inside an agent platform | Native graph authority | source · active-transition |
| [AI Workflow Builder by R. Mounith Reddy](projects/ai-workflow-builder-rmounith/) | R. Mounith Reddy | Visual authoring of executable source | Established visual platform with AI | Native graph authority | source · active |
| [AI Workflow Builder by Roberts B](projects/ai-workflow-builder-robertsbob/) | Roberts B | Visual authoring of executable source | Code-native visual editor or IDE | Native graph authority | source · active |
| [Flow Maker](projects/flow-maker/) | LlamaIndex | Visual authoring of executable source | Code-native visual editor or IDE | Design-code materialization | source · active |
| [AI Agent Workflow Builder by Sanket Hatti](projects/ai-workflow-builder-sanket-hatti/) | Sanket Hatti | System governance | Design surface inside an agent platform | Managed application-project graph | source · active |
| [HeliosGen](projects/heliosgen/) | SegFault42 | Native artifact authoring | Established visual platform with AI | Native graph authority | source · active |
| [ModelWeave](projects/modelweave/) | Serhii Sotskyi | System governance | Design surface inside an agent platform | Native graph authority | source · active-transition |
| [AgenticBuilder by showjihyun](projects/agenticbuilder-showjihyun/) | showjihyun | Visual authoring of executable source | Established visual platform with AI | Native graph authority | source · active-transition |
| [AI Workflow Builder by Sneha Chaurasia](projects/ai-workflow-builder-sneha-chaurasia/) | Sneha Chaurasia | Delegated creation | Design-code bridge | Design-code materialization | source · active-transition |
| [Visual Agent Builder by Freek van den Bosch](projects/visual-agent-builder-studentfrederick/) | Freek van den Bosch | Visual authoring of executable source | Agent-controllable canvas or domain editor | Native graph authority | source · active |
| [AI Workflow Builder by Subham Mohanta](projects/ai-workflow-builder-subham-mohanta/) | Subham Mohanta | System governance | Design surface inside an agent platform | Managed application-project graph | source · active-transition |
| [Aura AI Workflow Builder](projects/aura-ai-workflow-builder/) | surabhi2408 | Visual authoring of executable source | Agent-controllable canvas or domain editor | Native graph authority | source · active-transition |
| [Smart Canvas](projects/smart-canvas/) | Sam Polsky | Visual authoring of executable source | Established visual platform with AI | Native graph authority | source · active-transition |
| [AI Workflow Builder by Tim Wijma](projects/ai-workflow-tim-wijma/) | Tim Wijma | Visual authoring of executable source | AI engineering-design workspace | Native graph authority | source · active-transition |
| [Cadens](projects/cadens/) | Tofulabai | Delegated creation | Design surface inside an agent platform | Filesystem agent with visual evidence | architecture · active-transition |
| [AI Workflow Builder by Syeda Tooba Hasnain](projects/ai-workflow-builder-toobahasnain/) | Syeda Tooba Hasnain | Delegated creation | Agent-controllable canvas or domain editor | Candidate isolation and promotion | source · active |
| [Kgents](projects/kgents/) | Daniel Nwachukwu | System governance | Design surface inside an agent platform | External-agent canvas | source · active-transition |
| [AI Workflow Builder by Upinder Kaur](projects/ai-workflow-builder-upinder28/) | Upinder Kaur | System governance | Design surface inside an agent platform | Managed application-project graph | source · active |
| [AI Workflow Builder Platform by VMK-004](projects/ai-workflow-automation-vmk/) | VMK-004 | Visual authoring of executable source | AI engineering-design workspace | Native graph authority | source · active |
| [N8N AI Workflow Builder by W3JDev](projects/n8n-ai-workflow-builder-w3jdev/) | W3JDev | Delegated creation | Design-code bridge | Design-code materialization | source · active |
| [AgCluster Container](projects/agcluster-container/) | whiteboardmonk | System governance | Design surface inside an agent platform | Filesystem agent with visual evidence | source · active |
| [AgentForge by winka-alcel](projects/agentforge-winka-alcel/) | winka-alcel | System governance | Design surface inside an agent platform | Managed application-project graph | source · active-transition |
| [Doodle Agent](projects/doodleagent/) | Yifan Kang | Native artifact authoring | Agent-controllable canvas or domain editor | External-agent canvas | source · active |
| [Voice Agent Platform by YumikoooD](projects/voice-agent-platform-yumikoood/) | YumikoooD | Delegated creation | Design surface inside an agent platform | Managed application-project graph | source · active |
| [AI UI Builder by Alexandr Davydov](projects/ai-ui-builder-eptura/) | Alexandr Davydov | Delegated creation | Standalone design-agent workspace | Native graph authority | source · active |
| [AI UI Builder by beingshappy](projects/ai-ui-builder-beingshappy/) | CodeWithHappy | Visual authoring of executable source | Standalone design-agent workspace | Source-authority live projection | source · active-transition |
| [ComposeFlow](projects/composeflow/) | ComposeFlow | Native artifact authoring | AI app or site builder | Native graph authority | source · active |
| [Frappe Studio](projects/frappe-studio/) | Frappe | Native artifact authoring | Established visual platform with AI | Native graph authority | source · active-transition |
| [Grills](projects/grills/) | Grills | Delegated creation | Standalone design-agent workspace | Hosted generated-artifact workspace | source · active-transition |
| [AI UI Builder by Sharad Patil](projects/ai-ui-builder-sharadpatil/) | Sharad Patil | Visual authoring of executable source | Standalone design-agent workspace | Source-authority live projection | source · active-transition |
| [Dyad](projects/dyad/) | Dyad | End-to-end product delivery | AI app or site builder | Source-authority live projection | source · active |
| [Mobirise AI](projects/mobirise-ai/) | Mobirise | End-to-end product delivery | Established visual platform with AI | Native graph authority | architecture · active |
| [AI-Powered Website Builder by Ratna Babu](projects/ai-website-builder-ratna/) | Bantupalli Ratna Babu | Delegated creation | AI app or site builder | Hosted generated-artifact workspace | source · active |
| [PlayCode AI](projects/playcode/) | Playcode | End-to-end product delivery | AI app or site builder | Managed application-project graph | architecture · active |
| [AI Website Builder by V](projects/ai-website-builder-builtbyv/) | V | Visual authoring of executable source | General agent with visual tools | Filesystem agent with visual evidence | source · active |
| [Codey](projects/codey/) | Hamzah A.A. Amir | Delegated creation | AI app or site builder | Hosted generated-artifact workspace | source · active |
| [DeepSite](projects/deepsite/) | Enzo | Visual authoring of executable source | AI app or site builder | Source-authority live projection | source · active |
| [Cofounder](projects/cofounder/) | Open Interface | End-to-end product delivery | AI app or site builder | Managed application-project graph | source · active-transition |
| [Prompt2UI by Sully Omar](projects/prompt2ui-sully/) | Sully Omar | Visual authoring of executable source | Standalone design-agent workspace | Source-authority live projection | source · active |
| [Prompt to UI by Sanyam Bassi](projects/prompt-to-ui-sanyam/) | Sanyam Bassi | Native artifact authoring | Standalone design-agent workspace | Native graph authority | source · active |
| [Prompt-UI by Ayesha and Mahek](projects/prompt-ui-ayesha-mahek/) | Ayesha and Mahek | Delegated creation | Standalone design-agent workspace | Hosted generated-artifact workspace | source · active |
| [PRISM](projects/prism-prompt-to-ui/) | PRISM by trillion6 | Native artifact authoring | Standalone design-agent workspace | Native graph authority | source · active-transition |
| [Convertix AI](projects/convertix-ai/) | Radwa Talaat | Native artifact authoring | AI app or site builder | Native graph authority | source · active |
| [LandingForge](projects/landingforge/) | LandingForge | Visual authoring of executable source | AI app or site builder | Source-authority live projection | source · active |
| [AlwaysBlue](projects/alwaysblue/) | Rashed Hasan | Delegated creation | AI app or site builder | Hosted generated-artifact workspace | source · active-transition |
| [AI Landing Page Studio](projects/ai-landing-page-studio/) | Aditya Dwi Putra | Native artifact authoring | AI app or site builder | Managed application-project graph | source · active-transition |
| [AI Landing Page Builder by Ali Tamer](projects/ai-landing-page-builder-ali-tamer/) | Ali Tamer | Visual authoring of executable source | AI app or site builder | Source-authority live projection | source · active-transition |
| [PagePilot](projects/pagepilot/) | Galih Pratama | Delegated creation | AI app or site builder | Native graph authority | source · active |
| [OpenKombai](projects/openkombai/) | Hrishikesh Bania | Design-code translation and grounding | Standalone design-agent workspace | Design-code materialization | source · active |
| [GetUI.ai](projects/getui-ai/) | Jayesh | Visual authoring of executable source | Standalone design-agent workspace | Source-authority live projection | source · active |
| [AI Module Generator by Sawan Kumar](projects/ai-module-generator-sawan/) | Sawan Kumar | End-to-end product delivery | Standalone design-agent workspace | Filesystem agent with visual evidence | source · active-transition |
| [AI Frontend Generator by Arijeet Priyadarshi](projects/ai-frontend-generator-arijeet/) | Arijeet Priyadarshi | Design-code translation and grounding | Standalone design-agent workspace | Native graph authority | source · active-transition |
| [AI Frontend Generator by Marcelo Lima](projects/ai-frontend-generator-marcelorl/) | Marcelo Rizzardo Lima | Delegated creation | Standalone design-agent workspace | Filesystem agent with visual evidence | source · historical |
| [AI Frontend Generator by Tamil Selvan](projects/ai-frontend-generator-metamil/) | Tamil Selvan | Visual authoring of executable source | Standalone design-agent workspace | Source-authority live projection | source · historical |
| [AI Component Builder by Aditya Sharma](projects/ai-component-builder-aditya/) | Aditya Sharma | Visual authoring of executable source | Code-native visual editor or IDE | Source-authority live projection | source · active |
| [AI Frontend Generator by Amit Sharma](projects/ai-frontend-generator-amit/) | Amit Sharma | Visual authoring of executable source | Standalone design-agent workspace | Source-authority live projection | source · active |
| [GNR8](projects/gnr8/) | Srayash Singh | End-to-end product delivery | AI app or site builder | Hosted generated-artifact workspace | source · active |
| [WebCraft](projects/webcraft/) | WebCraft team | Visual authoring of executable source | AI app or site builder | Hosted generated-artifact workspace | source · active-transition |
| [HexCode](projects/hexcode/) | HexCode team | End-to-end product delivery | AI app or site builder | Managed application-project graph | source · active |
| [Curate](projects/curate/) | Curate team | Visual authoring of executable source | AI app or site builder | Filesystem agent with visual evidence | source · active-transition |
| [TextToWebsite](projects/text-to-website-rahul/) | Rahul Amlekar and contributors | Delegated creation | Standalone design-agent workspace | Hosted generated-artifact workspace | source · historical |
| [GenWeb by Dhruv Pansuriya](projects/genweb-dhruv/) | Dhruv Pansuriya and contributors | Visual authoring of executable source | AI app or site builder | Managed application-project graph | source · active-transition |
| [WebGalaxy](projects/webgalaxy/) | WebGalaxy team | Delegated creation | AI app or site builder | Hosted generated-artifact workspace | source · active-transition |
| [WebAgent](projects/webagent-ragul/) | Ragul | Visual authoring of executable source | AI app or site builder | Filesystem agent with visual evidence | source · active |
| [Frame Bucket](projects/frame-bucket/) | Frame Bucket maintainer | Native artifact authoring | AI app or site builder | Native graph authority | source · active |
| [Redesignr AI](projects/redesignr-ai/) | Web5Lab and Redesignr AI team | Delegated creation | AI app or site builder | Hosted generated-artifact workspace | architecture · active |
| [Lanhu to Code](projects/lanhu-to-code/) | ursazoo and contributors | Design-code translation and grounding | Design-code bridge | Design-code materialization | source · active |
| [Storybook Assistant](projects/storybook-assistant/) | flight505 and contributors | Visual authoring of executable source | General agent with visual tools | Filesystem agent with visual evidence | source · active-transition |
| [AI Webpage Generator by Achuajays](projects/ai-webpage-generator-achua/) | Achuajays and contributors | Visual authoring of executable source | AI app or site builder | Source-authority live projection | source · active |
| [GPT-4 Landing Page Creator](projects/gpt4-landing-page-creator-renzo/) | Renzo Nogueira | Visual authoring of executable source | AI app or site builder | Source-authority live projection | source · historical |
| [SiteGen AI](projects/sitegen-ai-mohamad/) | Mohamad Amjad and contributors | Visual authoring of executable source | AI app or site builder | Source-authority live projection | source · active |
| [AI Webpage Generator by Pablo de Groot](projects/ai-webpage-generator-pa741/) | Pablo de Groot and contributors | Native artifact authoring | AI app or site builder | Managed application-project graph | source · active |
| [Web Page Generator by Natalie Basille](projects/web-page-generator-natalie/) | Natalie Basille | Delegated creation | Standalone design-agent workspace | Hosted generated-artifact workspace | source · historical |
| [AI Webpage Generator by Pavan Kumar](projects/ai-webpage-generator-pavan/) | Pavan Kumar and contributors | Delegated creation | AI app or site builder | Design-code materialization | source · active-transition |
| [Aether Architect](projects/aether-architect/) | W3JDev | Native artifact authoring | Standalone design-agent workspace | Native graph authority | source · active |
| [AI-Powered UI Components Generator](projects/ai-ui-components-generator-thegreatbonnie/) | The Great Bonnie | Visual authoring of executable source | Standalone design-agent workspace | Source-authority live projection | source · historical |
| [HasCode UI](projects/hascode-ui/) | Lutfi Haslab and contributors | Visual authoring of executable source | Standalone design-agent workspace | Source-authority live projection | source · active-transition |
| [AI UI Generator by Mohammed Kahab](projects/ai-ui-generator-kahab/) | Mohammed Kahab K | Native artifact authoring | Standalone design-agent workspace | Native graph authority | source · active-transition |
| [AI UI Table Generator](projects/ai-ui-table-generator-dladislav/) | Vladyslav Dobrodii | Native artifact authoring | Standalone design-agent workspace | Native graph authority | source · active |
| [Prompt-to-Website Generator by Varun Padala](projects/prompt-to-website-padala/) | Varun Padala | Visual authoring of executable source | AI app or site builder | Source-authority live projection | source · active |
| [CodeCooks](projects/codecooks/) | CodeCooks team | Delegated creation | AI app or site builder | Hosted generated-artifact workspace | source · historical |
| [AI Website Builder by Shekh Basir](projects/ai-website-builder-shekhbasir/) | Shekh Basir | End-to-end product delivery | AI app or site builder | Managed application-project graph | source · active |
| [Panth PageBuilder AI](projects/panth-pagebuilder-ai/) | Panth Infotech | System governance | Established visual platform with AI | Native graph authority | source · active |
| [Synapse App Builder](projects/synapse-app-builder/) | Andre Corugda and contributors | Native artifact authoring | AI app or site builder | Managed application-project graph | source · active |
| [AI Voice Page Builder](projects/ai-voice-page-builder-graeber/) | AI Voice Page Builder maintainer | Delegated creation | Standalone design-agent workspace | Hosted generated-artifact workspace | source · historical |
| [AI CodeTutor Video Generator](projects/ai-code-tutor-video/) | Pushkar Chandra | Delegated creation | Standalone design-agent workspace | Design-code materialization | source · active |
| [Generative UI App by Abhay](projects/generative-ui-app-abhay/) | Abhay and Generative UI App contributors | Native artifact authoring | Standalone design-agent workspace | Native graph authority | source · active |
| [AI2UI Component Generator](projects/ai2ui-component-generator/) | Yuval and AI2UI contributors | Visual authoring of executable source | Standalone design-agent workspace | Source-authority live projection | source · historical |
| [AI Component Generator Sandbox](projects/ai-component-generator-sandbox/) | Daniela Vareiro | Visual authoring of executable source | Standalone design-agent workspace | Source-authority live projection | source · active |
| [CreAI](projects/creai/) | Cristian Ivan Araoz | Visual authoring of executable source | Standalone design-agent workspace | Source-authority live projection | source · active-transition |
| [AI React Component Generator by Amit Nandan](projects/ai-react-component-generator-amit/) | Amit Nandan | Visual authoring of executable source | Standalone design-agent workspace | Source-authority live projection | source · active-transition |
| [Shadway](projects/shadway/) | Shadway maintainers | Visual authoring of executable source | Standalone design-agent workspace | Source-authority live projection | source · active |
| [SOLIDWORKS AI Cover Generator](projects/solidworks-ai-cover-generator/) | Regoletto | Delegated creation | Standalone design-agent workspace | Hosted generated-artifact workspace | source · active |
| [Verilog IDE](projects/verilog-ide/) | Sanjay Surampudi | Constraint-driven engineering | AI engineering-design workspace | Source-authority live projection | source · active |
| [BlueStone AI Jewelry Prototype](projects/bluestone-ai-jewelry-prototype/) | Shivam Mishra | Delegated creation | Standalone design-agent workspace | Hosted generated-artifact workspace | source · active-transition |
| [Micracode](projects/micracode/) | Micracode maintainers | Visual authoring of executable source | Code-native visual editor or IDE | Source-authority live projection | source · active |
| [AI Web App Builder by Abdul Musawar](projects/ai-web-app-builder-mazzyy/) | Abdul Musawar | Visual authoring of executable source | AI app or site builder | Source-authority live projection | source · active-transition |
| [NxtBuild](projects/nxtbuild/) | Abhishek121004 | Visual authoring of executable source | AI app or site builder | Managed application-project graph | source · active |
| [Hanzo App](projects/hanzo-app/) | Hanzo | Visual authoring of executable source | AI app or site builder | Managed application-project graph | source · active |
| [ModernUI Maker](projects/modernui-maker/) | Om Singh | Visual authoring of executable source | Standalone design-agent workspace | Source-authority live projection | source · active |
| [project_threejs_ai](projects/project-threejs-ai/) | JavaScript Mastery / Adrian Hajdin | Native artifact authoring | Standalone design-agent workspace | Native graph authority | source · historical |
| [OSW Studio](projects/osw-studio/) | OSW Studio maintainers | Visual authoring of executable source | AI app or site builder | Filesystem agent with visual evidence | source · active |
| [Website That Builds Itself](projects/website-that-builds-itself/) | echoHive | Native artifact authoring | Agent-controllable canvas or domain editor | Native graph authority | source · historical |
| [AI Component Builder by Bamdad Erfanian](projects/ai-component-builder-bamerf/) | Bamdad Erfanian | Visual authoring of executable source | Standalone design-agent workspace | Source-authority live projection | source · historical |
| [AI Component Builder by bluntbrain](projects/ai-component-builder-bluntbrain/) | bluntbrain | Visual authoring of executable source | Standalone design-agent workspace | Source-authority live projection | source · active |
| [AI Component Builder by StackedByAdit](projects/ai-component-builder-stacked/) | StackedByAdit | Visual authoring of executable source | Standalone design-agent workspace | Source-authority live projection | source · active |
| [AI Component Builder by Gokul Krishna](projects/ai-component-builder-gokul/) | Gokul Krishna | Visual authoring of executable source | Standalone design-agent workspace | Source-authority live projection | source · active |
| [AI Component Builder by Aman Raj](projects/ai-component-builder-iaman/) | Aman Raj | Visual authoring of executable source | Standalone design-agent workspace | Source-authority live projection | source · active |
| [AI Component Builder by Debanik](projects/ai-component-builder-debanik/) | Debanik | Visual authoring of executable source | Standalone design-agent workspace | Source-authority live projection | source · active |
| [Qwen3 Coder WebDev by Ethan Ng](projects/qwen3-coder-webdev-ethan/) | Ethan Ng | Visual authoring of executable source | AI app or site builder | Source-authority live projection | source · active-transition |
| [bigbangdev](projects/bigbangdev/) | Simanta Sarma | End-to-end product delivery | AI app or site builder | Managed application-project graph | source · active |
| [NemoClaw Game Factory](projects/nemoclaw-game-factory/) | Dave Rollins | End-to-end product delivery | AI app or site builder | Managed application-project graph | source · active |
| [AI-Powered UI Builder by kiryuchi10](projects/ai-ui-builder-kiryuchi/) | Dong Hyeun Lee | Visual authoring of executable source | Code-native visual editor or IDE | Managed application-project graph | source · active-transition |
| [Deterministic AI UI Builder by ujjwal1541](projects/deterministic-ai-ui-builder-ujjwal/) | ujjwal1541 | Native artifact authoring | Standalone design-agent workspace | Native graph authority | source · active |
| [UI Architect by Anees ur Rehman](projects/ui-architect-aranees/) | Anees ur Rehman | Visual authoring of executable source | Standalone design-agent workspace | Source-authority live projection | source · active |
| [Deterministic AI UI Builder by codeacks](projects/deterministic-ai-ui-builder-codeacks/) | codeacks | Native artifact authoring | Standalone design-agent workspace | Native graph authority | source · active |
| [AI UI Builder by Merchantry](projects/ai-ui-builder-merchantry/) | Merchantry | Native artifact authoring | Standalone design-agent workspace | Native graph authority | source · active |
| [AI Website Generator by Louvivien](projects/ai-website-generator-louvivien/) | Louvivien | End-to-end product delivery | AI app or site builder | Source-authority live projection | source · historical |
| [Ideaship](projects/ideaship/) | Nathan Lu | End-to-end product delivery | AI app or site builder | Managed application-project graph | source · active |
| [AI Website Generator by Shaxxshankari](projects/ai-website-generator-shaxx/) | Gowrishankari S | End-to-end product delivery | AI app or site builder | Source-authority live projection | source · active |
| [AI Component Builder by Devisha Arora](projects/ai-component-builder-devisha/) | Devisha Arora | Visual authoring of executable source | Standalone design-agent workspace | Source-authority live projection | source · active |
| [React AI Component Builder by Artem Synytsin](projects/react-ai-component-builder-synytsin/) | Artem Synytsin | Visual authoring of executable source | Standalone design-agent workspace | Source-authority live projection | source · active |
| [Yellow Machine](projects/yellow-machine/) | Devesh Singh | Visual authoring of executable source | Standalone design-agent workspace | Source-authority live projection | source · active |
| [a0 AI Component Studio](projects/a0-component-studio/) | Lochlann O'Higgins | Visual authoring of executable source | Standalone design-agent workspace | Source-authority live projection | source · active-transition |
| [PromptOnent](projects/promptonent/) | Abrar Ahmed | Visual authoring of executable source | Standalone design-agent workspace | Source-authority live projection | source · active |
| [PromptUI by devSakshi022R](projects/promptui-devsakshi/) | devSakshi022R | Visual authoring of executable source | Standalone design-agent workspace | Source-authority live projection | source · active |
| [AI Website Generator by shrik4](projects/ai-website-generator-shrik4/) | shrik4 | End-to-end product delivery | AI app or site builder | Managed application-project graph | source · active-transition |
| [ogaTa.ai](projects/ogata-ai/) | ogaTa.ai maintainers | End-to-end product delivery | AI app or site builder | Managed application-project graph | source · active |
| [AI Website Generator by aifeifei798](projects/ai-website-generator-aifeifei/) | aifeifei798 | End-to-end product delivery | AI app or site builder | Design-code materialization | source · active-transition |
| [AI Website Generator by Shrutika Kapade](projects/ai-website-generator-shrutika/) | Shrutika Kapade | Visual authoring of executable source | AI app or site builder | Source-authority live projection | source · active |
| [GenSite AI](projects/gensite-ai-devendra/) | Vennapusa Devendra Reddy | Visual authoring of executable source | AI app or site builder | Source-authority live projection | source · active |
| [AI Website Generator by Pappu Kumar](projects/ai-website-generator-pappu/) | Pappu Kumar | End-to-end product delivery | AI app or site builder | Managed application-project graph | source · active |
| [WebLy](projects/webly/) | Ayushman Gupta | Visual authoring of executable source | AI app or site builder | Managed application-project graph | source · active |
| [GenU Advanced](projects/genu-advanced/) | cprince9 | Visual authoring of executable source | Standalone design-agent workspace | Source-authority live projection | source · active |
| [AI UI Builder by Rigoberto Quezada](projects/ai-ui-builder-isvaku/) | Rigoberto Quezada | Visual authoring of executable source | AI app or site builder | Managed application-project graph | source · active |
| [WebApp AI UI Builder](projects/webapp-ai-ui-builder/) | K3v123 | System governance | AI app or site builder | Managed application-project graph | source · active-transition |
| [AIWebGenerator by Kuroda Kayn](projects/aiwebgenerator-kuroda/) | Kuroda Kayn | Visual authoring of executable source | AI app or site builder | Managed application-project graph | source · active-transition |
| [Pitch Craft](projects/pitch-craft/) | Noman Rahim | Visual authoring of executable source | AI app or site builder | Managed application-project graph | source · active |
| [WebCraft AI by Krish Anand](projects/webcraft-krish/) | Krish Anand | Delegated creation | AI app or site builder | Filesystem agent with visual evidence | source · active-transition |
| [AI Component Builder by Sanskriti Singh](projects/ai-component-builder-sanskriti/) | Sanskriti Singh | Visual authoring of executable source | Standalone design-agent workspace | Source-authority live projection | source · active |
| [AI Website Generator by shubharthaksangharsha](projects/ai-website-generator-shubh/) | shubharthaksangharsha | Visual authoring of executable source | AI app or site builder | Source-authority live projection | source · active-transition |
| [AI-Powered UI Component Generator by Ryan](projects/ai-component-builder-sfyr/) | Ryan | Visual authoring of executable source | Standalone design-agent workspace | Source-authority live projection | source · active-transition |
| [AI UI Builder by Akshay Chaulya](projects/ai-ui-builder-akshay/) | Akshay Chaulya | System governance | Standalone design-agent workspace | Native graph authority | source · active |
| [AI UI Builder by Julian Shen](projects/ui-builder-julianshen/) | Julian Shen | Visual authoring of executable source | AI app or site builder | Managed application-project graph | source · active-transition |
| [PromptUI by Tushar Mokal](projects/promptui-tushar/) | Tushar Mokal | Visual authoring of executable source | Standalone design-agent workspace | Source-authority live projection | source · active |
| [webAi.new](projects/webai-new/) | Zeeshan1903 | Delegated creation | AI app or site builder | Filesystem agent with visual evidence | source · active-transition |
| [AI Website Generator by Jordan D'Souza](projects/ai-website-generator-jordan/) | Jordan D'Souza | System governance | AI app or site builder | Native graph authority | source · active |
| [AI Website Generator by Nithin1616](projects/ai-website-generator-nithin/) | Nithin1616 | End-to-end product delivery | AI app or site builder | Design-code materialization | source · active |
| [AI Orchestration UI Generator by Shishir Gupta](projects/ai-orchestration-honey610/) | Shishir Gupta | System governance | Standalone design-agent workspace | Native graph authority | source · active |
| [AI Website Generator by Dhanu7789](projects/ai-website-generator-dhanu7789/) | Dhanu7789 and contributors | End-to-end product delivery | AI app or site builder | Design-code materialization | source · active |
| [AI Component Builder by Harsh Bhanushali](projects/ai-component-builder-harshbhx/) | Harsh Bhanushali | Visual authoring of executable source | Standalone design-agent workspace | Source-authority live projection | source · active |
| [AI Website Generator by Tulsi Pandey](projects/ai-website-generator-tulsi/) | Tulsi Pandey | System governance | AI app or site builder | Native graph authority | source · active |
| [VERXA AI](projects/verxa-ai/) | Cephas Osei-Bonsu / CephasTechOrg | End-to-end product delivery | AI app or site builder | Design-code materialization | source · active-transition |
| [VISION.AI by Vishnu Prahalathan](projects/vision-ai-vishnu/) | Vishnu Prahalathan N | Visual authoring of executable source | AI app or site builder | Design-code materialization | source · active |
| [SiteForge AI by P Sreyanshu Anupam](projects/siteforge-ai-psa/) | P Sreyanshu Anupam | Visual authoring of executable source | AI app or site builder | Source-authority live projection | source · active |
| [AI Website Generator by GururajCharan](projects/ai-website-generator-gururaj/) | GururajCharan | End-to-end product delivery | AI app or site builder | Design-code materialization | source · active |
| [UIGen by Arshan Nawaz](projects/uigen-arshan/) | Arshan Nawaz | Visual authoring of executable source | Standalone design-agent workspace | Source-authority live projection | source · active |
| [ClientSight / GazeBuilder](projects/clientsight-gazebuilder/) | ClientSight / GazeBuilder contributors | Runtime correction | AI app or site builder | Source-authority live projection | source · active |
| [AI Website Generator by Krishna Priya](projects/ai-website-generator-kpriya/) | Krishna Priya | Visual authoring of executable source | AI app or site builder | Source-authority live projection | source · active |
| [SiteForge AI by Maf-Kelvin](projects/siteforge-ai-maf/) | Maf-Kelvin | Visual authoring of executable source | AI app or site builder | Source-authority live projection | source · active |
| [AI UI Builder by Diego Perez](projects/ai-ui-builder-devdiego/) | Diego Perez | Visual authoring of executable source | Standalone design-agent workspace | Source-authority live projection | source · active |
| [AI Website Generator by Praneet Biswal](projects/ai-website-generator-praneet/) | Praneet Biswal | End-to-end product delivery | AI app or site builder | Design-code materialization | source · active |
| [AI Website Generator by Rishikesh Ugale](projects/ai-website-generator-rishi/) | Rishikesh Ugale | End-to-end product delivery | AI app or site builder | Managed application-project graph | source · active |
| [AI Website Generator by GokulBits18](projects/ai-website-generator-gokulbits/) | GokulBits18 | Visual authoring of executable source | Standalone design-agent workspace | Source-authority live projection | source · active |
| [AI Website Generator by Aditya Umale](projects/ai-website-generator-aditya-umale/) | Aditya Umale | Native artifact authoring | AI app or site builder | Native graph authority | source · active |
| [Ventura Startup Analyzer](projects/ventura-startup-analyzer/) | ANAND C | Variant exploration and decision | Standalone design-agent workspace | Managed application-project graph | source · active |
| [Image to React Component Converter by Imroz Wahid](projects/image-to-react-iwahid/) | Imroz Wahid | Design-code translation and grounding | Design-code bridge | Design-code materialization | source · active-transition |
| [IA Landing Generator Pro](projects/ai-landing-generator-pro/) | Emiliano Conti | Delegated creation | Standalone design-agent workspace | Design-code materialization | source · active |
| [InstantSite AI](projects/instantsite-ai/) | Datta Sable | Visual authoring of executable source | AI app or site builder | Source-authority live projection | source · active-transition |
| [GenWebAI by Artibar](projects/genwebai-artibar/) | Artibar | End-to-end product delivery | AI app or site builder | Managed application-project graph | source · active |
| [AI-Powered Website Generator by Tony-VBB](projects/ai-website-generator-tony/) | Veeramalla Balaji Bhargav | End-to-end product delivery | AI app or site builder | Managed application-project graph | source · active |
| [PromptCraft AI](projects/promptcraft-ai/) | Krish Kapuriya | Delegated creation | AI app or site builder | Managed application-project graph | source · active |
| [Premium Website Generator by Edouard Kerwing](projects/premium-website-generator-edouard/) | Edouard Automations | Delegated creation | Design surface inside an agent platform | Filesystem agent with visual evidence | source · active |
| [WebCraft AI by Siddharth Kumar Rai](projects/webcraft-ai-siddharth/) | Siddharth Kumar Rai | End-to-end product delivery | AI app or site builder | Managed application-project graph | source · active |
| [AI UI Generator by Deepanshu Sharma](projects/ai-ui-generator-deepanshu/) | Deepanshu Sharma | Visual authoring of executable source | Standalone design-agent workspace | Source-authority live projection | source · active |
| [AI UI Generator by Mohannad Abdelrazek](projects/ai-ui-generator-mondo/) | Mohannad Ahmed Abdelrazek Abdelhakim | Visual authoring of executable source | Standalone design-agent workspace | Source-authority live projection | source · active |
| [AI UI Generator by Dhruv Jain](projects/ai-ui-generator-dhruv/) | Dhruv Jain | Visual authoring of executable source | Standalone design-agent workspace | Source-authority live projection | source · active |
| [UIGen Claude Code in Action sample](projects/anthropic-course-uigen/) | Anthropic | Native artifact authoring | Code-native visual editor or IDE | Source-authority live projection | source · active |
| [AI UI Generator by Mohit Aggarwal](projects/ai-ui-generator-mohit/) | Mohit Aggarwal | Visual authoring of executable source | Standalone design-agent workspace | Managed application-project graph | source · active |
| [AI UI Generator by yashsaini0759](projects/ai-ui-generator-yash/) | yashsaini0759 | Visual authoring of executable source | Standalone design-agent workspace | Source-authority live projection | source · active |
| [Artifex UI Generator](projects/artifex-ui-generator/) | Fujitsu11 | Visual authoring of executable source | Standalone design-agent workspace | Source-authority live projection | source · active |
| [Ryzen AI by Anushka Chaudhary](projects/ryzen-ai-anushka/) | Anushka Chaudhary | Visual authoring of executable source | Standalone design-agent workspace | Source-authority live projection | source · active |
| [VibeUI by Farazkhan542](projects/vibeui-faraz/) | Farazkhan542 | Native artifact authoring | AI app or site builder | Source-authority live projection | source · active |
| [Ryze UI Agent by Mohd Mazhar Khan](projects/ryze-ui-agent-mazhar/) | Mohd Mazhar Khan | Visual authoring of executable source | Standalone design-agent workspace | Source-authority live projection | source · active |
| [RyzeAI by Lakshmiprasanth](projects/ryzeai-lakshmi/) | Lakshmiprasanth | Visual authoring of executable source | Standalone design-agent workspace | Source-authority live projection | source · active |
| [Ryze UI Generator by Rohit Kumar](projects/ryze-ui-generator-rohit/) | Rohit Kumar | Variant exploration and decision | Standalone design-agent workspace | Candidate isolation and promotion | source · active |
| [Prompt2Site by Jay Sankopal](projects/prompt2site-jay/) | Jay Sankopal | End-to-end product delivery | AI app or site builder | Managed application-project graph | source · active |
| [AI Generator by Abhi Gandhi](projects/ai-generator-abhi/) | Abhi Gandhi | Native artifact authoring | AI app or site builder | Managed application-project graph | source · active |
| [Webora by JOSIAHTHEPROGRAMMER](projects/webora-josiah/) | JOSIAHTHEPROGRAMMER | End-to-end product delivery | AI app or site builder | Managed application-project graph | source · active |
| [AI Website Builder by Vaibhav Hajare](projects/ai-website-builder-lab1207/) | Vaibhav Hajare | Native artifact authoring | AI app or site builder | Source-authority live projection | source · active |
| [NexaBuild by Aqib Ahmed](projects/nexabuild-aqib/) | Aqib Ahmed | End-to-end product delivery | Standalone design-agent workspace | Design-code materialization | source · active |
| [AI Website Builder by Bonifacio Calindoro](projects/ai-website-builder-bonifacio/) | Bonifacio Calindoro | End-to-end product delivery | AI app or site builder | Managed application-project graph | source · active |
| [AI Website Builder by Zyra](projects/ai-website-builder-zaran/) | Zyra AI Assistant | End-to-end product delivery | AI app or site builder | Managed application-project graph | source · active |
| [AI Website Builder by Mohammad Armaan](projects/ai-website-builder-mohammad/) | Mohammad Armaan | Visual authoring of executable source | AI app or site builder | Managed application-project graph | source · active |
| [AI Website Builder by Firefetch](projects/ai-website-builder-firefetch/) | Firefetch | Native artifact authoring | Design surface inside an agent platform | Filesystem agent with visual evidence | source · active |
| [AI Website Builder by Vijay Kusekar](projects/ai-website-builder-vijay/) | Vijay Digambar Kusekar | Native artifact authoring | AI app or site builder | Managed application-project graph | source · active |
| [AI Website Builder by Krishna Paralkar](projects/ai-website-builder-krishna/) | Krishna Paralkar | Visual authoring of executable source | AI app or site builder | Managed application-project graph | source · active |
| [Agentic AI Website Builder by Akhil Maratha](projects/agentic-ai-website-builder-akhil/) | Akhil Maratha | Native artifact authoring | Design surface inside an agent platform | Managed application-project graph | source · active |
| [AI Website Builder by Safwan Hanif](projects/ai-website-builder-safwan/) | Safwan Hanif | Native artifact authoring | AI app or site builder | Managed application-project graph | source · active |
| [Webstew AI](projects/webstew-ai/) | SGK112 | Native artifact authoring | Design surface inside an agent platform | Filesystem agent with visual evidence | source · active |
| [AI Component Generator by Shakti Prasad Ram](projects/ai-component-generator-shakti/) | Shakti Prasad Ram | Visual authoring of executable source | Standalone design-agent workspace | Source-authority live projection | source · active |
| [React Component Generator by Mohit Kumar](projects/react-component-generator-mohit/) | Mohit Kumar | Visual authoring of executable source | Standalone design-agent workspace | Source-authority live projection | source · active |
| [Comp-gen by Aditya Singh Gautam](projects/comp-gen-aditya/) | Aditya Singh Gautam | Visual authoring of executable source | Code-native visual editor or IDE | Source-authority live projection | source · active |
| [DevoraUI](projects/devoraui/) | Prit Zalavadiya | System governance | Standalone design-agent workspace | Design-code materialization | source · active |
| [AI Website Builder by Subrata Ghosh](projects/ai-website-builder-subrata/) | Subrata Ghosh | End-to-end product delivery | AI app or site builder | Filesystem agent with visual evidence | source · active |
| [AgentSite](projects/agentsite/) | Juan Denis | End-to-end product delivery | AI app or site builder | Filesystem agent with visual evidence | source · active |
| [VoxelSite](projects/voxelsite/) | NowSquare | Native artifact authoring | AI app or site builder | Native graph authority | source · active |
| [AI Website Builder by Dennis Faucher](projects/ai-website-builder-dennis/) | Dennis Faucher | End-to-end product delivery | AI app or site builder | Filesystem agent with visual evidence | source · active |
| [Buildify by Pragya Manna](projects/buildify-pragya/) | Pragya Manna | End-to-end product delivery | AI app or site builder | Filesystem agent with visual evidence | source · active |
| [AI Website Builder by Vardhan V](projects/ai-website-builder-vardhan/) | Vardhan V | Visual authoring of executable source | AI app or site builder | Source-authority live projection | source · active |
| [AI Website Builder by Lucas H507](projects/ai-website-builder-lucas/) | Lucas H507 | System governance | AI app or site builder | Design-code materialization | source · active |
| [AI Website Builder by markec12345678](projects/ai-website-builder-markec/) | markec12345678 | Visual authoring of executable source | Standalone design-agent workspace | Source-authority live projection | source · active |
| [AI Website Builder by Chitransh Chocksey](projects/ai-website-builder-chitransh/) | Chitransh Chocksey | Runtime correction | Standalone design-agent workspace | Source-authority live projection | source · active |
| [AI App Builder by Piyush Agarwal](projects/ai-app-builder-piyush/) | Piyush Agarwal | End-to-end product delivery | AI app or site builder | Managed application-project graph | source · active |
| [Forge by Dhruv Bansal](projects/forge-dhruv/) | Dhruv Bansal | End-to-end product delivery | AI app or site builder | Managed application-project graph | source · active |
| [AI App Builder SaaS by Yayasan At-Tauhid](projects/ai-app-builder-saas-tauhid/) | Yayasan At-Tauhid | Native artifact authoring | AI app or site builder | Hosted generated-artifact workspace | source · active |
| [RAJ AI App Builder](projects/raj-ai-app-builder/) | RAJ AI | Visual authoring of executable source | Standalone design-agent workspace | Source-authority live projection | source · active |
| [LUMA AI Studio](projects/luma-ai-studio/) | Krishal Karna | Native artifact authoring | AI app or site builder | Managed application-project graph | source · active |
| [VibeSDK MVP](projects/vibesdk-mvp/) | stefanautomateed | End-to-end product delivery | AI app or site builder | Hosted generated-artifact workspace | source · active |
| [BuildRx](projects/buildrx/) | mabrig1 | End-to-end product delivery | AI app or site builder | Managed application-project graph | source · active |
| [AI UI Generator by Harshi](projects/ai-ui-generator-harshi/) | Harshi | Visual authoring of executable source | Code-native visual editor or IDE | Source-authority live projection | source · active |
| [Synapese 25](projects/synapese-25/) | Biswajit Sarkar | Design-code translation and grounding | Standalone design-agent workspace | Native graph authority | source · active |
| [Forma Fluens](projects/forma-fluens/) | Atharva Kulkarni | Visual authoring of executable source | Code-native visual editor or IDE | Source-authority live projection | source · active |
| [GenUI by Dimple](projects/genui-dimple/) | Dimple Choudhary | Visual authoring of executable source | Code-native visual editor or IDE | Source-authority live projection | source · active |
| [GenUI by Aman](projects/genui-aman/) | Aman Roniwal | Visual authoring of executable source | Code-native visual editor or IDE | Source-authority live projection | source · active |
| [Takumi](projects/takumi/) | Sejal Godbole | Native artifact authoring | Code-native visual editor or IDE | Managed application-project graph | source · active |
| [DesignForge AI](projects/designforge-ai/) | CodesByShi | System governance | Code-native visual editor or IDE | Source-authority live projection | source · active |
| [UiChemy](projects/uichemy/) | POSIMYTH | Design-code translation and grounding | Design-code bridge | Design-code materialization | architecture · active |
| [Naano WP AI Website Builder](projects/naano-wp-ai-builder/) | Naano | End-to-end product delivery | Established visual platform with AI | Native graph authority | source · active |
| [Spaceforge](projects/spaceforge/) | Ron Reiter | End-to-end product delivery | AI app or site builder | Managed application-project graph | source · active |
| [XSharko AI](projects/xsharko-ai/) | Tamim Bro | End-to-end product delivery | AI app or site builder | Managed application-project graph | source · active |
| [Naklikam](projects/naklikam/) | Tedysek | End-to-end product delivery | AI app or site builder | Managed application-project graph | source · active |
| [Buildora AI Studio](projects/buildora-ai-studio/) | Adithya T B | End-to-end product delivery | AI app or site builder | Managed application-project graph | source · active |
| [ABSBuilder](projects/absbuilder/) | AFI | Visual authoring of executable source | Code-native visual editor or IDE | Source-authority live projection | source · active |
| [Vibra Code](projects/vibra-code/) | Sehind Hemzani | End-to-end product delivery | AI app or site builder | Managed application-project graph | source · active |
| [sandboxd](projects/sandboxd/) | Tasty Effect | End-to-end product delivery | AI app or site builder | Managed application-project graph | source · active |
| [Open Claude](projects/open-claude/) | Damien | Visual authoring of executable source | General agent with visual tools | Source-authority live projection | source · active |
| [Totalum AI App Builder Open](projects/totalum-ai-app-builder/) | Totalum | End-to-end product delivery | AI app or site builder | Hosted generated-artifact workspace | architecture · active |
| [NativeBot](projects/nativebot/) | Eason Wang | End-to-end product delivery | AI app or site builder | Filesystem agent with visual evidence | source · active |
| [Buildable](projects/buildable/) | Buildable contributors | System governance | Design surface inside an agent platform | Filesystem agent with visual evidence | source · active |
| [BuilderAI by Raj Patel](projects/builderai-raj/) | Raj Patel | End-to-end product delivery | AI app or site builder | Managed application-project graph | source · active |
| [AppFromAI](projects/appfromai/) | BiosBrick | End-to-end product delivery | AI app or site builder | Managed application-project graph | source · active |
| [Opsiforce](projects/opsiforce/) | Opsima | End-to-end product delivery | AI app or site builder | Managed application-project graph | source · active |
| [AI Builder by Nishant Chaudhary](projects/ai-builder-nishant/) | Nishant Chaudhary | Native artifact authoring | Agent-controllable canvas or domain editor | Native graph authority | source · active |
| [Stitch Clone by Irfan Khan](projects/stitch-clone-khandev/) | Irfan Khan | Visual authoring of executable source | Code-native visual editor or IDE | Source-authority live projection | source · active |
| [CODEUI](projects/codeui-paurakh/) | Paurakh Pyakurel | End-to-end product delivery | AI app or site builder | Managed application-project graph | source · active |
| [Ayushi.AI](projects/ayushi-ai/) | Harsh Rawat | End-to-end product delivery | AI app or site builder | Source-authority live projection | source · active |
| [WebBuild by Arpit Tiwari](projects/webbuild-arpitt/) | Arpit Tiwari | Native artifact authoring | Agent-controllable canvas or domain editor | Native graph authority | source · active |
| [Forgix](projects/forgix/) | Tanaya Sherekar | End-to-end product delivery | AI app or site builder | Managed application-project graph | source · active |
| [GenSite](projects/gensite/) | Prathamesh Prasad | End-to-end product delivery | AI app or site builder | Managed application-project graph | source · active |
| [Genie AI Website Builder](projects/genie-ai-website-builder/) | Abhishek Agnihotri | End-to-end product delivery | AI app or site builder | Managed application-project graph | source · active |
| [FanBox](projects/fanbox/) | FanBox contributors | Visual coordination and evidence | General agent with visual tools | Filesystem agent with visual evidence | source · active |
| [Oboto](projects/oboto/) | Sebastian Schepis | Native artifact authoring | Design surface inside an agent platform | Filesystem agent with visual evidence | source · active |
| [Generative UI Builder](projects/generative-ui-builder-v3rmxni7/) | Nischay Vermani | Design-code translation and grounding | Code-native visual editor or IDE | Native graph authority | source · active |
| [GreatStack AI Website Builder course project](projects/greatstack-ai-website-builder/) | GreatStack | End-to-end product delivery | AI app or site builder | Managed application-project graph | source · active |
| [PenBoard](projects/penboard/) | ZSeven-W contributors | Native artifact authoring | Agent-controllable canvas or domain editor | Native graph authority | source · active |
| [AppiaV2](projects/appiav2/) | Morningstar | End-to-end product delivery | AI app or site builder | Managed application-project graph | source · active |
| [AI-Powered Website Generator by Susmita Dey](projects/websitebuilder-susmita/) | Susmita Dey | Visual authoring of executable source | AI app or site builder | Source-authority live projection | source · active |
| [VibeCoding a Website](projects/vibecoding-a-website/) | Mark Hinkle | System governance | General agent with visual tools | Filesystem agent with visual evidence | source · active |
| [Reactor by admineral](projects/reactor-admineral/) | Elias (admineral) | Visual authoring of executable source | Code-native visual editor or IDE | Source-authority live projection | source · active |
| [Cobra AI 2.0](projects/cobra-ai-2/) | Harsh Pandey | Delegated creation | AI app or site builder | Managed application-project graph | source · active |
| [Agentic AI Website Builder by Tayyab Ellahi](projects/ai-website-generator-tayyabeh/) | Tayyab Ellahi | Visual authoring of executable source | AI app or site builder | Source-authority live projection | source · active |
| [Quibly](projects/quibly/) | Rohit173-sv | End-to-end product delivery | AI app or site builder | Managed application-project graph | source · active |
| [WebAI by Sparsh Joshi](projects/webai-sparsh/) | Sparsh Joshi | End-to-end product delivery | AI app or site builder | Source-authority live projection | source · active |
| [Website Builder Agent by peter890176](projects/website-builder-agent-peter/) | peter890176 | Variant exploration and decision | AI app or site builder | Candidate isolation and promotion | source · active |
| [Prompt-to-App AI Code Generator by Pradeep](projects/prompt-to-app-pradeep/) | pradeep9557 | Visual authoring of executable source | Code-native visual editor or IDE | Source-authority live projection | source · active |
| [PromptToApp by Sahil Tanwani](projects/prompttoapp-sahil/) | Sahil Tanwani | Visual authoring of executable source | AI app or site builder | Managed application-project graph | source · active |
| [Front-end Builder by Siddhartha Kumar](projects/front-end-builder-siddhartha/) | Siddhartha Kumar | Delegated creation | AI app or site builder | Hosted generated-artifact workspace | source · active |
| [AI-Powered Web App Builder by Shubha](projects/ai-web-app-builder-shubha/) | shubha229 | Visual authoring of executable source | AI app or site builder | Managed application-project graph | source · active |
| [AI App Builder by Abdul Baqui](projects/ai-app-builder-abdul/) | Abdul Baqui | Visual authoring of executable source | AI app or site builder | Managed application-project graph | source · active |
| [AI App Developer by Rajnish Kumar](projects/ai-app-developer-rajnish/) | Rajnish Kumar | End-to-end product delivery | AI app or site builder | Managed application-project graph | source · active |
| [ForgeAI by Mousewarriors](projects/forgeai-mousewarriors/) | Mousewarriors | Native artifact authoring | AI app or site builder | Managed application-project graph | source · active |
| [NOIR.dev](projects/noir-dev/) | Radz Foundation | Visual authoring of executable source | AI app or site builder | Managed application-project graph | source · active |
| [MerchMate AI](projects/merchmate/) | Simon (syu213) | Delegated creation | Standalone design-agent workspace | Hosted generated-artifact workspace | source · active |
| [Nova AI Builder in fast-code](projects/fast-code-nova/) | Shashi Shekhar Pandey | Native artifact authoring | Code-native visual editor or IDE | Native graph authority | source · active |
| [Argus by Sammy Tourani](projects/argus-sammy/) | Sammy Tourani | End-to-end product delivery | AI app or site builder | Managed application-project graph | source · active |
| [Polaris by Umang](projects/polaris-umang/) | Umang | Visual authoring of executable source | AI app or site builder | Managed application-project graph | source · active |
| [Buildev by Jun Rod](projects/buildev-isjunrod/) | Jun Rod | Native artifact authoring | Agent-controllable canvas or domain editor | Native graph authority | source · active |
| [OpenVibeCoding](projects/openvibecoding/) | Tencent | End-to-end product delivery | AI app or site builder | Managed application-project graph | source · active |
| [Deskhand](projects/deskhand/) | Yuhao (YUHAO-corn) | Visual coordination and evidence | General agent with visual tools | Filesystem agent with visual evidence | source · active |
| [MDMA](projects/mdma/) | Mobile Reality | Native artifact authoring | Visual-editor infrastructure | Native graph authority | source · active |
| [ApexNeural AI Website Builder for WordPress](projects/wordpress-ai-builder-apex/) | ApexNeural Akshaay | End-to-end product delivery | AI app or site builder | Source-authority live projection | source · active |
| [Cloudflare VibeSDK](projects/cloudflare-vibesdk/) | Cloudflare | End-to-end product delivery | AI app or site builder | Managed application-project graph | source · active |
| [Firecrawl Open Lovable](projects/firecrawl-open-lovable/) | Firecrawl | Design-code translation and grounding | AI app or site builder | Source-authority live projection | source · active |
| [AppMaker](projects/appmaker/) | Filippos Dimitrios Ktistakis | Delegated creation | AI app or site builder | Managed application-project graph | source · active |
| [AI App Builder by Shoaib Ahmed](projects/ai-app-builder-edge/) | Shoaib Ahmed | Runtime correction | AI app or site builder | Source-authority live projection | source · active |
| [AI App Builder by Eugene McMillian](projects/ai-app-builder-eugene/) | Eugene McMillian | Delegated creation | AI app or site builder | Managed application-project graph | source · active |
| [K2 Vibe](projects/k2-vibe/) | Hatif Osmani | Delegated creation | AI app or site builder | Managed application-project graph | source · active |
| [GENESIS HighLevel App Builder](projects/genesis-highlevel/) | Bhavesh Shrivastav | Design-code translation and grounding | AI app or site builder | Managed application-project graph | source · active |
| [Tenali v-1](projects/tenali-v1/) | Neelanjan V | Visual authoring of executable source | Code-native visual editor or IDE | Source-authority live projection | source · active |
| [MakeMyWebsite AI](projects/make-my-website-ai/) | Krishna Sharma | End-to-end product delivery | AI app or site builder | Managed application-project graph | source · active |
| [AI Website Generator by Varun Sharma](projects/ai-website-generator-varun/) | Varun Sharma | Visual authoring of executable source | Code-native visual editor or IDE | Source-authority live projection | source · active |
| [LLM Website Generator by Yuzai Akira](projects/llm-website-generator-yuzai/) | Akira Yuzai | Visual authoring of executable source | Code-native visual editor or IDE | Source-authority live projection | source · active |
| [AKN AI Website Generator](projects/akn-website-generator/) | AKN Code | Visual authoring of executable source | AI app or site builder | Source-authority live projection | source · active |
| [AI Website Generator by Maurya Patel](projects/ai-website-generator-maurya/) | Maurya Patel | Visual authoring of executable source | Code-native visual editor or IDE | Source-authority live projection | source · active |
| [BuilderWeb](projects/builderweb/) | Abdullah Shahid | System governance | Established visual platform with AI | Managed application-project graph | source · active |
| [Kadnya](projects/kadnya/) | Kadnya team | Design-code translation and grounding | Design-code bridge | External-agent canvas | source · active |
| [ETER](projects/eter/) | Ignacio Gentili | End-to-end product delivery | AI app or site builder | Managed application-project graph | architecture · active |
| [Buildflow3](projects/buildflow3/) | ChoiceToShorts | Native artifact authoring | Code-native visual editor or IDE | Native graph authority | source · active |
| [InsightIQ Marketing Studio](projects/insightiq/) | Nandu Priya | Delegated creation | Established visual platform with AI | Native graph authority | source · active |
| [gstack](projects/gstack/) | Garry Tan | System governance | General agent with visual tools | Filesystem agent with visual evidence | source · active |
| [AWS Deploy on AWS plugin](projects/aws-deploy-on-aws/) | AWS Labs | Native artifact authoring | General agent with visual tools | Filesystem agent with visual evidence | source · active |
| [Bedrock Image MCP Server](projects/bedrock-image-mcp-server/) | Karl Wallbom | Delegated creation | General agent with visual tools | Filesystem agent with visual evidence | source · active |
| [AI App Builder by Doratiotto67](projects/ai-app-builder-doratiotto/) | Doratiotto67 | Delegated creation | AI app or site builder | Managed application-project graph | source · active |
| [AlgoCraft](projects/algocraft/) | Nick the Legend | Visual authoring of executable source | Code-native visual editor or IDE | Source-authority live projection | source · active |
| [Promptly](projects/promptly/) | Simran903 | Delegated creation | AI app or site builder | Source-authority live projection | source · active |
| [Vibe Coding Suite](projects/vibe-code-suite/) | Dustin Loring | Visual authoring of executable source | Code-native visual editor or IDE | Source-authority live projection | source · active |
| [Vibe Coding Platform by lwshakib](projects/vibe-coding-platform-lwshakib/) | lwshakib | End-to-end product delivery | AI app or site builder | Managed application-project graph | source · active |
| [VibecodeAI](projects/vibecodeai/) | Arpon Dutta | System governance | AI app or site builder | Managed application-project graph | source · active |
| [Vibe Coder by bluebot-609](projects/vibe-coder-bluebot/) | bluebot-609 | Runtime correction | Code-native visual editor or IDE | Source-authority live projection | source · active |
| [UiMason](projects/uimason/) | UiMason53-rgb | Delegated creation | AI app or site builder | Source-authority live projection | source · active |
| [Despy](projects/despy/) | Sim Hyeok | System governance | Code-native visual editor or IDE | Source-authority live projection | source · active |
| [DevPilot](projects/devpilot/) | Prince Thakarar | Visual authoring of executable source | Code-native visual editor or IDE | Source-authority live projection | source · active |
| [XCA Agent](projects/xca-agent/) | quotexlasthope3-commits | Delegated creation | AI app or site builder | Managed application-project graph | source · active |
| [Shakespeare](projects/shakespeare/) | Soapbox | Visual authoring of executable source | AI app or site builder | Source-authority live projection | source · active |
| [Velocity AI Coder](projects/velocity-ai-coder/) | Dishan Naik | Delegated creation | AI app or site builder | Filesystem agent with visual evidence | source · active |
| [Context Space](projects/ctx-space/) | super-nived | Visual authoring of executable source | AI app or site builder | Source-authority live projection | source · active |
| [Shakedroid](projects/shakedroid/) | Derek Ross | End-to-end product delivery | AI app or site builder | Source-authority live projection | source · active |
| [PHANTOM by Mohammad Abdul Raffay](projects/phantom-raffay/) | Mohammad Abdul Raffay | End-to-end product delivery | AI app or site builder | Source-authority live projection | source · active |
| [CodeRocket](projects/coderocket/) | Alexandre Le Corre | Visual authoring of executable source | AI app or site builder | Managed application-project graph | source · active |
| [BOLT AI Website Builder by Jagdish Suthar](projects/bolt-website-maker-jagdish/) | Jagdish Suthar | Visual authoring of executable source | AI app or site builder | Source-authority live projection | source · active |
| [CoderX](projects/coderx/) | Veera Venkata Naga Satyanarayana Thota | Visual authoring of executable source | Code-native visual editor or IDE | Source-authority live projection | source · active |
| [VibeCoder by Dublyo](projects/vibecoder-dublyo/) | Dublyo | End-to-end product delivery | AI app or site builder | Source-authority live projection | source · active |

## Research and contribution rules

1. Add discovery provenance before claiming coverage.
2. Keep candidates open until identity, ordinary-user loop and artifact authority are evidenced.
3. Treat query language, user market and team geography as separate fields.
4. Let each dossier follow the project's decisive questions rather than a universal ten-section outline.
5. Pin full revisions for source-derived implementation claims; keep closed internals unknown.
6. Classify only after dossier evidence stabilizes, and add a family only when existing tests erase a consequential difference.
7. Preserve pending, duplicate and excluded decisions so later researchers can reproduce the boundary.
8. Report verified-sample findings, discovery coverage and unknown population separately.

See [CONTRIBUTING.md](CONTRIBUTING.md) for the workflow and [PROJECT_TEMPLATE.md](PROJECT_TEMPLATE.md) for the common evidence floor.

## Repository structure

~~~text
.
├── README.md                    # current research report and verified registry
├── DISCOVERY.md                 # discovery, verification and saturation protocol
├── EVIDENCE_ATLAS.md            # deep mechanism synthesis from the legacy evidence pass
├── CONTRIBUTING.md              # research and classification workflow
├── HANDOFF.md                    # current maintainer state and continuation priorities
├── PROJECT_TEMPLATE.md          # project-specific dossier design
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
    └── <project-slug>/
        └── README.md            # evidence dossier about that project only
~~~

## Current research status

This v0.3 working snapshot contains 146 reproducible discovery batches, 124 verification-wave identifiers and 27 declared saturation strata (26 active, 1 paused and 0 blocked). It does **not** complete the world landscape. The durable result is the research apparatus: seeds are labeled as seeds, candidates and negative decisions remain inspectable, discovery novelty is measurable, verification decisions are reproducible, taxonomies are allowed to change, and the report states what the evidence cannot yet support.
