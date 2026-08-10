# Open Design

> Research status: **Source-level** · Last reviewed: **2026-08-10**

| Field | Value |
|---|---|
| Organization / team | nexu-io / Open Design contributors |
| Category | Local-first agent-native design workspace and artifact studio |
| Status | Active; pinned `main` manifest is v0.18.2 |
| Source availability | Open source under Apache-2.0; bundled content can retain its own license |
| Previous names / aliases | Open Claude Design (renamed to Open Design) |
| Canonical product URL | https://open-design.ai/ |
| Canonical source repository | https://github.com/nexu-io/open-design |
| Pinned source revision | `0460157e1eb1cbc3ca8314cae275d4464322ada5` |

## 1. Product facts

Open Design is a local-first design product built around coding-agent runtimes and code artifacts. The current repository describes it as an open-source Claude Design alternative and ships a complete application rather than only a skill bundle: a Next.js web client, an Electron desktop shell, a privileged local daemon, a CLI, a stdio MCP server, agent adapters, functional skills, rendering design templates, design systems and plugins.

At the pinned revision, the user-facing creation model has six entry tabs:

- **Prototype:** responsive web, mobile, tablet or desktop-app interface work;
- **Live Artifact:** a high-fidelity, data-bearing or connector-backed workflow represented as a prototype-shaped project with `intent: live-artifact`;
- **Deck:** slide artifacts with navigation, speaker-note and presentation export paths;
- **Template:** a user-owned project template saved through Share, distinct from the bundled rendering-template catalogue;
- **Media:** image, video or audio generation with provider/model-specific inputs;
- **Other:** a free-form project with no required primary skill.

The product previews HTML and deck artifacts, renders images and media, keeps project files visible to the user, and exposes direct editing, inspect/tuning, comments and drawn annotations where the preview transport supports them. Delivery paths include project archives and source files plus HTML, PDF, PPTX, Markdown, image and MP4 workflows; exact formats depend on the artifact and selected rendering path.

Open Design supports two ordinary generation profiles:

1. a filesystem-capable coding-agent CLI writes canonical files inside the project workspace;
2. a plain/BYOK adapter without filesystem tools returns a complete `<artifact>` block, which the daemon parses and materializes into the same file model.

The project explicitly positions real HTML/CSS/components and `DESIGN.md` as the handoff contract. It is therefore not a Figma-like pixel/object document with an independent layer graph. Its design workspace is a coordinated view over files, agent runs, rendered previews, structured comments and per-file versions.

The root package, web, daemon and desktop packages are v0.18.2 at the pinned revision. The root license is Apache-2.0; the repository also states that bundled skills and templates carrying their own license files retain those licenses.

## 2. Technical direction

Open Design's technical direction is **to make a local daemon the authority for projects and product state, delegate the model/tool loop to an installed coding-agent runtime, and keep generated design output as inspectable project files rendered in a constrained preview**.

The core route is:

`brief + project metadata + selected plugin/skill/template + DESIGN.md → daemon prompt/run orchestration → installed CLI/ACP/BYOK runtime → canonical project files or materialized <artifact> → sandboxed preview → direct edit/comment/follow-up → file version or new agent run`

Three planes stay deliberately separate:

- **Control plane:** projects, workspaces, conversations, messages, agent sessions, runs, comments, deployments and automation state live behind daemon APIs, with relational state primarily in SQLite.
- **Content plane:** project files, artifact manifests, design-system packages, skills, design templates, plugins, live-artifact documents and file-version content live on disk under daemon-owned roots or an explicitly imported project folder.
- **Execution plane:** a data-defined runtime adapter launches an external CLI or ACP process, streams normalized events, resumes upstream sessions where supported and lets the external agent perform reads, edits and shell/tool work.

This is a delegation architecture, not a thin model SDK wrapper. Open Design does not reimplement the selected coding agent's planner, model client, file tools, permission system or native session memory. The generic runtime engine supplies prompt staging, cwd, environment, MCP forwarding where available, event normalization, cancellation and persistence around it.

The design-content model is compositional but typed by role:

- functional **skills** provide mid-task behavior;
- **design templates** provide renderable starting shapes;
- **design systems** provide brand/tokens/components through `DESIGN.md` and companion files;
- **plugins** package runnable workflows and declared capabilities.

The web UI and `od` CLI are intended to drive the same daemon contracts. The stdio MCP server adds an external-agent boundary over the same project/file/run authority rather than creating a second artifact store.

## 3. Technology choices

### Application and build

