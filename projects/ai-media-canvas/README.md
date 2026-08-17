# AI Media Canvas

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

AI Media Canvas is a local-first Excalidraw workspace in which a person and an agent operate the same revisioned canvas. Its distinguishing mechanism is not image generation alone: typed canvas tools, browser-rendered screenshots, media artifacts and durable project state are joined behind one agent conversation.

## The revisioned Excalidraw document is authoritative

The shared [`CanvasContent` contract](https://github.com/tutti-os/ai-media-canvas/blob/7578f64560efa24086d269362e51be46d3a31880/packages/shared/src/contracts.ts) persists Excalidraw `elements`, `appState` and binary `files` together with a revision. The web [`canvas-editor`](https://github.com/tutti-os/ai-media-canvas/blob/7578f64560efa24086d269362e51be46d3a31880/apps/web/src/components/canvas-editor.tsx) hydrates that state, resolves local assets and debounces saves against the known revision.

The SQLite [`local store`](https://github.com/tutti-os/ai-media-canvas/blob/7578f64560efa24086d269362e51be46d3a31880/apps/server/src/local/store.ts) rejects stale writes when the expected revision no longer matches. That optimistic check matters: chat and direct manipulation can share one canvas without silently treating the most recent network arrival as truth.

## Agent operations are native editor operations

[`manipulate-canvas.ts`](https://github.com/tutti-os/ai-media-canvas/blob/7578f64560efa24086d269362e51be46d3a31880/apps/server/src/agent/tools/manipulate-canvas.ts) exposes additions, movement, resizing, style changes, reordering, alignment and distribution as structured operations. The implementation checks bindings, collisions and element existence instead of asking the model to rewrite an opaque JSON blob.

This gives the project a concrete shared-authority loop:

`user edits Excalidraw ↔ revisioned canvas document ↔ agent emits guarded operations`

## Visual feedback and media stay explicit

The agent can request a full, viewport or bounded [`canvas screenshot`](https://github.com/tutti-os/ai-media-canvas/blob/7578f64560efa24086d269362e51be46d3a31880/apps/server/src/agent/tools/screenshot-canvas.ts). Rendering is delegated to the actual browser canvas through RPC and the resulting image is persisted, so visual inspection is tied to the current projection rather than inferred from element JSON alone.

Generated images and videos use typed [`artifact contracts`](https://github.com/tutti-os/ai-media-canvas/blob/7578f64560efa24086d269362e51be46d3a31880/packages/shared/src/artifacts.ts). They remain addressable assets that can be placed on the canvas; they are not confused with the canonical layout document.

## Persistence boundary

Projects, canvases, chat, assets, skills and agent runs are local SQLite records, while media files live on disk. This is durable local project state, but the pinned source does not establish multi-user merging or a branchable visual version graph. Revisions provide concurrency protection, not a complete design-history product.

## Evidence

- [Pinned repository](https://github.com/tutti-os/ai-media-canvas/tree/7578f64560efa24086d269362e51be46d3a31880)
- [Agent tool directory](https://github.com/tutti-os/ai-media-canvas/tree/7578f64560efa24086d269362e51be46d3a31880/apps/server/src/agent/tools)
