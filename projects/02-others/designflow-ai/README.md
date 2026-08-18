# DesignFlow AI

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

DesignFlow AI is a Figma-like vector editor whose model output is parsed into the same element graph used by direct canvas controls. The current source also makes an important distinction between real editing and simulated collaboration.

## The Redux element graph is authoritative

[`canvasSlice.ts`](https://github.com/Mrsmartboy/FigmaAI/blob/82f7c8cb0897c8de61c014e70c28d5b3a4f8a7db/src/store/canvasSlice.ts) owns frames, text, images, shapes, brand kits, comments, selection and an undo/redo stack. [`Canvas.tsx`](https://github.com/Mrsmartboy/FigmaAI/blob/82f7c8cb0897c8de61c014e70c28d5b3a4f8a7db/src/components/Canvas.tsx) projects those objects and provides selection, movement, resizing and layer operations. Brand-token changes cascade through the same graph.

## Model output becomes native objects

[`aiGenerator.ts`](https://github.com/Mrsmartboy/FigmaAI/blob/82f7c8cb0897c8de61c014e70c28d5b3a4f8a7db/src/utils/aiGenerator.ts) makes an OpenAI-compatible chat request for JSON elements, repairs common truncation and validates the response before returning it. A deterministic auto-layout pass estimates wrapped text, moves overlapping children and grows containers before the elements enter the canvas.

This is not a screenshot generator: the resulting frames and children remain individually selectable and editable. Direct edits push snapshots into the same history stack used for generated changes.

## Handoff is generated from the graph

[`HandoffPanel.tsx`](https://github.com/Mrsmartboy/FigmaAI/blob/82f7c8cb0897c8de61c014e70c28d5b3a4f8a7db/src/components/HandoffPanel.tsx) recursively converts the selected element hierarchy into React TSX or CSS. That export is a derivative of current object properties rather than an unrelated second model call.

## Current limitations

Undo/redo is in-memory and the pinned source does not establish a durable project database. The collaborators and moving cursors are seeded simulations, not a real multiplayer synchronization path. Its AI call is real, but security and reliability are prototype-grade: provider access happens from the client and repaired partial JSON can still omit intended sections.

## Evidence

- [Pinned repository](https://github.com/Mrsmartboy/FigmaAI/tree/82f7c8cb0897c8de61c014e70c28d5b3a4f8a7db)
- [AI prompt surface](https://github.com/Mrsmartboy/FigmaAI/blob/82f7c8cb0897c8de61c014e70c28d5b3a4f8a7db/src/components/AIPromptPanel.tsx)
