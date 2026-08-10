# Cursor Design Mode and Canvases

> Research status: **Architecture-level / closed-source boundary reached** · Last reviewed: **2026-08-11**

| Field | Value |
|---|---|
| Organization / team | Anysphere |
| Category | Coding agent with visual workflow and agent-authored interactive artifacts |
| Status | Active |
| Source availability | Core client and hosted services closed; official issue repository and adjacent plugin/cookbook repositories public |
| Decisive artifact question | Does a visual gesture mutate the running application, its source repository, or a separate Cursor Canvas? |
| Evidence used | Current official docs/changelog, fixed public Git revisions, and a read-only inspection of the installed Cursor 3.13.25 distribution |

## Product boundary: one “Design Mode” name spans two different authorities

Cursor now exposes Design Mode in two surfaces that look similar but do not own the same artifact:

| Surface | What the user points at | What Cursor sends to an agent | Mutation authority | Durable center |
|---|---|---|---|---|
| Browser Design Mode | A rendered element or frozen region in a running web application | Runtime identity, framework/component hints, styles, geometry, text and a screenshot | Agent edits the application files; the development runtime then hot reloads | Repository/worktree files and, eventually, Git |
| Canvas Design Mode | An element inside an agent-authored interactive Canvas | A visual reference to the Canvas UI plus the user's instruction | Agent edits the Canvas source | Managed `.canvas.tsx` plus optional `.canvas.data.json` state |

The distinction is architectural, not merely organizational. Browser Design Mode is a **target-return aid for existing application code**. A Canvas is a **new first-class artifact** that Cursor can create, reopen, rerun, manually edit and publish. Selecting the same-looking button or card in the two surfaces does not imply the same persistence, source mapping or delivery path.

## Journey A: repair a running interface without creating a design document

The ordinary Browser Design Mode journey is:

1. Open a repository in Cursor and start or reuse its development server.
2. Open the application in the Browser inside the Agents Window.
3. Toggle Design Mode, then select one or several elements, draw over a frozen viewport, or speak a request.
4. Cursor inserts the selected target and visual state into Agent context.
5. Agent searches for the relevant authored code and changes files.
6. The application hot reloads as agents finish; the user inspects the resulting runtime and diff.
7. The user keeps working locally, commits or opens a PR from an isolated worktree, or explicitly applies the worktree result to the main checkout.

This journey is intentionally not “design file → code export.” The running application is the observation surface, while the repository remains the implementation authority.

### The original visual editor had a speculative preview stage

Cursor 2.2 introduced a browser sidebar and component tree that could drag rendered DOM elements, test React props, adjust CSS/layout controls and preview different arrangements. The product announcement was explicit: after the preview matched the user's intent, the user told Agent to **apply** it, and Agent located components and changed underlying code.

That creates two states:

```text
temporary browser experiment -> Agent materialization -> authored files -> hot-reloaded runtime
```

The visual experiment was not itself durable application state. Current Design Mode documentation emphasizes click, multi-select, drawing and voice rather than promising every 2.2 direct-manipulation control. The historical editor and current targeting workflow therefore should not be collapsed into one timeless feature contract.

## Browser targeting is a composite runtime packet, not source identity

The current official contract says that an element pick contributes two complementary signals:

- element identity: “xpath,” component, attributes, computed styles and props from the React Fiber tree;
- screenshot: layout, surrounding elements and the exact visible state.

The fixed Cursor 3.13.25 distribution makes this boundary more precise.

### The downstream protocol is small and string-based

The packaged `agent.v1.SelectedUIElement` and `aiserver.v1.RCPUIElementPicked` messages each expose six fields:

| Field | Meaning in the packaged client |
|---|---|
| `element` | Component or element label |
| `xpath` | Structural target path supplied by the picker |
| `text_content` | Visible text excerpt |
| `extra` | JSON string containing DOM attributes, geometry, style and optional framework metadata |
| `component` | Optional framework component name |
| `component_props_json` | Optional serialized component props |

No file path, line, column, module id, source-map location, AST node or repository revision appears in this public-facing packaged message shape.

### The field called `xpath` is not an XPath expression in the inspected build

The current picker constructs a CSS-like breadcrumb from:

- lowercase tag name;
- authored `id` when present;
- otherwise all class names;
- a zero-based sibling suffix when several siblings have the same tag/class signature;
- parent segments up to, but excluding, `body`.

It then assigns that string to the protocol field named `xpath`. A representative shape is conceptually:

```text
main.app > section.grid > button.primary[1]
```

This is a structural re-addressing hint. Class changes, sibling insertion, conditional rendering and hot reload can invalidate it. Calling the field `xpath` does not make it a browser-native XPath, a stable node id or a source pointer.

### The current element id is session-local by design

The newer co-bundled picker assigns `cursor-el-N` identifiers in a `WeakMap`. Its own implementation comment says an earlier `data-cursor-element-id` attribute strategy interfered with Next.js Fast Refresh/HMR because React observed foreign attributes. Moving identity off-DOM prevents that mutation, but also makes the id local to the injected picker and current element object. A reload that replaces the DOM node does not preserve this identity.

An older picker path still present in the bundle sets the attribute directly. Presence of both paths in a compiled distribution is not proof that both execute for the same surface or feature gate; activation tracing is unavailable. It is evidence that “unique id” is an implementation convenience, not a documented durable cross-reload identity.

### Framework context is richer than source mapping and varies by picker path

The newer packaged picker can walk runtime structures for:

- React Fiber names;
- Vue `__vueParentComponent` ancestry;
- Svelte `__svelte_meta` ancestry.

It emits a framework name and filtered component-name stack, but its constructed payload leaves `componentPropsJson` undefined. An older co-bundled path finds React Fiber or internal-instance keys, climbs to a named component and serializes props with depth, key-count, array-length and circular-reference guards.

Therefore three claims must remain separate:

1. **Established:** Cursor can attach runtime component hints to a visual target.
2. **Version/path dependent:** props and supported framework details differ across co-bundled picker implementations.
3. **Not established:** the client has a deterministic component-to-file/source-map binding.

The protocol itself still asks Agent to find the authored code.

### Screenshot and annotation carry state that the structural target cannot

Drawing operates over a frozen viewport frame. The packaged client captures a viewport image, rescales points and crop bounds, and attaches the rendered annotation separately from the selected-element packet. This preserves animation/layout state that a structural path cannot describe, but it is visual evidence rather than an editable node graph.

## Target return stops before the authored source location

The most defensible target-return model is:

```text
visible element
  -> session-local DOM identity + structural path
  -> framework/component hints + attributes/style/geometry/text
  -> screenshot or frozen annotation
  -> Agent repository search and reasoning
  -> file edit
  -> hot reload and human verification
```

This is stronger than an ungrounded screenshot prompt because the target packet distinguishes the intended element and surrounding runtime. It is weaker than deterministic build-time instrumentation because the packet does not carry an authored file/range identity.

The practical breaks follow directly:

- component names can be minified, wrapped, anonymous or repeated;
- Vue/Svelte/React runtime ancestry is component evidence, not an import path;
- CSS modules and generated utility classes can change the structural path;
- a list item can map to one shared component implementation;
- a selected DOM node can be produced by a library, slot, portal or runtime branch far from the desired edit;
- a screenshot can preserve the right pixels while the DOM packet points at a node replaced by HMR;
- Agent can choose a plausible but wrong file even when every captured runtime field is accurate.

No examined public API documents how an external tool could submit or receive this complete target packet, and no public schema promises stable compatibility across client versions.

## Parallel visual edits introduce a snapshot-concurrency problem

Design Mode deliberately lets the user send another edit before the first agent finishes. Several subagents can operate while the application hot reloads as results land.

The user-facing speedup also creates at least four independently advancing states:

| State | How it advances | Conflict risk |
|---|---|---|
| Selected runtime target | Captured at click/draw time | DOM and component ancestry may be replaced before Agent acts |
| Agent context | Frozen per request | Later visual observations are not automatically inserted into an earlier request |
| Repository/worktree | Changed by one or more agents | Agents can touch shared files or implement incompatible assumptions |
| Running app | Hot reloads from whichever files are active | The visible result can combine changes not present in the original screenshot |

Cursor documents the parallel flow but does not publish a visual-target revision, DOM precondition, optimistic lock or transaction that rejects a stale edit. Worktrees can isolate filesystem mutations between agent runs; they do not make an old DOM selection current.

## Browser automation is a separate Agent control plane

Design Mode is human-to-Agent context. Cursor Browser also lets Agent navigate, click, type, scroll, capture screenshots, read console output and inspect network traffic.

The installed distribution includes a `cursor-browser-automation` extension whose manifest describes an MCP server. Its bundled tool names include navigation, click, fill, drag, snapshot, screenshot and tab operations. This supports the official architecture statement that a secure web view is controlled through an MCP server running as an extension.

