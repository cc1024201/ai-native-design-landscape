# TRAE Work Design

> Research status: **Architecture-level / closed-source boundary reached** · Last reviewed: **2026-08-11**

| Field | Value |
|---|---|
| Organization / team | ByteDance / TRAE |
| Category | Agent workspace with a design-specific mode |
| Status | Active |
| Design Mode launch | 2026-06-24 in TRAE Work `v0.1.21–0.1.23` |
| Product lineage | Standalone TRAE SOLO launched 2026-03-31; renamed TRAE Work on 2026-06-09 |
| Surfaces | Web, Windows, macOS; mobile participates in the wider workspace, while the public design journey moves to Desktop or Web |
| Source availability | Closed product implementation |
| Public artifact evidence | Anonymous Web client exposes built-in Design Library packages, including token, component, preview, UI-kit and consumption-contract metadata |
| Related public repositories | `Trae-AI/TRAE` is an issue/community shell; `bytedance/trae-agent` is a separate general software-engineering agent |
| Pinned related revisions | `Trae-AI/TRAE@d9386061fd45805f00fd74e09f35566deb4d5a79`; `bytedance/trae-agent@e839e559ac61bdd0e057c375dd1dee391fee797d` |

## Product boundary: Design is a third workspace mode, not TRAE IDE

TRAE Work is the renamed standalone TRAE SOLO product. It is not the full TRAE IDE and it is not the SOLO mode embedded in that IDE. The standalone product began with Work/MTC and Code modes, then added a third **Design** tab.

The public product promise is one continuous loop:

```text
Work (ideation) → Design (visualization) → Code (implementation) → Work (verification)
```

That continuity is a workspace and context promise. It does not establish that a Work document, Design canvas, Code repository and exported Figma file are one lossless data model.

The anonymous Web client makes the boundary concrete:

- the sidebar exposes Work, Code and Design as sibling task modes;
- Design presents “production-ready page prototypes,” not a general vector-document editor;
- its starting examples are screenshot restoration, concept-to-spec generation and design-system-aligned high-fidelity output;
- Design Library is a first-class sibling surface to the task list;
- creating a task, attaching inputs, copying a library or adding a custom library requires login.

The dossier therefore follows the actual mechanism: **a design-library-grounded hosted artifact with several downstream authorities**.

## The ordinary journey has one canvas and four materially different exits

1. Start or continue requirements in Work Mode.
2. Switch to Design Mode on Desktop or Web.
3. Describe a page/prototype, optionally attach a UI screenshot or bring an existing requirement.
4. Select a built-in Design Library or, after authentication, add/copy a custom library. The launch article also advertises importing a Figma design system.
5. TRAE generates an editable high-fidelity artifact and renders it in real time.
6. Refine through natural-language requests, comments, prototype interaction and a GUI that edits CSS properties.
7. Review visual fidelity and the clickable flow.
8. Choose an exit:
   - export to Figma;
   - export `.jpg` or `.png`;
   - move the artifact into Code Mode to build a functional prototype/application;
   - after code/page generation, optionally deploy a static page through the BytePlus Pages skill.
9. Verify the chosen destination itself. Success inside the Design canvas is not evidence that the Figma document, image, codebase or deployed page preserves the same semantics.

The official article says Code Mode “picks up” where Design left off. Public evidence does not disclose whether that operation copies a snapshot, serializes an intermediate representation, passes visual/context evidence to an agent, or shares stable node identities.

## Design Library is an executable package, not merely a mood board

The strongest public technical evidence is available in the anonymous Web client. On 2026-08-11, the built-in TraeWork library exposed four views: **Theme**, **Components**, **Graphic** and **Design Spec**.

Its own README and SKILL describe a file-oriented consumption package:

| Layer | Publicly exposed package material | Role | Boundary |
|---|---|---|---|
| Routing contract | `library-consumption.json` | tells a downstream consumer whether a task needs tokens, components, icons or UI-kit evidence | schema versioning and the runtime consumer are not public |
| Tokens | `colors_and_type.css` and `css.json` | authoritative Light-mode CSS token source plus a machine-readable projection grouped by color, font, radius, spacing, size and shadow | the inspected package is one built-in library; this does not prove every imported library has the identical shape |
| Component contracts | `components.css`, `components/index.json` and `components/{slug}.json` | stable `.ds-*` classes plus fields such as `tokensConsumed`, `domAnatomy`, `assetsConsumed`, `coverageMatrix` and `provenance` | the package labels current contracts `sourceKind: "preview-contract"` with medium confidence |
| Executable previews | `preview/component-*.html` | directly renderable component reference and reusable markup | a preview contract is not proof of original Figma or product-source intent |
| UI-kit evidence | `uikit-plan.json`, `ui_kits/{type}/index.html` and `quality-report.json` | page-level examples and evidence about component reuse | UI-kit pages are explicitly showcases rather than production templates |
| Graphics | `assets/icons/*.svg` | canonical local icon set | the design library UI does not expose upstream asset history or licensing per item |
| Human/agent rules | README and SKILL | consumption order, design principles, authoring rules and verification expectations | these rules constrain generation but do not expose the Design agent implementation |

