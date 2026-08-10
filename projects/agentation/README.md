# Agentation

> Research status: **Source-level** · Last reviewed: **2026-08-10**

| Field | Value |
|---|---|
| Organization / team | Benji Taylor / Agentation contributors |
| Category | In-app visual feedback and agent-context primitive |
| Status | Active; pinned `main` contains package v3.0.2 and MCP package v1.2.0 |
| Source availability | Source-available under PolyForm Shield 1.0.0; competitive use is restricted |
| Previous names / aliases | — |
| Canonical product URL | https://agentation.com/ |
| Canonical source repository | https://github.com/benjitaylor/agentation |
| Pinned source revision | `8158a97c10c37e577b0a6e2d3175d143918216cd` |

## 1. Product facts

Agentation is a React component that runs inside the web application being reviewed. It adds a floating toolbar and overlays for attaching feedback to rendered UI, then turns that feedback into structured context for an external coding agent. It is not itself a code editor or code-changing agent.

At the pinned revision, the product surface includes:

- click annotations and selected-text annotations;
- modifier-click, drag multi-select and free-area selection;
- a drawing canvas for marking regions;
- animation/video freezing for inspecting transient states;
- compact, standard, detailed and forensic Markdown output;
- React component ancestry and best-effort source-file detection in development builds;
- Design Mode for placing component skeletons, sketching a blank-page wireframe and proposing moves/resizes with ghost overlays;
- callbacks, clipboard output, direct webhooks and optional server synchronization;
- a companion HTTP/SSE + MCP server for agent-driven annotation lifecycles.

The published package requires React 18 or newer and a desktop browser. It is normally installed as a development dependency and rendered alongside the target application. The package declares no ordinary runtime dependency other than optional React/ReactDOM peers.

The source is publicly readable but is not permissive open source: PolyForm Shield allows broad use while restricting use to compete with the software.

## 2. Technical direction

Agentation's technical direction is **to leave the target application and its source code in place, then add a thin in-runtime intent and targeting layer that an external coding agent can consume**.

The current architecture has four separable loops:

1. the browser component observes the live target DOM and collects user intent;
2. a browser-side annotation/session model preserves and formats that context;
3. optional HTTP/SSE synchronization exposes annotation state to MCP tools;
4. a separate coding agent locates and edits the target repository, then resolves or discusses the annotation.

The design surface is deliberately descriptive rather than authoritative. Placement skeletons and rearrangement ghosts record desired layout; they do not rewrite the target DOM or source code. The implementing agent receives a proposal and performs the actual code change through its own tools.

Source mapping follows the same progressive-enhancement model. Basic DOM descriptions work without React. React fiber ownership is added when available. A file/line hint is attempted only in development environments where React internals or stack frames expose it. Failure at a richer layer falls back to less precise context instead of blocking annotation.

Server synchronization is optional. Without `endpoint`, the component remains a local browser tool. With `endpoint`, it joins or creates a session, uploads local annotations and listens for lifecycle updates; network failures return the UI to local-only operation.

## 3. Technology choices

### Browser package

- **UI/runtime:** React and ReactDOM 18+ peer dependencies.
- **Language/build:** TypeScript, tsup and ES module/CommonJS outputs.
- **Styling:** Sass compiled as CSS Modules; toolbar animation is implemented without an animation runtime dependency.
- **Embedding:** client-side React portal into `document.body` of the target application.
- **Interaction:** capture-phase document events, DOM geometry APIs, open-shadow-root traversal, SVG/canvas overlays and native selection APIs.
- **Framework context:** React fiber inspection, with configurable component-name filtering.
- **Local state:** React state plus `localStorage`/`sessionStorage`.
- **Distribution:** npm package `agentation`, v3.0.2 in the pinned manifest.

### Agent Sync / MCP package

- **Runtime:** Node.js 18+.
- **Protocol:** Model Context Protocol SDK over stdio.
- **Browser/server bridge:** Node HTTP REST endpoints and Server-Sent Events.
- **Validation:** Zod for MCP tool arguments; the local REST payload handlers use TypeScript types rather than runtime schemas.
- **Persistence:** `better-sqlite3`, WAL mode, with an in-memory fallback.
- **Distribution:** npm package `agentation-mcp`, v1.2.0 in the pinned manifest.