The distinction matters:

| Plane | Initiator | Payload/result | Primary risk |
|---|---|---|---|
| Design Mode selection | Human | Target packet and visual prompt for Agent | stale or ambiguous source grounding |
| Browser automation | Agent | Browser actions, screenshots, logs and network observations | unintended navigation/submission or prompt injection |
| Repository tools | Agent/human | File edits, terminal actions, diffs and Git state | wrong mutation scope or incomplete validation |

Browser tool actions require approval by default. Cursor also offers allow-list and auto-run modes, while warning that these are best-effort protections. The browser's cookies, local/session storage and IndexedDB persist across Agent sessions within a workspace-isolated context. A successful authenticated browser replay is therefore not evidence that the repository or Canvas is versioned, and browser state can outlive the request that created it.

## Journey B: create and iterate a Cursor Canvas

The ordinary Canvas journey is different:

1. Ask Agent for a dashboard, report, audit, analysis or custom interface, or let Cursor choose Canvas as the better response form.
2. Agent authors the Canvas and inserts a reference card into chat.
3. Open the rendered artifact beside the conversation.
4. Ask Agent to revise it, switch to its source for a manual edit, or use Design Mode to point at its rendered UI.
5. Reopen it from the workspace Canvas list and rerun underlying queries for fresh data.
6. Optionally publish or refresh a team-visible browser snapshot.

The initial April 2026 release describes Canvas as a durable artifact beside terminal, browser and source control. Current docs say it is saved, can be reopened without rerunning the original Agent task, and can later rerun with fresh data.

## A Canvas is a managed TypeScript/React artifact with a state sidecar

Official docs expose “source” editing but not the filesystem contract. The Cursor 3.13.25 package does:

- Canvas source ends in `.canvas.tsx`.
- Managed sources are accepted only under the user-level pattern `.cursor/projects/<workspace-key>/canvases/<name>.canvas.tsx`.
- The workspace key is derived from the first workspace root or workspace id and the directory is created under the user's home `.cursor/projects` area.
- Persistent interactive state uses a sibling `<name>.canvas.data.json` sidecar.
- `useCanvasState(key, defaultValue)` promises that values survive rebuilds, reloads and IDE restarts; keys are stable independently of hook order.
- The public authoring import is `cursor/canvas`.
- The bundled SDK exposes layout, typography, cards, tables, charts, diffs, forms, todo lists, theme tokens and a DAG layout helper.

This means the durable Canvas is not merely a serialized chat attachment or hosted screenshot. It is local source rendered by a Cursor-managed runtime, with mutable data stored separately when the author opts into `useCanvasState`.

It also means a Canvas associated with a repository is **not automatically inside that repository or its Git history**. Moving, deleting, copying, committing or applying a worktree does not, by itself, establish what happens to the user-home Canvas and its sidecar.

### Canvas actions are one-way host commands

The packaged SDK exposes `useCanvasAction()` for three host-directed actions:

- `openAgent`: navigate to a local or cloud Agent conversation by id;
- `newComposerChat`: open a new local Agent chat with the Canvas file mentioned and an optional prompt;
- `openFile`: open a workspace file, optionally at a line/column selection.

The type documentation explicitly calls these actions **fire-and-forget**: the Canvas receives no response. A button can start a prompt or open a file, but that button has no built-in transaction proving the requested Agent task completed or that the file changed.

## Canvas rendering, sharing and source authority form three stages

The installed client registers a managed Canvas with a Canvas server provider, obtains a `canvasId` and preview URL, and creates a tunnel when the provider is remote. The editor session can be disposed while the `.canvas.tsx` remains the reopenable artifact.

Publishing adds another authority:

```text
local .canvas.tsx + optional state sidecar
  -> managed Canvas runtime
  -> explicitly published/refreshed live snapshot
  -> read-only team browser view
```

Official docs specify that sharing uploads a live snapshot and requires an eligible paid plan, team membership, storage-compatible privacy mode and enabled team settings. Teammates receive the layout, charts and tables without rerunning Agent. The share is therefore a delivery snapshot, not a collaborative source checkout, and it becomes stale until explicitly refreshed after local edits.

Public evidence does not establish whether every sidecar value, external data source, prompt button capability or local file dependency is embedded in the shared snapshot. It also does not document an export from Canvas into ordinary application source or a reverse binding from a Canvas element into some separate repository UI.

## The two visual loops do not roundtrip into each other