- **Monorepo:** pnpm 10.33.2 workspaces, TypeScript and Node `~24`.
- **Web:** Next.js 16.2, React 18.3 and Tailwind/PostCSS, with Lexical for rich composition and Excalidraw for sketch flows.
- **Desktop:** Electron 41 with a sandboxed renderer and sidecar/IPC coordination for packaged web and daemon processes.
- **Daemon:** Express 5, `better-sqlite3` with WAL and foreign keys, SSE/JSON event streams, child processes and PTYs.
- **Shared contracts:** pure TypeScript contracts plus Zod where runtime schemas are required.
- **Exports/media:** PDF-lib, PptxGenJS, browser printing/capture and artifact-specific media pipelines.
- **Plugin runtime:** a filesystem-independent TypeScript parser/merger/validator package; daemon, web and CI inject loaders.

### Agent/runtime adapters

The pinned registry contains 26 base runtime definitions, including one BYOK OpenCode profile, across 25 distinct local executable families. Adapter groups include:

- Claude-style stream JSON;
- Codex/OpenCode-style JSON event streams;
- Copilot and Qoder stream variants;
- ACP JSON-RPC agents;
- Pi RPC;
- plain stdout adapters.

Each `RuntimeAgentDef` declares executable discovery, arguments, stream format, models, prompt transport, session-resume behavior, environment, optional auth probe and MCP-injection strategy. A new CLI sharing an existing wire format usually needs a definition rather than another orchestration engine.

### Content protocols

- Skills and design templates use portable `SKILL.md` directories, with optional `od:` metadata.
- Design systems center on `DESIGN.md`, optional tokens, component manifests and richer referenced files.
- Artifact files can carry a v1 manifest naming kind, renderer, entry, export formats, primary/supporting files, source skill and design system.
- Plugins use `open-design.json` plus type-specific payloads and explicit capability declarations.

### Security-relevant choices

- The normal project preview uses an opaque-origin iframe and a CSP with scripts/forms allowed but network connections, form actions, base URI and objects blocked.
- A separate powered-preview path intentionally grants same-origin workers/storage and cross-origin isolation for WebGL, WASM and `SharedArrayBuffer`; it uses a preview-only loopback origin barred from normal daemon APIs.
- File routes validate project-relative paths and hide internal version-store paths.
- The daemon binds loopback by default; non-loopback operation requires explicit bind/auth/origin configuration.
- Agent subprocess authority is adapter-specific and materially broader than iframe authority. Claude is launched with `bypassPermissions`; Codex uses `workspace-write` with network on supported macOS/Linux environments but `danger-full-access` on Windows/WSL or explicit operator override. Several other adapters use their own headless allow-all flags.

## 4. Artifact and data model

### Project control record

A `Project` has an id, name, selected skill and design system, timestamps, optional pending prompt/custom instructions and a broad `ProjectMetadata` record. Metadata carries the creation kind, intent, platform targets, fidelity, media options, template/plugin provenance, connector context, imported-folder authority and design-system review state. A project can be bound to exactly one workspace; visibility and synchronization are separate read/control records rather than artifact content.

### Conversation and run state

Each project can have multiple conversations. SQLite stores conversation mode and intent signals, ordered user/assistant messages, normalized event JSON, attachments, produced/trace files, run context, analytics and delivery state. `agent_sessions` keys an upstream session by `(conversation_id, agent_id)` and also records model, cwd and last assistant message so resume can be rejected or reseeded when the conversation shape or runtime identity drifts.

### Canonical project files

A `ProjectFile` is the common durable output unit. It has a project-relative name/path, byte size, mtime, MIME type and coarse kind such as HTML, image, video, audio, sketch, text, code, PDF, document, presentation or spreadsheet. Native projects resolve inside the daemon's project root; imported-folder projects are the explicit exception and read/write a picker-validated external `metadata.baseDir`.

The filesystem remains authoritative even when an artifact manifest exists. The manifest is a typed rendering/delivery envelope, not a replacement document model:

- kinds include HTML, deck, React component, Markdown document, SVG, diagram, code snippet, mini-app and design system;
- renderer selects HTML, deck HTML, React, Markdown, SVG, diagram, code, mini-app or design-system handling;
- entry, primary and supporting files describe the package;
- export capabilities, status, source skill, design-system id and bounded metadata travel with it.

Legacy HTML, Markdown and SVG files can receive inferred manifests. Explicit artifact creation rejects unsupported/uninferrable shapes rather than inventing an unsafe renderer.

### Live-artifact document

Live artifacts add a project-scoped structured document rather than replacing project files. The v1 record names a title/slug/status, preview type/entry, refresh status and an `html_template_v1` document with canonical template, data and generated-preview paths. `data.json` is canonical; the API hydrates `dataJson`. A bounded `sourceJson` can describe local-file, daemon-tool or connector-tool input, read-only refresh permission and output mapping, while provenance records generator and source labels.

