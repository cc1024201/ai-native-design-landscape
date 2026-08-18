# stagewise

> Research status: **Source-level** · Last reviewed: **2026-08-10**

| Field | Value |
|---|---|
| Organization / team | stagewise GmbH / stagewise Inc. |
| Category | Browser-first agentic IDE / code-native visual surface |
| Status | Active |
| Source availability | AGPL-3.0-only |
| Previous names / aliases | — |
| Canonical product URL | https://stagewise.io |
| Canonical source repository | https://github.com/stagewise-io/stagewise |
| Pinned source revision | `065cf5f23646f5c2d238c669cfb7112609f7bc6b` |

## 1. Product facts

stagewise is an open-source agentic IDE whose primary shell is a browser. Its public product description emphasizes browsing and building in the same tool, a built-in coding agent, access to the active tab's console/debugger, optional codebase connection for permanent edits, temporary experimentation on arbitrary sites, reverse-engineering of website components/style systems, and integration with external IDEs.

The desktop product is packaged as an Electron application and contains an embedded browser, coding-agent UI, code/editor/terminal capabilities, selected-element targeting, screenshots, console capture and DevTools integration.

## 2. Technical direction

stagewise's architecture is runtime-observation-first rather than design-document-first:

- a real web page runs inside an Electron `WebContentsView`;
- Chrome DevTools Protocol (CDP) is attached to the live tab;
- the browser layer exposes runtime state such as DOM nodes, CSS, console output, screenshots, frames and viewport information;
- a selection tracker turns hover/click targets into structured element context;
- React-specific analysis can traverse React Fiber ancestry for component-level context;
- that visual/runtime context is supplied to the coding-agent workflow, which can modify a connected codebase.

There is no separate proprietary design-document model established by the pinned source. The visual surface is the running web application plus browser/runtime metadata.

## 3. Technology choices

### Client / shell

- **Desktop shell:** Electron 40 + Electron Forge.
- **Frontend:** React 19.
- **Build tooling:** Vite 7, TypeScript, pnpm workspaces + Turbo.
- **Routing/UI/editor dependencies:** TanStack Router, Monaco Editor, Tiptap/ProseMirror ecosystem, xterm, dnd-kit.

### Browser/runtime inspection

- **Embedded page surface:** Electron `WebContentsView`.
- **Browser instrumentation/inspection:** Electron Debugger API + Chrome DevTools Protocol (`devtools-protocol`).
- **Terminal/process integration:** `node-pty` + xterm.
- **Code parsing/indexing support:** Tree-sitter packages are present in the browser app.

### Data

- **Local database client:** `@libsql/client`.
- **ORM/migrations:** Drizzle ORM / Drizzle Kit.
- The pinned package manifest establishes these dependencies; the complete schema and ownership of each persisted object are not inferred here.

### AI

- The monorepo contains first-party `@stagewise/agent-core`, `@stagewise/agent-runtime-node` and `@stagewise/agent-shell` packages.
- Vercel AI SDK (`ai`) and multiple provider adapters are present, including Anthropic, OpenAI, Azure, Google/Vertex, Bedrock and OpenAI-compatible providers.
- Product-level BYOK/custom-provider support is explicitly documented in the README.

## 4. Artifact and data model

### Primary durable artifact / source of truth

For codebase-connected work, the durable implementation artifact is the connected project/repository. stagewise can also inspect arbitrary sites without a connected codebase, in which case the running page is observable but not necessarily persistable as source.

### Visual/editor representation

The main visual representation is a live browser tab. `BrowsingTabController` maintains structured tab state including URL/title, device emulation, viewport, screenshot, navigation history, console counters, permissions, DevTools state and an optional `agentInstanceId` attachment.

### Runtime identity

Selected elements are tracked using CDP backend node IDs plus frame IDs. This is a runtime-browser identity, not a source-file identity.

### Framework enrichment

For React pages, `ReactComponentTracker` inspects private React Fiber links on DOM nodes (`__reactFiber$` / `__reactInternalInstance$`) and walks the Fiber return chain to recover component/display/debug-owner information.

### Change model

The pinned files reviewed here prove selection/context capture and agent/code integration, but not a single centralized visual-operation transaction model comparable to a design editor's node-operation log. Code changes are handled through the agent/IDE workflow.

## 5. Agent interface

### Invocation surface

The coding agent is built into the stagewise browser/IDE. A tab may be attached to a concrete `agentInstanceId`.

### Context supplied to the agent

Public/source evidence establishes access to:

- browser tab/runtime state;
- selected/hovered element information;
- console/debugger information;
- screenshots and viewport state;
- React component ancestry where available;
- connected codebase context;
- terminal/process capabilities through the broader IDE.

### Internal agent architecture

The monorepo separates agent concerns into `agent-core`, `agent-runtime-node` and `agent-shell` workspaces. This is an internal first-party agent runtime rather than an external-agent-only visual overlay.

### Human correction path

The user can navigate the real application, choose runtime elements and continue the coding-agent conversation from that concrete browser context. Exact approval semantics for every code mutation are outside the files reviewed in this pass.

## 6. Runtime and rendering

### Execution/rendering surface

`apps/browser/src/backend/services/window-layout/browsing-tab-controller.ts` creates an Electron `WebContentsView`. Browser content uses a persistent Electron session partition named `persist:browser-content`.

### CDP instrumentation

The browser controller and `SelectedElementTracker` attach Electron's debugger and enable CDP domains including:

- `DOM`;
- `CSS`;
- `Page`;
- `Runtime`.

The controller also records screenshots, viewport geometry, console logs and DevTools state.

### Frame/context handling

The element tracker caches frame information and execution contexts for both the main world and Electron isolated/preload world. Navigation invalidates and rebuilds these caches.

