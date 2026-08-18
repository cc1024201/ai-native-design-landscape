# Onlook

> Research status: **Source-level** · Last reviewed: **2026-08-10**

| Field | Value |
|---|---|
| Organization / team | Onlook |
| Category | Code-native visual surface |
| Status | Open-source editor active; hosted next-generation product in early access |
| Source availability | Apache-2.0 open source for the editor analyzed here |
| Previous names / aliases | Onlook Desktop is an earlier implementation referenced by the current repo |
| Canonical product URL | https://onlook.com |
| Canonical source repository | https://github.com/onlook-dev/onlook |
| Pinned source revision | `423e2e924366419e418ee049093872d535eea41a` |

## 1. Product facts

Onlook's public repository describes the analyzed product as an open-source, visual-first code editor for Next.js + Tailwind applications. The editor can create/import an application, run it, display the live result, edit the rendered UI visually, edit code side-by-side, use AI chat against the codebase, branch design work, save/restore checkpoints, run commands, and deploy.

The same README also draws an important product boundary: the repository is the open-source visual editor that "started Onlook", while a newer hosted product for AI-native designers is being built separately and is in early access. Therefore the source-level claims below apply to the pinned open-source repository, not automatically to undisclosed internals of the hosted successor.

## 2. Technical direction

The source architecture is explicitly code/runtime-first:

1. project code is loaded into a web container;
2. the project is executed and served;
3. Onlook displays the live preview in an iframe;
4. Onlook reads/indexes project code;
5. JSX is instrumented so rendered elements can be mapped back to source identity;
6. visual edits are reflected in the iframe and persisted back into code;
7. AI chat receives code access and editing tools.

The current implementation is optimized for Next.js + TailwindCSS, while the project states that the instrumentation approach could generalize to other declarative DOM-producing frameworks.

## 3. Technology choices

### Client / application

- **Application framework:** Next.js.
- **Styling:** TailwindCSS.
- **Server interface:** tRPC.
- **Monorepo/runtime/package manager:** Bun; root workspace spans `packages/*`, `apps/*`, `tooling/*`, `apps/web/*`, and docs.
- **Container management:** Docker is part of the local/backend operational stack.

### Data/backend

- **Auth/database/storage:** Supabase.
- **ORM:** Drizzle.

### AI

- **LLM client/orchestration SDK:** Vercel AI SDK.
- **Model routing/provider:** OpenRouter is listed by the project.
- **Fast-apply providers:** Morph Fast Apply and Relace are listed in the pinned README.

### Sandbox/runtime/deployment

- **Development sandbox:** CodeSandbox SDK.
- **Hosting/deployment:** Freestyle is listed by the project.
- **Default generated-project commands:** `bun install`, `bun run dev`, `bun run build` are encoded in editor defaults.

## 4. Artifact and data model

### Primary durable artifact / source of truth

The application codebase is the durable implementation artifact. The product edits JSX/TSX/CSS/Tailwind-backed project files and runs those files to obtain the live UI. There is no evidence in the pinned source that a separate Figma-like design document replaces the application source as the primary implementation artifact.

### Runtime/editor representation

The user edits a live DOM rendered from the application inside an iframe. Onlook adds editor-specific DOM/source identities including:

- `data-oid` — Onlook source identity;
- `data-oiid` — instance identity;
- `data-odid` — runtime DOM identity;
- `data-ocname` — component-name metadata;
- additional attributes for inserted, dragged, editing-text and dynamic element state.

### Source identity model

The parser walks JSX opening elements and ensures each non-fragment element has a unique `data-oid`. It handles missing, invalid and duplicate IDs and also detects branch conflicts. OIDs are therefore not merely transient browser selectors; they are intentionally inserted into the JSX AST to establish durable source identity.

### Change model

The source defines typed editor actions including:

- `update-style`;
- `insert-element` / `remove-element`;
- `move-element`;
- `edit-text`;
- `group-elements` / `ungroup-elements`;
- `write-code` with code diffs;
- image insert/remove.

Action targets carry `domId`, `oid` and `branchId`, connecting runtime targeting, source identity and branch state.

