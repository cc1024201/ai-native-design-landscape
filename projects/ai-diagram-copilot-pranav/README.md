# AI Diagram Copilot by Pranav

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

This project separates diagram semantics from Excalidraw rendering. Its own DSL and operation log are the durable design language; the canvas is a bidirectional runtime port.

## The diagram is an evented model

At commit [`699b6e96`](https://github.com/Pranav-learner/AI_Diagram_Copilot/tree/699b6e9637843ddbc4ecad2402bc1c8230b8327b), typed diagram operations update the model and feed runtime history. Undo is based on model events rather than only Excalidraw's transient UI stack.

## Copilot changes cross a review gate

The AI foundation is provider-pluggable and parts of the understanding layer remain demonstrative, but the editing architecture is concrete: semantic plans become previews and require approval before apply. The dossier therefore does not inflate mock provider behavior into a fully autonomous product claim.

## Canvas and persistence

`ExcalidrawCanvasPort` maps model state to native elements and reads interaction back. Autosave and backend project services retain the shared artifact, so manual and proposed changes join the same lifecycle.

## Evidence

- [Pinned repository](https://github.com/Pranav-learner/AI_Diagram_Copilot/tree/699b6e9637843ddbc4ecad2402bc1c8230b8327b)
- [Diagram engine contract](https://github.com/Pranav-learner/AI_Diagram_Copilot/blob/699b6e9637843ddbc4ecad2402bc1c8230b8327b/src/diagram-engine/README.md)
- [Excalidraw runtime port](https://github.com/Pranav-learner/AI_Diagram_Copilot/blob/699b6e9637843ddbc4ecad2402bc1c8230b8327b/src/features/canvas/runtime/ExcalidrawCanvasPort.ts)
- [Runtime history](https://github.com/Pranav-learner/AI_Diagram_Copilot/blob/699b6e9637843ddbc4ecad2402bc1c8230b8327b/src/features/canvas/runtime/useRuntimeHistory.ts)
- [Backend diagram service](https://github.com/Pranav-learner/AI_Diagram_Copilot/blob/699b6e9637843ddbc4ecad2402bc1c8230b8327b/backend/app/services/diagram.py)
