# AI-Native Design Landscape

> A living map of global AI-native design products, teams, visual surfaces, coding-agent design workflows, and open-source infrastructure.

**Snapshot:** 2026-08-11 · **Version:** v0.1 · **Coverage:** 63 canonical project directories

## Current progress

- **Canonical coverage:** 63 project directories registered and coverage-audited against the research collected for v0.1.
- **Evidence-bounded deep dossiers complete:** 32 / 63 — 18 Source-level dossiers plus Claude Design, Replit Design, QoderWork Design, TRAE Work Design, Cursor, Tencent CodeBuddy, Baidu Comate, Devin, historical Windsurf, Diagram, Galileo AI, Motiff, Stitch and Google Antigravity at Architecture-level with the closed-source evidence boundary reached.
- **Source-level subset:** 18 / 63 — Onlook, stagewise, Tuna, Nimbalyst, OpenPencil (`open-pencil/open-pencil`), OpenPencil (`ZSeven-W/openpencil`), Reframe, Puck, onUI, Open CoDesign, Agentation, Code Inspector, Open Design, Monet, Superdesign, Figwright, mcp_excalidraw, Codex.
- **Remaining dossiers:** 31 / 63 at Seed, Product-level, or unfinished Architecture-level depth.
- **Repository structure:** canonical project registry, project template, evidence rules, lifecycle/alias rules, and global panorama are established.
- **Current milestone:** v0.1 breadth is established; depth work is in progress project by project.

## Remaining work

The remaining work is intentionally depth-first, one project directory at a time. Depth does **not** mean forcing every project through one table of contents. Before drafting a dossier, identify the product's decisive user journey, unusual technical mechanism and most consequential evidence gaps, then build the document around those questions.

The earlier ten-part chain remains a **research checklist**, not a required structure:

`product facts · technical direction · technology choices · artifact/data model · agent interface · runtime/rendering · source mapping · persistence/versioning · implementation paths · commit history`

Use only the dimensions that explain the project, combine related ones, and add project-specific dimensions when the implementation demands them. A compile-time source locator, a feedback overlay, a vector editor and an agent-run artifact workspace should not read like four instances of the same system.

Priority backlog:

1. Deepen the remaining closed, partial-source and historical products through official product docs, changelogs, engineering posts, public protocols, distribution artifacts and bounded live observation without guessing undisclosed internals.
2. When a closed product exposes an open format, SDK, agent API or related foundation, pin and inspect that component but do not let adjacent source stand in for the product implementation.
3. Trace the project's own critical path deeply enough to establish its artifact/source of truth, decisive mechanism, user-visible failure boundaries and relevant persistence or delivery semantics; do not add irrelevant sections for symmetry.
4. Maintain lifecycle events, aliases/rebrands, acquisitions and discontinued products.
5. Re-audit completed Source-level dossiers and re-run long-tail discovery periodically so coverage can expand without weakening the per-project evidence standard.
6. Evolve the root panorama only from facts established in project dossiers; cross-product synthesis remains root-only.

## Scope

This repository tracks the part of the design-tool ecosystem being reshaped by AI agents, executable artifacts, code-native visual editing, agent-controllable canvases, and design-to-code/code-to-design workflows.

Repository rule:

- Root `README.md`: taxonomy, categorization, panorama, lifecycle, coverage decisions, research depth and project index.
- `projects/<project>/README.md`: only that project's own technical direction, public technology choices, artifact model and primary sources.
- No cross-product comparisons inside project directories.
- No guessed internal stack for closed products.

### Directory unit

A directory represents an independently identifiable product, open-source project, or independently surfaced design workspace.

- Product features/modes stay inside the owning product directory unless they have a distinct product/workspace identity.
- Direct renames/rebrands normally stay in one canonical directory with aliases recorded as metadata.
- An acquired or discontinued product may remain as a historical entry when its independently attributable pre-transition lineage is material; that dossier must declare an exact cutoff and leave the successor's current implementation in the successor directory.
- Traditional design tools are outside the current scope unless they have an AI-native product/workspace represented here.

### Coverage audit

The v0.1 registry was re-audited against the named products and projects collected during the research thread. Important canonicalization decisions:

| Name encountered during research | Canonical entry |
|---|---|
| Create | [Anything](projects/anything/) |
| MGX / MetaGPT X | [Atoms](projects/atoms/) |
| TRAE SOLO | [TRAE Work](projects/trae-work/) |
| Devin Desktop / cloud Desktop mode / installable Devin PWA | [Devin](projects/devin/) |
| Windsurf Editor through 2026-06-01 | [Windsurf](projects/windsurf/) as a bounded historical entry; post-rename Devin Desktop belongs to [Devin](projects/devin/) |
| Cursor Design Mode | [Cursor](projects/cursor/) |
| Codex Browser / Annotations / Sites / Product Design workflows | [Codex](projects/openai-codex/) |
| v0 Design Mode | [v0](projects/vercel-v0/) |
| Uizard Autodesigner | [Uizard](projects/uizard/) |
| Canva AI / Magic Design | [Canva Magic Design](projects/canva-magic-design/) |
| Galileo AI / `usegalileo.ai` historical product | [Galileo AI](projects/galileo-ai/) as a bounded historical entry; the current redirect destination and active product belong to [Stitch](projects/google-stitch/) |
| Motiff UI Editor / later Motiff AI generator | [Motiff](projects/motiff/) as one two-era historical dossier: UI Editor ended 2025-08-22, Motiff AI went offline 2026-06-23, and announced export ends 2026-10-31 |

### Research depth

Coverage and evidence depth are tracked separately. A directory existing in the registry does **not** mean its technical dossier is complete. Completion follows the available evidence ceiling: source-visible projects require implementation tracing, while a closed product can be complete only after its official behavior, public architecture/protocol edges, observable failure boundaries and consequential unknowns have been exhausted for the current snapshot.

| Depth | Meaning | Count in current snapshot |
|---|---|---:|
| **Source-level** | Open/source-available implementation pinned to a concrete commit and traced through the project's decisive product and technical questions, relevant implementation paths and failure boundaries, with commit history used where it changes the conclusion | **18** |
| **Architecture-level / closed-source boundary reached** | Closed implementation, but the decisive user journey, working artifact authority, public runtime/protocol boundaries, delivery and persistence semantics, documented failures, live observable edges and unresolved internals are explicitly established without invented source claims | **14** |
| **Seed, Product-level or unfinished Architecture-level** | Product is registered and independently documented, but its available public evidence has not yet been exhausted around the project's decisive questions | **31** |

Current source-level dossiers:

- [Onlook](projects/onlook/)
- [stagewise](projects/stagewise/)
- [Tuna](projects/tuna/)
- [Nimbalyst](projects/nimbalyst/)
- [OpenPencil (`open-pencil/open-pencil`)](projects/open-pencil/)
- [OpenPencil (`ZSeven-W/openpencil`)](projects/openpencil-zseven/)
- [Reframe](projects/reframe/)
- [Puck](projects/puck/)
- [onUI](projects/onui/)
- [Open CoDesign](projects/open-codesign/)
- [Agentation](projects/agentation/)
- [Code Inspector](projects/code-inspector/)
- [Open Design](projects/open-design/)
- [Monet](projects/monet/)
- [Superdesign](projects/superdesign/)
- [Figwright](projects/figwright/)
- [mcp_excalidraw](projects/mcp-excalidraw/)
- [Codex](projects/openai-codex/)

