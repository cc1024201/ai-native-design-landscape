# Open CoDesign

> Research status: **Source-level** · Last reviewed: **2026-08-10**

| Field | Value |
|---|---|
| Organization / team | OpenCoworkAI / Open CoDesign contributors |
| Category | Local-first desktop AI design agent |
| Status | Active; latest stable release v0.2.1; pinned `main` is post-v0.2.1 |
| Source availability | MIT |
| Previous names / aliases | — |
| Canonical product URL | https://opencoworkai.github.io/open-codesign/ |
| Canonical source repository | https://github.com/OpenCoworkAI/open-codesign |
| Pinned source revision | `b94d7156bf4aeb2c79892c91dc9934911a4e3741` |

## Product boundary and local-first thesis

Open CoDesign is an MIT-licensed desktop design agent for macOS, Windows and Linux. It turns prompts and local context into interactive prototypes, slide decks, PDFs and other visual artifacts while letting the user choose the model/provider and keep the working files on the local machine.

The current product surface combines:

- a prompt/chat and agent-activity panel;
- a live responsive artifact preview;
- workspace file inspection;
- element comments and batched pending edits;
- model-proposed tweak controls;
- local exports to HTML, PDF, PPTX, ZIP and Markdown.

The v0.2 product model is workspace-backed: a design is associated with a real folder and a long-running session. `App.jsx` is the default visual source entry, while `index.html` remains the legacy/standalone HTML entry. Supporting CSS, assets, handoff documents and a Google-compatible `DESIGN.md` can live beside that source.

Open CoDesign has no required hosted workspace or OpenCoworkAI account. Model traffic goes to the provider, relay or local endpoint selected by the user. The repository explicitly excludes bundled model runtimes and default telemetry/account/cloud-sync flows.

### Product and architectural direction

Open CoDesign's current direction is **a local workspace as the durable design artifact, with the canvas as a rendered projection and an agent operating through bounded tools**.

The architecture separates five responsibilities:

1. the workspace filesystem owns editable design source, assets, `DESIGN.md` and exports;
2. an agent harness composes model/provider context and exposes editing plus design-specific tools;
3. a preview runtime turns workspace JSX/TSX/HTML into an executable document;
4. the desktop renderer supplies direct human correction through comments and tweak controls;
5. JSON metadata, snapshots and per-design JSONL sessions preserve navigation/history around the workspace.

The project reuses pi agent/model/session primitives where possible, but adds design-specific contracts such as `preview`, `done`, `scaffold`, `skill`, `tweaks`, image generation and structured questions. It also requires preview/self-check before completion instead of treating model output text as the finished artifact.

At the pinned revision, this direction is still in migration. The primary `generateViaAgent` implementation assembles tools on `pi-agent-core`; a separate `createCodesignSession` wrapper integrates `pi-coding-agent` sessions and a bash permission hook, but that wrapper's source header states that it is not yet wired into the legacy generation path. The dossier therefore distinguishes shipped implementation from repository direction rather than presenting them as already unified.

### Concrete technology choices

#### Desktop/client

- **Shell:** Electron 39 with `electron-vite` and `electron-builder`.
- **Renderer:** React 19 + ReactDOM 19.
- **Build/dev:** Vite 7, TypeScript 6 and pnpm/Turborepo.
- **Styling:** Tailwind CSS 4, PostCSS and CSS variables.
- **Client state:** Zustand 5.
- **UI primitives:** repository UI package, Radix-style primitives and Lucide icons.
- **Quality tooling:** Biome, Vitest and Playwright.

#### Agent/model layer

- **Agent primitives:** `@mariozechner/pi-agent-core`, `pi-ai` and `pi-coding-agent` 0.72.x.
- **Provider boundary:** pi model/provider abstractions plus the repository's `packages/providers` compatibility layer.
- **Credentials/model routing:** user-selected provider credentials, ChatGPT/Codex sign-in, imported provider configuration, local endpoints and OpenAI-compatible relays.
- **Hosted backend:** none required for the core desktop workflow.

