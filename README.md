# AI-Native Design Landscape

> An open, evidence-backed research map of how teams define Design, turn those definitions into products, and implement them technically. It is not a global directory and not a finished census.

**Snapshot:** 2026-08-11 · **Schema:** v0.3 · **Verified records:** 69 · **Candidate register:** 258 · **Reproducible discovery batches:** 22

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
| How many global teams or products exist? | **Not estimated.** This repository has 69 verified records and 168 unresolved plausible candidates. | The global population and recall of every discovery channel. |
| How complete is discovery? | 22 reproducible batches reviewed 891 result cards and found 195 candidates beyond the 63 seeds. | Broad domain batches still have 41–49% first-seen-candidate yield, so discovery is not saturated. |
| How many definitions, forms and architectures exist? | The 69 verified records currently require 10 Design definitions, 12 primary product forms and 10 architecture families. | Whether later verification will split, merge or add families. These are sample-derived, not global totals. |
| Where are the teams? | Only 5 of 258 candidate rows currently have first-party region evidence; 253 remain unknown. | Any defensible global geographic distribution. Query language and localized pages are not team-location evidence. |

The correct conclusion is therefore not “there are 69 products worldwide.” It is:

> We have a reproducible, expanding observation system; its current verified sample contains 69 records, its open candidate register contains 258 rows, and its own novelty measurements show that the field boundary is still moving.

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
| Reproducible discovery batches | **22** | 19 web, 1 GitHub, 1 launch-directory and 1 npm batch |
| Search result cards reviewed | **891** | Batch denominator; a card can be irrelevant, duplicated or mention several candidates |
| First-seen candidates after the legacy import | **195** | Distinct names or product claims retained for a decision |
| Candidate-register rows | **258** | 63 seeds plus 195 reproducibly discovered rows |
| Open plausible pool | **237** | 69 included plus 168 pending; not yet a fully verified or fully deduplicated universe |
| Verified records | **69** | 63 legacy records plus 6 records included through the new verification protocol |
| Pending candidates | **168** | Plausibly in scope but missing decisive identity, artifact, lifecycle or authority evidence |
| Duplicate decisions | **2** | Aliases or surfaces already represented elsewhere |
| Exclusion decisions | **19** | Boundary failures retained so the screening logic remains inspectable |
| Candidates with team-region evidence | **5** | Too sparse and selectively verified for any geographic distribution |
| Candidates with unknown team region | **253** | The dominant geography result in this snapshot is “not yet audited” |

### Channel behavior

| Discovery channel | Batches | Cards reviewed | First-seen candidates | Repeated candidates |
|---|---:|---:|---:|---:|
| General and language/domain web search | 19 | 629 | 159 | 83 |
| GitHub README/repository search | 1 | 150 | 20 | 8 |
| Product launch directory | 1 | 12 | 9 | 6 |
| npm package registry | 1 | 100 | 7 | 5 |

These numbers describe the query surfaces, not global prevalence. A launch-directory card can mention more than one retained object; package search can return generic dependencies; web ranking and GitHub full-text search have different visibility biases.

### Why discovery is not saturated

| Batch | Search stratum | Cards | First-seen | New-candidate yield |
|---|---|---:|---:|---:|
| WEB-DOMAIN-001 | creative, presentation and video | 47 | 23 | **48.94%** |
| WEB-DOMAIN-002 | CAD, architecture, fashion and game | 46 | 19 | **41.30%** |
| WEB-AR-002 | Saudi, UAE, Egyptian and Arabic web | 32 | 10 | **31.25%** |
| WEB-ZH-003 | Chinese UI, creative and CAD follow-up | 41 | 8 | **19.51%** |
| NPM-EN-001 | npm registry | 100 | 7 | **7.00%** |
| WEB-JA-002 / WEB-KO-002 | country-domain-restricted Japanese/Korean queries | 0 | 0 | **0%** |

The two zero-result batches are search/index failures, not evidence that Japan or Korea has zero teams. The high cross-domain yields show that the earlier UI/software/web-heavy sample omitted major artifact domains. No channel has met the protocol's requirement of at least three comparable low-novelty, high-overlap batches, and even channel-level saturation would not imply global completion.

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

## Current verified analytical sample

These counts describe the 69 dossier-backed records only. They are not global totals, market shares or estimates of unseen teams.