The built-in TraeWork package is especially careful about provenance:

- its component JSON is an implementation contract derived from preview evidence;
- `previewClassReuseRate` and `componentUsageBasis` determine whether a UI-kit page is strong reuse evidence;
- a `semantic-fallback` page can be visually useful while remaining weak component-reuse evidence;
- the extraction script that produced the mirrored component CSS is not shipped;
- original Figma, product and upstream design-source evidence must not be assumed.

This is a more precise public contract than the launch phrase “components, tokens, and visual specifications carry over directly.” It shows an intermediate package that can preserve useful structure while still declaring confidence and provenance limits.

## Consumption order is part of the agent interface

The visible SKILL prescribes an explicit read order:

1. README for scope, limitations and authoring rules.
2. `library-consumption.json` for layer routing.
3. `uikit-plan.json` for the component whitelist and page blueprint.
4. CSS/JSON token projections.
5. component index and per-component contracts.
6. stable component CSS and the nearest executable preview.
7. UI-kit pages only as page-level evidence.

It also constrains generated work to token-first styling, local assets, stable component classes, accessibility and preview comparison before shipping.

This establishes a real **agent-facing design-system interface**. It does not establish:

- which model or agent reads the package;
- how much of the package is placed in model context;
- whether runtime validation enforces the read order;
- whether generated canvas nodes retain the component `provenance` field;
- whether Code Mode receives the same package revision;
- whether a later library edit invalidates or regenerates existing artifacts.

## The canvas artifact remains the closed center

Official evidence calls the result an editable artifact, canvas, prototype and page. Users can change color, typography, components and layout in a visual interface, edit CSS properties through a GUI and preview the result in real time.

The internal artifact representation is not public. In particular, there is no published schema for:

- pages, frames, layers or prototype links;
- selected-element identity;
- responsive constraints and breakpoints;
- component-instance references;
- CSS property storage;
- comments and their target anchors;
- undo/redo or revision nodes;
- asset references;
- Design Library revision pins.

The visible Design Library proves that structured component and token evidence exists. It does not prove that a canvas selection returns to `components/{slug}.json`, an original Figma node, a Code Mode file or an AST range.

## Four mutation paths do not expose one shared transaction

| Mutation path | What is established | What remains unknown |
|---|---|---|
| Natural-language edit | Design Mode supports conversational and batch changes | patch scope, atomicity, rollback and whether the model rewrites an artifact or source files |
| Visual CSS GUI | users can adjust CSS properties with real-time preview | property allowlist, generated CSS location, responsive behavior and conflict rules with later agent edits |
| Comment / revision request | comments and requested revisions live beside visible deliverables in the wider Work product | comment target identity, persistence, resolution state and whether a comment is itself a durable artifact |
| Design Library change | templates can be used or customized conversationally; a custom library can be added after login | whether changes fork a package, mutate a shared library, or retroactively affect existing designs |

The June 1 changelog also records selecting an element in the built-in browser and adding it to a conversation or comment. That is evidence of a nearby rendered-target interaction in the base product; it is not evidence that the Design canvas uses the same identity mechanism or that either one maps to source code.

## One workspace contains several authorities

| Authority | What it owns | Persistence evidence | Why it is not interchangeable |
|---|---|---|---|
| Task ledger | conversation, progress, comments and task history | tasks appear in a persistent task list; Desktop/Web can resume work | resuming context is not a documented design-version restore |
| Project workspace | files and cross-mode context | standalone SOLO documented a unified workspace; Desktop can open local folders, Web runs in the cloud | local and cloud modes have different storage/egress boundaries |
| Design Library package | reusable tokens, components, graphics, previews, UI kits and rules | built-in packages are browseable; custom packages require an account | package revision history, scope and artifact pinning are undisclosed |
| Design canvas artifact | editable pages and prototype interactions | hosted project/task continuity is implied by the multi-device workspace | serialization, version graph and relationship to files are closed |
| Global/project memory | preferences, brand guidance and past context | Global Memory was added beside Design Mode in the same release train | memory influences generation but is not the design artifact or its history |
| Git worktree | isolated code/files for a task | TRAE Work added per-task Worktree support in May 2026 | no public evidence says Design canvas state or Design Library state lives in that Git worktree |
| Destination artifact | Figma document, raster image, Code Mode repository or deployed site | each exit creates a destination-native result | no public reverse-sync or cross-destination transaction is documented |