#### Storage and execution

- **Design source:** normal workspace files.
- **Design catalog/snapshots:** local `design-store.json`.
- **Conversation/comments/context:** per-design pi JSONL session files.
- **Interactive preview:** sandboxed Electron renderer iframe using `srcdoc`.
- **JSX/TSX runtime:** vendored React, ReactDOM and Babel Standalone injected by the host runtime.
- **Agent preview/PDF execution:** `puppeteer-core` against an installed system Chrome/Chromium; the app does not bundle a browser binary.
- **Export dependencies:** dynamically loaded HTML, PDF, PPTX, ZIP and Markdown exporters.

## The project bundle: artifacts, catalog, and snapshots

### Primary durable artifact / source of truth

The workspace filesystem is the source of truth for the current design. A visual/web design normally uses `App.jsx`; legacy or standalone work may use `index.html`. CSS, images, other local assets, supporting documents and exports remain ordinary files. `DESIGN.md` is a separate, user-editable design-system artifact and becomes the visual-system authority when present.

This means Open CoDesign does **not** use a proprietary canvas graph as the canonical editable design document. The visible canvas is produced from source files.

### Catalog and snapshot records

`DesignV1` stores a design UUID, name, timestamps, deletion marker, workspace path/mode and preview mode/URL. `DesignSnapshotV1` stores a snapshot UUID, design ID, parent ID, `initial | edit | fork` type, prompt, artifact type, a copy of the artifact source and creation time.

The JSON design store contains design records, snapshots and diagnostics. It is written through a temporary file followed by rename. Snapshot source copies support iteration/history and fallback preview, but the current workspace file remains the authoritative editable source.

### Runtime and visual representations

- **Source representation:** JSX/TSX/HTML plus local supporting files.
- **Design-system representation:** Google-compatible `DESIGN.md`.
- **Preview representation:** a complete HTML `srcdoc` document, with JSX/TSX compiled by Babel and rendered by vendored React/ReactDOM.
- **Rendered representation:** DOM inside the sandboxed iframe or isolated headless Chrome page.
- **Export representation:** standalone HTML or derived PDF/PPTX/ZIP/Markdown output.

### Identity and change model

- Design and snapshot records use UUIDs.
- Workspace files are identified by safe workspace-relative paths.
- Inline comments are tied to a design/snapshot and carry a runtime selector, tag, HTML snippet, rectangle, text, status and optional parent HTML context.
- Agent changes use workspace file tools, primarily view/replace operations against `App.jsx`.
- Tweak controls update an in-iframe token object over `postMessage`, then debounce the same token values back into the source file's `EDITMODE` block.
- Completed generations create a content-deduplicated snapshot whose parent is the previous newest snapshot.

## Agent planning, tool use, and human correction

### Invocation surfaces

- natural-language prompt in the desktop workspace;
- follow-up prompt against an existing workspace;
- one or more saved element comments submitted as a batch;
- direct inline-comment action against the currently selected element;
- user-visible tweak controls for values the model exposed.

### Context supplied to the agent

The generation path can include:

- the user prompt and replayed user/assistant session history;
- current workspace source candidates and file state;
- workspace `AGENTS.md`, `DESIGN.md` and `.codesign/settings.json` when present;
- attachments, reference URL and selected design-system context;
- loaded skills, brand references and scaffold/resource state;
- pending edit targets expressed as selector, tag, current `outerHTML`, optional parent HTML, scope and instruction.

### Tool/action path

The pinned `generateViaAgent` path conditionally assembles tools according to available host capabilities. Its concrete surface includes:

- `set_title` and `set_todos`;
- `skill` and `scaffold`;
- `str_replace_based_edit_tool` for workspace files;
- `preview` for an intermediate rendered runtime report;
- `done` for static plus runtime verification;
- `ask` for structured user questions;
- `tweaks` for discovering cross-file `EDITMODE` controls;
- optional image generation and workspace inspection;
- UI-kit decomposition/parity tools when their dependencies are present.