Current evidence-bounded closed-source dossiers:

- [Claude Design](projects/anthropic-claude-design/)
- [Replit Design](projects/replit-design/)
- [QoderWork Design](projects/qoderwork-design/)
- [TRAE Work Design](projects/trae-work/)
- [Cursor](projects/cursor/)
- [Tencent CodeBuddy](projects/tencent-codebuddy/)
- [Baidu Comate](projects/baidu-comate/)
- [Devin](projects/devin/)
- [Windsurf](projects/windsurf/) — historical boundary through 2026-06-01
- [Diagram](projects/diagram/) — historical product family through the 2023 Figma acquisition
- [Galileo AI](projects/galileo-ai/) — historical product whose legacy domain now redirects to Stitch
- [Motiff](projects/motiff/) — UI Editor through 2025-08-22, later Motiff AI through 2026-06-23 and export through 2026-10-31
- [Stitch](projects/google-stitch/) — closed hosted core with public MCP, SDK, DESIGN.md specification/CLI, Agent Skills and Gemini CLI extension boundaries
- [Google Antigravity](projects/google-antigravity/) — closed desktop/IDE/CLI and Go harness core with an open Python control layer and a managed Gemini API agent boundary

### Project-specific dossier design

Every dossier keeps a small common evidence floor: verified identity and lifecycle, canonical sources, an explicit evidence boundary, research gaps, and immutable revisions for source-derived claims. Everything between those anchors is project-specific.

Examples of questions that can determine a dossier's structure:

| Project shape | Questions that should lead the document |
|---|---|
| Agent design workspace | What is the ordinary-user loop, who owns execution authority, what becomes the durable artifact, and how is it delivered or recovered? |
| Code-native visual editor | What is canonical—source or a design document—how is it rendered, how does a selected element regain identity, and where is a mutation written? |
| Feedback/annotation bridge | What context is captured, how stable is the target, what survives transport to the agent, and what is persisted or lost? |
| Compile-time source locator | Which files are transformed, what identity is injected, how is it resolved at runtime, and which framework/build cases break the chain? |
| Canvas/object editor | What graph or schema owns truth, which operations mutate it, how do renderers project it, and how do undo, collaboration and versioning compose? |
| Closed or historical product | What user-observable journey and public contracts are established, what changed over time, and which internal claims must remain unknown? |

These are prompts, not archetype templates. The final headings should expose the particular system's causal structure rather than demonstrate that every checklist label was filled.

## Panorama

```mermaid
flowchart TD
    L[AI-Native Design Landscape]
    L --> A[Agent-first design surfaces]
    L --> B[Coding agents with visual/design workflows]
    L --> C[AI app builders with visual editing]
    L --> D[Code-native visual surfaces]
    L --> E[Agent-controllable canvases & design editors]
    L --> F[Design/code bridges & MCP integrations]
    L --> G[Open & source-available interaction and source-return primitives]
    L --> H[Historical & transition cases]
    L --> I[Domain-specific creative runtimes]
```

The project index is the ecosystem view; completed deep dossiers also support an implementation-oriented reading across products:

```mermaid
flowchart LR
    I[Human intent] --> A[Artifact or source of truth]
    A --> R[Runtime projection]
    R --> M[Target and source mapping]
    M --> D[Deterministic build-time identity]
    M --> S[Preview-time structural re-addressing]
    M --> H[Heuristic runtime context]
    M --> C[Import-time compiled identity]
    M --> N[Native document-node identity]
    M --> J[Join-time semantic reconciliation]
    D --> X[Agent interface]
    S --> X
    H --> X
    C --> X
    N --> X
    X --> P[Persistence and versions]
```

These axes distinguish prompts, annotations and direct manipulation; source files, canvas graphs and feedback sessions; DOM, iframe, canvas and native renderers; selectors, component identities and source maps; file tools, MCP and product protocols; and browser storage, databases, snapshots and version graphs. Each dossier pins those distinctions to evidence instead of treating every visible canvas as the same architecture.

Six distinct target-return mechanisms are now established in the current source-level dossiers; this is an evidence-backed starting taxonomy, not an exhaustive claim about the landscape. Code Inspector and Open Design try to return a preview target toward authored source, Agentation transports heuristic runtime context, Reframe returns exported DOM to an imported graph identity, OpenPencil never leaves its canonical design-document identity domain, and Figwright reconciles native Figma identities with repository-level semantic candidates at join time:

| Target-return route | Established implementation | Identity delivered downstream | Known break |
|---|---|---|---|
| Deterministic build-time identity | [Code Inspector](projects/code-inspector/) rewrites eligible framework source during bundling | file, line, column and node name carried on the rendered element | untransformed/failed files and unresolved multi-root call sites lose or downgrade the mapping |
| Preview-time structural re-addressing | [Open Design](projects/open-design/) parses HTML for its rich preview, prefers authored element ids and adds body-relative child-index paths before re-parsing persisted HTML for bounded patches | authored `data-od-id` or a structural HTML path plus DOM/text/style context | generated paths drift after structural edits; runtime-only DOM and heuristic comment targets do not become component-source identity |
| Heuristic runtime context | [Agentation](projects/agentation/) inspects DOM/React runtime structures while the page is running | DOM context plus optional React hierarchy and file hint | file hints are environment-dependent and do not survive its default SQLite + common MCP projection |
| Import-time compiled identity | [Reframe](projects/reframe/) hashes content-aware DOM paths into `h:` INode ids and re-emits them as `data-reframe-inode` in the HTML canvas | a selected exported DOM element returns to the compiled `SceneGraph`; `NodeMeta` retains structural import provenance | anonymous/duplicate-key ordering can retarget ids, there is no file/line mapping, and the primary MCP recompile path currently bypasses the replay overlay |
| Native document-node identity | [OpenPencil (`ZSeven-W/openpencil`)](projects/openpencil-zseven/) copies each canonical `.op` node ID into its resolved paint scene; paint and hit testing consume that same refreshed scene | the selected canvas target is already the canonical design-document node addressed by editor commands and MCP | the identity ends at the `.op` boundary; conversion provenance and generated code do not create a live reverse pointer to original application source |
| Join-time semantic reconciliation | [Figwright](projects/figwright/) groups Figma instances by main component, scans repository components/tokens/icons, then joins names, props and values with explicit map-file overrides | a tool result can associate Figma instance ids with a candidate component file, or design tokens/icons with repository refs/assets | fuzzy evidence is not a source line or AST identity; durable overrides are keyed by unnamespaced Figma names, and no cross-artifact transaction proves that the agent used the candidate |

[Superdesign](projects/superdesign/) adds an equally important negative result: selected source snippets can condition a hosted HTML draft and a coding agent can later implement that draft, but the public workflow carries no canvas-element identity back to an application file or component. Workflow continuity is not target-return identity.

[Figwright](projects/figwright/) establishes the inverse nuance: native Figma node ids can survive reads, writes and design baselines, while repository joins can return a semantic code candidate, yet the two facts still do not create a durable node-to-code-AST binding. Semantic reconciliation is stronger than an ungrounded prompt and weaker than source identity.

[mcp_excalidraw](projects/mcp-excalidraw/) adds another negative boundary: a coding agent can inspect a repository, draw a diagram and commit the exported <code>.excalidraw</code> file beside source, but the canvas carries no repository scan, component join or node-to-file identity. A repo-native artifact is not automatically source mapping.