### Deliberate non-choices

- no imported copy of the target application's source tree;
- no proprietary canvas document required for ordinary feedback;
- no embedded LLM or code-editing engine;
- no iframe or remote browser runtime for the annotation surface;
- no required hosted service for the local MCP workflow.

## 4. Artifact and data model

### Primary artifact / source of truth

Agentation does not own the target application artifact. The target repository remains the source of truth for the UI. Agentation owns a separate **feedback artifact**: annotations, layout proposals, session state and derived Markdown describing desired changes against a particular rendered URL/path.

### Annotation model

The browser `Annotation` is the central record. Its base identity and target fields are:

- `id`, `timestamp`, `comment`;
- marker position `x`/`y` and optional bounding rectangles;
- human-readable `element` and `elementPath`;
- optional selected/nearby text, CSS classes, nearby elements, computed styles, full DOM path and accessibility context;
- optional fixed-position, multi-select and drawing linkage;
- optional React component path and `sourceFile` hint.

Three annotation kinds share the lifecycle model:

- `feedback`: a note attached to one or more rendered targets;
- `placement`: a proposed component type, size, scroll offset and optional text;
- `rearrange`: a selector plus original/current rectangles for a proposed move or resize.

When synchronized, annotations may add URL, session, intent, severity, status, timestamps, author and resolution fields. Status is `pending`, `acknowledged`, `resolved` or `dismissed`.

### Session and discussion model

A `Session` associates an ID with a URL, lifecycle status, timestamps and optional project metadata. `SessionWithAnnotations` projects its annotation collection. Each annotation may also carry a thread of human/agent messages.

The server emits monotonic `AFSEvent` records for annotation, session, thread and action events. Each event has a type, ISO timestamp, session ID, sequence number and typed payload.

### Design-mode records

`DesignPlacement` stores a component palette type, page coordinates, dimensions, scroll offset, timestamp and optional text. `DetectedSection` stores a selector, label/tag/role/class/text context and immutable original plus mutable proposed rectangles. `RearrangeState` groups those section records and their original ordering.

These records are proposal geometry, not target-source AST nodes. The copied Markdown is another derived representation, containing viewport/reference-frame calculations, selectors, spatial relationships and suggested CSS/layout language.

### Projection mismatch at the MCP boundary

The full browser annotation and the common MCP result are not the same artifact shape. `agentation_get_pending` and `agentation_watch_annotations` map only ID/kind, comment, element/path, URL, intent/severity, timestamp, nearby text, React components and structured placement/rearrange data. They omit selected text, rectangles, classes, computed/accessibility context, full DOM path and `sourceFile`.

The default SQLite schema also has no `source_file` column even though the browser type includes `sourceFile`. Consequently, copied Markdown, callbacks and immediate browser/webhook payloads can contain the detected file hint, but the default persisted MCP pending/watch loop does not deliver it.

## 5. Agent interface

### Local and programmatic exits

The browser component exposes several independent exits:

- copy generated Markdown to the clipboard;
- `onAnnotationAdd`, `onAnnotationUpdate`, `onAnnotationDelete` and clear callbacks;
- `onCopy` with generated Markdown;
- `onSubmit(output, annotations)` for host-owned integration;
- per-event and manual-submit HTTP webhooks;
- an optional Agent Sync endpoint and session ID.

The component remains agent-agnostic because none of these exits assumes a particular code-editing model or repository tool.

### MCP bridge

The companion MCP server is a stateless protocol adapter over the HTTP API; its source explicitly treats the HTTP service as the single source of truth. It registers nine tools:

- `agentation_list_sessions`;
- `agentation_get_session`;
- `agentation_get_pending` and `agentation_get_all_pending`;
- `agentation_acknowledge`;
- `agentation_resolve`;
- `agentation_dismiss`;
- `agentation_reply`;
- `agentation_watch_annotations`.

`watch_annotations` first drains already-pending records so work arriving between watch calls is not missed. If none exist, it opens a global or session-scoped SSE stream, ignores the initial replay marker, waits for the first `annotation.created` event and collects a bounded batch before returning.