A normal visual run is therefore:

`prompt/context → inspect/view workspace → plan if needed → edit files → preview → repair → done → persist session/snapshot`.

### Approval and human correction

The documented permission model grades workspace-local operations, installs/network access, publishing/high-blast-radius commands and destructive operations into tiers. The `createCodesignSession` integration also installs a `tool_call` hook that asks the host permission callback before allowing bash.

Human correction does not require replacing the whole prompt. Users can pin element comments, queue multiple edits, adjust exposed tokens, answer `ask` questions, cancel generation and inspect live tool activity. File changes remain visible in the workspace.

## Preview-to-tweak-to-export pipeline

### Interactive renderer

`buildPreviewDocument` classifies `.html`, `.jsx` and `.tsx` inputs. JSX/TSX is auto-mounted when necessary, compiled by Babel and run with vendored React/ReactDOM. HTML remains HTML but receives the preview viewport/runtime and annotation overlay when needed. Relative workspace assets resolve through an injected `file://` base URL.

The main workspace preview uses an iframe with:

```html
sandbox="allow-scripts"
```

Because `allow-same-origin` is absent, the generated document executes with scripts but without the iframe being granted normal same-origin privileges. The parent and iframe coordinate selection, error reporting, live rectangles and tweaks through explicit `postMessage` envelopes.

### Agent-visible preview

The `preview(path)` tool reads a safe workspace-relative source, builds the same preview document, launches the user's installed Chrome headlessly with a disposable profile and collects:

- console and page errors;
- failed asset requests;
- DOM node count and viewport metrics;
- a depth-bounded DOM outline for text-only models;
- a PNG screenshot for vision-capable models.

`done(path)` adds static checks for structural JSX/HTML errors, duplicate IDs, missing alt text, broken hash links and `DESIGN.md` validity, then optionally runs a hidden runtime verifier. The agent is instructed to repair failures and retry, with a bounded error-round policy.

### Export runtime

Exporters convert the current source/runtime into HTML, PDF, PPTX, ZIP or Markdown. Heavy exporters are lazy-imported. PDF and rendered conversions use an installed Chrome/Chromium rather than downloading or shipping a private browser runtime.

### Element identity and source-return limits

Open CoDesign's current targeting is **runtime DOM context followed by agent-mediated source search**, not deterministic DOM-to-file mapping.

#### Runtime element identity

The injected overlay chooses a selector in this order:

1. `[data-codesign-id="..."]` when the element provides one;
2. `#id` when present;
3. otherwise a body-relative tag/index path such as `/section[1]/button[2]`.

On click it sends the selector, tag name, truncated `outerHTML`, truncated parent `outerHTML` and bounding rectangle to the parent. Saved comments also retain snapshot association and status. The parent can ask the iframe to remeasure watched selectors so pins follow scroll/layout changes.

#### Mapping back to source

For a batched pending edit, the agent receives selector/tag/HTML context and is explicitly told to inspect and modify `App.jsx` with the file editing tool. The single-selection schema used by the legacy `apply-comment` path carries selector, tag, outer HTML and rectangle. No source filename, AST node, component ID or line/column is produced by the overlay.

The resulting path is:

`rendered DOM element → runtime selector + HTML context → model searches workspace source → file edit → rerender/verification`.

`data-codesign-id` can stabilize runtime selection, but it still does not establish a source-file/line mapping.

#### Known unmappable or weakly mappable cases

- DOM created dynamically by libraries or runtime state may not have a unique source snippet.
- Repeated markup can make `outerHTML` search ambiguous.
- Selectors can become stale after structural rerenders; the live-rectangle channel only remeasures selectors that still resolve.
- canvas pixels, pseudo-elements and internals of closed shadow roots do not yield an ordinary selectable DOM source target through this overlay.
- the runtime does not currently instrument React component ownership or consume source maps for writeback.

