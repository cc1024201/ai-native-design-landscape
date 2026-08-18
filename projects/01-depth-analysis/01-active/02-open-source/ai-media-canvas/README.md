# AI Media Canvas

AI Media Canvas answers "what is design" with a shared, revisioned canvas: design is the act of jointly (human and agent) mutating one live Excalidraw document, not the act of generating an image. The generated pictures and videos are downstream artifacts placed onto that document — addressable assets, never the design itself. [Evidence: CanvasContent contract](https://github.com/tutti-os/ai-media-canvas/blob/7578f64560efa24086d269362e51be46d3a31880/packages/shared/src/contracts.ts)

The decisive mechanism is a guarded-operation loop over a single authoritative projection. `manipulate-canvas.ts` turns the agent's intent into explicit editor operations — add, move, resize, restyle, reorder, align, distribute — where each step is validated against bindings, collisions and element existence instead of letting the model rewrite an opaque JSON blob. [Evidence: manipulate-canvas.ts](https://github.com/tutti-os/ai-media-canvas/blob/7578f64560efa24086d269362e51be46d3a31880/apps/server/src/agent/tools/manipulate-canvas.ts)

That loop only works because the document is versioned at the persistence boundary. The browser canvas-editor debounces saves against a known revision, and the SQLite local store rejects any write whose expected revision no longer matches. Chat-driven edits and direct human manipulation therefore share one canvas without naively trusting the most recent network arrival — revision mismatch is a real concurrency guard, not a plumbing detail. [Evidence: canvas-editor / local store](https://github.com/tutti-os/ai-media-canvas/blob/7578f64560efa24086d269362e51be46d3a31880/apps/server/src/local/store.ts)

Visual feedback stays tied to reality: the agent can request a full, viewport or bounded screenshot, rendered from the actual browser projection through RPC and persisted, rather than inferred from element JSON alone. [Evidence: screenshot-canvas.ts](https://github.com/tutti-os/ai-media-canvas/blob/7578f64560efa24086d269362e51be46d3a31880/apps/server/src/agent/tools/screenshot-canvas.ts)

Everything is local-first — projects, canvases, chat, assets, skills and agent runs in SQLite, media on disk. What is absent is telling: no multi-user merging and no branchable visual version graph. Revisions guarantee concurrency protection, not a full design-history product, so the project's authority is a single mutable canvas with optimistic guards rather than a forkable lineage.

- [Pinned repository](https://github.com/tutti-os/ai-media-canvas/tree/7578f64560efa24086d269362e51be46d3a31880)
- [Agent tool directory](https://github.com/tutti-os/ai-media-canvas/tree/7578f64560efa24086d269362e51be46d3a31880/apps/server/src/agent/tools)
