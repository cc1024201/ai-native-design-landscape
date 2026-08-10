# OpenPencil (`open-pencil/open-pencil`)

> Research status: **Source-level** · Last reviewed: **2026-08-10**

| Field | Value |
|---|---|
| Organization / team | OpenPencil |
| Category | Agent-controllable design editor / programmable design engine |
| Status | Active development; v0.14.0 at pinned revision |
| Source availability | MIT |
| Previous names / aliases | — |
| Canonical product URL | https://openpencil.dev |
| Canonical source repository | https://github.com/open-pencil/open-pencil |
| Pinned source revision | `4d6ddd3f84af817049bf8e4be6a15f84aac11d46` |

## 1. Product facts

OpenPencil is an open-source design editor and programmable design toolkit. It opens and writes `.fig` and `.pen` design files, provides a desktop app and browser/PWA surface, has built-in AI, exposes a headless CLI and Vue SDK, and exposes the live editor/document to external agents through MCP and local RPC.

The product includes conventional design-editor capabilities such as layers, vector editing, components/variants, variables/tokens, auto layout, CSS Grid, export, collaboration and direct manipulation. It also supports HTML/CSS/Tailwind import into editable design layers and JSX/Tailwind/HTML export from design documents.

## 2. Technical direction

OpenPencil is **design-document-native**, not code-as-source-of-truth.

Its architecture centers on an explicit scene graph and native design-file representations. AI and coding agents operate on that same design document through programmable APIs rather than indirectly instructing a separate design UI.

The core directions are:

- make Figma/Pencil-style documents locally readable/writable;
- keep the editor and file format programmable from CLI, SDK, Figma Plugin API-compatible eval and MCP;
- share the same editor engine across web, desktop, headless and agent surfaces;
- make rendering/layout deterministic through an internal scene graph, Skia and Yoga;
- make collaboration local/accountless through P2P WebRTC + Yjs;
- bridge design documents to/from HTML/CSS and component-oriented code.

## 3. Technology choices

### Editor/renderer

- **UI shell:** Vue 3.
- **UI primitives:** Reka UI; Tailwind CSS 4.
- **Rendering:** Skia via CanvasKit WASM.
- **Layout:** Yoga WASM with an OpenPencil grid-capable fork for flex + CSS-grid-style layout.
- **Drag/drop:** Atlassian pragmatic drag-and-drop packages.

### File/data formats

- **Scene graph:** `@open-pencil/scene-graph`.
- **Pencil format support:** `@open-pencil/pen`.
- **Figma format stack:** Kiwi runtime/container parsing + `.fig` conversion packages.
- **Document encoding:** public architecture describes Kiwi binary + Zstd + ZIP for the Figma-oriented path.
- **DOM/CSS import:** `@open-pencil/dom-css`.

### Desktop/web

- **Desktop:** Tauri v2.
- **Web/PWA build:** Vite + Vue; PWA dependencies are present.
- **Package/runtime:** Bun workspaces.

### AI/agent protocols

- **AI SDK:** Vercel AI SDK with Anthropic, OpenAI, Google, DeepSeek/OpenRouter-compatible providers.
- **MCP:** `@modelcontextprotocol/sdk`; separate `@open-pencil/mcp` package.
- **ACP:** Agent Client Protocol SDK is present for desktop coding-agent integration.
- **HTTP server layer:** Hono is present for the MCP/agent transport path.

### Collaboration/persistence

- **CRDT:** Yjs.
- **P2P transport:** Trystero/WebRTC.
- **Browser persistence:** IndexedDB/Yjs IndexedDB dependencies are present.

## 4. Artifact and data model

### Primary durable artifact / source of truth

The durable artifact is a design document (`.fig` / `.pen` or an in-memory/live scene graph that can be serialized to those supported formats). This is fundamentally different from runtime-overlay projects where the codebase remains the only durable artifact.

### Scene graph

`packages/scene-graph/` owns node primitives, selection/hit testing, snapping, copy behavior and undo-related engine concerns. The editor operates on typed design nodes rather than on a browser DOM.