Acknowledgement updates status. Resolution/dismissal updates status and may append an agent thread message. The toolbar listens for server-side `annotation.updated` events and removes resolved/dismissed feedback markers or the matching placement/rearrangement proposal.

The MCP surface does **not** include a file read, file edit, browser-control or verification tool. A normal agent loop is therefore:

`human annotates live page → browser synchronizes record → MCP watch/get returns context → coding agent uses its own repository/browser tools → agent acknowledges/replies/resolves → toolbar receives lifecycle update`.

The HTTP server also implements an `action.requested` route, and the browser sync utility exports a matching client helper. At the pinned revision the toolbar does not import that helper: its manual send path invokes `onSubmit` and a webhook, while MCP watch mode reacts directly to annotation creation.

## 6. Runtime and rendering

### In-app overlay

`<Agentation />` executes in the same window and document as the target React application. It portals its toolbar/markers/overlays into `document.body`, installs document-level listeners and reads layout directly from live DOM nodes. This avoids a second rendering environment but means the inspection layer and target application share global DOM, event and timer state.

Click targeting uses `composedPath()` plus recursive `elementFromPoint()` traversal through open shadow roots. An optional setting prevents the target button/link/input handler from running while annotation mode is active. Fixed/sticky ancestry changes whether marker Y coordinates are viewport- or document-relative.

### Drawing and design rendering

- Freehand strokes render to an overlay `<canvas>`.
- Component placements render as draggable/resizable skeletons from a built-in palette.
- Rearrangement renders interactive ghost outlines, snapping guides and connector SVGs.
- Blank-canvas mode overlays the current page and records a standalone wireframe.

Rearrangement is explicitly ghost-mode: moving/resizing an outline updates `currentRect`; it does not transform the captured page element. Output generation translates proposal geometry into Markdown and CSS suggestions for an external implementer.

### Freeze behavior

The freeze utility is installed as a module side effect and preserves original timer functions for Agentation's own UI. While frozen it:

- patches page `setTimeout`, `setInterval` and `requestAnimationFrame` behavior;
- injects CSS that pauses animations and removes transitions outside Agentation;
- pauses running Web Animations API animations;
- pauses playing videos.

On unfreeze it replays queued timeouts/animation frames, resumes the animations it paused, removes the CSS and resumes videos it marked. This captures transient visual states, but it is a global intervention in the target page rather than an isolated renderer.

## 7. Source mapping and targeting

Agentation uses several different target identities, each with different precision.

### Human-readable DOM identity

Normal feedback calls `getElementPath` with a default depth of four. For each ancestor it prefers an ID, otherwise one filtered class, otherwise the tag; open shadow-boundary crossings are marked. `identifyElement` adds a human label using element type, visible text, ARIA labels, role, class semantics or media context.

The forensic record separately stores a full ancestry path, sibling/nearby text, cleaned classes, computed styles, accessibility attributes and geometry. These fields improve search context, but the ordinary `elementPath` is a readable locator, not a guaranteed unique or permanently valid CSS selector.

### Design-mode selector

Rearrangement uses a separate selector generator. It prefers a unique semantic tag, then ID, then a unique tag/class pair, and finally a recursively constructed `:nth-child` path. This selector is used to recapture/highlight the section and is carried into the rearrangement proposal.

### React ownership

React context is recovered by locating React fiber keys on the DOM node and walking `.return` links. Depending on output detail, component names are disabled, filtered, correlated against DOM classes or returned broadly. The resulting path resembles `<App> <Layout> <Button>` and supplements, rather than replaces, DOM identity.

### File/line detection

`detectSourceFile` first walks fiber/owner nodes for development-only `_debugSource`, then tries additional React 19-style source properties. If those are absent, the fallback unwraps a function/forward-ref/memo component, temporarily installs a throwing hooks dispatcher, invokes the component with `{}` and parses the error stack for an original source frame.

This mapping is heuristic:

- production builds commonly strip the relevant debug data;
- non-React pages, missing fibers and bundler-transformed stacks can yield no file;
- closed shadow roots cannot be traversed from the page;
- DOM/class/nth-child paths can become stale after structural rerenders;
- the stack fallback only captures hook-using functions reliably and may execute a hookless component body with empty props;
- no source map consumer or AST/component identity is used for deterministic writeback;
- the default SQLite/MCP projection drops `sourceFile`, even when the browser found it.

The end-to-end path is therefore normally:

`rendered node → DOM label/path + optional React hierarchy/file hint → structured feedback → external agent searches source → external agent edits and verifies`.

## 8. Persistence and versioning

### Browser-local mode

Annotations are stored under `feedback-annotations-<pathname>`. Loading filters out records older than seven days. Design placements, rearrangement state and blank-canvas wireframe state use separate path-scoped keys; the joined server session ID is also remembered per path. Theme, settings and toolbar position use shared local keys, while toolbar-hidden state is tab-scoped in `sessionStorage`.

The browser marks synchronized records with `_syncedTo`. On joining a session, it loads server annotations and uploads any local ID missing from that server session. This is an ID-union/merge strategy, not version-aware conflict resolution; it has no tombstones, revision numbers or field-level merge contract.

### Server mode

The default store is SQLite at `~/.agentation/store.db` in WAL mode. If SQLite initialization fails—or `AGENTATION_STORE=memory` is selected—the server uses in-memory maps/arrays instead.

SQLite persists:

- sessions and their URL/status/metadata;
- annotations, lifecycle fields and thread JSON;
- placement/rearrange extras as JSON;
- ordered event payloads for SSE replay;
- schema support for organizations, users and API keys used by tenant/cloud paths.

The event sequence is restored from the database at startup. Events older than the configured retention period, seven days by default, are pruned on startup; session and annotation rows do not have the same automatic retention rule in the reviewed local store.

### What is not versioned

Agentation tracks feedback lifecycle, not source-code versions. It has no target-file snapshots, commits, visual document revision graph, undo stack for prior submissions or binding between an annotation and the source commit that produced the rendered page. Git or another system must provide code history outside Agentation.

### Local server boundary

In default local mode the HTTP server sets wildcard CORS, performs no local-route authentication and calls `server.listen(port)` without an explicit loopback host, although its log prints a localhost URL. This dossier does not assume network isolation from the log text; deployment exposure should be checked explicitly.

## 9. Source-available implementation map

Repository pinned at `8158a97c10c37e577b0a6e2d3175d143918216cd`.

| Concern | Repository path | What it establishes |
|---|---|---|
| Product and license | `README.md`, `LICENSE`, `package/README.md` | embedded visual-feedback purpose, ordinary-user features, React/desktop requirement and PolyForm Shield boundary |
| Browser package stack | `package/package.json`, `package/src/index.ts` | package version, peers, TypeScript/tsup/Sass build and public export |
| Artifact/session schema | `package/src/types.ts`, `mcp/src/types.ts` | full browser annotation, design kinds, protocol status/session/thread/event contracts and the source-file schema mismatch |
| Main runtime/coordination | `package/src/components/page-toolbar-css/index.tsx` | portal component, event capture, annotation construction, local persistence, server merge/SSE, design shadow sync and output exits |
| DOM identity/context | `package/src/utils/element-identification.ts` | shadow-aware readable paths, labels, nearby context, styles, accessibility and forensic ancestry |
| React ownership | `package/src/utils/react-detection.ts` | fiber traversal, component filtering/correlation and hierarchy output |
| File/line hint | `package/src/utils/source-location.ts` | `_debugSource`, React 19 heuristics, stack-probe fallback and development limitations |
| Markdown projection | `package/src/utils/generate-output.ts` | feedback detail levels and inclusion of source/React/DOM/geometry context |
| Browser persistence/sync | `package/src/utils/storage.ts`, `package/src/utils/sync.ts` | path-scoped local state, seven-day annotation filter, session IDs and optional REST actions |
| Design proposals | `package/src/components/design-mode/types.ts`, `section-detection.ts`, `rearrange.tsx`, `output.ts` | component palette, proposal geometry, selector strategy, ghost-only rearrangement and implementation-oriented Markdown |
| Runtime freeze | `package/src/utils/freeze-animations.ts` | global timer/CSS/WAAPI/video pause and replay behavior |
| MCP surface | `mcp/src/server/mcp.ts` | nine actual tools, HTTP-as-authority adapter, narrowed MCP mapping and pending/SSE watch semantics |
| REST/SSE surface | `mcp/src/server/http.ts`, `events.ts` | routes, action/webhook events, sequence distribution, CORS and bind behavior |
| Durable store | `mcp/src/server/store.ts`, `sqlite.ts` | SQLite-first selection, memory fallback, WAL schema, lifecycle/event persistence and retention |
| Recommended integration | `skills/agentation/SKILL.md`, `skills/agentation-self-driving/SKILL.md` | repository-authored setup and critic/fixer workflow guidance; these are guidance, not runtime enforcement |

