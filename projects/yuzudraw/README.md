# YuzuDraw

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

YuzuDraw defines design as a text-native diagram that a person and a coding agent can edit through the same durable artifact. It is a native macOS application, not a browser wrapper around a Mermaid renderer.

## One artifact for humans and agents

The `.yuzudraw` document stores a compact diagram DSL. The canvas, inspector, layers, groups, and selection tools are projections and mutation surfaces over that source. The bundled `/draw` command gives an agent a constrained way to create or revise the same document instead of asking it to drive pixels or return a disposable image.

## Native editing semantics matter

The source exposes ordinary editor behaviors—selection, drag, grouping, layers, undo/redo, and autosave—alongside the agent path. That combination is the decisive mechanism: AI output enters an established document model and remains directly correctable by the user.

## Delivery without changing authority

ASCII, PNG, and SVG are export forms. They make the work portable, but none becomes the editable authority merely because it was exported. The `.yuzudraw` source continues to carry the objects and relationships needed for later changes.

## Pinned evidence

- Repository: [agavra/yuzudraw](https://github.com/agavra/yuzudraw)
- Inspected tree: [`dbd0718268c6231eeb75581c81496ad29a59c32d`](https://github.com/agavra/yuzudraw/tree/dbd0718268c6231eeb75581c81496ad29a59c32d)
- Immutable revision: [commit `dbd0718`](https://github.com/agavra/yuzudraw/commit/dbd0718268c6231eeb75581c81496ad29a59c32d)