### Document adapters

- `packages/pen/` handles Pencil document format support.
- `packages/kiwi/` handles low-level Kiwi runtime/container parsing.
- `packages/fig/` maps `.fig` archives/metadata/instances into the editor scene graph and back.
- `packages/dom-css/` maps HTML/CSS/Tailwind into editable scene-graph layers.

### Layout model

Auto-layout and grid constraints are represented inside the design scene graph and executed by Yoga WASM rather than delegated to a browser layout engine.

### Component/variable model

The product has first-class components, instances, component sets/variants and design variables/tokens. The pinned release history also contains fixes specifically preserving component-instance rendering/text edits during `.fig` roundtrips, confirming that instance semantics participate in the document model.

## 5. Agent interface

OpenPencil exposes multiple first-class programmatic surfaces.

### Built-in AI

The in-app AI assistant has 100+ tools for creating/modifying nodes, fills/strokes, layout, components, variables, boolean operations, token analysis and export.

### MCP

`@open-pencil/mcp` exposes the design document to any MCP client over:

- stdio (`openpencil-mcp`);
- HTTP/local socket (`openpencil-mcp-http`).

External agents can inspect, modify and export design documents. File operations can be scoped with `OPENPENCIL_MCP_ROOT`.

### Live-app RPC

The CLI can omit the file path and connect to a running desktop editor via RPC. This gives scripts/agents access to the current live document/canvas rather than forcing file reopen/serialize cycles for every operation.

### Figma Plugin API-compatible eval

`openpencil eval` exposes a Figma Plugin API-like programmable surface for querying and mutating nodes. This provides an additional agent/automation interface independent of the visual shell.

### Coding-agent embedding

The desktop chat can host Claude Code, Codex or Gemini CLI and connect those agents to the editor MCP server. The agent remains an external coding-agent runtime while the OpenPencil editor exposes design tools.

## 6. Runtime and rendering

### Renderer

The design scene is rendered through Skia/CanvasKit WASM. This makes the visual editor independent of browser DOM/CSS layout for its native design surface.

### Layout engine

Yoga WASM calculates flex/grid layout for design nodes. The repository depends on an OpenPencil Yoga fork with grid support.

### Desktop runtime

Tauri v2 wraps the Vue/Vite application for macOS/Windows/Linux. The product also runs as a web/PWA application.

### Headless runtime

CLI and SDK packages can load/query/mutate/export documents without the full visual editor. Rendering/export paths can output raster/vector/code formats.

## 7. Source mapping and targeting

For OpenPencil's native design surface, the relevant mapping is **canvas node ↔ design-document node**, not DOM ↔ application source.

### Stable identity

Design nodes carry native document/scene-graph identities; the CLI can address nodes by IDs such as Figma-style `1:23`, and XPath-like queries can select nodes by type/properties/structure.

### Canvas targeting

Hit testing and selection are scene-graph concerns implemented in `packages/scene-graph/` and `packages/core/`.

### Code bridge

Code import/export is a conversion boundary:

- HTML/CSS/Tailwind can be imported into editable design layers through `@open-pencil/dom-css`;
- design selections/documents can export JSX/Tailwind or HTML;
- the product does not claim that every arbitrary application DOM node remains a lossless bidirectional pointer to its original source file after conversion.

### Design-file mapping

`.fig` and `.pen` parsing/conversion preserve design-document semantics such as nodes, instances and metadata. This is a document conversion problem rather than runtime source mapping.

## 8. Persistence and versioning

### File persistence

`.fig` and `.pen` are first-class local file artifacts. CLI/document APIs can read, write and convert them directly.

### Browser/local persistence

IndexedDB/Yjs packages support browser/local collaborative persistence paths; precise ownership of every editor setting/document cache should be traced before making broader claims.

### Collaboration

Real-time collaboration is P2P WebRTC through Trystero with Yjs CRDT state, with no required collaboration server/account according to the product README.

### Undo/redo

Undo is an editor-engine concern in the scene-graph/core stack; source tree documentation explicitly associates `scene-graph` with copy/snap/undo behavior. A later pass should pin the exact history implementation and transaction boundaries.