### Design-content registries

Functional skills, design templates and design systems are request-time registries over portable directories. When a run activates a skill/template, the daemon copies the relevant instruction bundle into a project-private staging area rather than symlinking it. Design-system content is composed into the prompt through `DESIGN.md`, usage guidance, tokens, component manifests and a bounded file index; rich files remain readable on demand.

### Preview comments

A preview comment is not merely text. Its target stores file path, element id, selector, label, visible text, bounding box, an HTML start-tag hint, optional computed-style summary, deck slide and optional multi-element pod members. Collaboration adds an explicit anchor state (`anchored`, `reanchored`, `stale`, `lost`) and last-known-good position so drift is surfaced instead of silently retargeted.

## 5. Agent interface

### Product run API

The web surface creates a run through `/api/runs` (with `/api/chat` retained as a compatible entry), supplying an agent id, project/conversation ids, current message, mode, selected skills/design system/plugin snapshot, attachments, model/reasoning tier and optional run-scoped tool bundle. The daemon composes stable and per-turn prompt sections, stages content, selects the runtime definition, launches the process in the resolved project workspace and streams normalized events over SSE.

Filesystem-capable adapters receive the project as their working directory and write files with their own tools. The daemon takes before/after fingerprints so a real create or edit is recognized independently of provider-specific tool-event shapes. It does not automatically fall back from a failed selected agent to a different agent; the user selects and retries.

Plain adapters use a narrower contract. The final stdout can contain complete `<artifact type="..." identifier="..." title="...">...</artifact>` blocks outside Markdown code ranges. The daemon accepts HTML, CSS, SVG and Markdown, allocates a non-colliding filename, builds a manifest and writes it through the normal project artifact path. Incomplete or unsupported tags are not materialized.

### Session and permission boundary

Claude, Codex and several other adapters resume their native upstream sessions. The daemon stores the resume handle and uses prompt hashes/runtime identity to decide whether a continuation is safe; otherwise it starts or reseeds a session. This preserves tool history without treating the flattened web transcript as the only memory.

The authority boundary is the selected CLI, not an Open Design-wide sandbox. For example:

- Claude uses stream JSON over a kept-open stdin and `bypassPermissions`;
- Codex uses structured `exec --json`, captures its thread id, and resumes with the same effective sandbox policy;
- OpenCode permission bypass is enabled only when its probed help advertises the dangerous flag;
- ACP and plain adapters declare their own launch/permission behavior.

The iframe can be strongly sandboxed while the agent process can still edit the entire granted workspace and invoke shell/network tools. These are different trust boundaries.

### External MCP server

`od mcp` exposes a stdio server with project-scoped tools including:

- project discovery and active context;
- get/search/list files and artifacts;
- create an artifact, write/delete a file and create/delete a project;
- discover skills, plugins and agents;
- start, poll and cancel an Open Design run.

`start_run` commissions Open Design's own selected agent and returns immediately with a run id. It is not the caller directly executing a skill. Request ids make attributed generation retriable without intentionally starting another logical run. Successful delivery prefers a Studio/preview URL; source is fetched only when the caller actually needs it.

### CLI

The `od` CLI calls the same daemon surface for projects, files, versions, conversations, runs, exports, skills, design systems, plugins, live artifacts, terminals and automation. `od mcp install <agent>` adapts installation to the target agent's config/CLI conventions. This dual UI/CLI route makes the daemon API, not Electron UI state, the product integration seam.

## 6. Runtime and rendering

### Daemon and event lifecycle

The daemon is the only privileged local service. It owns API authorization, SQLite, project paths, imports/exports, runtime detection and launch, prompts, agent streams, file watchers, version capture, MCP/config state and content registries. Runs are durable control records with replayable event logs; live child-process state remains runtime-scoped and supports cancel/restart recovery according to adapter capabilities.

### Preview transports

HTML has two related preview transports:

1. **URL-loaded preview:** serves project HTML and relative assets through scoped project routes. This works for larger/multi-file/running artifacts and can receive a bounded set of URL-preview bridges.
2. **`srcDoc` preview:** parses and injects host bridges for selection, comments, palette, direct editing, deck navigation, snapshot/export, scroll and observability. It is the richer editing surface.

The host can snapshot bounded runtime DOM state and carry it from a URL-loaded frame into a `srcDoc` twin so direct editing does not always reset the visible page. This is best-effort UI continuity, not persistence of arbitrary application business state.

The normal preview sandbox has no `allow-same-origin`, so the document has an opaque origin. The powered route is an explicit exception for artifacts needing workers, storage, WebGL, WASM or shared memory. Its iframe adds `allow-same-origin` and broader capabilities, but loads from a host-swapped preview-only origin with normal API access rejected.

