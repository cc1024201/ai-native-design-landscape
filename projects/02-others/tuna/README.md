# Tuna

> Research status: **Source-level** · Last reviewed: **2026-08-10**

| Field | Value |
|---|---|
| Organization / team | Tuna contributors / Suryanewa |
| Category | Runtime visual manipulation layer for coding agents |
| Status | Active |
| Source availability | Source-available; PolyForm Shield 1.0.0 |
| Previous names / aliases | Fork/continuation of the Retune visual-overlay direction is part of its history, but this directory covers Tuna only |
| Canonical product URL | https://tuna.dev |
| Canonical source repository | https://github.com/suryanewa/Tuna |
| Pinned source revision | `28946b5c4385b50ef2ef0fdf8913900990990842` |

## 1. Product facts

Tuna is a visual DevTools overlay for a running web application. A user can select rendered elements, edit styles/text/layout, reorder/reparent/resize/delete elements, annotate elements or regions, inspect component props/state, and preview those changes immediately. Tuna then hands structured visual intent to an external coding agent such as Codex, Claude Code or Cursor so that the agent can persist the intended change into source code.

Tuna ships as:

- a React overlay package (`@suryanewa/tuna`);
- a CLI/MCP server exposed by the same package;
- a Manifest V3 browser-extension package for arbitrary pages;
- an optional `tuna.manifest.json` design-system/component metadata file.

## 2. Technical direction

Tuna deliberately separates **visual intent capture** from **source-code mutation**.

The browser overlay is authoritative only for the user's pending visual experiment. It collects structured before/after changes and context. The external coding agent remains responsible for applying those changes to the real codebase.

The main loop is:

1. render the real application normally;
2. mount or inject Tuna into the page;
3. select/manipulate real DOM elements;
4. preview the manipulation immediately;
5. accumulate pending visual changes/comments/selection context;
6. expose that context over a local bridge and MCP tools;
7. let the coding agent translate the structured intent into source edits;
8. clear pending changes after successful handoff/apply.

This keeps Tuna lightweight and agent-neutral while allowing rich direct manipulation.

## 3. Technology choices

### Overlay/UI

- **Language/UI:** TypeScript + React.
- **Text/comment editor:** Lexical (`lexical`, `@lexical/react`).
- **Selector generation/parsing:** `@medv/finder`, `parsel-js`.
- **Speech input:** `react-speech-recognition`.
- **Build:** tsup + TypeScript.
- **Tests:** Vitest.

### Agent bridge

- **Protocol:** Model Context Protocol using `@modelcontextprotocol/sdk`.
- **Local transport bridge:** WebSocket (`ws`); documented default is `ws://127.0.0.1:9223/ws`.
- **Schema validation:** Zod.

### Packaging

- npm workspace/overlay package plus private Manifest V3 Chrome extension bundle.
- `npx @suryanewa/tuna setup` can configure Codex, Claude Code and Cursor and install a Tuna skill.

## 4. Artifact and data model

### Primary durable artifact / source of truth

The application's normal source files remain the durable implementation artifact. Tuna itself does not claim that its runtime-edited DOM is the final source of truth.

### Visual/editor representation

The visual representation is the live DOM plus a Shadow-DOM-isolated overlay. The overlay owns selection boxes, property controls, layer tree, annotations, guides and pending-change state.

### Pending change model

Visual edits are accumulated as structured before/after diffs. MCP exposes both raw/enriched pending changes and formatted Markdown suitable for source implementation.

### Selection/context model

The visual context can include:

- current selection and multi-selection;
- CSS selectors;
- text/classes/computed styles;
- layout mode;
- React component ancestry;
- drawing annotations/geometry;
- comments;
- viewport state;
- page-state/spatial snapshot;
- pending visual diffs.

### Optional manifest

`tuna.manifest.json` v2 can describe design-system components, designer-relevant props, state hooks, design tokens, variants and conditional prop visibility. It improves targeting/control fidelity but does not replace the application codebase as the implementation artifact.

## 5. Agent interface

Tuna has one of the clearest public visual-agent contracts in this landscape.

### MCP tools

`packages/overlay/src/mcp/server.ts` registers concrete tools including:

- `tuna_get_selection`;
- `tuna_get_visual_context`;
- `tuna_get_pending_changes`;
- `tuna_get_formatted_changes`;
- `tuna_watch_changes`;
- `tuna_clear_changes`;
- `tuna_get_comments`;
- `tuna_manifest_loaded`;
- `tuna_status`.

### Handoff semantics

`get_formatted_changes` produces implementation-ready structured output and, by default, clears pending changes after retrieval. `watch_changes` supports a reactive loop in which an agent waits for human visual edits. `clear_changes` gives the agent an explicit acknowledgement/cleanup action after persistence.

### Codex integration

`setup --codex` writes the MCP server into Codex configuration and installs a Tuna skill. The MCP server can therefore act as a visual-context provider while Codex remains the code-editing agent.

## 6. Runtime and rendering

### Execution environment

Tuna does not own the application's main runtime. The user's application runs in its normal dev environment (Next.js, Vite, Remix, Astro, SvelteKit are documented examples).

### Overlay runtime