### Git/versioning

OpenPencil files can naturally be stored in normal filesystems/repos, but the product's primary version semantics are document-file/history based rather than a codebase branch model.

## 9. Open-source implementation map

Repository pinned at `4d6ddd3f84af817049bf8e4be6a15f84aac11d46`.

| Concern | Repository path | What it establishes |
|---|---|---|
| Product/architecture | `README.md` | file support, AI/MCP/CLI, renderer/layout/collaboration stack, package structure |
| Workspace dependencies | `package.json` | Vue/Tauri/CanvasKit/Yoga/Yjs/Trystero/AI SDK/MCP/ACP technology choices |
| Scene graph | `packages/scene-graph/` | nodes, primitives, hit testing, snapping, copy/history foundation |
| Editor engine | `packages/core/` | renderer/layout/tools/RPC/document I/O |
| Figma format | `packages/kiwi/`, `packages/fig/` | Kiwi parsing and `.fig` archive/scene conversion |
| Pencil format | `packages/pen/` | `.pen` document support |
| DOM/code bridge | `packages/dom-css/` | HTML/CSS/Tailwind → editable design document |
| Vue embedding SDK | `packages/vue/` | headless editor composables/components |
| CLI | `packages/cli/` | headless inspection/query/mutation/export/live-app RPC |
| MCP | `packages/mcp/` | stdio/HTTP external-agent design tools |
| Desktop shell | `desktop/` | Tauri v2 desktop packaging |
| App shell/AI/collab | `src/` | Vue editor shell and product-level integrations |

## 10. Commit-level evidence

**Pinned revision:** `4d6ddd3f84af817049bf8e4be6a15f84aac11d46`

| Claim | Evidence at pinned revision |
|---|---|
| OpenPencil is a programmable `.fig`/`.pen` design editor with AI, CLI, MCP, RPC and collaboration | [`README.md`](https://github.com/open-pencil/open-pencil/blob/4d6ddd3f84af817049bf8e4be6a15f84aac11d46/README.md) |
| Renderer/layout stack is CanvasKit/Skia + Yoga and UI shell is Vue/Tauri | [`README.md`](https://github.com/open-pencil/open-pencil/blob/4d6ddd3f84af817049bf8e4be6a15f84aac11d46/README.md), [`package.json`](https://github.com/open-pencil/open-pencil/blob/4d6ddd3f84af817049bf8e4be6a15f84aac11d46/package.json) |
| AI/provider, MCP, ACP, Yjs/Trystero and DOM/CSS import dependencies are part of the current implementation | [`package.json`](https://github.com/open-pencil/open-pencil/blob/4d6ddd3f84af817049bf8e4be6a15f84aac11d46/package.json) |
| Repository is split into scene graph, file-format, core, DOM/CSS, SDK, CLI and MCP packages | [`README.md`](https://github.com/open-pencil/open-pencil/blob/4d6ddd3f84af817049bf8e4be6a15f84aac11d46/README.md) |

## Evidence boundary

- **Fact:** source structure, renderer/layout, document formats, programmatic interfaces, collaboration technology and package boundaries are pinned to public source.
- **Inference:** OpenPencil is design-document-native because its central artifact and engine operate on scene-graph design documents rather than the runtime DOM of an external app.
- **Unknown:** complete Figma binary compatibility, every roundtrip-loss edge case and exact internal transaction/history implementation are not generalized beyond the pinned claims.

## Research gaps

- Trace scene-graph identity and history/transaction implementation to concrete files.
- Trace `.fig` serialization/roundtrip boundaries and unsupported node/property classes.
- Trace the MCP tool registry and the live-app RPC transport implementation in detail.
- Trace Yjs document partitioning and IndexedDB persistence lifecycle.
- Trace DOM/CSS import fidelity and code-export component mapping rules.

## Primary sources

- https://github.com/open-pencil/open-pencil/tree/4d6ddd3f84af817049bf8e4be6a15f84aac11d46
- https://openpencil.dev