### Renderers and delivery

Artifact manifests dispatch HTML/deck HTML, React component, Markdown, SVG, diagram, code, mini-app and design-system surfaces. Deck bridges normalize slide navigation and export state. Export paths can inline project resources, snapshot a sandboxed preview, print to PDF, create image/PPTX output or hand an artifact-specific job to a media/rendering workflow.

There is no universal Open Design renderer that converts an abstract design graph into every output. The selected template/skill and artifact's own HTML/CSS/JS remain responsible for most layout and interaction; Open Design supplies containment, bridges, inspection and delivery machinery around them.

## 7. Source mapping and targeting

### Direct-edit addressing

Open Design does not consume JavaScript source maps or compiler AST metadata to return a rendered element to JSX/TSX source. Its rich direct-edit path addresses elements inside an HTML source document:

1. `buildSrcdoc` parses the HTML and assigns missing `data-od-id` values to selected semantic/structural nodes using a body-relative child-index path such as `path-0-2-1`.
2. When edit mode is enabled, a broader element set also receives `data-od-source-path` from the same structural walk.
3. The iframe bridge chooses an authored `data-od-id` first, then source path/runtime id/DOM path, and returns text, attributes, inline styles, geometry, computed styles and outer HTML.
4. The host parses the persisted HTML again and resolves the target by authored id, runtime/source-path attribute or structural path.
5. A bounded patch changes text, link, image, inline styles, attributes, one-root outer HTML, a CSS token, element removal or the full source, then serializes and writes the HTML file.

Before saving, the host re-fetches the persisted file. If it differs from the source on which the edit was computed, history is cleared and the new edit is refused rather than overwriting the external change. Manual undo/redo use the same content-equality guard.

This is deterministic relative to one parsed HTML tree, but it is not a compiler-level source map. Authored stable `data-od-id` values are the strongest identity. Generated child-index paths can drift when siblings/wrappers change, DOMParser reserialization can normalize markup, and nodes created only by runtime JavaScript may not exist in the persisted source at all.

### Inspect/tuning path

Inspect mode shares a selection bridge with comments but persists style changes differently. It accepts only an allow-listed set of typography, color, padding and radius properties; unsafe CSS values are rejected. The host serializes its own structured override map into a single `<style data-od-inspect-overrides>` block keyed by `data-od-id` or `data-screen-label`. It does not trust a CSS string returned from the artifact iframe.

This path targets a stable annotated selector when available. It styles the selected rendered element without claiming knowledge of the original CSS rule, token definition or component source file.

### Comment and annotation anchors

Comment mode is intentionally more permissive than direct edit. It prefers `data-od-id`/`data-screen-label`, but for meaningful runtime DOM can fall back to a `body > ... > tag:nth-of-type(n)` selector. The target includes selector, text, start-tag hint, bbox and computed-style snapshot; free pins and drawn pods can exist without a source element.

On later renders, the anchoring engine resolves from strong to weak evidence and persists `anchored`, `reanchored`, `stale` or `lost`. This makes comments useful on dynamic previews while explicitly admitting that a selector/HTML hint/position is not source identity.

### Mapping limits

- targeting is primarily HTML DOM-to-HTML-source, not DOM-to-React/Vue component source;
- generated child-index ids are sensitive to structural edits;
- runtime-generated and closed/nested-frame content may be uneditable;
- direct text edits refuse ambiguous mixed inline markup;
- inspect saves an override style sheet instead of rewriting the originating stylesheet/token;
- comments can survive through heuristic re-anchoring but can also become stale/lost;
- the selected element gives an agent visual/contextual evidence, not an automatic semantic ownership proof for the correct component or design token.

## 8. Persistence and versioning

### Resolved daemon data root

Open Design resolves one daemon data root and derives daemon-owned SQLite, projects, registries, configuration, logs and other stores from it. This is a runtime contract rather than a path clients should reconstruct. Imported-folder projects are the explicit exception: their picker-validated, realpath-resolved `metadata.baseDir` remains the content authority while Open Design keeps control metadata in its own store.

### SQLite control state

SQLite uses WAL and foreign keys. The core schema includes projects, single-workspace project bindings, templates, conversations, upstream agent sessions, messages, preview comments, tabs, deployments, routines and routine runs. Large/portable artifact content does not live in SQLite merely because the project record does.

### File-version store

HTML versions live in a reserved per-project `.file-versions` store. Each file has a v2 manifest and immutable content files. A public version records:

- monotonically increasing version number and generated id;
- label, timestamp, byte size, MIME and kind;
- source (`ai`, `manual`, `restore`) and optional prompt/prompt source;
- content digest;
- optional parent version and restore source;
- bounded origin for UI, CLI or external MCP lineage.