[Codex](projects/openai-codex/) establishes a tool-supplied visual-context boundary: the public harness carries images as data or paths and client-supplied context as opaque classified strings, while review comments can address Git diff lines. None of those public types standardizes a rendered DOM/design node back to an authored file or AST location. Rich visual feedback can guide a repair without becoming durable target-return identity.

[Claude Design](projects/anthropic-claude-design/) establishes the corresponding closed-product boundary. Its public surface can click-target a canvas element, directly manipulate layout and let Claude create adjustment sliders for the current artifact, but no public contract exposes the selected node identity, slider representation or a reverse binding to design-system source or code. Precise human targeting and an artifact-specific generated editor are product facts; durable target-return identity is still unknown.

[Replit Design](projects/replit-design/) establishes a stronger closed-product target-return contract without disclosing its mechanism: an eligible rendered element can jump to its source location, and deterministic text/style/layout/image edits update source directly. Reused or loop-rendered elements may update every instance, while hidden complexity routes to Agent. This proves visual-target-to-source behavior at the product boundary, but not the injected identity, framework adapter, AST patch or conflict semantics; it does not increase the six source-inspected mechanism count.

[QoderWork Design](projects/qoderwork-design/) establishes a different closed boundary: lasso/annotation grounds an Agent edit to a Canvas region and Nudge exposes generated design parameters, while Design Files remain directly editable. No public contract returns a selected region or Nudge parameter to a stable file/range/AST identity or exposes its writeback. Grounded visual correction and parametric control are not yet source mapping.

[TRAE Work Design](projects/trae-work/) adds structured design-system provenance without closing the target-return loop. Its anonymously visible Design Library exposes token projections, component DOM anatomy, assets, coverage and provenance, but the package itself labels component contracts as medium-confidence preview evidence rather than original design intent. No public identity joins those contracts to a generated canvas node, imported Figma node or Code Mode file. Executable design-system grounding is not canvas-to-source mapping.

[Cursor](projects/cursor/) exposes the strongest inspectable closed-client runtime packet in this snapshot without crossing into deterministic source identity. Its shipped protocol carries element label, a field named `xpath`, text, JSON extras, component and optional props; the inspected picker actually fills `xpath` with a CSS-like tag/id/class/sibling path and gives nodes session-local `WeakMap` ids. Framework stacks, geometry, styles and screenshots help Agent search, but no file, range, module, source-map location or repository revision reaches the packet. Cursor therefore sharpens the heuristic-runtime-context category without increasing the six source-inspected mechanism count.

[Tencent CodeBuddy](projects/tencent-codebuddy/) exposes two different closed-client negative boundaries. Its Figma path stores generated HTML, resources and an optional screenshot under selection-keyed workspace paths before passing them to Agent, while its Preview path narrows a runtime element to HTML, a synthetic range in serialized page markup and optional DOM-editor deltas. A normal localhost target contributes no authored file path; the DOM Editor first patches the live element and only then asks Agent to implement CSS in project files. Figma node ids and runtime coordinates improve grounding, but neither path yields a durable file/range/AST identity or reverse sync.

[Baidu Comate](projects/baidu-comate/) establishes a stronger optional closed-client return path. Its Preview picker can inherit `data-comate-source-path` from the selected element or an ancestor, navigate to a real file/line/column and use that hint for direct style/text rewrites or Agent-led general edits. Yet the installed client exposes the reader rather than the annotation producer, its own edit prompt calls coordinates search starting points rather than exact identity, and no file revision guards against HMR or concurrent change. Normal Figma input remains a generated HTML/assets/token context mediated by a system Skill, not a native node-to-source binding. Comate therefore strengthens source-addressed runtime repair without increasing the six source-inspected mechanism count.

[Devin](projects/devin/) adds a closed-client runtime-context boundary across two different visual planes. Cloud Computer Use observes screenshots and acts on a remote Linux/Windows desktop, then can return a focused recording; local Devin Desktop Preview sends an HTML ancestor path, outer HTML, geometry, computed CSS and an optional clipped screenshot to local, remote or ACP agents. The inspected Preview packet contains no file, range, component, source-map or repository revision, while cloud screen coordinates never claim source identity. Visual execution proof and richly structured DOM context can improve a repair without becoming target return.

The bounded historical [Windsurf](projects/windsurf/) dossier fixes the lineage behind that local Preview category. The final Windsurf-branded `2.3.15` main process uses Electron debugging and CDP `DOM`/`CSS`/`Overlay`/`Runtime` calls to turn a clicked element into ancestor path, attributes, HTML, computed styles, geometry and an optional clipped screenshot before Cascade searches source. Its outgoing packet likewise has no authored file/range/component/source-map/revision identity. This establishes that the runtime-context mechanism predates the Devin Desktop name; it refines product history rather than adding a seventh source-inspected mapping mechanism.

[Diagram](projects/diagram/) adds a historical **forward binding** that should not be counted as source return. Prototyper turned each Figma layer into a JavaScript variable for a closed plugin bridge and rendered Framer Library interactions in a live preview; no public contract maps that runtime back to repository source or even establishes how the code/layer binding survives rename, reload or handoff. The same dossier also fixes Magician's narrower Text Review boundary: Figma's host event carries text and returns suggestion ranges, while the proprietary plugin/model binding remains closed.

[Motiff](projects/motiff/) adds a read-only node-addressed projection without creating source return. Its public MCP package sends a Motiff `docId` and selected `nodeId` to hosted asynchronous HTML or screenshot tasks, then passes the result to an external coding agent. The package exposes no Motiff write tool, descendant-node-to-HTML identity or binding from generated application code back to the design file. Addressing a source frame for export is stronger than an ungrounded screenshot and still weaker than roundtrip identity.

[Stitch](projects/google-stitch/) exposes a different closed-core boundary. Its public SDK types retain XPath and bounding-box annotations inside generated screens and XPath-to-screen links inside prototypes, while the open React skill preserves only a screen-level ledger before decomposing downloaded HTML into a new component tree. Static code import first removes scripts and uploads a rendered document, so neither direction carries original file/range/AST identity through the hosted graph. Source-inspected clients make this loss visible, but they do not make the proprietary product a seventh source-return implementation.

[Google Antigravity](projects/google-antigravity/) adds a visual-verification boundary rather than another source-return mechanism. Browser screenshots, recordings and walkthroughs can prove that an agent observed and exercised a running application, but no public artifact or browser schema carries a rendered target back as a stable authored file, range, component, source-map location or repository revision. Local folders/worktrees remain implementation authority; in the managed Gemini API, the remote environment filesystem does. Pixel evidence improves acceptance without becoming target identity.

The dossiers now also establish twenty-one different durable-refinement models. “Structured” does not by itself mean that every product has one equivalent source of truth:

| Durable-refinement model | Established implementation | Durable center | Known break |
|---|---|---|---|
| Canonical design document | [OpenPencil (`ZSeven-W/openpencil`)](projects/openpencil-zseven/) edits one typed `.op` document and projects it into paint scenes and exports | the `.op` document; editor commands, save, undo and collaboration all converge on its node ids | imported/generated code is an asymmetric conversion, not a continuously bound second authority |
| Materialized compile plus rebuild layers | [Reframe](projects/reframe/) keeps a live INode graph and SceneJSON snapshot, with optional HTML source and a partial JSONL edit overlay | current scene snapshot for restart; HTML + replay only for supported regeneration paths | the main MCP compile does not currently replay the overlay, structural edit coverage is incomplete and some graph side-channel metadata is not serialized |
| Filesystem-native deliverable | [Open Design](projects/open-design/) delegates execution to an installed agent and treats project files as the artifact, with optional manifests and per-file versions | canonical project files in the daemon project root or an explicitly imported folder | provider events are not artifact proof; render/edit bridges remain artifact-type-specific and must guard external file changes |
| Thread ledger plus workspace and Git clocks | [Codex](projects/openai-codex/) persists replayable thread JSONL, lets tools and external processes mutate the selected workspace, and uses Git/worktrees for reviewable isolation and versions | the intended workspace files and Git state are the artifact; rollout JSONL preserves orchestration history and SQLite is a rebuildable query projection | resuming a thread does not restore files, streamed turn diffs cover exact tracked patch deltas rather than every side effect, and worktrees do not merge or publish themselves |
| Split repository repair and managed Canvas sources | [Cursor](projects/cursor/) uses a running app only as visual context for Agent edits to repository/worktree files, while a separately created Canvas is managed user-home `.canvas.tsx` with optional `.canvas.data.json` state and an explicit published snapshot | repository files and Git for Browser Design Mode; managed Canvas source/sidecar for Canvas Design Mode; the uploaded share after delivery | runtime targets are session-local and can stale under HMR, Canvas is outside the application repo by default, host actions are fire-and-forget and no transaction joins code, Canvas state, worktree or share |
| Path-bound multi-artifact workspace | [Monet](projects/monet/) combines a live timeline store, `.aiveproj.json`, hashed autosave, path-keyed Canvas sidecar, absolute media references and generated source/renders | live `ProjectStore` for editing/export; project file and newer autosave for timeline recovery | Canvas is outside the project file, relocation changes its lookup key, external media is not bundled and MCP mixes live calls with direct disk writes |
| Hosted draft graph with local context staging | [Superdesign](projects/superdesign/) reduces a repository into selected context files, then keeps branchable draft nodes and per-node HTML versions on its hosted service | remote project/draft/version graph during design; application source becomes durable only through a later coding-agent implementation | context snippets are evidence inputs rather than source links, the hosted renderer/backend is closed and implemented code can diverge from the approved HTML draft |
| Hosted multi-format project with inferred organization constraints | [Claude Design](projects/anthropic-claude-design/) derives a reusable design system from heterogeneous organization assets, then keeps chat, canvas corrections, saved directions, sharing and exports around a hosted project | the hosted project is the working editing center; the published organization design system governs later projects and each export/handoff creates a new delivery authority | internal project and version schemas are closed, projects are not publicly pinned to an exact design-system revision, and no lossless roundtrip or downstream reverse sync is established |
| Hosted visual branches plus Git-backed application state | [Replit Design](projects/replit-design/) keeps Design frames and live Artifact previews on one hosted Project Canvas, writes eligible direct edits to source, and uses Agent checkpoints when a frame becomes or rewrites an Artifact | Project files and Git own runnable implementation; checkpoints add Agent/context/database recovery; Canvas owns visual branches and layout | public checkpoint fields do not explicitly include complete Canvas state, so Git recovery cannot be equated with visual-branch recovery and frame-to-Artifact Build is not a live binding |
| Task-bound engineering files with opaque visual side state | [QoderWork Design](projects/qoderwork-design/) can bind a task to one local Working Folder, write HTML/React files, retain task conversation and artifacts, and place Design Plan, Canvas, Preview and Nudge around that file-producing run | local folder files are the handoff authority; the task ledger retains context and artifacts | the folder is optional, Canvas/plan/Nudge serialization and atomic versioning with files are undisclosed, and QoderWork Awareness memory is a separate persistence domain |
| Design-library-grounded hosted artifact with plural exits | [TRAE Work Design](projects/trae-work/) conditions a hosted canvas with an agent-readable package of tokens, components, previews, UI kits, provenance and authoring rules, then exits to Figma, raster images, Code Mode or static deployment | the hosted task/canvas is the editing center; the Design Library is reusable generation evidence; each destination becomes its own authority | no public Design revision graph or library pin joins task, canvas, local/cloud files, memory, Git worktree and destination state atomically |
| Native external document with repository-side reconciliation aids | [Figwright](projects/figwright/) mutates the open Figma file while optionally storing verified name mappings and per-node context baselines in the application repository | Figma owns durable design state; application files own implementation; `docs/figma-*-map.md` and `.figwright/snapshots/` support later reconciliation | the aids are not a mirrored document: map keys lack file identity, snapshots are keyed only by node id, and neither establishes a shared Figma/code transaction |
| Native document plus portable automation program | [Diagram](projects/diagram/) Automator interprets a recursive `command`/`metadata`/`actions[]` JSON tree against the current Figma file, while definitions can be exported, remixed or cloud-synced separately | the Figma document owns design output; JSON/team/community copies own the reusable procedure | the pinned schema has no version field or secret type, remote/selection inputs vary, and no transaction binds one definition/run to a Figma file version or rolls back partial mutations |
| Hosted screen-lineage thread with destination forks | [Galileo AI](projects/galileo-ai/) groups generated variants under a bot message, carries refinement through `based_on_screen_id`, retries selected screen ids and regenerates message screens under a shared theme | the hosted chat/message/screen lineage is the editing center; public pages and pasted Figma content are separate projections or forks | no immutable version/rollback contract is public, theme regeneration can partially fail, account termination can destroy content and no transaction or reverse identity joins the thread, public share and Figma document |
| Native design document with AI side state, followed by a hosted generator center | [Motiff](projects/motiff/) let AI Layout promote a temporary inferred hierarchy, AI Reduplication read an asynchronous organization index and AI Design Systems promote candidates into native libraries; its later generator coordinated multiple screens before exporting each code screen separately | the native file/library/version graph in the UI Editor era; the hosted Motiff AI project in the generator era; the actual Figma/code/image artifact after exit | temporary layout can be discarded, retrieval can be stale, candidates require human publication, version restore excludes comments/libraries, code exits split screens and both hosted centers reached separate shutdown cliffs |
| Hosted project graph with source screens, canvas instances and design assets | [Stitch](projects/google-stitch/) lets the human canvas, Design Agent, remote MCP and SDK address one project while `DESIGN.md` and Agent Skills move design intent or snapshots across the boundary | the hosted project is the editing center; source screens own downloadable outputs, instances own canvas placement, design assets own reusable intent and each export becomes a new authority | project/screen history is not public, asset version is the only explicit version field, defaults do not update existing screens and imported/exported code has no element-level reverse identity |
| Volatile canvas with explicit interchange checkpoints | [mcp_excalidraw](projects/mcp-excalidraw/) keeps live elements, snapshots and image files in one local process, then materializes deterministic Excalidraw or Obsidian files on demand | an explicitly exported <code>.excalidraw</code>/<code>.excalidraw.md</code> file; PNG/SVG are visual deliveries | restart loses live state, named snapshots are process-local and shallow, files have a separate lifecycle, and an open browser tab can become an unintended shadow copy |
| External-design and runtime-context convergence on checkpointed files | [Tencent CodeBuddy](projects/tencent-codebuddy/) materializes Figma selections as local HTML/resources/screenshots, turns Preview selections and DOM-editor deltas into Agent context, and imports Miora bridge results as files | application files and Git are the implementation authority; automatic file checkpoints add recovery, while Figma/Miora caches, plans, chat, global memory, Preview and deployment retain separate clocks | re-export can mix refreshed HTML with a retained screenshot, runtime targets stale under reload/HMR, and no transaction joins visual sources, context caches, file checkpoint and delivery |
| Skill-mediated design context plus hybrid source-addressed repair | [Baidu Comate](projects/baidu-comate/) materializes Figma HTML/assets/tokens under temporary and `.comate` context, while Preview can carry an optional source hint into direct style/text rewrites or Agent-led general edits | workspace files and ordinary Git state are the implementation authority; design providers, F2C cache/rules, Spec/Mission, Memory, conversation recovery and Preview retain separate clocks | multiple Figma inputs share first-context configuration, source hints can be absent/inherited/stale, direct rewrites are tag/line heuristics, and no transaction joins design revision, working tree, runtime and delivery |
| Snapshot-booted cloud execution plus local/cloud Git convergence | [Devin](projects/devin/) boots each cloud session from an organization snapshot, lets local agents work in a checkout/worktree, and transfers bounded context into separate cloud VMs whose reviewable result is a branch/PR | local files/Git or the cloud branch/PR are implementation authority; snapshot, session VM, queue, browser state, recording, plan, checkpoint and Space retain distinct clocks | session changes do not persist to the snapshot, worktrees require preservation/merge, handoff omits or truncates local state, and no suite-wide rewind joins machines, Git and visual evidence |
| Multi-surface harness over direct, worktree and managed-environment authorities | [Google Antigravity](projects/google-antigravity/) coordinates plans, diffs, screenshots, recordings, conversations, subagents and schedules across 2.0, IDE, CLI, SDK and a managed API agent | local folder/Git state or the active conversation worktree for local work; the remote environment filesystem until API output is exported; artifacts and transcripts remain evidence/control state | mixed Projects can share non-Git folders, conversations are not automatically shared across surfaces, CLI forks do not isolate Git, remote environments expire and no suite-wide rewind joins files, worktrees, artifacts, sidecars and interactions |

