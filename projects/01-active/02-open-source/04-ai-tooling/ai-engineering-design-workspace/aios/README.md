# AIOS

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

AIOS contains a broad backend agent stack and a polished React Flow “Agent Builder,” but the inspected commit does not connect those two systems. The canvas is real authoring UI; its simulation and deployment are product demonstrations.

## A capable local canvas

[AgentBuilderPage.tsx](https://github.com/harshchavan009/AIOS/blob/d6d19c4f4c9e581f0c3d4c71cb940e9dcab7702e/frontend/src/pages/AgentBuilderPage.tsx) supports drag-and-drop node types, editable configuration, connections, resizing, undo/redo, JSON import/export and a local-storage save. Those operations create a genuine user-controlled graph artifact.

## The run and deploy controls do not call a runtime

In the same file, simulation advances node status through `setTimeout`; deployment advances a modal through timed stages and registers a frontend telemetry item. Neither path posts the authored nodes and edges to a backend endpoint.

## The backend is adjacent, not integrated evidence

[orchestrator.py](https://github.com/harshchavan009/AIOS/blob/d6d19c4f4c9e581f0c3d4c71cb940e9dcab7702e/backend/app/agents/orchestrator.py) implements backend agent orchestration, but no inspected adapter consumes the canvas schema. Its existence cannot upgrade the builder's runtime evidence.

## Why it remains included

AIOS defines a distinct visual vocabulary for composing planner, retrieval, reasoning, memory, tool and I/O nodes, and supports correction plus portable JSON. It is counted at prototype depth as native visual authoring, not as proven deployment infrastructure.

## Pinned evidence

- [Repository](https://github.com/harshchavan009/AIOS)
- [Inspected tree](https://github.com/harshchavan009/AIOS/tree/d6d19c4f4c9e581f0c3d4c71cb940e9dcab7702e)
- [Backend agent API](https://github.com/harshchavan009/AIOS/blob/d6d19c4f4c9e581f0c3d4c71cb940e9dcab7702e/backend/app/api/v1/agents.py)
