# DesignCanvas

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

DesignCanvas is a Windows-first local design workspace that keeps spatial composition and executable generation topology as separate authorities. The tldraw document answers “what is on the board and where”; a compiled project graph answers “what runs, in which order, with which upstream context.”

## The canvas does not silently define execution

Brief, note, asset and generation cards live in the tldraw snapshot. Arrows become workflow edges only through the explicit compiler in [`generationWorkflow.ts`](https://github.com/poer2023/designcanvas/blob/723c7b836e5c579f4512dd828ab87991a15502d1/src/lib/canvas/generationWorkflow.ts), which accepts valid card bindings, rejects cycles and creates a topological order. Flow connections are hidden during ordinary arrangement and shown in Flow Edit mode.

Before a run, the compiled nodes and edges are persisted separately. That design prevents moving a card for readability from accidentally changing execution semantics.

## Outputs retain upstream lineage

Run-all and run-from-selection collect text from upstream brief or note cards and image URLs/seeds from upstream generation cards. The application calls its image-job API, polls the job, and writes the resulting URL, asset ID and seed back to the generation card. A selected result can seed a downstream iteration node rather than overwriting its ancestor.

Provider adapters include real OpenRouter, Cloudflare and Hugging Face paths; [`openrouter.ts`](https://github.com/poer2023/designcanvas/blob/723c7b836e5c579f4512dd828ab87991a15502d1/src/lib/adapters/openrouter.ts) sends text and upstream reference images through a multimodal request. A separate older `src/lib/engine/executor.ts` still contains simulated execution, but it is not the current tldraw generation path traced above.

## Two optimistic version clocks live in SQLite

Electron owns filesystem, secrets and SQLite through typed preload IPC. [`canvasDocuments.ts`](https://github.com/poer2023/designcanvas/blob/723c7b836e5c579f4512dd828ab87991a15502d1/src/lib/db/canvasDocuments.ts) saves tldraw snapshots with optimistic version checks; [`projectGraphs.ts`](https://github.com/poer2023/designcanvas/blob/723c7b836e5c579f4512dd828ab87991a15502d1/src/lib/db/projectGraphs.ts) maintains a separate version for executable graphs. Debounced autosave observes direct gestures and programmatic card updates.

These are conflict detectors for one local application, not a multi-user operational transform or branch merge protocol. Large media stays outside lightweight shape props, and the current distribution still has a tldraw production-license gate and an uncompleted Windows release acceptance gate.

## Evidence

- [Pinned repository](https://github.com/poer2023/designcanvas/tree/723c7b836e5c579f4512dd828ab87991a15502d1)
- [Architecture charter](https://github.com/poer2023/designcanvas/blob/723c7b836e5c579f4512dd828ab87991a15502d1/docs/architecture-charter.md)