### React runtime inspection

`ReactComponentTracker` injects analysis helpers into the page's main world and accesses React Fiber pointers from DOM elements. It then serializes a bounded ancestor chain to produce component-level information without serializing the Fiber object graph itself.

## 7. Source mapping and targeting

### DOM targeting

The deterministic targeting primitive is CDP `backendNodeId` + `frameId`. `SelectedElementTracker` performs hit-testing, resolves backend nodes into runtime object IDs, maintains frame/context caches and emits structured selected/hovered-element events.

### React targeting

For React pages, Fiber inspection recovers component names/display names/debug-owner metadata and component ancestry.

### Source-location mechanism

The pinned source proves robust runtime and framework-level targeting. This pass has **not** established a universal deterministic `DOM node → source file + line` mapping mechanism from the inspected files. Permanent edits are possible when a codebase is connected, but the exact source-location inference path must be traced separately rather than assumed.

### Known unmappable cases

- arbitrary sites may have no local source tree;
- non-React pages cannot use React Fiber enrichment;
- cross-origin/frame execution contexts can limit runtime inspection;
- runtime/component identity does not by itself prove an exact source line.

## 8. Persistence and versioning

### Browser state

The embedded browser uses Electron's persistent `persist:browser-content` partition. The controller tracks navigation history, viewport and related runtime state.

### Application/session data

The browser package includes libSQL + Drizzle dependencies, establishing a local relational persistence layer. Exact table ownership for sessions, projects and history remains to be pinned to schema files in a later pass.

### Code/workspace versions

stagewise's product workflow is repository/codebase oriented and includes worktree concepts in the UI/source tree. The precise git/worktree lifecycle is not fully traced in this pass.

### Undo/redo

No claim is made here about a universal visual-editor undo transaction model; this requires separate source tracing.

## 9. Open-source implementation map

Repository pinned at `065cf5f23646f5c2d238c669cfb7112609f7bc6b`.

| Concern | Repository path | What it establishes |
|---|---|---|
| Product model | `README.md` | browser-first agentic IDE, console/debugger/codebase workflow, model/provider posture |
| Monorepo | `package.json` | pnpm/Turbo workspace, shared agent/runtime dependencies |
| Desktop/browser app | `apps/browser/package.json` | Electron/React/Vite stack, AI SDK/provider adapters, libSQL/Drizzle, Monaco/xterm/tree-sitter |
| Browser tab runtime | `apps/browser/src/backend/services/window-layout/browsing-tab-controller.ts` | `WebContentsView`, persistent partition, screenshots, console/CDP/devtools/viewport state |
| Element targeting | `apps/browser/src/backend/services/window-layout/selected-element-tracker/index.ts` | CDP DOM/CSS/Page/Runtime attachment, backendNodeId/frame/context tracking |
| React enrichment | `apps/browser/src/backend/services/window-layout/selected-element-tracker/react-component-tracker.ts` | React Fiber discovery and ancestor/component metadata extraction |
| Agent packages | `packages/agent-core/`, `packages/agent-runtime-node/`, `packages/agent-shell/` | first-party agent runtime separation |

## 10. Commit-level evidence

**Pinned revision:** `065cf5f23646f5c2d238c669cfb7112609f7bc6b`

| Claim | Evidence at pinned revision |
|---|---|
| stagewise is an open-source browser-first agentic IDE with tab console/debugger access and optional codebase connection | [`README.md`](https://github.com/stagewise-io/stagewise/blob/065cf5f23646f5c2d238c669cfb7112609f7bc6b/README.md) |
| The desktop browser is Electron/React and includes CDP, libSQL/Drizzle, Monaco, xterm and AI SDK/provider dependencies | [`apps/browser/package.json`](https://github.com/stagewise-io/stagewise/blob/065cf5f23646f5c2d238c669cfb7112609f7bc6b/apps/browser/package.json) |
| The live page runs in `WebContentsView` with persistent browser partition and structured tab state | [`browsing-tab-controller.ts`](https://github.com/stagewise-io/stagewise/blob/065cf5f23646f5c2d238c669cfb7112609f7bc6b/apps/browser/src/backend/services/window-layout/browsing-tab-controller.ts) |
| Element selection is based on CDP backend node/frame/context identity | [`selected-element-tracker/index.ts`](https://github.com/stagewise-io/stagewise/blob/065cf5f23646f5c2d238c669cfb7112609f7bc6b/apps/browser/src/backend/services/window-layout/selected-element-tracker/index.ts) |
| React runtime context is enriched by Fiber inspection | [`react-component-tracker.ts`](https://github.com/stagewise-io/stagewise/blob/065cf5f23646f5c2d238c669cfb7112609f7bc6b/apps/browser/src/backend/services/window-layout/selected-element-tracker/react-component-tracker.ts) |

## Evidence boundary

- **Fact:** Electron/CDP runtime, selection identity, React Fiber enrichment, public agent-provider support and package-level technology choices are source-established.
- **Inference:** the running application acts as the visual artifact surface because this follows directly from the browser/controller architecture.
- **Unknown:** deterministic source-file/line mapping for arbitrary selected nodes, exact session/database schemas, full worktree/version semantics and all agent approval rules remain unclaimed.

## Research gaps

- Trace selected-element context from browser events into the agent prompt/tool context end-to-end.
- Determine whether and how stagewise resolves selected DOM/React components to concrete source files/lines.
- Pin database schemas for sessions/projects/browser history.
- Trace git/worktree lifecycle and code-apply/approval semantics.
- Trace temporary arbitrary-site edits versus connected-codebase persistent edits.

## Primary sources

- https://github.com/stagewise-io/stagewise/tree/065cf5f23646f5c2d238c669cfb7112609f7bc6b
- https://stagewise.io