`<Tuna />` mounts into the running app in development by default. A browser-extension build can inject the same overlay into arbitrary HTTP/HTTPS/file pages without modifying application source.

### Bridge

The overlay communicates with the local MCP side over a WebSocket bridge. This allows the page/runtime side to remain browser-resident while the MCP server runs as a local Node process.

### UI isolation

The project documents Shadow DOM isolation for stable overlay styling. The comment editor also runs within this isolated overlay environment.

## 7. Source mapping and targeting

Tuna uses a layered targeting model rather than one universal identifier.

### DOM-level

- CSS selector;
- text content;
- classes;
- computed styles;
- spatial/layout context.

### React-level

When React is available, Tuna enriches a selection with component name, props and component ancestry derived from the runtime Fiber tree.

### Source-level

Tuna can optionally include file path + line number when `__source` metadata is available. The project explicitly treats this as optional, so exact source location is not guaranteed for every build/framework.

### Styling-system inference

The product detects Tailwind, CSS Modules and plain CSS and can resolve runtime values toward CSS variables, utility classes or semantic tokens. The optional manifest can replace runtime token scanning with explicit token/component metadata.

### Important boundary

Tuna's mapping payload is a **hint/context contract for the coding agent**. The coding agent still decides how to implement the change in source; the overlay does not claim a deterministic source rewriter for every styling framework.

## 8. Persistence and versioning

### Project persistence

The application repository remains the durable project store after the agent applies changes.

### Overlay state

Pending visual changes/comments/selection are runtime session state exposed through the bridge. They can be cleared explicitly after handoff.

### Undo/redo

The overlay exposes undo/redo shortcuts for visual experimentation. This is distinct from source-control history; source persistence is performed by the coding agent.

### Manifest persistence

`tuna.manifest.json` is a file in the project and can therefore be versioned with the codebase. MCP detects its presence/version and can nudge the agent to generate or update it.

### Source versioning

Tuna itself delegates durable version history to the host codebase/git/coding-agent workflow. It does not introduce an independent design-document version store in the analyzed architecture.

## 9. Open-source implementation map

Repository pinned at `28946b5c4385b50ef2ef0fdf8913900990990842`.

| Concern | Repository path | What it establishes |
|---|---|---|
| Product architecture/features | `README.md` | runtime overlay, direct manipulation, layered targeting, supported agents/frameworks, bridge behavior |
| Published overlay package | `packages/overlay/package.json` | React/TypeScript/Lexical/MCP/WebSocket dependencies and package/CLI boundary |
| MCP contract | `packages/overlay/src/mcp/server.ts` | exact agent tools, manifest nudges, pending-change handoff/clear/watch semantics |
| Agent skill | `packages/overlay/skill/SKILL.md` | expected agent-side workflow for consuming Tuna context |
| Manifest logic | `packages/overlay/src/manifest/` | design-system/component metadata prompts and runtime handling |
| Browser extension | `packages/chrome-extension/` | arbitrary-page injection package |

## 10. Commit-level evidence

**Pinned revision:** `28946b5c4385b50ef2ef0fdf8913900990990842`

| Claim | Evidence at pinned revision |
|---|---|
| Tuna is a runtime visual layer whose coding agent persists changes to source | [`README.md`](https://github.com/suryanewa/Tuna/blob/28946b5c4385b50ef2ef0fdf8913900990990842/README.md) |
| Published overlay uses React/TypeScript, Lexical, MCP SDK, WebSocket and selector libraries | [`packages/overlay/package.json`](https://github.com/suryanewa/Tuna/blob/28946b5c4385b50ef2ef0fdf8913900990990842/packages/overlay/package.json) |
| MCP exposes selection, visual context, pending/formatted changes, watch, clear, comments and manifest tools | [`packages/overlay/src/mcp/server.ts`](https://github.com/suryanewa/Tuna/blob/28946b5c4385b50ef2ef0fdf8913900990990842/packages/overlay/src/mcp/server.ts) |
| Agent setup/usage is formalized as a skill | [`packages/overlay/skill/SKILL.md`](https://github.com/suryanewa/Tuna/blob/28946b5c4385b50ef2ef0fdf8913900990990842/packages/overlay/skill/SKILL.md) |

## Evidence boundary

- **Fact:** the visual overlay/MCP division, tool names, WebSocket bridge, manifest concept and layered element-identification model are public and pinned.
- **Inference:** Tuna is best modeled as a visual-intent protocol rather than a source editor because source persistence is deliberately delegated to the coding agent.
- **Unknown:** exact correctness of source-file/line hints across every framework/build mode and the coding agent's final rewrite strategy are outside Tuna's deterministic control.

## Research gaps

- Trace the internal pending-change store and undo stack implementation.
- Trace Fiber/source metadata extraction code and framework-specific fallbacks.
- Trace design-token resolution precedence and scope-selection algorithm.
- Trace the WebSocket bridge message schema end-to-end.
- Determine which runtime manipulations can be losslessly expressed in the structured handoff versus requiring agent interpretation.

## Primary sources

- https://github.com/suryanewa/Tuna/tree/28946b5c4385b50ef2ef0fdf8913900990990842
- https://tuna.dev