The same evidence separates **having an agent interface** from **converging on one mutation authority**:

| Control-plane convergence | Established implementation | Agent/direct-edit relationship | Failure boundary |
|---|---|---|---|
| Native-document convergence | [OpenPencil (`ZSeven-W/openpencil`)](projects/openpencil-zseven/) addresses the same canonical `.op` nodes from editor commands and MCP | human selection, paint scene and agent commands retain one document-node identity | conversion provenance ends at the `.op` boundary rather than roundtripping to original app source |
| Filesystem convergence with verification | [Open Design](projects/open-design/) lets agents and artifact bridges converge on project files | file fingerprints/content diffs, not provider events, establish that the artifact changed | different artifact render/edit bridges still have type-specific fidelity and external-change boundaries |
| App-Server-mediated workspace convergence | [Codex](projects/openai-codex/) gives rich clients one thread/turn/item and approval protocol around tools acting in an explicit cwd/workspace | CLI and rich clients can coordinate commands, patches, review and visual context while the actual mutation lands in workspace files | client-specific visual context creates no public DOM-to-source identity, arbitrary command/external writes exceed exact patch-diff tracking, and approval is not rollback |
| Dual visual-context convergence on separate sources | [Cursor](projects/cursor/) turns a human Browser selection into Agent context for repository edits, and a Canvas selection into Agent context for edits to managed `.canvas.tsx`; browser automation is a separate MCP control plane | both gestures rely on Agent materialization, but Browser changes converge on application files while Canvas changes converge on Canvas source/sidecar | the structural path and session-local id can stale, no source range travels with the target, parallel agents expose no visual precondition and Canvas host actions provide no completion receipt |
| Live-graph convergence with partial replay | [Reframe](projects/reframe/) shares the current `SceneGraph` across MCP and Platform UI | direct manipulation and agent tools see one in-memory graph | not every mutation joins the replay log, and the primary compile route currently bypasses replay |
| Split live/file/sidecar control | [Monet](projects/monet/) routes CLI/HTTP mutations to a live store but lets six MCP tools rewrite the project JSON directly; Canvas persists separately | nominally one agent server can operate three authorities | UI saves can overwrite disk-only MCP edits, disk reads can be stale, Canvas acknowledgements precede renderer persistence and fixed MCP port/file discovery can miss the live project |
| Hosted-draft convergence, downstream source rewrite | [Superdesign](projects/superdesign/) gives web UI and CLI operations common remote project/draft/version identities | agent commands and canvas review converge on the hosted draft, then a coding agent separately writes the application repository after approval | no shared transaction or reverse identity joins the approved HTML head to the resulting framework code |
| Hosted-project convergence with generated controls | [Claude Design](projects/anthropic-claude-design/) brings chat, element comments, direct manipulation, Claude-created sliders and an OAuth-scoped read/write MCP edge to the same hosted design project | users can move between semantic, targeted, continuous and direct corrections before sharing, export or Claude Code handoff | public evidence does not prove one durable node identity or transaction across those paths; comments can be lost, simultaneous editing is basic and downstream handoff has no documented reverse binding |
| Deterministic source edit plus checkpointed Agent materialization | [Replit Design](projects/replit-design/) lets Visual Editor patch eligible source directly, routes hidden complexity to Agent, and asks Agent to create/rewrite an Artifact from a selected Design frame | simple edits converge on project source; Build/apply converges on the Artifact through a checkpointed Agent task | direct-edit classification and mapping internals are closed, reused instances broaden write scope, and no shared identity or transaction keeps the source Design frame synchronized with the resulting Artifact |
| File-centered workspace with opaque visual and parametric bridges | [QoderWork Design](projects/qoderwork-design/) lets Agent writes and direct Design Files edits converge on engineering source while lasso/annotation and Nudge operate through the Canvas | source files remain available for inspection and handoff; visual targeting can ground a requested change without replacing the file artifact | no public contract exposes target identity, Nudge writeback or dirty-file conflict behavior, and stopping a run is not documented as transactional rollback |
| Hosted-artifact convergence with an executable library contract | [TRAE Work Design](projects/trae-work/) lets conversational edits, comments and a CSS-property GUI refine one hosted Design artifact while the Design Library supplies routed token/component/preview evidence | direct and agent-guided corrections meet in the current canvas; Code Mode is a later materialization path | canvas patch/rollback semantics are closed, no node-to-library/code identity is public, and later Figma/code/deployment exits have no documented reverse sync |
| Read-only native-frame projection into external code authority | [Motiff](projects/motiff/) accepts a native document/frame id, asynchronously exports inline-CSS HTML or a screenshot through its public MCP adapter and lets the calling IDE agent implement it | human edits remain in the Motiff file while agent changes land only in the external repository | the two MCP tools cannot mutate Motiff, complex or layer-heavy frames lose fidelity, package/server versions diverge and no transaction or reverse identity joins design revision and code |
| Hosted-resource convergence across human, agent and programmable clients | [Stitch](projects/google-stitch/) gives the canvas, Design Agent, destructive MCP tools and an SDK compatible project/screen/design-system resources; Agent Skills add repository-side capture and materialization | native operations converge on hosted resource IDs, while `DESIGN.md` can carry intent between agents and tools | instance and source-screen identities differ, long-running writes lack public idempotency/session recovery, and no transaction joins the hosted mutation to original code or any exported destination |
| Native-Figma convergence with downstream provider split | [Figwright](projects/figwright/) routes human-visible plugin activity and agent tools to nodes in the same open Figma file, while Figma-to-code hands grounded context to an external coding agent | direct Figma edits and plugin writes converge on the native document; repository output is a later provider-authored artifact | server/plugin feature skew can make a write partial, activity-based file routing is not an explicit file id on every call, and code generation has no shared commit with the Figma mutation |
| REST-centered convergence with browser full-scene return | [mcp_excalidraw](projects/mcp-excalidraw/) routes CLI, MCP and raw HTTP to one in-memory canvas server while the browser projects and edits the same scene | agent-side granular writes and human browser edits normally meet in the server element map | browser edits replace the complete map after a debounce; no scene revision or transaction prevents a stale tab or partial multi-operation call from overwriting earlier work |
| Dual visual-context convergence on one project workspace | [Tencent CodeBuddy](projects/tencent-codebuddy/) routes an external Figma export and a selected running DOM through different context schemas to the same Agent file-writing authority; Miora contributes a third ordinary-file input | Figma is a one-way HTML/resource/screenshot materialization, while DOM Editor performs a temporary runtime patch before Agent edits source | neither target carries deterministic source identity, parallel tasks can observe different runtime/file states, and a checkpoint cannot rewind the external design, cached context or deployment |
| Hybrid direct/Agent convergence with optional source hints | [Baidu Comate](projects/baidu-comate/) routes Figma context through the `figma2code` Skill to Agent, while Preview routes supported style/text edits through a local source rewriter and compound edits through Agent | both mutation paths converge on workspace files; a clean rebuilt Preview is the shared verification surface | the source annotation producer and coverage are closed, direct rewrites use AST/line heuristics, Agent targets are advisory, and preview overlays can look correct before durable source exists |
| Command-center convergence over plural machines | [Devin](projects/devin/) places Devin Local, Cascade, cloud Devin and ACP agents in one Kanban/Space surface while each route retains its own workspace or VM | local agents mutate the main checkout/worktree; cloud sessions mutate their own checkout and return a branch/PR; shared Space context coordinates rather than merges | sessions can see different revisions, Preview context has no source identity, handoff is lossy and a “finished” control state does not prove file or PR delivery |
| Harness-level coordination over plural authorities | [Google Antigravity](projects/google-antigravity/) gives desktop, IDE, CLI, SDK and managed API surfaces related planning/tool/subagent concepts while Project modes and environments choose where execution lands | plan/diff/artifact feedback coordinates agent writes, but the actual convergence point is a direct folder, a Git worktree or a hosted environment rather than the conversation itself | shared-core claims do not share conversations or machines, mixed folders weaken isolation, permissions/hooks vary by surface and task completion does not integrate or export the result |

