# AISpirit Agent

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

AISpirit Agent is a modular agent workspace whose agentic-graph package adds a PixiJS-backed builder to a deeper event-driven Python runtime.

## The canvas is not the runtime

[canvas.py](https://github.com/aispiritlabs/aispiritlab-agentic/blob/d396a1b0c865bac6e025f43f9bcd057b00160adc/packages/agentic_graph/src/agentic_graph/canvas.py) presents nodes and links inside Gradio. Graph models and serialization preserve the authored structure, while validation and [compiler.py](https://github.com/aispiritlabs/aispiritlab-agentic/blob/d396a1b0c865bac6e025f43f9bcd057b00160adc/packages/agentic_graph/src/agentic_graph/compiler.py) translate it into registered runtime objects.

## Runs are eventful and recoverable

The core workflow package routes messages through processors, reactors and a runtime instead of replaying UI gestures. [sqlite_event_store.py](https://github.com/aispiritlabs/aispiritlab-agentic/blob/d396a1b0c865bac6e025f43f9bcd057b00160adc/packages/agentic/src/agentic/workflow/sqlite_event_store.py) records serialized workflow events and checkpoints with WAL persistence.

## Code generation is another projection

The graph package can emit a summary and Python representation. That makes the canvas a constrained system-authoring interface over runtime and source projections, not a decorative diagram of a separately maintained agent.

## Pinned evidence

- [Repository](https://github.com/aispiritlabs/aispiritlab-agentic)
- [Inspected tree](https://github.com/aispiritlabs/aispiritlab-agentic/tree/d396a1b0c865bac6e025f43f9bcd057b00160adc)
- [Graph runtime](https://github.com/aispiritlabs/aispiritlab-agentic/blob/d396a1b0c865bac6e025f43f9bcd057b00160adc/packages/agentic_graph/src/agentic_graph/runtime.py)