## 5. Agent interface

### Invocation surface

AI is exposed through Onlook's chat/editor workflow. The pinned README states that AI chat has access to project code and tools for understanding and editing it.

### Context and action path

The repository demonstrates two edit paths that converge on the same project:

- **human visual path:** select/manipulate a rendered element → build an editor action → change preview/runtime state → persist the corresponding change into project code;
- **AI path:** chat/tool execution reads project code and produces code edits/diffs.

The source-level action model contains `write-code` operations alongside direct visual operations, allowing both to participate in editor history.

### Protocol boundary

The product uses tRPC for application/server calls, but the pinned evidence reviewed here does not establish a public, stable external agent protocol equivalent to MCP/App Server. Treat the AI tool contract as internal unless further source tracing proves a public boundary.

## 6. Runtime and rendering

### Execution environment

Application code runs in a development sandbox/web container. The project README names CodeSandbox SDK as the sandbox technology.

### Preview/rendering

The running application's preview URL is displayed in an iframe inside the visual editor. Onlook overlays editor UI and selection/manipulation affordances on top of that live application.

### Runtime instrumentation

The `apps/web/preload/script` package contains the browser-side preload/instrumentation layer. Runtime helpers read Onlook IDs from DOM nodes, track selected elements, and support DOM manipulation APIs used by the editor.

### Isolation boundary

The running user project is sandboxed separately from the editor/application backend. Exact hosted-production isolation guarantees are not inferred beyond the public CodeSandbox SDK architecture statement.

## 7. Source mapping and targeting

This is one of the clearest source-level mechanisms in Onlook.

### Stable source identity

`packages/parser/src/ids.ts` parses JSX ASTs and injects/repairs `data-oid` attributes. IDs are checked against local/global sets and branch ownership, so duplicate or cross-branch collisions cause regeneration.

### Runtime identity

`packages/constants/src/editor.ts` defines separate identifiers for source (`data-oid`), instance (`data-oiid`), runtime DOM (`data-odid`) and component name (`data-ocname`). This separation lets one source element be distinguished from runtime instances and concrete DOM nodes.

### DOM targeting

The preload layer under `apps/web/preload/script/` reads these identifiers from rendered elements and exposes DOM-level editor behavior. The canvas overlay under `apps/web/client/.../canvas/overlay/` uses the selected/runtime element information for selection rectangles and text editing.

### Source writeback

The parser and client code-edit layers under `packages/parser/src/code-edit/` and `apps/web/client/src/components/store/editor/code/` implement source mutations corresponding to visual operations.

### Known scope

The pinned README explicitly lists non-Next.js and non-Tailwind project support as unfinished. Source mapping claims should therefore be treated as proven for the supported JSX/Next.js-oriented path, not as universal DOM-to-source mapping for arbitrary frameworks or generated/dynamic DOM.

## 8. Persistence and versioning

### Project/workspace persistence

- Project and application metadata are backed by the product's Supabase/Drizzle data layer.
- Application source lives in the project sandbox/codebase and is the material being edited.

### Undo/redo

`apps/web/client/src/components/store/editor/history/helpers.ts` defines reversible editor actions. It reverses style changes, code diffs, insert/remove, group/ungroup, move, text and image actions. This is an explicit operation-level undo/redo model rather than screenshot restoration.

### Branching

The product exposes branching for design experiments. Branch identity is also present inside action targets and OID conflict resolution, proving that branch state participates in editor/source identity.

### Checkpoints

The product README advertises save/restore checkpoints. The exact checkpoint storage schema and relationship to sandbox snapshots/branches has not yet been traced to a pinned implementation file and remains a research gap.

### Collaboration

Real-time editing is marked implemented in the README; comments are marked unfinished at the pinned revision. The exact collaboration transport/state model has not yet been source-traced in this pass.

## 9. Open-source implementation map

Repository pinned at `423e2e924366419e418ee049093872d535eea41a`.

