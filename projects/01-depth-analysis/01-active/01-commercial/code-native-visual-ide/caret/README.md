# Caret

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

Caret is a code editor whose Design Mode adds a live React canvas, deterministic direct edits, visual-to-agent context and a one-way design-layer synchronization workflow. The separately published `caret-ide` repository is a VSCodium distribution shell; this dossier follows the independently maintained Caret core where the Design implementation lives.

## Repository and `.caret/` files divide authority

Application source remains the implementation authority. A `.caret/` design layer can hold pages, components, layouts, flows and tokens for visual exploration. [`DesignMode.ts`](https://github.com/precious112/caret/blob/c381a6b4616d346f16a7f1b54021f006cc6c867f/src/core/design/DesignMode.ts) starts a local rendering shell when that layer exists and opens the project preview inside the editor.

This is not an opaque hosted canvas: Vite evaluates real React source, and filesystem changes drive the rendered result.

## Stable element identity enables deterministic writeback

Caret instruments eligible JSX with stable `data-caret-id` attributes. [`ast-editor.ts`](https://github.com/precious112/caret/blob/c381a6b4616d346f16a7f1b54021f006cc6c867f/src/core/design/visual-editing/ast-editor.ts) resolves those IDs back to JSX and performs guarded text and color mutations. It refuses ambiguous fallback replacements and checks whether the text the user saw is stale before writing atomically.

Direct property changes therefore use a narrow deterministic writer. More open-ended visual instructions cross into the agent path: [`context-builder.ts`](https://github.com/precious112/caret/blob/c381a6b4616d346f16a7f1b54021f006cc6c867f/src/core/design/visual-editing/context-builder.ts) packages the selected element, exact file, surrounding source, design tokens and optional painted-region screenshot. [`ai-edit-handler.ts`](https://github.com/precious112/caret/blob/c381a6b4616d346f16a7f1b54021f006cc6c867f/src/core/design/visual-editing/ai-edit-handler.ts) delegates that scoped task to Caret's coding-agent runtime.

## Synchronization is planned and reversible

Design-layer work does not automatically overwrite the app. The sync subsystem records a Git bookmark and a `.caret/sync-state.json` baseline, computes a worklist and asks the agent to materialize reviewed design changes into application source. The [`sync orchestrator`](https://github.com/precious112/caret/blob/c381a6b4616d346f16a7f1b54021f006cc6c867f/src/core/design/sync/sync-orchestrator.ts) coordinates this one-way transition, while the saved baseline supports review and undo by rewinding the generated application changes.

## Boundary

Caret's source mapping is intentionally pattern-dependent: dynamic iterator output and arbitrary React abstractions cannot always receive a stable direct-edit target. Those cases fall back to scoped agent editing rather than pretending the canvas offers lossless round-trip manipulation. Git and files remain the durable recovery layer.

## Evidence

- [Pinned core repository](https://github.com/precious112/caret/tree/c381a6b4616d346f16a7f1b54021f006cc6c867f)
- [Design sync state](https://github.com/precious112/caret/blob/c381a6b4616d346f16a7f1b54021f006cc6c867f/src/core/design/sync/sync-state.ts)
- [Distribution shell](https://github.com/precious112/caret-ide/tree/81074b41098cbb3138b8273d1f19c1f61b2c7355)