The first three behaviors are source-established mechanisms plus direct consequences of the selector strategy; the exact failure rate in real projects has not been measured in this dossier.

## Persistence, checkpoints, and recovery limits

### Project/workspace persistence

Each design catalog record binds to a local workspace path. Current source, assets, `DESIGN.md` and exports persist as normal files that can also be opened or versioned by external tools.

### Catalog and preview state

`design-store.json` persists design metadata, preview settings, snapshot source copies and diagnostics. Writes use a temporary JSON file followed by rename. The renderer's Zustand state and live iframe pool are transient acceleration/UI state, not the durable design artifact.

### Agent/session history

Each design has a pi `SessionManager` JSONL file. Open CoDesign appends typed custom entries for chat messages, tool-status updates, comments, compact design briefs and run preferences, then replays those entries to reconstruct the UI. Comments use append/update/remove/mark-applied events rather than a separate cloud service.

### Checkpoints and versions

After a generation, the renderer snapshots artifact source when its content differs from the latest snapshot. Snapshots form a parent chain and record `initial`, `edit` or `fork` semantics. They are useful history/fallback records, but the workspace remains current truth.

The pinned project explicitly does not expose session branching UI or undo/version rollback in v0.2. There is no general source-editor undo/redo contract in the reviewed implementation; users can rely on snapshots/workspace copies or an external VCS, but the latter is not an Open CoDesign-owned version model.

### Tweak persistence

Tweak changes first update the live iframe without recompiling Babel, then are debounced into the relevant workspace source file. This ensures reload, later snapshots and export see the accepted token values rather than only transient DOM styles.

### Collaboration state

No hosted collaboration or cloud-sync data model is part of the pinned local-first architecture. Multiple sessions may share a workspace, but real-time multi-user collaboration and merge semantics are not established by the reviewed source.

## Implementation and evolution evidence

Repository pinned at `b94d7156bf4aeb2c79892c91dc9934911a4e3741`.

| Concern | Repository path | What it establishes |
|---|---|---|
| Product and architectural contract | `AGENTS.md`, `README.md` | workspace-backed design model, local-first constraints, current tool/storage direction and shipped product surfaces |
| Desktop stack | `apps/desktop/package.json` | Electron/React/Vite/Tailwind/Zustand/pi/Puppeteer packaging choices |
| Agent orchestration | `packages/core/src/agent.ts` | prompt/context assembly, conditional tool surface, pi-agent-core execution and artifact extraction |
| pi session migration boundary | `packages/core/src/agent-session.ts` | `pi-coding-agent` session creation, JSONL directory and bash permission hook; also states current wiring boundary |
| Design tools | `packages/core/src/tools/` | `preview`, `done`, `ask`, `scaffold`, `skill`, `tweaks`, image and file tooling contracts |
| Artifact/design/comment schemas | `packages/shared/src/index.ts`, `packages/shared/src/snapshot.ts` | artifact formats, selected-element data, design/snapshot/comment identity and fields |
| Workspace source boundary | `apps/desktop/src/main/design-workspace.ts`, `apps/desktop/src/main/workspace-reader.ts` | workspace binding, safe file access and local file ownership |
| Catalog and snapshots | `apps/desktop/src/main/snapshots-db.ts` | JSON design store, atomic writes, design records, snapshot chain and file projection |
| Session/comment persistence | `apps/desktop/src/main/session-chat.ts` | per-design JSONL chat/tool/comment/context events and replay |
| Generation and comment IPC | `apps/desktop/src/main/ipc/generate.ts` | active model resolution, workspace context, generation execution and inline-comment route |
| Pending-edit context | `apps/desktop/src/renderer/src/store/slices/generation.ts` | selector/HTML/scope enrichment and batched comment submission |
| Preview compiler/runtime | `packages/runtime/src/index.ts` | HTML/JSX/TSX classification, vendored React/Babel wrapping, base URL and overlay injection |
| Element targeting | `packages/runtime/src/overlay.ts`, `apps/desktop/src/renderer/src/components/PreviewPane.tsx` | selector strategy, selection payload, live rectangles and sandbox message boundary |
| Live tweaks/writeback | `packages/runtime/src/tweaks-bridge.ts`, `apps/desktop/src/renderer/src/preview/tweak-persistence.ts` | token update bridge and debounced source persistence |
| Agent-visible verification | `apps/desktop/src/main/preview-runtime.ts`, `packages/core/src/tools/done.ts` | isolated system-Chrome preview, screenshots/DOM report and completion verification |
| Exporters | `packages/exporters/src/` | lazy HTML/PDF/PPTX/ZIP/Markdown output paths |