The dossiers now separate twenty-one artifact-production profiles that can all look like “the agent made a design” at the UI level:

| Artifact production profile | Established implementation | Durable result | Verification boundary |
|---|---|---|---|
| Filesystem-native agent run | Open Design launches a selected CLI/ACP agent in the resolved project workspace and fingerprints files before/after the run | canonical project files plus optional manifests and per-HTML versions | provider tool events are insufficient by themselves; a real content/file diff is the evidence that an artifact changed |
| Stream-to-file materialization | Open Design parses complete supported `<artifact>` blocks from a plain/BYOK adapter | HTML, CSS, SVG or Markdown written through the same project-file API with a generated manifest | incomplete, fenced or unsupported blocks are not a durable artifact merely because text streamed in chat |
| Thread-coordinated workspace mutation with visual verification | [Codex](projects/openai-codex/) accepts reference images or client/tool context, executes commands and patches under workspace authority, then lets a user inspect a runtime, file preview or Git review | the actual application/document files and intended Git state | a completed turn, image observation or streamed diff is insufficient; acceptance requires repository inspection, the relevant deterministic checks and a real render/visual pass |
| Runtime-targeted repository repair | [Cursor](projects/cursor/) packages a selected running element or frozen region with DOM/framework/style/geometry context and a screenshot, then asks Agent to locate and edit authored code | application files in the active checkout/worktree and the eventual Git result | an accurate visual packet can still lead to the wrong shared component or file; HMR and parallel edits stale the target, so acceptance requires a real final runtime and diff review |
| Managed interactive Canvas authoring | [Cursor](projects/cursor/) lets Agent create a React/TypeScript Canvas, refine it through prompts/source/Design Mode, persist keyed sidecar state and explicitly publish a team snapshot | user-home managed `.canvas.tsx`, optional `.canvas.data.json`, and the separately refreshed read-only share | the artifact is not automatically Git-owned, sidecar/share completeness is unpublished, prompt buttons are fire-and-forget and a rendered/opened Canvas does not prove fresh data or downstream application changes |
| Hosted draft then agent implementation | Superdesign generates or imports a versioned HTML draft, obtains human approval on the hosted canvas, then asks the calling coding agent to implement it | remote HTML/version history plus whatever application files the downstream agent actually writes | a completed draft job proves neither that repository files changed nor that the implementation preserved the approved design |
| Hosted multi-format design with downstream exits | Claude Design builds a hosted result under an inferred organization design system, then exposes HTML/ZIP, PDF, PPTX, partner transfers and Claude Code handoff | the hosted project while editing; the actual exported file, destination-native object or repository after exit | preview success is not export fidelity, different formats preserve different semantics, and a successful handoff proves neither production readiness nor durable canvas-to-source identity |
| Visual branch to checkpointed Project Artifact | [Replit Design](projects/replit-design/) explores sibling Design frames, then asks Agent to create a new Artifact or rewrite an existing one inside the same Project | runnable source and the resulting Artifact, with an Agent checkpoint before/after materialization; the Design frame remains a reference | an interactive mockup is not app behavior, Build is not a proven live frame/source binding, and acceptance requires inspecting the running Artifact for translation, responsive and functional gaps |
| Plan-contracted runnable design project | [QoderWork Design](projects/qoderwork-design/) can turn answers and a visible Design Plan into HTML/React source, then project it through Canvas and Preview before handing the folder/code to Qoder IDE | local Working Folder source when one is bound, or task-retained artifacts when it is not | direct Run can skip the plan, the screenshot-visible `.design.json` contract is unpublished, Preview is not production acceptance, and Handoff/branch mechanics remain closed |
| Library-grounded hosted prototype with destination-specific exits | [TRAE Work Design](projects/trae-work/) generates and visually refines a clickable page under a routed token/component/preview package, then exports Figma, JPG/PNG, Code Mode context or an optional static deployment | hosted canvas during design; the actual native Figma document, image file, repository/runtime or static site after exit | package provenance does not prove original or generated-node identity, raster export flattens semantics, Code Mode requires runtime acceptance, and the optional BytePlus preview URL is temporary |
| Context-grounded provider implementation | Figwright serializes a selected Figma subtree, joins it to repository components/tokens/icons, and leaves framework code generation to the connected model | application source and exported assets actually written by the coding agent | a successful context or mapping call is not artifact proof; only a repository diff plus a rendered Figma comparison closes the loop |
| Plugin-mediated native-document mutation | Figwright's model issues typed writes through the local relay and public Figma Plugin API, with retry idempotency and an inverse-allowlisted batch | the open Figma document | a tool result can be unverified under plugin skew, batch rollback can itself be partial, and no simultaneous repository transaction exists |
| Recursive visual program to native-document mutation | [Diagram](projects/diagram/) Automator scopes nested Figma actions through `result`/`item`/`index`, conditions, loops and optional network fetches, then creates or rewrites native nodes/styles/file metadata | the changed Figma document plus the separately exportable automation JSON | one run depends on live selection, design-system and remote data; JSON can embed credentials, and a failed later action has no public atomic rollback contract |
| Hosted variant generation with clipboard-native-design fork | [Galileo AI](projects/galileo-ai/) turns text or image input, device and variant count into message-scoped screens, then supports parent-screen refinement, partial retry, theme regeneration and HTML clipboard export | the hosted screen lineage while editing; a destination-owned Figma document only after a successful user paste | message/screenshot/copy success does not prove every screen, recoverable history or Figma layer fidelity; public share is a narrower projection and no reverse sync joins the destinations |
| Structured-design mutation followed by per-screen generator exits | [Motiff](projects/motiff/) used reversible layout inference, organization-indexed duplication and human-promoted design-system candidates to modify native files, then later generated/refined hosted screens from prompts, images, files or canvas selections | native document/library in the editor era; hosted generator project while iterating; actual `.fig`, code folder, ZIP or image after shutdown export | AI side state is not file truth, Figma routes lose library/system semantics, MCP HTML is read-only and absolute-unit, every ZIP screen is a separate project, and no reverse sync or post-2026-10-31 recovery is documented |
| Hosted screen graph with snapshot and code forks | [Stitch](projects/google-stitch/) streams screens into a spatial project, groups variants, applies portable design intent and connects screen IDs through prototype XPaths before exporting selected material | hosted source screens and instances while editing; actual ZIP/code/Figma object, hosted-builder app or deployment after exit | App/Web is a persistent interpretation surface, generation can outlive its connection, static import strips scripts, React export creates a new AST and prototype links do not become destination routing automatically |
| Volatile canvas to deterministic diagram artifact | mcp_excalidraw lets an agent create/query elements, use a real browser screenshot to repair layout, then explicitly expand the compact agent model into a byte-stable Excalidraw/Obsidian file | the exported diagram file actually written to the selected path | live-scene success is not durability, structured description is not visual proof, browser writeback changes the graph shape, and a failed multi-step mutation can leave partial state |
| Exported design context plus runtime-targeted implementation | [Tencent CodeBuddy](projects/tencent-codebuddy/) exports selected Figma content into local HTML/resources/screenshot context, or packages a selected Preview element and DOM-editor intent, then asks Agent to implement the result | the project files actually changed by Agent and the provider-specific deployed result; `.codebuddy` exports are evidence inputs | an export, temporary correct-looking DOM patch or completed task is insufficient; acceptance requires current design comparison, real diff review, clean reload and final deployment validation |
| Skill-mediated design implementation plus source-addressed preview repair | [Baidu Comate](projects/baidu-comate/) gives Agent Figma HTML/assets/thumbnail/tokens under a project-aware Skill, or turns a rendered-element ledger into direct supported rewrites and general Agent changes | workspace files actually changed and the independently verified delivered result; Figma/cache/Preview state are evidence inputs | context acceptance, cursor navigation, a successful rewrite or Spec Summary is insufficient; acceptance requires diff review, clean rebuild, interaction checks and separate delivery validation |
| PR-centered remote execution with focused visual proof | [Devin](projects/devin/) boots a fresh cloud VM, edits/tests a repository, produces a branch/PR and can attach an edited Computer Use recording of one focused flow; local Preview separately supplies structured runtime context for local-file repair | the actual cloud branch/PR or local Git state; recording, Preview capture and session status are evidence/control objects | snapshot and VM state diverge, a short recording is not exhaustive or commit-bound, local Preview has no source identity, and handoff/Space do not make local and cloud files one transaction |
| Artifact-reviewed local or managed agent execution | [Google Antigravity](projects/google-antigravity/) gates plans and diffs through review, mutates a direct folder/worktree or managed environment, and can return screenshots, recordings and a walkthrough | the current local files and intended Git state, or the remote environment snapshot/result after explicit export; plans and visual artifacts are retained evidence | approval can precede writes, evidence can stale after later edits, recordings cover only selected paths, background descendants may still run and a completed remote interaction does not update a local checkout |