At run completion, the daemon diffs pre/post filesystem fingerprints and creates AI versions for touched HTML files. Manual saves can require the current content's matched version as their parent. Restoring an old version writes its content as the current file and appends a new `restore` version rather than moving the current pointer backward invisibly.

Delete marks an HTML version store deleted so history can be handled deliberately if a file is recreated; rename migrates/merges the store. Version history is per HTML file, not a transactionally atomic project snapshot, Git commit or branch graph. Some file-write routes preserve the authoritative file and return a `PROJECT_FILE_VERSION_CAPTURE_FAILED` warning if secondary version capture fails.

### Conversation and runtime continuity

Messages/events and agent-session handles persist separately from file versions. Native upstream resume is accepted only when agent/model/cwd and conversation cursor still match; an intervening agent turn or edited history forces a fresh/reseeded session. Run artifact fingerprints and event logs describe what a turn touched, but they are not a substitute for source-control commits.

### Portable registries and live data

Skills, templates, design systems and plugins are versionable directories rather than database blobs. Live artifacts keep their own project-scoped document/data/provenance and refresh log. Team/shared resource layers add publication/materialization versions, but the local canonical project file model remains distinct from collaboration transport state.

## 9. Open-source implementation map

Repository pinned at `0460157e1eb1cbc3ca8314cae275d4464322ada5`.

| Concern | Repository path | What it establishes |
|---|---|---|
| Product, version and license | `README.md`, `package.json`, `LICENSE` | current product scope, v0.18.2 manifest and Apache-2.0 boundary |
| Current topology | `docs/architecture.md`, `apps/web/package.json`, `apps/daemon/package.json`, `apps/desktop/package.json` | Next/React web, Express/SQLite daemon, Electron shell and authoritative data flows |
| Creation taxonomy | `docs/modes.md`, `apps/web/src/components/NewProjectPanel.tsx` | six UI creation tabs and their project/skill routing |
| Skill/template protocol | `docs/skills-protocol.md`, `apps/daemon/src/skills.ts`, `skills/AGENTS.md`, `design-templates/AGENTS.md` | portable registries, staging copies and design-system prompt composition |
| Project/control contracts | `packages/contracts/src/api/projects.ts`, `packages/contracts/src/api/chat.ts` | project metadata, workspace scope, conversations and run request shape |
| File/artifact contracts | `packages/contracts/src/api/files.ts`, `apps/web/src/artifacts/types.ts`, `apps/daemon/src/artifacts/manifest.ts` | project-file kinds, artifact manifest, renderer/export envelope and validation |
| Live-artifact model | `packages/contracts/src/api/live-artifacts.ts`, `apps/daemon/src/live-artifacts/store.ts` | template/data/source/provenance/refresh document and project-scoped persistence |
| Relational persistence | `apps/daemon/src/db.ts` | SQLite tables and normalization for projects, conversations, messages, comments, tabs and routines |
| Filesystem authority/safety | `apps/daemon/src/projects.ts`, `apps/daemon/src/project-root.ts` | resolved project root, imported-folder exception, path validation and file IO |
| Run API/orchestration | `apps/daemon/src/routes/runs.ts` | run creation, authority, event lifecycle, artifact outcome and compatibility chat route |
| Runtime abstraction | `apps/daemon/src/runtimes/types.ts`, `apps/daemon/src/runtimes/registry.ts`, `apps/daemon/src/runtimes/defs/` | declarative CLI/ACP adapters, installed-agent registry and per-agent behavior |
| Agent permissions/resume | `apps/daemon/src/runtimes/defs/claude.ts`, `apps/daemon/src/runtimes/defs/codex.ts`, `apps/daemon/src/runtimes/opencode-permissions.ts`, `docs/agent-adapters.md` | actual launch flags, sandbox decisions and upstream session semantics |
| Plain artifact materialization | `apps/daemon/src/runtimes/plain-stream.ts`, `apps/daemon/src/artifacts/create.ts` | `<artifact>` parsing, type allow-list, filename allocation, manifest creation and file write |
| Agent-agnostic artifact detection | `apps/daemon/src/run-artifact-fs.ts`, `apps/daemon/src/runtimes/run-artifacts.ts` | before/after fingerprint diff and artifact classification independent of provider events |
| Normal/powered preview routes | `apps/daemon/src/routes/project/index.ts`, `apps/web/src/runtime/powered-preview.ts` | scoped file serving, opaque CSP preview and isolated worker/WASM route |
| `srcDoc` bridges | `apps/web/src/runtime/srcdoc.ts`, `apps/web/src/components/FileViewer.tsx` | preview injection, URL-to-srcDoc state handoff, deck/selection/edit/export bridges and host orchestration |
| Direct-edit target/patch | `apps/web/src/edit-mode/bridge.ts`, `apps/web/src/edit-mode/source-patches.ts` | element discovery, stable-id preference, structural source paths and bounded HTML patches |
| Comment anchors | `packages/contracts/src/api/comments.ts`, `apps/web/src/comments.ts`, `apps/daemon/src/routes/project/comments.ts` | selector/html/position payload, drift ladder and durable collaboration comment state |
| HTML file versions | `apps/daemon/src/project-file-versions.ts`, `apps/daemon/src/run-html-version-snapshots.ts` | digest-bearing content snapshots, AI capture, parent/origin lineage, restore/rename/delete behavior |
| External agent interface | `apps/daemon/src/mcp.ts`, `apps/daemon/src/cli.ts`, `apps/daemon/src/mcp-agent-install.ts` | MCP tool surface, daemon-backed CLI parity and agent-specific installation |
| Regression coverage | `apps/web/tests/edit-mode/source-patches.test.ts`, `apps/web/tests/runtime/srcdoc.test.ts`, `apps/web/tests/components/FileViewer.manual-edit-history.test.tsx`, `apps/daemon/tests/project-file-versions.test.ts`, `apps/daemon/tests/plain-stream-artifact-event-truncation.test.ts`, `apps/daemon/tests/mcp-runs.test.ts` | repository-authored checks for patching, bridges, history, version store, plain persistence and MCP run lifecycle |