### Commit-level evolution

**Pinned revision:** `b94d7156bf4aeb2c79892c91dc9934911a4e3741`

| Claim | Evidence at pinned revision |
|---|---|
| A design owns a real workspace; files are the source of truth and `App.jsx` is the default visual entry | [`AGENTS.md`](https://github.com/OpenCoworkAI/open-codesign/blob/b94d7156bf4aeb2c79892c91dc9934911a4e3741/AGENTS.md), [`packages/shared/src/source-entries.ts`](https://github.com/OpenCoworkAI/open-codesign/blob/b94d7156bf4aeb2c79892c91dc9934911a4e3741/packages/shared/src/source-entries.ts) |
| The desktop stack uses Electron, React, Vite, Tailwind, Zustand and pi packages | [`apps/desktop/package.json`](https://github.com/OpenCoworkAI/open-codesign/blob/b94d7156bf4aeb2c79892c91dc9934911a4e3741/apps/desktop/package.json) |
| The current generation path conditionally assembles file, preview, done, ask, tweak and other design tools around a pi agent | [`packages/core/src/agent.ts`](https://github.com/OpenCoworkAI/open-codesign/blob/b94d7156bf4aeb2c79892c91dc9934911a4e3741/packages/core/src/agent.ts), [`packages/core/src/tool-manifest.ts`](https://github.com/OpenCoworkAI/open-codesign/blob/b94d7156bf4aeb2c79892c91dc9934911a4e3741/packages/core/src/tool-manifest.ts) |
| The separate pi-coding-agent session wrapper stores JSONL sessions and gates bash, but documents that it is not yet wired into the legacy generation flow | [`packages/core/src/agent-session.ts`](https://github.com/OpenCoworkAI/open-codesign/blob/b94d7156bf4aeb2c79892c91dc9934911a4e3741/packages/core/src/agent-session.ts) |
| Design metadata/snapshot copies use a local JSON store while chat, comments and context use per-design SessionManager JSONL | [`apps/desktop/src/main/snapshots-db.ts`](https://github.com/OpenCoworkAI/open-codesign/blob/b94d7156bf4aeb2c79892c91dc9934911a4e3741/apps/desktop/src/main/snapshots-db.ts), [`apps/desktop/src/main/session-chat.ts`](https://github.com/OpenCoworkAI/open-codesign/blob/b94d7156bf4aeb2c79892c91dc9934911a4e3741/apps/desktop/src/main/session-chat.ts) |
| JSX/TSX is compiled into a sandbox preview document using vendored React/ReactDOM/Babel; HTML receives runtime/overlay injection | [`packages/runtime/src/index.ts`](https://github.com/OpenCoworkAI/open-codesign/blob/b94d7156bf4aeb2c79892c91dc9934911a4e3741/packages/runtime/src/index.ts), [`apps/desktop/src/renderer/src/components/PreviewPane.tsx`](https://github.com/OpenCoworkAI/open-codesign/blob/b94d7156bf4aeb2c79892c91dc9934911a4e3741/apps/desktop/src/renderer/src/components/PreviewPane.tsx) |
| Element comments use runtime selectors plus HTML/geometry context and are resolved back to source by agent file search rather than source maps | [`packages/runtime/src/overlay.ts`](https://github.com/OpenCoworkAI/open-codesign/blob/b94d7156bf4aeb2c79892c91dc9934911a4e3741/packages/runtime/src/overlay.ts), [`packages/core/src/index.ts`](https://github.com/OpenCoworkAI/open-codesign/blob/b94d7156bf4aeb2c79892c91dc9934911a4e3741/packages/core/src/index.ts), [`apps/desktop/src/renderer/src/store/slices/generation.ts`](https://github.com/OpenCoworkAI/open-codesign/blob/b94d7156bf4aeb2c79892c91dc9934911a4e3741/apps/desktop/src/renderer/src/store/slices/generation.ts) |
| Tweak values update the iframe over postMessage and are then persisted back into workspace source | [`packages/runtime/src/tweaks-bridge.ts`](https://github.com/OpenCoworkAI/open-codesign/blob/b94d7156bf4aeb2c79892c91dc9934911a4e3741/packages/runtime/src/tweaks-bridge.ts), [`apps/desktop/src/renderer/src/preview/tweak-persistence.ts`](https://github.com/OpenCoworkAI/open-codesign/blob/b94d7156bf4aeb2c79892c91dc9934911a4e3741/apps/desktop/src/renderer/src/preview/tweak-persistence.ts) |
| Agent preview uses an isolated system-Chrome process and returns runtime errors, metrics, DOM outline or screenshots | [`apps/desktop/src/main/preview-runtime.ts`](https://github.com/OpenCoworkAI/open-codesign/blob/b94d7156bf4aeb2c79892c91dc9934911a4e3741/apps/desktop/src/main/preview-runtime.ts), [`packages/core/src/tools/preview.ts`](https://github.com/OpenCoworkAI/open-codesign/blob/b94d7156bf4aeb2c79892c91dc9934911a4e3741/packages/core/src/tools/preview.ts) |
| Snapshots form a content-deduplicated parent chain; explicit undo/version rollback UI remains outside v0.2 | [`apps/desktop/src/renderer/src/store/slices/snapshots.ts`](https://github.com/OpenCoworkAI/open-codesign/blob/b94d7156bf4aeb2c79892c91dc9934911a4e3741/apps/desktop/src/renderer/src/store/slices/snapshots.ts), [`AGENTS.md`](https://github.com/OpenCoworkAI/open-codesign/blob/b94d7156bf4aeb2c79892c91dc9934911a4e3741/AGENTS.md) |

## Evidence boundary

- **Fact:** repository structure, package versions, workspace/source boundary, tool assembly, runtime compilation, selector strategy, JSON/JSONL persistence and snapshot behavior are established by the pinned source.
- **Inference:** Open CoDesign is best modeled as a source/workspace-first design agent because the current canvas projects normal files rather than owning an independent canonical scene graph.
- **Unknown/unverified here:** this dossier did not install and interact with the packaged v0.2.1 desktop release, benchmark model output quality, inspect every provider's network behavior or validate production-scale recovery after process interruption.
- **Known implementation boundary:** deterministic DOM-to-file/line mapping, general undo/rollback UI, session branching UI and real-time collaboration are not established in the pinned implementation.

## Research gaps

- Browser-validate the ordinary-user journey from new workspace through prompt, comment batch, tweak persistence, app restart and export.
- Trace the connected-URL/external-app preview modes separately from the managed workspace-file runtime.
- Test selector survival across React structural rerenders and quantify ambiguous `outerHTML` targeting.
- Trace snapshot selection/restoration UX and failure recovery around interrupted JSON/JSONL writes.
- Trace provider registration, OAuth/key storage and request routing for each supported provider class.
- Verify PDF/PPTX/ZIP/Markdown exports against complex multi-file workspaces and local assets.

## Primary sources

- https://github.com/OpenCoworkAI/open-codesign/tree/b94d7156bf4aeb2c79892c91dc9934911a4e3741
- https://opencoworkai.github.io/open-codesign/
- https://opencoworkai.github.io/open-codesign/architecture
- https://github.com/OpenCoworkAI/open-codesign/releases/tag/v0.2.1
