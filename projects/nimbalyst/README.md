# Nimbalyst

> Research status: **Source-level** · Last reviewed: **2026-08-10**

| Field | Value |
|---|---|
| Organization / team | Nimbalyst |
| Category | Generic visual workspace over coding agents |
| Status | Active |
| Source availability | MIT client repository; collaboration sync server is a separate project |
| Previous names / aliases | — |
| Canonical product URL | https://nimbalyst.com |
| Canonical source repository | https://github.com/Nimbalyst/nimbalyst |
| Pinned source revision | `2e6237c8e8114eda32129f75df1b2a6b8aaf754c` |

## 1. Product facts

Nimbalyst is an open-source, local-first visual workspace built around existing coding agents including Codex and Claude Code. It combines visual file editors, agent session/task management, git/worktree/terminal tools and mobile session control.

Built-in visual/editor surfaces include Markdown, code via Monaco, mockups, Mermaid, Excalidraw, CSV/spreadsheets and data models. The extension system is intended to make editor types pluggable; the repository documents additional extensions such as an Astro site editor, mind maps, slides, visual git and 3D editing.

A central product behavior is red/green WYSIWYG review of agent edits: the same file can be human-edited, agent-edited, diffed and accepted/rejected through its corresponding visual editor.

## 2. Technical direction

Nimbalyst does not create a new universal design document. Instead it places a **generic visual-editor host layer over ordinary files and coding-agent sessions**.

Its architecture separates:

- durable user files on disk/git;
- editor-specific in-memory representations;
- a common `EditorHost` lifecycle contract;
- AI tools with explicit document-access modes;
- coding-agent sessions/transcripts;
- optional collaboration/sync infrastructure.

Every editor is intended to become an extension. This makes “Design Surface” a framework capability rather than a single UI type: a mockup, Excalidraw document, CSV, code file or future domain editor can all surface selection/context to the same agent/session layer.

## 3. Technology choices

### Client/editor platform

- **Desktop shell:** Electron.
- **Main UI:** React.
- **Rich text:** Meta Lexical.
- **Code editor:** Monaco.
- **Diagram editor:** Excalidraw is a built-in/editor dependency surfaced by the product.
- **Extension system:** first-party `extension-sdk` + built-in extension workspaces.
- **Terminal/process:** `node-pty` plus an embedded terminal experience.

### Mobile

- **iOS:** native SwiftUI workspace exists in the monorepo.
- **Android:** Android workspace/build commands are present at the pinned revision.

### Storage

The source contains both PGLite and `better-sqlite3` paths during an active database migration. Repository guidance explicitly warns contributors that both backends may be active on user machines and code must handle their behavioral differences. Therefore this dossier does not simplify the current implementation to only one local database engine.

### Collaboration/sync

- collaboration protocol/client packages live in the monorepo;
- customer/team collaboration state uses Cloudflare Durable Objects according to source guidance;
- D1 is reserved for cross-entity management lookup in that architecture;
- the public README states the collaboration sync server is a separate project from the MIT client repository.

### AI/agents

- supports Codex, Claude Code, OpenCode and Copilot at differing maturity levels according to README;
- OpenAI SDK is a root dependency;
- Anthropic Claude Agent SDK is pinned in overrides;
- extensions can expose tools over MCP.

## 4. Artifact and data model

### Primary durable artifacts / source of truth

Nimbalyst is file-first: content and status are deliberately stored in normal Markdown/plain files and project files on disk or git where applicable. Different file types have their own serialized formats rather than being normalized into one proprietary visual document.

### EditorHost abstraction

All visual/editor implementations conform to an `EditorHost` contract with operations such as:

- `loadContent()`;
- `saveContent(content)`;
- dirty-state tracking;
- external file-change notifications;
- save requests;
- theme changes;
- optional AI diff request/clear hooks.

The editor owns its internal representation. The host owns file lifecycle and integration with tabs, saves, watchers and AI diff mode.

### Editor data models

The architecture explicitly supports multiple internal models:

- Lexical-managed document state;
- Monaco text buffers;
- Excalidraw scene data;
- store-managed visual models such as data-model editors;
- custom editor/library imperative state.

`useEditorLifecycle` intentionally avoids keeping complex editor content in React state. Instead it pushes serialized content into an editor and pulls content back on save.