The March standalone-SOLO launch is explicit about the storage split:

- Desktop can work directly with a local folder.
- Web executes in the cloud.
- cloud features transmit and store codebase/related data to provide the service;
- local Desktop use without cloud features keeps codebase files local.

The later TRAE Work product page emphasizes multi-device cloud continuity. The public record does not specify which Design operations are local on Desktop, which always require cloud execution, or how local source, hosted canvas and mobile-visible task state reconcile.

## “Same platform” does not make the exports roundtrips

| Exit | What survives by definition | What must be verified at the destination |
|---|---|---|
| Figma | a structured Figma-side artifact rather than a flat image | frames, components, variants, Auto Layout, variables, prototype links, fonts, assets and editability; no reverse sync is documented |
| `.jpg` / `.png` | the rendered pixels at one export configuration | dimensions, crop, density, font/image loading and color; structure and interaction are intentionally flattened |
| Code Mode | context sufficient for an agent to build a functional prototype and integrate into a codebase | actual repository files, framework choices, responsive behavior, interactions, accessibility, data/backend behavior and runtime errors |
| BytePlus Pages | a packaged static page and a live URL | final static bundle, asset completeness, mobile behavior and URL lifetime; preview URLs reset roughly every three hours |

The BytePlus flow is downstream of page generation, not the canonical Design persistence layer. Its official guide says the deployed result is static, content/assets are baked at build time, large media can cause deployment failure, credentials may require user action and long-term sharing needs a custom domain.

## Source mapping stops at public package provenance

Three different identities are visible in the public story:

1. Figma design-system nodes and semantics at import time.
2. Design Library component/token/provenance contracts used as generation evidence.
3. Design canvas targets and later Code Mode files.

No public contract joins all three.

The built-in library can tell a consumer that a component contract used particular tokens, DOM anatomy and assets. It does not expose:

- the original Figma file/node IDs that produced the contract;
- a generated canvas node’s library-component identity;
- a selected canvas element’s code file/range;
- a Code Mode component’s reverse pointer to the design artifact;
- a durable mapping updated after either side changes.

Design-system grounding is therefore established. Durable target-to-source mapping is not.

## Ordinary-user failure atlas

| User-visible state | What it proves | What it does not prove | Required check or recovery |
|---|---|---|---|
| Design tab is visible anonymously | the mode is currently discoverable on Web | that a task can run without an account | log in before expecting attachments, generation or custom libraries |
| A first draft renders | generation and preview reached a visible state | correct flow, responsive behavior or library fidelity | exercise every prototype path and target viewport |
| A built-in library is selected | a known package can condition generation | that every node reused a stable component contract | inspect components/tokens and compare the rendered result |
| Figma import completes | some design-system material was accepted | lossless variables, variants, instances or provenance | audit the resulting library package and generate a representative screen |
| GUI CSS edit looks correct | the current preview reflects a property change | Code Mode parity or persistence across later agent rewrites | reopen, regenerate and compare the downstream runtime |
| Natural-language batch edit completes | the agent applied a requested change | bounded scope or transactional rollback | inspect unchanged regions and the artifact/task history |
| Comment is submitted | feedback entered the task workflow | stable node anchoring, resolution semantics or source mapping | reopen the task and verify target/context survived |
| “Export to Figma” succeeds | a Figma artifact was created | lossless structure or bidirectional sync | inspect the native Figma document and test a roundtrip separately |
| PNG/JPG downloads | a flattened render exists | interaction, responsive variants or editable structure | inspect file dimensions/content and preserve the editable source separately |
| Design moves to Code Mode | context crossed the mode boundary | that runnable files exist or match the canvas | inspect the repository diff, run the app and compare key screens/interactions |
| Code runs in preview | one environment rendered | deployability, backend correctness or production readiness | test the actual build, console, network, breakpoints and target deployment |
| A task resumes on another device | cloud task context persisted | exact canvas/file revision recovery | verify the expected design, files and library revision independently |
| A Git worktree exists | a code task has isolated files and branch state | that canvas/library state is versioned with Git | enumerate tracked files and test design recovery after branch switching |
| BytePlus returns a URL | static deployment completed | permanent sharing | use a custom domain for long-term access; record the temporary-link boundary |
| A large page fails to deploy | the static package exceeded a practical boundary | that the design artifact is corrupt | compress media and retry the deployment artifact only |
| Agent deletion goes to Trash/Recycle Bin | a rollout may make deletion recoverable | complete task or design rollback | inspect the filesystem and product rollout status before assuming recovery |