| Observable | Verified sample count | Meaning inside this repository |
|---|---:|---|
| Canonical products / projects | **69** | Independently identifiable products, open-source projects or surfaced Design workspaces with dossiers |
| Publicly attributable team units | **63–69** | 63 organization/maintainer umbrellas or 69 product/maintainer lineages; not internal squad headcount |
| Product or maintainer lineages | **69** | Distinct public product or maintainer histories represented in the sample |
| Organizations / maintainer umbrellas | **63** | Canonical public homes used to consolidate related lineages |
| Operational definitions of Design | **10** | Sample-derived operational answers to what work counts as Design |
| Primary product forms | **12** | Mutually countable primary packaging forms in the verified sample |
| Decisive architecture families | **10** | Distinct authority, projection and mutation arrangements required by verified evidence |
| Source-level dossiers | **21** | Public implementation pinned to a full source revision and traced through its decisive mechanism |
| Architecture-level dossiers | **48** | Closed/distributed systems researched to their available public evidence boundary |
| Active or actively transitioning records | **63** | 61 active and 2 active-transition records |
| Historical or sunsetting records | **6** | 4 historical and 2 sunsetting records preserved as lineage evidence |

### Ten observed definitions of Design

Primary counts sum to 69. “Appears in” is multi-label adoption and overlaps. Neither distribution estimates the global field.

| Operational definition | Primary | Appears in | Operational distinction |
|---|---:|---:|---|
| Delegated creation | 14 | 39 | intent or references lead an agent to create and iteratively refine an artifact |
| Native artifact authoring | 17 | 28 | a structured design, scene, page, site, timeline or comparable graph remains editable authority |
| Visual authoring of executable source | 5 | 21 | a visual projection returns changes to executable source or its owning workspace |
| Runtime correction | 8 | 28 | selection, annotation or demonstration on a running artifact directs source repair |
| Variant exploration and decision | 3 | 29 | alternatives coexist and one direction can be explicitly adopted |
| System governance | 1 | 22 | reusable components, tokens, rules or instructions constrain later work |
| Design-code translation and grounding | 6 | 26 | structured identity or semantics move between design and code authorities |
| End-to-end product delivery | 10 | 37 | Design is inseparable from behavior, data and release of an app or site |
| Visual coordination and evidence | 4 | 16 | visual artifacts coordinate or verify work while another authority owns implementation |
| Constraint-driven engineering | 1 | 1 | precise dimensions, constraints, features, topology and production fitness determine the artifact |

The one-record engineering definition is deliberately visible rather than smoothed away. It is a falsifiable hypothesis created by new evidence; future CAD, architecture, industrial and fashion verification may strengthen it, split it or show that it should merge elsewhere.

### Twelve observed primary product forms

| Product form | Count |
|---|---:|
| Standalone design-agent workspace | 9 |
| Design surface inside an agent platform | 5 |
| General agent with visual tools | 6 |
| AI app or site builder | 11 |
| Code-native visual editor or IDE | 5 |
| Runtime overlay or context bridge | 5 |
| Agent-controllable canvas or domain editor | 11 |
| Design-code bridge | 2 |
| Established visual platform with AI | 11 |
| Visual decision or verification workspace | 2 |
| Visual-editor infrastructure | 1 |
| AI engineering-design workspace | 1 |

### Ten observed architecture families

Primary counts sum to 69; “Appears in” includes hybrid mechanisms.

| Architecture family | Primary | Appears in | Decisive authority arrangement |
|---|---:|---:|---|
| Source-authority live projection | 8 | 17 | repository files own truth and a live projection returns edits or intent to them |
| Runtime-intent relay | 6 | 13 | a runtime bridge captures target context while another writer owns durable mutation |
| Native graph authority | 12 | 25 | a host-native structured graph owns the editable artifact |
| External-agent canvas | 9 | 12 | an external agent operates a separate native canvas through MCP, plugin, CLI or API |
| Hosted generated-artifact workspace | 9 | 16 | provider-managed artifacts and revisions converge with AI and visual/code editing |
| Managed application-project graph | 9 | 12 | UI, logic, data, configuration and release state live in one managed project |
| Design-code materialization | 7 | 18 | design/capture/system structure is compiled, exported, reconstructed or grounded into code |
| Filesystem agent with visual evidence | 5 | 11 | files and Git own truth while visual evidence coordinates or verifies the agent |
| Candidate isolation and promotion | 3 | 23 | alternatives are isolated and one is explicitly selected or applied |
| Parametric engineering-model authority | 1 | 1 | constraints, feature history, topology and PDM-governed versions own precise engineering state |

## What the verified evidence supports