### Agent transcript model

Repository architecture guidance documents a two-tier transcript representation:

- `ai_agent_messages` — raw append-only provider/session log and source of truth;
- `ai_transcript_events` — derived canonical provider-agnostic events produced by a transformer.

This separates raw agent execution facts from the normalized UI transcript.

## 5. Agent interface

Nimbalyst provides an explicit bridge between visual editors and coding agents.

### Selection → prompt context

An editor can call `host.setEditorContextItems(...)` with stable item IDs, labels, natural-language descriptions and optional JSON-serializable structured data. The chat presents those selections as removable chips and includes non-dismissed descriptions in the next prompt. Multi-selection is first-class.

The architecture states that these editor-context items flow to SDK/API agent providers including Claude and Claude Code. The product-level README lists Codex as a supported coding agent; the exact Codex adapter implementation should be traced separately before attributing every provider-specific detail to Codex.

### AI tool access modes

Extension AI tools must declare one of three document-access modes:

- **`filesystem`** — no editor mount, reads ordinary disk state;
- **`editor-read`** — mounts a visible/hidden read-only editor when renderer-backed scene inspection/export is required;
- **`editor-write`** — mounts a writable editor and persists mutations through the host save path.

This is an important architectural boundary: AI access to a file does not automatically imply access to the editor's richer in-memory scene/model.

### Diff loop

`EditorHost` and `useEditorLifecycle` expose AI edit diff state with accept/reject callbacks. Custom editors can supply specialized diff renderers such as cell-level spreadsheet diffs or node-aware editor diffs.

### Extension tools

Extensions can contribute AI tools through MCP, allowing domain-specific editors to become callable by the shared agent layer.

## 6. Runtime and rendering

### Desktop runtime

Electron is the primary desktop shell. The monorepo separates desktop application concerns (`packages/electron`) from cross-platform runtime services (`packages/runtime`).

### Visual rendering

There is intentionally no single renderer. Each editor extension renders its own artifact:

- Lexical renders rich text;
- Monaco renders source code;
- Excalidraw renders canvas graphics;
- mockup/data/spreadsheet/custom editors use their own React/library surfaces.

The shared lifecycle contract, not a common graphics engine, unifies these surfaces.

### Hidden editor runtime

For AI tools requiring renderer-backed semantics, Nimbalyst can mount hidden editors via the `editor-read` / `editor-write` access model. This allows the agent to call editor-level operations without requiring the corresponding tab to already be visibly open.

## 7. Source mapping and targeting

Nimbalyst does not have one global DOM→source mapping algorithm because it supports heterogeneous file/editor types.

### Stable identity

The stable identity starts with the file path plus editor-defined selections/nodes. `EditorContextItem.id` gives the chat a stable identifier for individual selected objects within a given editor context.

### Targeting

Each editor is responsible for converting its native selection into prompt/tool context. Node-like editors can emit one context item per selected node and include structured node data when explicitly enabled.

### Mapping to durable artifact

Editor changes are serialized back through `EditorHost.saveContent`, meaning the source-targeting problem is delegated to the editor that owns that file format. A diagram editor writes diagram data; a code editor writes text; a mockup editor writes its own file format.

### Boundary

This architecture is a **multi-artifact visual workspace**, not a universal code source mapper. Exact targeting/mapping semantics must therefore be documented per editor/extension rather than claimed globally.

## 8. Persistence and versioning

### File persistence

Normal project files are persisted on disk and can be versioned in git. The README explicitly describes storage as open Markdown/plain files and git-visible content.

### Editor lifecycle

`EditorHost` handles save requests, dirty state and external file changes. `useEditorLifecycle` includes echo detection so the editor can distinguish its own saves from external disk changes.

### Local structured state

Complex application/session/document-history state is stored in the local database layer. At the pinned revision both PGLite and better-sqlite3 paths must be considered because migration is ongoing.

### Agent history

Raw agent messages are append-only and transformed into canonical transcript events, providing a durable/derived split for session history.

### Git/worktrees

The product includes git management, AI commit workflows and worktrees as first-class developer features. Session/workstream UI can therefore coexist with repository-native versioning.

### Collaboration

Collaborative/shared data is synchronized through the separate collaboration architecture; source guidance places isolated customer/team state in per-entity Durable Objects. The client talks to the sync service using a separate collaboration protocol package.

