# Agent Diagram Tool

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

Agent Diagram Tool is a GCP architecture co-designer built around a bidirectional diagram DSL. An embedded Gemini or Claude provider can ask clarifying questions and apply undoable changes while a deterministic offline generator remains available.

## One schema drives code canvas API and export

At commit [`1f8b088`](https://github.com/thebobrovs/agent-diagram-tool/tree/1f8b08898e84baf669b267c22908df26fcb90f54) the Zod diagram model is serialized to a textual DSL and adapted to React Flow. Dragging or connecting changes the same model that the code panel parses. The co-designer issues shared edit operations then invokes deterministic layout and a guideline critic.

IndexedDB stores multiple diagrams and local profiles. The HTTP and MCP servers call pure handlers shared with the browser and a headless renderer produces SVG without inventing a second schema.

```text
prompt/chat -> provider -> edit ops -> diagram model <-> DSL
                                |             |
                                v             v
                         React Flow       SVG/PNG/JSON
```

Provider keys remain in browser storage. The code proves the architecture but no paid model run was performed and public first-party material does not establish the team region.

## Pinned evidence

- [Core source](https://github.com/thebobrovs/agent-diagram-tool/tree/1f8b08898e84baf669b267c22908df26fcb90f54/src/core)
- [Canvas adapter](https://github.com/thebobrovs/agent-diagram-tool/blob/1f8b08898e84baf669b267c22908df26fcb90f54/src/app/canvas/Canvas.tsx)
- [Pinned README](https://github.com/thebobrovs/agent-diagram-tool/blob/1f8b08898e84baf669b267c22908df26fcb90f54/README.md)