1. **Design is not one object.** Within the sample it ranges from native layer authoring and runtime correction to product delivery and constraint-driven engineering.
2. **Similar visible features can hide different authority boundaries.** Figma Design Agent edits the host file from inside; TalkToFigma temporarily relays an external agent into that host; Figma Make owns a separate generated application workspace.
3. **Artifact authority is more explanatory than framework choice.** The decisive difference is whether truth lives in files, a native graph, a hosted app project, a version candidate or a parametric engineering model.
4. **Domain expansion can change the taxonomy.** Presentation and Arabic-product candidates fit existing mechanisms; verified CAD evidence required new tests.
5. **Open implementation evidence remains a minority.** Only 21 of 69 records are source-level, so closed systems must retain explicit internal unknowns.
6. **Geography is currently a research gap, not a result.** The first reproducible cycle diversified query languages, but team-location evidence has barely begun.

## Conclusions this repository cannot make

- It cannot state the total number of AI-native Design teams or products worldwide.
- It cannot treat 69 verified records, 237 open plausible objects or 258 candidate rows as the global population.
- It cannot infer team origin from query language, domain suffix, translated marketing or user market.
- It cannot call the 10/12/10 taxonomy globally complete or use sample proportions as market prevalence.
- It cannot interpret a zero-result language query as absence of local teams.
- It cannot infer closed-source internals, atomicity, fidelity or persistence guarantees from a successful demo.
- It cannot call discovery globally saturated because one noisy registry has low yield.

## Data and reproducibility