## 10. Commit-level evidence

**Pinned revision:** `8158a97c10c37e577b0a6e2d3175d143918216cd`

| Claim | Evidence at pinned revision |
|---|---|
| Agentation is an embedded React feedback component with click/text/multi/area annotations, structured output and a source-available license | [`README.md`](https://github.com/benjitaylor/agentation/blob/8158a97c10c37e577b0a6e2d3175d143918216cd/README.md), [`LICENSE`](https://github.com/benjitaylor/agentation/blob/8158a97c10c37e577b0a6e2d3175d143918216cd/LICENSE) |
| The browser package is v3.0.2, targets React 18+ and has no normal runtime dependencies beyond optional peers | [`package/package.json`](https://github.com/benjitaylor/agentation/blob/8158a97c10c37e577b0a6e2d3175d143918216cd/package/package.json) |
| Feedback annotations can carry DOM/visual/accessibility/React context and a browser-only source-file hint; placement and rearrange are structured kinds | [`package/src/types.ts`](https://github.com/benjitaylor/agentation/blob/8158a97c10c37e577b0a6e2d3175d143918216cd/package/src/types.ts) |
| The toolbar portals into the target document, captures rendered targets, persists locally, synchronizes sessions and receives server lifecycle updates | [`package/src/components/page-toolbar-css/index.tsx`](https://github.com/benjitaylor/agentation/blob/8158a97c10c37e577b0a6e2d3175d143918216cd/package/src/components/page-toolbar-css/index.tsx) |
| DOM identity is shadow-aware and enriched with nearby, style, geometry and accessibility context | [`package/src/utils/element-identification.ts`](https://github.com/benjitaylor/agentation/blob/8158a97c10c37e577b0a6e2d3175d143918216cd/package/src/utils/element-identification.ts) |
| React component ownership comes from fiber traversal; source-file detection uses debug-source patterns and a stack-probe fallback | [`package/src/utils/react-detection.ts`](https://github.com/benjitaylor/agentation/blob/8158a97c10c37e577b0a6e2d3175d143918216cd/package/src/utils/react-detection.ts), [`package/src/utils/source-location.ts`](https://github.com/benjitaylor/agentation/blob/8158a97c10c37e577b0a6e2d3175d143918216cd/package/src/utils/source-location.ts) |
| Generated Markdown varies from compact to forensic detail and can include browser-detected source and React hints | [`package/src/utils/generate-output.ts`](https://github.com/benjitaylor/agentation/blob/8158a97c10c37e577b0a6e2d3175d143918216cd/package/src/utils/generate-output.ts) |
| Design Mode stores component placements and move/resize proposals; rearrangement renders ghosts rather than mutating page elements | [`package/src/components/design-mode/types.ts`](https://github.com/benjitaylor/agentation/blob/8158a97c10c37e577b0a6e2d3175d143918216cd/package/src/components/design-mode/types.ts), [`package/src/components/design-mode/rearrange.tsx`](https://github.com/benjitaylor/agentation/blob/8158a97c10c37e577b0a6e2d3175d143918216cd/package/src/components/design-mode/rearrange.tsx), [`package/src/components/design-mode/output.ts`](https://github.com/benjitaylor/agentation/blob/8158a97c10c37e577b0a6e2d3175d143918216cd/package/src/components/design-mode/output.ts) |
| Freeze mode globally coordinates page timers, CSS/WAAPI animations and videos, then restores/replays them | [`package/src/utils/freeze-animations.ts`](https://github.com/benjitaylor/agentation/blob/8158a97c10c37e577b0a6e2d3175d143918216cd/package/src/utils/freeze-animations.ts) |
| The MCP server exposes the documented nine-tool lifecycle and watches via pending-drain plus SSE batching | [`mcp/src/server/mcp.ts`](https://github.com/benjitaylor/agentation/blob/8158a97c10c37e577b0a6e2d3175d143918216cd/mcp/src/server/mcp.ts) |
| The common MCP projection omits `sourceFile`, and the default SQLite record cannot persist it | [`mcp/src/types.ts`](https://github.com/benjitaylor/agentation/blob/8158a97c10c37e577b0a6e2d3175d143918216cd/mcp/src/types.ts), [`mcp/src/server/mcp.ts`](https://github.com/benjitaylor/agentation/blob/8158a97c10c37e577b0a6e2d3175d143918216cd/mcp/src/server/mcp.ts), [`mcp/src/server/sqlite.ts`](https://github.com/benjitaylor/agentation/blob/8158a97c10c37e577b0a6e2d3175d143918216cd/mcp/src/server/sqlite.ts) |
| Local storage is path-scoped; server storage is SQLite/WAL by default with memory fallback and seven-day event pruning | [`package/src/utils/storage.ts`](https://github.com/benjitaylor/agentation/blob/8158a97c10c37e577b0a6e2d3175d143918216cd/package/src/utils/storage.ts), [`mcp/src/server/store.ts`](https://github.com/benjitaylor/agentation/blob/8158a97c10c37e577b0a6e2d3175d143918216cd/mcp/src/server/store.ts), [`mcp/src/server/sqlite.ts`](https://github.com/benjitaylor/agentation/blob/8158a97c10c37e577b0a6e2d3175d143918216cd/mcp/src/server/sqlite.ts) |
| Local HTTP routes use wildcard CORS and a port-only listen call; cloud/API-key paths are separate from the default local route table | [`mcp/src/server/http.ts`](https://github.com/benjitaylor/agentation/blob/8158a97c10c37e577b0a6e2d3175d143918216cd/mcp/src/server/http.ts) |

## Evidence boundary

- **Fact:** package versions, runtime embedding, annotation/design schemas, target-identification logic, source heuristics, local/server persistence and the HTTP/MCP lifecycle are established by the pinned source.
- **Inference:** Agentation is best classified as an intent/context primitive rather than a design editor because its durable records describe proposed work while the external repository remains authoritative.
- **Established discontinuity:** browser `sourceFile` evidence does not survive the default SQLite plus common MCP pending/watch projection.
- **Unknown/unverified here:** this dossier did not run the package against production-sized React 18/19 applications, connect a live coding agent, measure locator success or test LAN exposure of the default server.
- **Not established:** deterministic source-map/AST writeback, code snapshots, commit binding, built-in code editing, automatic browser verification or a collaborative visual-document version graph.

## Research gaps

- Browser-validate the ordinary-user loop from annotation through MCP acknowledgement, source edit, rerender and resolution.
- Test DOM, React hierarchy and file/line targeting across Vite, Next.js/SWC, React 18, React 19, portals and open/closed shadow roots.
- Reproduce the `sourceFile` schema discontinuity through default SQLite and decide whether it is intentional projection or an implementation defect.
- Test session rejoin, duplicate local IDs, server-side deletion and offline/reconnect merge behavior.
- Measure target-page side effects of timer freezing and the stack-probe component invocation.
- Verify the local server's actual bind interfaces and document a safe default exposure model.
- Test whether placement/rearrange geometry produces reliable source changes across flex, grid, transforms and responsive breakpoints.

## Primary sources

- https://github.com/benjitaylor/agentation/tree/8158a97c10c37e577b0a6e2d3175d143918216cd
- https://agentation.com/
- https://www.npmjs.com/package/agentation
- https://www.npmjs.com/package/agentation-mcp