## 9. Open-source implementation map

Repository pinned at `2e6237c8e8114eda32129f75df1b2a6b8aaf754c`.

| Concern | Repository path | What it establishes |
|---|---|---|
| Product/feature model | `README.md` | visual editors, coding-agent sessions, open file storage, extension/product boundaries |
| Monorepo/stack | `package.json` | Electron/runtime/mobile/extensions workspaces, React/Lexical/Monaco, DB/process/agent dependencies |
| Architecture guidance | `CLAUDE.md` | extension direction, DB migration boundary, transcript source-of-truth split, collab data isolation |
| Editor abstraction | `docs/EXTENSION_ARCHITECTURE.md` | `EditorHost`, editor lifecycle, selection→chat context, tool access modes, diff model |
| Desktop application | `packages/electron/` | desktop shell, persistence, agent/session integration |
| Cross-platform runtime | `packages/runtime/` | shared AI/editor/runtime services |
| Extension API | `packages/extension-sdk/` | extension/editor/tool contracts |
| Built-in editors | `packages/extensions/` | first-party visual editor implementations |
| Collaboration protocol | `packages/collab-protocol/`, `packages/collab-client/` | client/server wire and sync integration boundaries |

## 10. Commit-level evidence

**Pinned revision:** `2e6237c8e8114eda32129f75df1b2a6b8aaf754c`

| Claim | Evidence at pinned revision |
|---|---|
| Nimbalyst is an open visual workspace for Codex/Claude Code with heterogeneous WYSIWYG editors and plain-file storage | [`README.md`](https://github.com/Nimbalyst/nimbalyst/blob/2e6237c8e8114eda32129f75df1b2a6b8aaf754c/README.md) |
| Monorepo includes Electron/runtime/mobile/extensions and React/Lexical/Monaco/DB/agent dependencies | [`package.json`](https://github.com/Nimbalyst/nimbalyst/blob/2e6237c8e8114eda32129f75df1b2a6b8aaf754c/package.json) |
| All editor types are converging on one `EditorHost` extension lifecycle | [`docs/EXTENSION_ARCHITECTURE.md`](https://github.com/Nimbalyst/nimbalyst/blob/2e6237c8e8114eda32129f75df1b2a6b8aaf754c/docs/EXTENSION_ARCHITECTURE.md) |
| Editors can emit selected nodes as structured agent prompt context | [`docs/EXTENSION_ARCHITECTURE.md`](https://github.com/Nimbalyst/nimbalyst/blob/2e6237c8e8114eda32129f75df1b2a6b8aaf754c/docs/EXTENSION_ARCHITECTURE.md) |
| AI tools explicitly distinguish filesystem/editor-read/editor-write access | [`docs/EXTENSION_ARCHITECTURE.md`](https://github.com/Nimbalyst/nimbalyst/blob/2e6237c8e8114eda32129f75df1b2a6b8aaf754c/docs/EXTENSION_ARCHITECTURE.md) |
| Source guidance documents dual DB compatibility and raw→canonical transcript architecture | [`CLAUDE.md`](https://github.com/Nimbalyst/nimbalyst/blob/2e6237c8e8114eda32129f75df1b2a6b8aaf754c/CLAUDE.md) |

## Evidence boundary

- **Fact:** editor host contract, heterogeneous editors, file-first lifecycle, selection context, AI access modes, monorepo structure and source-documented persistence/transcript constraints are established at the pinned revision.
- **Inference:** Nimbalyst is best modeled as a generic visual-surface framework over coding agents because multiple independent editor types share the same agent/session host rather than a single design-document engine.
- **Unknown:** the exact Codex process/transport adapter, every editor-specific diff algorithm and final post-migration database architecture require separate source tracing.

## Research gaps

- Trace Codex session launch/resume/streaming transport end-to-end.
- Trace `EditorHost` TypeScript definitions and host implementation, not only architecture documentation.
- Trace one representative visual editor's `editor-write` tool through mutation → save → diff review.
- Pin the current database schemas and migration selection logic.
- Trace collaboration wire protocol and document/session partitioning.

## Primary sources

- https://github.com/Nimbalyst/nimbalyst/tree/2e6237c8e8114eda32129f75df1b2a6b8aaf754c
- https://nimbalyst.com