| Direction | What is established | What is not established |
|---|---|---|
| Running app → Agent | Runtime target packet and screenshot can ground a repository edit | Stable file/range identity or a saved design graph |
| Agent → running app | File edits appear through hot reload | Atomic visual commit or automatic acceptance |
| Agent → Canvas | Agent authors managed `.canvas.tsx` and can persist sidecar state | Automatic insertion into the application repository |
| Canvas Design Mode → Canvas | Point/annotate can guide Agent changes to the Canvas | Public node-to-source protocol or conflict semantics |
| Canvas → team browser | Publish/refresh uploads a read-only live snapshot | Bidirectional collaboration or downstream source sync |
| Canvas → application code | A Canvas button can open a file or start a prompt | Deterministic conversion, completion receipt or shared transaction |

“Both are inside Cursor” is workflow proximity, not one artifact model.

## Persistence and versioning have at least eight clocks

| Clock | Durable unit | Restore/advance mechanism | Boundary |
|---|---|---|---|
| Application source | Files in the selected checkout | Editor/Agent edits, Git commit/revert | The visual selection is not stored as source identity |
| Agent worktree | Isolated Git checkout | Commit/PR, explicit `/apply-worktree`, deletion | Finishing an agent does not merge its files |
| Running browser | Current server output and page state | Dev server, refresh and HMR | A reload can invalidate selected nodes and session-local ids |
| Browser session data | Cookies, Web Storage and IndexedDB scoped by workspace | Automatic persistence across Agent sessions | It is runtime state, not source history |
| Visual target packet | Request context and optional frozen screenshot | New selection/new prompt | No published revision or replay contract |
| Canvas artifact | Managed `.canvas.tsx` | Agent/manual source edit and reopen | Stored outside the ordinary project repository by default |
| Canvas interactive state | `.canvas.data.json` sidecar | `useCanvasState` | Separate lifecycle from source and Git |
| Shared Canvas | Uploaded team-visible snapshot | Publish or refresh | Read-only delivery can lag behind local source/state |

Legacy Cursor checkpoint documentation described local, Agent-only snapshots distinct from Git and not permanent version control. That documentation now redirects away from a current checkpoint page, so this dossier does not assume a checkpoint is present, complete or usable for every contemporary local/cloud Design Mode run.

## Ordinary-user failure atlas

| Journey point | User-visible symptom | Technical boundary | Required recovery or verification |
|---|---|---|---|
| Select element | Agent edits a sibling or parent | Structural path/component hint is ambiguous | Re-select after reload; mention the intended component/file explicitly |
| Select before HMR | Highlight/reference no longer matches the page | WeakMap id belongs to replaced DOM object | Capture a new selection and screenshot |
| Multi-select | Shared component change affects every instance | Several DOM instances can share one authored component | Review diff and all rendered instances |
| Queue edits | Later result overwrites or contradicts an earlier one | No public visual-target transaction across parallel agents | Isolate tasks/worktrees and re-run the final app state |
| Drag/style preview | Browser looked correct but reload loses it | Historical direct manipulation required Agent materialization | Confirm a real file diff before leaving the preview |
| Agent reports completion | Code changed but target journey still fails | Tool completion is not runtime acceptance | Exercise the ordinary user path, console/network and responsive states |
| Worktree run | Main checkout still shows old UI | Worktree is intentionally isolated | Review, commit/PR or explicitly apply the result |
| Browser automation | Unexpected navigation or form submission | Agent controls an authenticated persistent browser | Keep manual approvals for untrusted sites and inspect action logs |
| Open Canvas | Provider timeout, type error or blank render | Managed source requires a Canvas runtime session and compatible SDK | Inspect `.canvas.tsx`, type error and provider/runtime availability |
| Reopen Canvas | UI state resets | Sidecar absent, moved or incompatible with source | Inspect the sibling `.canvas.data.json` and state keys |
| Publish Canvas | Share unavailable | Plan/team/privacy/admin gates | Satisfy the documented sharing gates or deliver another artifact |
| View shared Canvas | Team sees old numbers/layout | Share is a snapshot, not live source sync | Refresh the share after rerunning/editing |
| Use Canvas button | Prompt/file opens but expected work never lands | Host action is fire-and-forget | Inspect the target conversation/file and verify its resulting artifact |
| Treat Canvas as repo output | Clone/checkout lacks the Canvas | Managed source lives under user-home `.cursor/projects` | Export/copy intentionally if repository ownership is required |

