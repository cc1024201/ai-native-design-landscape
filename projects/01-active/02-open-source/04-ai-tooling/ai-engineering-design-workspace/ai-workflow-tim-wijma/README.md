# AI Workflow Builder by Tim Wijma

> Research status: **Source-level** · Lifecycle: **active-transition** · Last reviewed: **2026-08-12**

This project is a Vue Flow editor whose nodes and connections are stored as relational records and executed by a FastAPI service. Its distinctive boundary is simple and inspectable: the saved first outgoing connection determines the next API or LLM step.

## Editor operations write directly to the runtime model

[useFlowStore.ts](https://github.com/TimWijma/ai-workflow/blob/d70b4e2a2579649d545649207cbb50ba6af9d4df/frontend/src/stores/useFlowStore.ts) loads flows, creates and updates steps, persists node positions and creates or removes connection records through the backend. [FlowFlow.vue](https://github.com/TimWijma/ai-workflow/blob/d70b4e2a2579649d545649207cbb50ba6af9d4df/frontend/src/components/FlowFlow.vue) projects those records into Vue Flow without an intermediate export format.

## The backend performs real calls

[execution.py](https://github.com/TimWijma/ai-workflow/blob/d70b4e2a2579649d545649207cbb50ba6af9d4df/backend/app/engine/execution.py) starts at the flagged node, performs HTTP operations or LiteLLM calls and follows saved `source_connections`. Prompt variables can be replaced from earlier results, and the run endpoint returns collected outputs.

## Graph and evidence ceiling

Only `source_connections[0]` is followed, so additional outgoing edges, joins and branches drawn in the editor have no runtime meaning. The loop has no visited-set cycle protection, run models are defined but the executor returns results without persisting step-by-step run history, and LLM output is not registered with the variable helper in the inspected path. The implementation establishes a real linear visual runtime but not a general graph engine.

## Pinned evidence

- [Repository](https://github.com/TimWijma/ai-workflow)
- [Inspected tree](https://github.com/TimWijma/ai-workflow/tree/d70b4e2a2579649d545649207cbb50ba6af9d4df)
- [Flow CRUD and run routes](https://github.com/TimWijma/ai-workflow/blob/d70b4e2a2579649d545649207cbb50ba6af9d4df/backend/app/api/endpoints/flows.py)