- [DISCOVERY.md](DISCOVERY.md) defines units, channels, screening, verification waves and stopping rules.
- [data/discovery-batches.csv](data/discovery-batches.csv) preserves exact queries, denominators, first-seen candidates and repeats.
- [data/candidates.csv](data/candidates.csv) is the open candidate and decision register.
- [data/verification-waves.csv](data/verification-waves.csv) records why candidates were deeply reviewed and what decided each outcome.
- [data/census.csv](data/census.csv) is the verified analytical sample.
- [data/organizations.csv](data/organizations.csv) resolves organization and maintainer umbrellas.
- [data/identity-map.csv](data/identity-map.csv) records aliases, surfaces, rebrands and lineage cutoffs.
- [data/taxonomy.json](data/taxonomy.json) defines every current unit and family test.
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
| [Claude Design](projects/anthropic-claude-design/) | Anthropic | delegated creation | Standalone design-agent workspace | Hosted generated-artifact workspace | architecture · active |
| [Codex](projects/openai-codex/) | OpenAI | visual coordination and evidence | General agent with visual tools | Filesystem agent with visual evidence | source · active |
| [Cursor](projects/cursor/) | Anysphere | visual authoring of executable source | Design surface inside an agent platform | Source-authority live projection | architecture · active |
| [TRAE Work](projects/trae-work/) | ByteDance | delegated creation | Design surface inside an agent platform | Hosted generated-artifact workspace | architecture · active |
| [QoderWork Design](projects/qoderwork-design/) | Alibaba | delegated creation | Design surface inside an agent platform | Hosted generated-artifact workspace | architecture · active |
| [Replit Design](projects/replit-design/) | Replit | variant exploration and decision | Design surface inside an agent platform | Candidate isolation and promotion | architecture · active |
| [CodeBuddy](projects/tencent-codebuddy/) | Tencent | design-code translation and grounding | General agent with visual tools | Design-code materialization | architecture · active |
| [Comate](projects/baidu-comate/) | Baidu | design-code translation and grounding | General agent with visual tools | Design-code materialization | architecture · active |
| [Devin](projects/devin/) | Cognition | runtime correction | General agent with visual tools | Filesystem agent with visual evidence | architecture · active |
| [v0](projects/vercel-v0/) | Vercel | end-to-end product delivery | AI app or site builder | Hosted generated-artifact workspace | architecture · active |
| [Lovable](projects/lovable/) | Lovable | end-to-end product delivery | AI app or site builder | Managed application-project graph | architecture · active |
| [Windsurf](projects/windsurf/) | Cognition | runtime correction | General agent with visual tools | Filesystem agent with visual evidence | architecture · historical |
| [GitHub Spark](projects/github-spark/) | GitHub | end-to-end product delivery | AI app or site builder | Managed application-project graph | architecture · sunsetting |
| [Anything](projects/anything/) | Anything | end-to-end product delivery | AI app or site builder | Managed application-project graph | architecture · active |
| [Fusion](projects/builderio-fusion/) | Builder.io | visual authoring of executable source | Code-native visual editor or IDE | Source-authority live projection | architecture · active |
| [Stitch](projects/google-stitch/) | Google | delegated creation | Standalone design-agent workspace | Native graph authority | architecture · active |
| [Google Antigravity](projects/google-antigravity/) | Google | visual coordination and evidence | General agent with visual tools | Filesystem agent with visual evidence | architecture · active |
| [Base44](projects/base44/) | Wix | end-to-end product delivery | AI app or site builder | Managed application-project graph | architecture · active |
| [Bolt.new](projects/bolt-new/) | StackBlitz | end-to-end product delivery | AI app or site builder | Managed application-project graph | architecture · active |
| [Atoms](projects/atoms/) | MetaGPT / Atoms | end-to-end product delivery | AI app or site builder | Managed application-project graph | architecture · active |
| [Subframe](projects/subframe/) | Subframe | system governance | Established visual platform with AI | Design-code materialization | architecture · active |
| [FlutterFlow](projects/flutterflow/) | FlutterFlow | native artifact authoring | Established visual platform with AI | Managed application-project graph | architecture · active |
| [Figma Make](projects/figma-make/) | Figma | delegated creation | AI app or site builder | Hosted generated-artifact workspace | architecture · active |
| [Alloy](projects/alloy/) | Alloy | delegated creation | Standalone design-agent workspace | Hosted generated-artifact workspace | architecture · active |
| [Magic Patterns](projects/magic-patterns/) | Magic Patterns | delegated creation | Standalone design-agent workspace | Hosted generated-artifact workspace | architecture · active |
| [Anima](projects/anima/) | Anima | design-code translation and grounding | Design-code bridge | Design-code materialization | architecture · active |
| [Kombai](projects/kombai/) | Kombai | design-code translation and grounding | Design surface inside an agent platform | Design-code materialization | architecture · active |
| [Miaoda](projects/baidu-miaoda/) | Baidu | end-to-end product delivery | AI app or site builder | Managed application-project graph | architecture · active |
| [Onlook](projects/onlook/) | Onlook | visual authoring of executable source | Code-native visual editor or IDE | Source-authority live projection | source · active |
| [Tempo](projects/tempo/) | Tempo Labs | visual authoring of executable source | Code-native visual editor or IDE | Source-authority live projection | architecture · active-transition |
| [stagewise](projects/stagewise/) | stagewise | visual authoring of executable source | Code-native visual editor or IDE | Source-authority live projection | source · active |
| [Dosmos](projects/dosmos/) | Dosmos | runtime correction | Code-native visual editor or IDE | Runtime-intent relay | source · active |
| [Retune](projects/retune/) | Retune contributors | runtime correction | Runtime overlay or context bridge | Runtime-intent relay | source · active |
| [Tuna](projects/tuna/) | Tuna contributors | runtime correction | Runtime overlay or context bridge | Runtime-intent relay | source · active |
| [onUI](projects/onui/) | onUI contributors | runtime correction | Runtime overlay or context bridge | Runtime-intent relay | source · active |
| [Design Canvas](projects/design-canvas/) | Design Canvas | visual coordination and evidence | Visual decision or verification workspace | Filesystem agent with visual evidence | architecture · active |
| [Rivet](projects/rivet-design/) | Rivet Design | variant exploration and decision | Visual decision or verification workspace | Candidate isolation and promotion | architecture · active |
| [pen.dev](projects/pen-dev/) | High Agency | native artifact authoring | Agent-controllable canvas or domain editor | External-agent canvas | architecture · active |
| [Paper](projects/paper/) | Lost Coast Labs | native artifact authoring | Agent-controllable canvas or domain editor | External-agent canvas | architecture · active |
| [Clearly](projects/clearly/) | Clearly | native artifact authoring | Agent-controllable canvas or domain editor | External-agent canvas | architecture · active |
| [MagicPath](projects/magicpath/) | NewCompute | delegated creation | Agent-controllable canvas or domain editor | Hosted generated-artifact workspace | architecture · active |
| [Superdesign](projects/superdesign/) | Superdesign | variant exploration and decision | Standalone design-agent workspace | External-agent canvas | source · active |
| [Nimbalyst](projects/nimbalyst/) | Nimbalyst | visual coordination and evidence | Agent-controllable canvas or domain editor | Source-authority live projection | source · active |
| [OpenPencil](projects/open-pencil/) | OpenPencil | native artifact authoring | Agent-controllable canvas or domain editor | External-agent canvas | source · active |
| [OpenPencil ZSeven](projects/openpencil-zseven/) | ZSeven-W contributors | native artifact authoring | Agent-controllable canvas or domain editor | External-agent canvas | source · active |
| [Reframe](projects/reframe/) | Reframe contributors | native artifact authoring | Agent-controllable canvas or domain editor | Native graph authority | source · active |
| [Open CoDesign](projects/open-codesign/) | OpenCoworkAI | delegated creation | Standalone design-agent workspace | Source-authority live projection | source · active |
| [Open Design](projects/open-design/) | nexu-io | delegated creation | Standalone design-agent workspace | Source-authority live projection | source · active |
| [Agentation](projects/agentation/) | Agentation contributors | runtime correction | Runtime overlay or context bridge | Runtime-intent relay | source · active |
| [Code Inspector](projects/code-inspector/) | zh-lx contributors | runtime correction | Runtime overlay or context bridge | Runtime-intent relay | source · active |
| [Puck](projects/puck/) | Puck contributors | native artifact authoring | Visual-editor infrastructure | Native graph authority | source · active |
| [Figwright](projects/figwright/) | Roya / Figwright contributors | design-code translation and grounding | Design-code bridge | Design-code materialization | source · active |
| [mcp_excalidraw](projects/mcp-excalidraw/) | yctimlin contributors | native artifact authoring | Agent-controllable canvas or domain editor | External-agent canvas | source · active |
| [Monet](projects/monet/) | Het Patel / Monet contributors | native artifact authoring | Agent-controllable canvas or domain editor | External-agent canvas | source · active |
| [Uizard](projects/uizard/) | Miro | delegated creation | Established visual platform with AI | Native graph authority | architecture · active |
| [Galileo AI](projects/galileo-ai/) | Galileo AI | delegated creation | Standalone design-agent workspace | Candidate isolation and promotion | architecture · historical |
| [Diagram](projects/diagram/) | Figma | native artifact authoring | Established visual platform with AI | Native graph authority | architecture · historical |
| [Framer AI](projects/framer-ai/) | Framer | native artifact authoring | Established visual platform with AI | Native graph authority | architecture · active |
| [Relume](projects/relume/) | Relume | design-code translation and grounding | Established visual platform with AI | Design-code materialization | architecture · active |
| [Webflow AI](projects/webflow-ai/) | Webflow | native artifact authoring | Established visual platform with AI | Native graph authority | architecture · active-transition |
| [Canva Magic Design](projects/canva-magic-design/) | Canva | delegated creation | Established visual platform with AI | Native graph authority | architecture · active |
| [Firebase Studio](projects/firebase-studio/) | Google | end-to-end product delivery | AI app or site builder | Hosted generated-artifact workspace | architecture · sunsetting |
| [Motiff](projects/motiff/) | Motiff | native artifact authoring | Established visual platform with AI | Native graph authority | architecture · historical |
| [TalkToFigma](projects/talktofigma/) | TalkToFigma maintainers | native artifact authoring | Agent-controllable canvas or domain editor | External-agent canvas | source · active |
| [Figma Design Agent](projects/figma-design-agent/) | Figma | native artifact authoring | Established visual platform with AI | Native graph authority | architecture · active |
| [Calicat](projects/calicat/) | Beijing Damaidi Information Technology | native artifact authoring | Established visual platform with AI | Native graph authority | architecture · active |
| [zCAD / Zixel 3D CAD](projects/zcad/) | Zixel | constraint-driven engineering | AI engineering-design workspace | Parametric engineering-model authority | architecture · active |
| [Gamma](projects/gamma/) | Gamma | delegated creation | Standalone design-agent workspace | Native graph authority | architecture · active |
| [Etlaq](projects/etlaq/) | Etlaq (Saudi Arabia) | end-to-end product delivery | AI app or site builder | Managed application-project graph | architecture · active |

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
├── PROJECT_TEMPLATE.md          # project-specific dossier design
├── data/
│   ├── discovery-batches.csv    # reproducible searches and denominators
│   ├── candidates.csv           # open candidate and decision register
│   ├── verification-waves.csv   # deep-review selection and outcomes
│   ├── census.csv               # verified analytical sample
│   ├── organizations.csv        # organization/maintainer labels
│   ├── identity-map.csv         # alias and lineage decisions
│   └── taxonomy.json            # units, definitions, forms and architecture tests
├── scripts/
│   └── verify-census.ps1        # integrity and derived-count verification
└── projects/
    └── <project-slug>/
        └── README.md            # evidence dossier about that project only
~~~

## Current research status

This v0.3 snapshot completes one reproducible discovery cycle and one maximum-variation verification wave. It does **not** complete the world landscape. The durable result is the research apparatus: seeds are labeled as seeds, candidates remain open, discovery novelty is measurable, verification decisions are reproducible, taxonomies are allowed to change, and the report states what the evidence cannot yet support.
