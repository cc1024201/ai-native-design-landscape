# Nextflow by Aadithyan A.S

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

Nextflow is a full-stack visual workflow application whose React Flow document is saved as MongoDB node and edge arrays and interpreted by an Express execution engine.

## A workflow is an owned database document

[Workflow.ts](https://github.com/Aadithyanas/nextflow/blob/d2e46c841b46132d8f57e0dca155271c4c0092ec/backend/src/models/Workflow.ts) persists the graph with its owner and timestamps. Authenticated CRUD routes keep workflow identity distinct from a transient browser canvas.

## Execution begins with structural rejection

[execution-engine.ts](https://github.com/Aadithyanas/nextflow/blob/d2e46c841b46132d8f57e0dca155271c4c0092ec/backend/src/services/execution-engine.ts) requires exactly one trigger, validates every edge and dispatches typed trigger, text, HTTP, delay, condition and AI nodes. Outputs enter a template context that later nodes can reference, and an execution log records the path.

## Product boundary

The builder, inspector and execution panel form one ordinary-user loop: author, save, run and inspect. There is no source evidence of published endpoints, schedules or version history, so the durable authority is the editable Mongo document rather than a deployed immutable release.

## Pinned evidence

- [Repository](https://github.com/Aadithyanas/nextflow)
- [Inspected tree](https://github.com/Aadithyanas/nextflow/tree/d2e46c841b46132d8f57e0dca155271c4c0092ec)
- [Workflow routes](https://github.com/Aadithyanas/nextflow/blob/d2e46c841b46132d8f57e0dca155271c4c0092ec/backend/src/routes/workflows.ts)
