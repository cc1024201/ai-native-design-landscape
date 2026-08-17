# DeepDiagram

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

DeepDiagram is a multi-agent visualization workspace for mind maps, flow diagrams, infographics, charts, Mermaid and Draw.io outputs. Users can upload multimodal references, watch generation stream into a canvas, edit suitable outputs and return to stored sessions.

## Agent-specific code streams into agent-specific renderers

A dispatcher selects specialized LangGraph agents. Each streams a design concept and code payload independently over SSE; the React frontend loads the matching canvas renderer. This preserves domain-specific artifact contracts rather than forcing charts, Mermaid and freeform Draw.io into one universal schema.

Chat and canvas stores restore sessions, diagrams and execution traces. The authoritative artifact varies by agent—structured code or graph for editable formats—while PNG/SVG exports are delivery projections. Persistent message branching makes alternate runs inspectable but does not imply a universal merge model.

## Evidence

- [Pinned repository](https://github.com/LingyiChen-AI/DeepDiagram/tree/b37398463b6ed169019d9eb4a89cae5abfcc1e02)
- [Agent dispatcher](https://github.com/LingyiChen-AI/DeepDiagram/blob/b37398463b6ed169019d9eb4a89cae5abfcc1e02/backend/app/agents/dispatcher.py)
- [Canvas renderer switchboard](https://github.com/LingyiChen-AI/DeepDiagram/blob/b37398463b6ed169019d9eb4a89cae5abfcc1e02/frontend/src/components/CanvasPanel.tsx)
- [Canvas state](https://github.com/LingyiChen-AI/DeepDiagram/blob/b37398463b6ed169019d9eb4a89cae5abfcc1e02/frontend/src/store/canvasState.ts)
