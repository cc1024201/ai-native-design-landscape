# AgentForge

> Research status: **Source-level** · Lifecycle: **active-transition** · Last reviewed: **2026-08-12**

AgentForge is a desktop visual coordinator for teams of coding agents. Its editor has a concrete graph-to-pipeline contract, while backend persistence and execution remain a mixture of implemented orchestration and demo-grade in-memory state.

## Canvas state becomes a pipeline configuration

[forgeStore.ts](https://github.com/lanekingkong/agentforge/blob/0824c0f328acb2c249078bc401bab670c030f885/src/stores/forgeStore.ts) owns React Flow nodes, edges, role instructions, collaboration mode, selection and a 50-step undo/redo history. `toPipelineConfig` turns incoming edges into stage dependencies and maps each agent card into a backend task stage.

## Projects carry the graph beyond the editor

[projectStore.ts](https://github.com/lanekingkong/agentforge/blob/0824c0f328acb2c249078bc401bab670c030f885/src/stores/projectStore.ts) calls project CRUD endpoints and keeps the selected project. The API accepts agent-team and pipeline configuration, so the visual artifact has a defined serialization boundary.

## Runtime depth is uneven

[project_service.py](https://github.com/lanekingkong/agentforge/blob/0824c0f328acb2c249078bc401bab670c030f885/backend/services/project_service.py) hands execution to an Orchestrator under a per-project lock. Agent discovery and CLI adapters are implemented, but projects live in an in-memory dictionary and the log endpoint returns an empty placeholder; the frontend `startExecution` also initializes local status without itself calling the API.

## Product significance

AgentForge defines software-delivery coordination as an editable role/dependency graph. It qualifies through that graph-to-pipeline contract and local agent adapters, with durability and integrated run projection explicitly bounded as transition work.

## Pinned evidence

- [Repository](https://github.com/lanekingkong/agentforge)
- [Inspected tree](https://github.com/lanekingkong/agentforge/tree/0824c0f328acb2c249078bc401bab670c030f885)
- [Forge canvas](https://github.com/lanekingkong/agentforge/blob/0824c0f328acb2c249078bc401bab670c030f885/src/components/forge/ForgeCanvas.tsx)