| Concern | Repository path | What it establishes |
|---|---|---|
| Product architecture and stack | `README.md` | container → preview iframe → code indexing → instrumentation → DOM/code edits; declared stack |
| Monorepo/runtime | `package.json` | Bun workspaces, build/runtime scripts |
| Editor identity constants | `packages/constants/src/editor.ts` | source/instance/DOM/component IDs and editor data attributes |
| JSX source identity | `packages/parser/src/ids.ts` | AST traversal and durable `data-oid` insertion/repair/conflict handling |
| Editor action model | `packages/models/src/actions/action.ts` | reversible visual/code action types and target identity fields |
| Undo/redo mechanics | `apps/web/client/src/components/store/editor/history/helpers.ts` | inversion of style/code/insert/remove/move/text/group/image operations |
| Browser/runtime bridge | `apps/web/preload/script/` | runtime DOM access and editor preload APIs |
| Source-edit layer | `packages/parser/src/code-edit/` | AST/source mutation implementation |
| Client code-edit orchestration | `apps/web/client/src/components/store/editor/code/` | editor-side source-write workflow |
| Canvas overlays | `apps/web/client/src/app/project/[id]/_components/canvas/overlay/` | visual selection/manipulation UI over live render |

## 10. Commit-level evidence

**Pinned revision:** `423e2e924366419e418ee049093872d535eea41a`

| Claim | Evidence at pinned revision |
|---|---|
| Open-source editor is Next.js/Tailwind, live-preview, code-editing and sandbox-based | [`README.md`](https://github.com/onlook-dev/onlook/blob/423e2e924366419e418ee049093872d535eea41a/README.md) |
| Root is a Bun monorepo with apps/packages/tooling workspaces | [`package.json`](https://github.com/onlook-dev/onlook/blob/423e2e924366419e418ee049093872d535eea41a/package.json) |
| Editor defines separate source/instance/DOM/component identifiers | [`packages/constants/src/editor.ts`](https://github.com/onlook-dev/onlook/blob/423e2e924366419e418ee049093872d535eea41a/packages/constants/src/editor.ts) |
| JSX AST is modified to carry unique branch-aware OIDs | [`packages/parser/src/ids.ts`](https://github.com/onlook-dev/onlook/blob/423e2e924366419e418ee049093872d535eea41a/packages/parser/src/ids.ts) |
| Visual and code changes share a typed action model | [`packages/models/src/actions/action.ts`](https://github.com/onlook-dev/onlook/blob/423e2e924366419e418ee049093872d535eea41a/packages/models/src/actions/action.ts) |
| Undo/redo reverses both visual operations and generated code diffs | [`apps/web/client/src/components/store/editor/history/helpers.ts`](https://github.com/onlook-dev/onlook/blob/423e2e924366419e418ee049093872d535eea41a/apps/web/client/src/components/store/editor/history/helpers.ts) |

## Product continuity

The current repository explicitly says it is the open-source visual editor that started Onlook and that a newer hosted product for AI-native designers is in early access. `onlook-dev/desktop` is also referenced as the previous implementation for capabilities such as component detection. Source facts in this document are therefore revision-scoped to `onlook-dev/onlook` and should not be silently projected onto the closed hosted successor.

## Evidence boundary

- **Fact:** code/runtime architecture, stack, source IDs, action model and undo/redo above are established by the pinned repository.
- **Inference:** describing the codebase as the primary durable implementation artifact follows from the architecture and source-write paths; this does not imply every editor/session metadata record is stored only in the codebase.
- **Unknown:** the hosted successor's private architecture, exact checkpoint storage, full collaboration protocol and complete AI tool contract are not claimed.

## Research gaps

- Trace checkpoint creation/restoration to its concrete storage/sandbox implementation.
- Trace branch creation/forking and its exact relationship to sandbox snapshots.
- Trace the full AI chat tool registry and fast-apply pipeline.
- Trace collaboration transport and persistence beyond the public product statement.
- Map visual style operations to Tailwind/CSS source-rewrite paths in more detail.

## Primary sources

- https://github.com/onlook-dev/onlook/tree/423e2e924366419e418ee049093872d535eea41a
- https://github.com/onlook-dev/desktop
- https://docs.onlook.com/developers/architecture