mcp_excalidraw also exposes a distribution-truth boundary that product matrices often hide. At the 2026-08-11 snapshot, its source manifest and README announce <code>2.0.0</code> and current containers carry that HEAD, while the recommended <code>npx</code> route still resolves to npm <code>1.1.0</code>; no <code>v2.0.0</code> tag, GitHub Release or npm publish exists. Merged release intent and green source CI do not establish what an ordinary install obtains.

## Project index

| Project | Team | Category | Status | Source |
|---|---|---|---|---|
| [Claude Design](projects/anthropic-claude-design/) | Anthropic | Agent-first design | Active / beta | Closed |
| [Codex](projects/openai-codex/) | OpenAI | Coding agent with visual workflow | Active | CLI/SDK/App Server Apache-2.0; desktop/IDE/cloud clients not public |
| [Cursor](projects/cursor/) | Anysphere | Coding agent with visual workflow | Active | Closed |
| [TRAE Work](projects/trae-work/) | ByteDance / TRAE | Agent workspace with Design Mode | Active | Closed |
| [QoderWork Design](projects/qoderwork-design/) | Alibaba / Qoder | Agent-first design surface | Active | Closed |
| [Replit Design](projects/replit-design/) | Replit | Agent-first design surface | Active | Closed |
| [CodeBuddy](projects/tencent-codebuddy/) | Tencent | Coding agent with design workflow | Active | Closed |
| [Comate](projects/baidu-comate/) | Baidu | Coding agent with design workflow | Active | Closed |
| [Devin](projects/devin/) | Cognition | Coding agent with visual/runtime workflow | Active | Closed |
| [v0](projects/vercel-v0/) | Vercel | AI app builder with visual editing | Active | Closed |
| [Lovable](projects/lovable/) | Lovable | AI app builder with visual editing | Active | Closed |
| [Windsurf](projects/windsurf/) | Exafunction / Codeium → Cognition | Historical agentic IDE and local-to-cloud transition | Historical; renamed to Devin Desktop on 2026-06-02 | Closed editor/agent core; adjacent MIT demo/plugins |
| [GitHub Spark](projects/github-spark/) | GitHub | AI app builder with visual editing | Active | Closed |
| [Anything (formerly Create)](projects/anything/) | Anything | AI app builder with design reasoning | Active | Closed |
| [Fusion](projects/builderio-fusion/) | Builder.io | Code-native visual surface | Active | Closed |
| [Stitch](projects/google-stitch/) | Google Labs | Agent-first design | Active / beta | Closed core; official SDK, DESIGN.md CLI/specification, Agent Skills and Gemini CLI extension open |
| [Google Antigravity](projects/google-antigravity/) | Google | Multi-surface agentic development platform with visual verification | Active | Closed 2.0/IDE/CLI and Go harness; Apache-2.0 Python control layer; managed Gemini API agent |
| [Base44](projects/base44/) | Wix / Base44 | AI app builder with visual editing | Active | Closed |
| [Bolt.new](projects/bolt-new/) | StackBlitz | AI app builder with design-system workflow | Active | Closed |
| [Atoms (formerly MGX / MetaGPT X)](projects/atoms/) | MetaGPT / Atoms | Multi-agent app builder with visual editing | Active | Commercial product; related MetaGPT open source |
| [Subframe](projects/subframe/) | Subframe | Design-to-code / code-native design | Active | Closed |
| [FlutterFlow](projects/flutterflow/) | FlutterFlow | Visual builder with coding-agent integration | Active | Closed |
| [Figma Make](projects/figma-make/) | Figma | AI design + app builder | Active | Closed |
| [Alloy](projects/alloy/) | Alloy | AI prototyping + code context | Active | Closed |
| [Magic Patterns](projects/magic-patterns/) | Magic Patterns | AI design + code | Active | Closed |
| [Anima](projects/anima/) | Anima | Design-to-code / agent integration | Active | Closed |
| [Kombai](projects/kombai/) | Kombai | Design engineering agent | Active | Closed |
| [Miaoda (秒哒)](projects/baidu-miaoda/) | Baidu | AI app builder with visual editing | Active | Closed |
| [Onlook](projects/onlook/) | Onlook | Code-native visual surface | Active | Open source |
| [Tempo](projects/tempo/) | Tempo Labs | Code-native visual surface | Active | Closed |
| [stagewise](projects/stagewise/) | stagewise | Code-native visual surface | Active | Open source |
| [Dosmos](projects/dosmos/) | Dosmos | Code-native visual surface | Active | Source status unconfirmed |
| [Retune](projects/retune/) | Retune | Visual manipulation layer | Active | Closed |
| [Tuna](projects/tuna/) | Tuna contributors | Visual manipulation layer | Active | Open-source repository |
| [onUI](projects/onui/) | onUI contributors | Visual interaction primitive | Active | Open source |
| [Design Canvas](projects/design-canvas/) | Design Canvas | Agent-controlled runtime canvas | Active | Closed / source status unconfirmed |
| [Rivet](projects/rivet-design/) | Rivet Design | Visual manipulation layer | Active | Closed |
| [pen.dev](projects/pen-dev/) | pen.dev | Agent-controllable design canvas | Active | Closed product; open design format |
| [Paper](projects/paper/) | Paper | Agent-controllable design canvas | Active | Closed |
| [Clearly](projects/clearly/) | Clearly | Agent-controllable design canvas | Active | Closed |
| [MagicPath](projects/magicpath/) | MagicPath | Agent-controllable design canvas | Active | Closed |
| [Superdesign](projects/superdesign/) | Superdesign dev, Inc. | Agent skill over a hosted design-draft graph | Active; skill/plugin v0.4.2, CLI v0.10.0 | MIT skill + packaged CLI; hosted platform closed; legacy extension historical |
| [Nimbalyst](projects/nimbalyst/) | Nimbalyst | Generic visual workspace over agents | Active | Open source |
| [OpenPencil (open-pencil/open-pencil)](projects/open-pencil/) | OpenPencil | Agent-controllable design editor | Active | Open source |
| [OpenPencil (ZSeven-W/openpencil)](projects/openpencil-zseven/) | ZSeven-W / contributors | AI-native vector design editor and design-as-code runtime | Active; v0.8.3 | MIT |
| [Reframe](projects/reframe/) | Ilya Makarov / contributors | HTML-to-INode design compiler, DOM canvas and agent interface | Public v0.1.0; pinned main 2026-05-01 | AGPL-3.0-or-later; commercial option |
| [Open CoDesign](projects/open-codesign/) | OpenCoworkAI / contributors | Local-first desktop AI design agent | Active; v0.2.1 | MIT |
| [Open Design](projects/open-design/) | nexu-io / Open Design contributors | Local-first agent-native design workspace and artifact studio | Active; v0.18.2 | Apache-2.0 |
| [Agentation](projects/agentation/) | Benji Taylor / contributors | In-app visual feedback and agent-context primitive | Active; package v3.0.2 | PolyForm Shield 1.0.0 source-available |
| [Code Inspector](projects/code-inspector/) | zh-lx / contributors | Compile-time DOM-to-source and in-browser coding-agent bridge | Active; v2.0.7 | MIT |
| [Puck](projects/puck/) | Puck Editor | Visual editor primitive | Active | Open source |
| [Figwright](projects/figwright/) | Roya / contributors | Local bidirectional Figma MCP + repository grounding | Active; v0.4.0 | MIT |
| [mcp_excalidraw](projects/mcp-excalidraw/) | yctimlin / contributors | Local agent-driven Excalidraw workbench and interchange tool | Active source; npm 1.1.0, source 2.0.0 release intent | MIT |
| [Monet](projects/monet/) | Het Patel / contributors | Agent-operable video timeline and code canvas | Active public alpha; v0.1.9 | MIT |
| [Uizard](projects/uizard/) | Uizard | AI UI design | Active | Closed |
| [Galileo AI](projects/galileo-ai/) | Galileo AI | Historical prompt/image-to-UI screen-lineage workspace | Historical; legacy domain redirects to Stitch | Closed; archived shipped client inspectable |
| [Diagram](projects/diagram/) | Diagram Technologies / Figma | Historical Figma-native automation and generative-design product family | Acquired 2023-06-21 / historical | Closed products; public automation JSON, plugin scaffold and Framer foundation |
| [Framer AI](projects/framer-ai/) | Framer | AI website design / builder | Active | Closed |
| [Relume](projects/relume/) | Relume | AI website design system workflow | Active | Closed |
| [Webflow AI](projects/webflow-ai/) | Webflow | AI website builder | Active | Closed |
| [Canva Magic Design](projects/canva-magic-design/) | Canva | AI visual design | Active | Closed |
| [Firebase Studio](projects/firebase-studio/) | Google | Historical/transitioning AI app builder | Sunsetting 2027-03-22 | Closed |
| [Motiff](projects/motiff/) | Motiff | Historical structured UI editor and hosted AI UI generator | UI Editor ended 2025-08-22; Motiff AI offline 2026-06-23; export through 2026-10-31 | Closed core; public MIT MCP distribution |

## Research rules

1. Prefer official docs, official product/changelog posts and official source repositories.
2. Keep fact, inference and unknown separate.
3. Project directories are monographs, not comparison pages.
4. For open-source projects, source-level dossiers pin immutable commit SHAs before recording implementation details.
5. Keep discontinued/acquired products as history instead of deleting them.
6. Categories may change as products evolve; directory slugs should remain stable.
7. Record aliases/direct rebrands inside the canonical project directory unless a materially independent pre-transition product is retained under the bounded historical exception above.
8. Track breadth and research depth separately; a registered directory is not automatically a completed technical dossier.

## Repository structure

```text
.
├── README.md
├── CONTRIBUTING.md
├── PROJECT_TEMPLATE.md
└── projects/
    └── <project-slug>/
        └── README.md
```

## Milestone status

**v0.1 breadth:** complete for the audited 63-project registry.

**v0.1 depth:** in progress — 32 evidence-bounded deep dossiers complete (18 Source-level and 14 closed-source Architecture-level), 31 remaining.