## Persistence and versioning have at least five clocks

1. **Task clock** — prompts, progress, comments and task history.
2. **Workspace/file clock** — local folder or cloud project files.
3. **Canvas clock** — the closed Design artifact and its current visual state.
4. **Library clock** — built-in/custom design-system package state.
5. **Destination clock** — Figma, raster export, Git/code or deployment history.

Global Memory adds a sixth context clock. Git worktrees may add a seventh for Code Mode.

The public record does not expose a Design revision graph, named versions, branch/merge semantics, library-version pins, atomic snapshots across these clocks or a guarantee that task resume reconstructs the exact file/canvas/library combination.

“No more searching for the right version” is a product-experience claim, not evidence of a unified version model.

## Product evolution matters because the architecture changed quickly

| Date | Public event | Technical consequence |
|---|---|---|
| 2026-03-31 | standalone TRAE SOLO `v0.1.0` launched | unified task/workspace shell, local Desktop versus cloud Web split, Work/MTC and Code modes |
| 2026-05-05 | Worktree and mobile support announced | task-isolated Git environments and remote progress became adjacent persistence/control planes |
| 2026-06-01 | built-in-browser element selection added | rendered elements could enter conversations/comments in the base product, without a published source identity |
| 2026-06-09 | TRAE SOLO renamed TRAE Work `v0.1.18` | product boundary separated from TRAE IDE while retaining the standalone workspace |
| 2026-06-24 | Design Mode and Global Memory shipped in `v0.1.21–0.1.23` | design became a first-class mode beside a newly broadened memory domain |
| 2026-06-25 | Design Mode launch article published | Figma import/export, visual CSS GUI, Canvas/prototype and Code Mode exits became explicit |
| 2026-07-01 | BytePlus Pages workflow published | an optional static deployment path and temporary-link boundary became public |

The changelog does not publish later Design-specific schema migrations, versioning changes or renderer internals as of this review.

## Open-source and commit-level evidence boundary

### `Trae-AI/TRAE` is not the client source

At `d9386061fd45805f00fd74e09f35566deb4d5a79`, the official TRAE GitHub repository contains only `README.md` and issue-template material at the top level. Its README says it is the official GitHub presence. The latest commit updates issue templates. It provides community/issue evidence, not TRAE Work, Design canvas or renderer implementation.

### `bytedance/trae-agent` is a separate research-friendly CLI agent

At `e839e559ac61bdd0e057c375dd1dee391fee797d`, the MIT-licensed repository implements a general software-engineering CLI agent with LLM clients, file/Bash/thinking tools, trajectories, tests and evaluation infrastructure.

The pinned tree has no Design, Figma, Canvas, renderer or preview path. Its pinned HEAD predates the March standalone Work launch and the June Design Mode launch. No official public contract states that TRAE Work Design embeds this repository or shares its runtime.

It can establish how one TRAE-branded open agent represents tool execution and trajectories. It cannot establish the closed product’s model orchestration, Design Library consumer, canvas runtime, source mapping or persistence.

### The visible Design Library is artifact evidence, not an open-source release

The anonymous Web client exposes substantial package contents and documentation, but it does not expose:

- a repository URL;
- a license for the package as a whole;
- source commit/release tag;
- extraction/generation implementation;
- downloadable history;
- the client or server that consumes it.

The package may be inspected as a public product artifact. It must not be labeled Source-level product code.

## Facts, inferences and unknowns

### Established public facts

- Design is a first-class TRAE Work mode on the live Web client.
- generation produces editable page/prototype artifacts with real-time preview.
- natural-language edits, comments and GUI CSS-property editing are public capabilities.
- Design Library supports built-in packages and advertises Figma design-system import.
- the inspected built-in TraeWork library exposes token, component, graphic, preview, UI-kit, README and SKILL layers.
- the package explicitly distinguishes executable preview contracts from original design intent.
- Figma, JPG, PNG and Code Mode are documented exits.
- Desktop can use local folders; Web/cloud features store relevant data in the cloud.
- TRAE Work has task history, cross-device context, Global Memory and a separately documented Git-worktree feature.
- the related public repositories do not contain TRAE Work Design implementation.