## Product evolution changed both the surface and the artifact model

| Date | Release evidence | Architectural change |
|---|---|---|
| 2025-10-29 | Cursor 2.0 | Browser for Agent became generally available, establishing the integrated runtime-observation surface |
| 2025-12-10/11 | Cursor 2.2 changelog and visual-editor announcement | Browser gained DOM drag/drop, React prop inspection, CSS/layout controls and Agent apply-to-code |
| 2026-04-02 | Cursor 3.0 | Agents Window unified local, worktree, cloud and remote agents; Design Mode became a first-class element/area targeting flow |
| 2026-04-13 | Cursor 3.1 | Keyboard navigation through the element tree improved target selection; tiled Agent layouts persisted across sessions |
| 2026-04-15 | Canvases launch | Agent responses could become durable interactive artifacts built from first-party React components |
| 2026-05-20 | Cursor 3.5 | Canvas publishing added team-visible read-only live snapshots |
| 2026-06-04 | Cursor 3.7 | Design Mode was added to Canvases, joining visual targeting to the second artifact authority |
| 2026-06-05 | Design Mode announcement/improvements | Multi-select, frozen drawing, voice queueing and parallel visual-edit flow were documented in detail |

The historical sequence explains why “Cursor Design Mode” cannot be represented as one static canvas-to-code architecture: Browser editing came first, Agents Window changed concurrency and isolation, and Canvas later introduced a separate durable source/runtime/share chain.

## Open-source and commit-level evidence boundary

### `cursor/cursor` is an issue/download shell, not the client source