## 10. Commit-level evidence

**Pinned revision:** [`0460157e1eb1cbc3ca8314cae275d4464322ada5`](https://github.com/nexu-io/open-design/commit/0460157e1eb1cbc3ca8314cae275d4464322ada5)

### Current snapshot evidence

| Claim | Evidence at pinned revision |
|---|---|
| Open Design is a v0.18.2 local-first web/desktop design product under Apache-2.0 | [`README.md`](https://github.com/nexu-io/open-design/blob/0460157e1eb1cbc3ca8314cae275d4464322ada5/README.md), [`package.json`](https://github.com/nexu-io/open-design/blob/0460157e1eb1cbc3ca8314cae275d4464322ada5/package.json), [`LICENSE`](https://github.com/nexu-io/open-design/blob/0460157e1eb1cbc3ca8314cae275d4464322ada5/LICENSE) |
| The current topology is Next/React + Electron around an Express/SQLite daemon and files remain the artifact authority | [`docs/architecture.md`](https://github.com/nexu-io/open-design/blob/0460157e1eb1cbc3ca8314cae275d4464322ada5/docs/architecture.md), [`apps/daemon/src/db.ts`](https://github.com/nexu-io/open-design/blob/0460157e1eb1cbc3ca8314cae275d4464322ada5/apps/daemon/src/db.ts), [`apps/daemon/src/projects.ts`](https://github.com/nexu-io/open-design/blob/0460157e1eb1cbc3ca8314cae275d4464322ada5/apps/daemon/src/projects.ts) |
| Creation tabs and skill registry modes are related but intentionally not one-to-one | [`docs/modes.md`](https://github.com/nexu-io/open-design/blob/0460157e1eb1cbc3ca8314cae275d4464322ada5/docs/modes.md), [`apps/web/src/components/NewProjectPanel.tsx`](https://github.com/nexu-io/open-design/blob/0460157e1eb1cbc3ca8314cae275d4464322ada5/apps/web/src/components/NewProjectPanel.tsx) |
| Artifact manifests classify files/renderers/exports while the underlying project file remains canonical | [`apps/web/src/artifacts/types.ts`](https://github.com/nexu-io/open-design/blob/0460157e1eb1cbc3ca8314cae275d4464322ada5/apps/web/src/artifacts/types.ts), [`apps/daemon/src/artifacts/manifest.ts`](https://github.com/nexu-io/open-design/blob/0460157e1eb1cbc3ca8314cae275d4464322ada5/apps/daemon/src/artifacts/manifest.ts), [`packages/contracts/src/api/files.ts`](https://github.com/nexu-io/open-design/blob/0460157e1eb1cbc3ca8314cae275d4464322ada5/packages/contracts/src/api/files.ts) |
| The runtime registry delegates to installed CLI/ACP agents through declarative definitions and adapter-specific permissions | [`apps/daemon/src/runtimes/types.ts`](https://github.com/nexu-io/open-design/blob/0460157e1eb1cbc3ca8314cae275d4464322ada5/apps/daemon/src/runtimes/types.ts), [`registry.ts`](https://github.com/nexu-io/open-design/blob/0460157e1eb1cbc3ca8314cae275d4464322ada5/apps/daemon/src/runtimes/registry.ts), [`docs/agent-adapters.md`](https://github.com/nexu-io/open-design/blob/0460157e1eb1cbc3ca8314cae275d4464322ada5/docs/agent-adapters.md) |
| Filesystem agents write canonical files; plain adapters materialize supported complete `<artifact>` blocks | [`apps/daemon/src/run-artifact-fs.ts`](https://github.com/nexu-io/open-design/blob/0460157e1eb1cbc3ca8314cae275d4464322ada5/apps/daemon/src/run-artifact-fs.ts), [`apps/daemon/src/runtimes/plain-stream.ts`](https://github.com/nexu-io/open-design/blob/0460157e1eb1cbc3ca8314cae275d4464322ada5/apps/daemon/src/runtimes/plain-stream.ts) |
| Normal preview is opaque/CSP-restricted while powered preview is an explicit cross-origin-isolated exception | [`apps/daemon/src/routes/project/index.ts`](https://github.com/nexu-io/open-design/blob/0460157e1eb1cbc3ca8314cae275d4464322ada5/apps/daemon/src/routes/project/index.ts), [`apps/web/src/runtime/powered-preview.ts`](https://github.com/nexu-io/open-design/blob/0460157e1eb1cbc3ca8314cae275d4464322ada5/apps/web/src/runtime/powered-preview.ts) |
| Direct editing uses authored ids or parsed DOM-index paths and writes guarded HTML source patches | [`apps/web/src/runtime/srcdoc.ts`](https://github.com/nexu-io/open-design/blob/0460157e1eb1cbc3ca8314cae275d4464322ada5/apps/web/src/runtime/srcdoc.ts), [`apps/web/src/edit-mode/bridge.ts`](https://github.com/nexu-io/open-design/blob/0460157e1eb1cbc3ca8314cae275d4464322ada5/apps/web/src/edit-mode/bridge.ts), [`source-patches.ts`](https://github.com/nexu-io/open-design/blob/0460157e1eb1cbc3ca8314cae275d4464322ada5/apps/web/src/edit-mode/source-patches.ts) |
| Comments use selector/text/HTML/position evidence and persist explicit anchor drift states | [`packages/contracts/src/api/comments.ts`](https://github.com/nexu-io/open-design/blob/0460157e1eb1cbc3ca8314cae275d4464322ada5/packages/contracts/src/api/comments.ts), [`apps/web/src/comments.ts`](https://github.com/nexu-io/open-design/blob/0460157e1eb1cbc3ca8314cae275d4464322ada5/apps/web/src/comments.ts) |
| HTML history appends AI/manual/restore versions with digests, parent/origin fields and content files | [`apps/daemon/src/project-file-versions.ts`](https://github.com/nexu-io/open-design/blob/0460157e1eb1cbc3ca8314cae275d4464322ada5/apps/daemon/src/project-file-versions.ts), [`run-html-version-snapshots.ts`](https://github.com/nexu-io/open-design/blob/0460157e1eb1cbc3ca8314cae275d4464322ada5/apps/daemon/src/run-html-version-snapshots.ts) |
| External agents can create/read/write project artifacts and commission/poll/cancel Open Design runs through MCP | [`apps/daemon/src/mcp.ts`](https://github.com/nexu-io/open-design/blob/0460157e1eb1cbc3ca8314cae275d4464322ada5/apps/daemon/src/mcp.ts), [`apps/daemon/src/cli.ts`](https://github.com/nexu-io/open-design/blob/0460157e1eb1cbc3ca8314cae275d4464322ada5/apps/daemon/src/cli.ts) |

### Historical implementation commits

| Date | Commit | What the diff establishes |
|---|---|---|
| 2026-04-28 | [`a98096a`](https://github.com/nexu-io/open-design/commit/a98096a042388b74e422d4b1a750fce6894f9a5d) | initial product structure already joined daemon, projects, agent streams, skills, design systems, preview and export surfaces |
| 2026-04-28 | [`6f6bf31d`](https://github.com/nexu-io/open-design/commit/6f6bf31dd23d8e83a74fc5775272cf8c8ecae509) | renamed Open Claude Design to Open Design |
| 2026-05-06 | [`8eb9b1b5`](https://github.com/nexu-io/open-design/commit/8eb9b1b50669998c5c3dbda9491daa23bb4702c4) | introduced manual edit mode and its source/preview bridge |
| 2026-05-07 | [`988fd6db`](https://github.com/nexu-io/open-design/commit/988fd6db5e5ec4518f1893d9133239e29ab92852) | added existing-folder import as an external project-workspace authority |
| 2026-05-28 | [`b8cdf5f0`](https://github.com/nexu-io/open-design/commit/b8cdf5f0ea76d7ec7f65dfcb3ed3c6e2965f2d4f) | added the MCP generation loop and one-click Codex installation path |
| 2026-06-26 | [`fbce1ddf`](https://github.com/nexu-io/open-design/commit/fbce1ddfa512b9e3dbfbdab65061268725eb88f1d) | added native multi-turn session resume across Codex, OpenCode, Pi and AMR |
| 2026-07-01 | [`27e89e83`](https://github.com/nexu-io/open-design/commit/27e89e83eeb8d7523dfe52ba4ab1f2441bbf69f3) | added HTML file version history and the project version routes |
| 2026-07-08 | [`e8ea6847`](https://github.com/nexu-io/open-design/commit/e8ea6847953f037e128775704ed430ccec21ac5b) | persisted plain-stream `<artifact>` output into project files |
| 2026-07-08 | [`956b6607`](https://github.com/nexu-io/open-design/commit/956b6607f572a670c4eb76fd8e0a3738a2d44411) | added powered WebGL previews and their separate runtime/security path |
| 2026-07-20 | [`4054b535`](https://github.com/nexu-io/open-design/commit/4054b53571f0d605234d24ab737e56de11332da1) | made plain-stream artifact persistence independent of bounded event-ring retention |
| 2026-07-27 | [`b99a9fdc`](https://github.com/nexu-io/open-design/commit/b99a9fdc3d69001ec0c2296e4b606f8b34bea663) | expanded manual edit into direct manipulation with guarded, reliable history |
| 2026-08-05 | [`356c8c36`](https://github.com/nexu-io/open-design/commit/356c8c364f1dd863312bc3be0be00d3187d0d5ee) | introduced team workspaces, shared resources and workspace-scoped authority across the product |

## Evidence boundary

- **Fact:** product/version/license, current topology, project/file/artifact contracts, runtime definitions, preview bridges, HTML patching, SQLite schema, version store, CLI and MCP tools are established by the pinned source.
- **Inference:** Open Design is best classified as a filesystem-native agent design workspace rather than a conventional vector/layer editor because canonical output is project files and its direct-edit mapping patches parsed HTML instead of mutating a separate design graph.
- **Established discontinuity:** normal preview isolation is stronger than agent-process isolation; a user can be viewing an opaque sandbox while the selected CLI runs with broad filesystem/shell authority.
- **Established discontinuity:** direct edits can deterministically return to one parsed HTML structure, while comments deliberately permit heuristic runtime selectors and drift states; those are different source-return guarantees.
- **Unknown/unverified here:** this dossier did not install the desktop release, exercise a real local agent/BYOK run, import a folder, run a powered artifact, export each format or perform a multi-device team sync.
- **Not established:** AST/source-map-backed DOM-to-component identity, a Figma-style object graph, project-wide atomic versions, automatic Git commits, automatic cross-agent fallback or a universal renderer independent of artifact code.

## Research gaps

- Browser-validate the ordinary-user create → agent generation → preview → direct edit → saved version → restore → export path on packaged Windows and macOS builds.
- Measure how often generated structural paths survive framework-driven DOM, asynchronous rendering and external source edits; separate authored `data-od-id` success from fallback-path success.
- Exercise comment re-anchoring across substantial HTML changes and verify `anchored`/`reanchored`/`stale`/`lost` transitions in team sync.
- Test every adapter's real permission prompt, cwd, session resume, cancellation and MCP forwarding behavior rather than relying only on launch definitions.
- Verify plain/BYOK artifact recovery for truncated streams, multiple blocks, duplicate names and unsupported media in a live run.
- Confirm the powered-preview origin/API boundary under Web Workers, storage, WASM, `SharedArrayBuffer`, CDN assets and hostile artifact scripts.
- Test version-capture warnings and concurrent agent/manual writes to determine when the canonical file can advance without a matching version entry.
- Inspect export artifacts on disk for HTML/PDF/PPTX/MP4 fidelity, embedded assets, fonts and editability; UI success text is not delivery proof.

## Primary sources

- https://github.com/nexu-io/open-design/tree/0460157e1eb1cbc3ca8314cae275d4464322ada5
- https://open-design.ai/
- https://github.com/nexu-io/open-design/blob/0460157e1eb1cbc3ca8314cae275d4464322ada5/docs/architecture.md
- https://github.com/nexu-io/open-design/blob/0460157e1eb1cbc3ca8314cae275d4464322ada5/docs/agent-adapters.md
- https://github.com/nexu-io/open-design/blob/0460157e1eb1cbc3ca8314cae275d4464322ada5/docs/skills-protocol.md