### Evidence-backed inferences

- Design Library is an intermediate semantic package between an upstream design system and generated artifacts.
- the hosted Design artifact is a separate authority because it can be exported into destination-specific representations.
- Code Mode handoff is downstream materialization, not proven live synchronization.
- task, workspace, canvas, library, memory and destination state can advance independently.
- the Design Library’s provenance/confidence fields enable better grounding without creating canvas-to-code source identity.

### Material unknowns

- canonical Design artifact schema and storage format;
- canvas renderer, layout engine and sandbox;
- selected-node identity and comment anchoring;
- GUI CSS edit representation and conflict behavior;
- Design agent/model/tool protocol;
- Figma authentication, import conversion, export mechanism and roundtrip fidelity;
- whether custom libraries share the built-in package schema;
- library scoping, revision history and artifact revision pins;
- code-generation frameworks, file layout and source mapping;
- exact local/cloud split for Design Mode on Desktop;
- Design version history, branching, undo persistence and cross-clock snapshots;
- collaboration, permissions and simultaneous-edit semantics;
- reverse sync from Figma, Code Mode or deployed pages;
- authenticated ordinary-user runtime behavior beyond the public surface.

## Verification performed for this snapshot

- Loaded `https://work.trae.ai/` in a real browser without signing in.
- Confirmed the Work/Code/Design tabs, Design starter examples, task/login boundary and Design Library navigation.
- Opened the built-in TraeWork library and inspected Theme, Components, Graphic and Design Spec views.
- Read the public in-product README and SKILL, including package layout, consumption order, contract fields, provenance limits and authoring rules.
- Confirmed that adding/copying a custom library reaches a login surface; no account was used and no task/project was created.
- Fetched the official Design launch, Work launch, standalone-SOLO architecture, changelog, download and BytePlus Pages evidence.
- Confirmed live HTTP access to the product, changelog, blogs, download page and pinned GitHub revisions.
- Queried the official GitHub organization/repositories and pinned both related repository heads.
- Inspected the pinned `bytedance/trae-agent` tree for Design/Figma/Canvas/render/preview paths; none were present.
- Checked the local machine for TRAE commands, uninstall registrations and common TRAE Work application paths; no installed client was found.

The authenticated generation/edit/export journey was not executed because no TRAE account or installed desktop client was available in the authorized environment. That limitation is recorded rather than replaced with invented runtime claims.

## Primary sources

- [Introducing Design Mode in TRAE Work](https://www.trae.ai/blog/trae_work_design_0625)
- [TRAE Work product page](https://www.trae.ai/work)
- [Live TRAE Work Web client](https://work.trae.ai/)
- [Introducing TRAE Work](https://www.trae.ai/blog/trae_work_0609)
- [Introducing the standalone TRAE SOLO workspace](https://www.trae.ai/blog/new_solo_beta_0331)
- [TRAE changelog](https://www.trae.ai/changelog)
- [TRAE Work × BytePlus Pages](https://www.trae.ai/blog/trae_work_x_byteplus)
- [TRAE download center](https://www.trae.ai/download)
- [Official issue/community repository at `d9386061fd45805f00fd74e09f35566deb4d5a79`](https://github.com/Trae-AI/TRAE/tree/d9386061fd45805f00fd74e09f35566deb4d5a79)
- [Issue-repository boundary commit](https://github.com/Trae-AI/TRAE/commit/d9386061fd45805f00fd74e09f35566deb4d5a79)
- [Related `bytedance/trae-agent` source at `e839e559ac61bdd0e057c375dd1dee391fee797d`](https://github.com/bytedance/trae-agent/tree/e839e559ac61bdd0e057c375dd1dee391fee797d)
- [Pinned TRAE Agent commit](https://github.com/bytedance/trae-agent/commit/e839e559ac61bdd0e057c375dd1dee391fee797d)
- [Official TRAE Agent open-source announcement](https://www.trae.ai/blog/product_update_0625)

## Evidence-bounded conclusion

TRAE Work Design’s decisive mechanism is not merely chat-to-UI. It is a hosted design canvas conditioned by an agent-readable Design Library package whose tokens, component contracts, previews, provenance and consumption rules are partially visible, then projected into several destination authorities.

That public artifact evidence is unusually strong for a closed product. The implementation, canvas schema, target identity, version graph and cross-mode/export transactions remain closed. The dossier is therefore **Architecture-level / closed-source boundary reached**, not Source-level.