The official public repository resolves to [`cursor/cursor@654b1b4775ca67aef473bd31a14c8c04a1abde2d`](https://github.com/cursor/cursor/tree/654b1b4775ca67aef473bd31a14c8c04a1abde2d). Its complete pinned tree contains only:

- `.github/ISSUE_TEMPLATE/new-issue.md`;
- `README.md`;
- `SECURITY.md`.

The README directs users to the website, download and forum. It contains no workbench, picker, Canvas, Agent, renderer or persistence implementation. Other official public repositories such as `cursor/plugins`, `cursor/cookbook` and `cursor/sdk-bridge` expose extension examples and adjacent tooling; they are not the proprietary desktop client.

### The installed distribution is inspectable but not an open-source repository

The read-only local evidence snapshot was:

| Item | Fixed value |
|---|---|
| Cursor version | `3.13.25` |
| Distribution id | `d5c0e77a0214208f36b56d42e8e787de88d02ea4` |
| Declared VS Code base | `1.128.0` |
| `workbench.glass.main.js` | 48,276,446 bytes; SHA-256 `5979ee3f454cd0f5fd25ebbdbdea5676159d80cfad7a1b0881cc1299b93be198` |
| Browser automation manifest | SHA-256 `286a043c03d8093cd708c765dffb773f562541ecb0a3a4f9505dfb3f7a6ddf29` |
| Canvas `hooks.d.ts` | SHA-256 `b8acf8388a6c3da6b7bc3f95619dd508502d50660f360d8778b4822334299c84` |
| Canvas `index.d.ts` | SHA-256 `9fb5f6f59b8d98fe4c963496a63183a753f7b1e8e151829c51cc3bce163d87ad` |
| Bundled Canvas SDK version marker | `bb42508f11484c6fed6d725bb813efa3809beb5ad7cf3b9e9de9b3345c2989e3` |

The package metadata points its repository field at upstream `microsoft/vscode`, which identifies the editor base rather than publishing Anysphere's proprietary additions. Minified bundle strings and distributed type declarations can establish shipped message shapes, algorithms and paths for this exact build; they do not supply source history, build provenance, tests, server implementation or license permission to call the product open source.

## Facts, inferences and unknowns

### Established facts

- Browser Design Mode targets a running application and asks Agent to edit code.
- Selection context includes runtime element/component evidence plus a screenshot.
- The inspected message schema carries no source file/range identity.
- The inspected structural target uses a CSS-like path even though its protocol field is named `xpath`.
- The current packaged picker includes session-local WeakMap ids and runtime component-stack detection.
- Cursor Browser automation runs through an extension/MCP control plane and persists workspace-scoped browser storage.
- Cursor Canvases are durable, editable, reopenable and rerunnable artifacts.
- The inspected build materializes Canvas source as managed `.canvas.tsx` and interactive state as `.canvas.data.json`.
- Canvas host actions are fire-and-forget.
- Shared Canvases are explicit, read-only team-visible snapshots.
- Worktrees isolate code mutations and require an explicit commit/PR/apply path.

### Evidence-backed inferences

- Browser target return is best classified as **heuristic runtime context**, not deterministic source mapping.
- A hot reload can invalidate both the structural path and session-local element id captured by an earlier request.
- Browser and Canvas Design Mode converge through a similar human gesture but terminate at different source authorities.
- Canvas source/state outside the application repository requires an intentional handoff if the team expects Git ownership.
- Parallel visual prompting improves throughput while increasing the need for final integrated runtime acceptance.

### Material unknowns

- Which co-bundled picker implementation and feature flags execute for every Browser/Canvas/framework combination.
- The model-side algorithm that maps target packets to repository files and how candidates are ranked.
- Whether any non-public source-map or framework adapter augments the six-field packet server-side.
- Conflict/precondition semantics when the DOM, Canvas source or repository changes after a target is captured.
- Exact Canvas compiler, sandbox, module allowlist, process isolation and network policy.
- Complete schema, migration and atomic-write behavior of `.canvas.data.json`.
- Whether publishing embeds every sidecar value and dependency or re-executes any local logic.
- Retention/version graph for local Canvas source, sidecar state and published snapshots.
- Roundtrip semantics, if any, between Canvas source and ordinary application source.
- Whether Canvas files are copied, shared or separated when Agent tasks move among local, worktree, cloud and remote environments.

## Verification performed for this snapshot

- Read the current official Design Mode, Browser, Canvases, Worktrees, Agents Window and Agent Review documentation.
- Cross-checked the 2.2, 3.0, 3.1, Canvas launch, Shared Canvas and 3.7 release history.
- Inspected the installed Cursor 3.13.25 package metadata, product metadata, browser-automation manifest, Canvas SDK type declarations and fixed-hash workbench bundle without launching or mutating the application.
- Traced the distributed selected-element protocol fields, structural-path builder, element-id strategy, framework-stack detector, annotation image path, managed Canvas path, sidecar convention, provider lifecycle and share boundary.
- Queried the full Git tree of the official public issue repository at commit `654b1b4775ca67aef473bd31a14c8c04a1abde2d`.
- Did not sign in, publish a Canvas, run a user's application, execute browser actions or infer undisclosed hosted-service internals.

## Primary sources

- [Design Mode docs](https://cursor.com/docs/agent/design-mode)
- [Browser docs](https://cursor.com/docs/agent/tools/browser)
- [Canvases docs](https://cursor.com/docs/agent/tools/canvas)
- [Worktrees docs](https://cursor.com/docs/configuration/worktrees)
- [Agents Window docs](https://cursor.com/docs/agent/agents-window)
- [A visual editor for the Cursor Browser](https://cursor.com/blog/browser-visual-editor)
- [Cursor 2.2: Browser layout and style editor](https://cursor.com/changelog/2-2)
- [Cursor 3.0: New Cursor Interface](https://cursor.com/changelog/3-0)
- [Cursor 3.1: tiled layout and Design Mode element-tree navigation](https://cursor.com/changelog/3-1)
- [Canvases launch](https://cursor.com/changelog/04-15-26)
- [Canvas product announcement](https://cursor.com/blog/canvas)
- [Shared Canvases](https://cursor.com/changelog/shared-canvases)
- [Canvas Design Mode](https://cursor.com/changelog/canvas-improvements)
- [Direct agents with visual prompts in Design Mode](https://cursor.com/blog/design-mode)
- [Design Mode improvements](https://cursor.com/changelog/design-mode-improvements)
- [`cursor/cursor` pinned public tree](https://github.com/cursor/cursor/tree/654b1b4775ca67aef473bd31a14c8c04a1abde2d)

## Evidence-bounded conclusion

Cursor's decisive design mechanism is not a hidden design document. Browser Design Mode compresses a visible runtime target into a version-sensitive context packet, then relies on Agent to recover authored code and materialize the change. Its shipped target contract is unusually inspectable for a closed client, yet it still stops before file/range identity.

Canvases add a second, genuinely durable design-capable artifact: managed React/TypeScript source with optional persistent sidecar state and an explicit publish snapshot. The two loops share visual prompting and Agent orchestration, but not one source of truth. Any evaluation that calls both “visual editing” without separating repository code, runtime snapshot, Canvas source, sidecar data and shared snapshot misses Cursor's actual architecture and its most important failure boundaries.
