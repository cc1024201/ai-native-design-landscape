# AI Workflow Builder (Demilade01)

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

This project is a database-backed React Flow authoring tool whose saved blocks and connections are consumed by its execution endpoint. It is small, but its visual artifact is not merely decorative.

## Canvas and database share one graph

[workflow-editor.tsx](https://github.com/Demilade01/ai-workflow/blob/4ed8257220acbed641132edbce824cfa3538db92/components/workflow-editor.tsx) edits the workflow, while [schema.ts](https://github.com/Demilade01/ai-workflow/blob/4ed8257220acbed641132edbce824cfa3538db92/lib/schema.ts) stores workflows, blocks, connections, workflow runs and per-block executions as related records.

## Runtime follows the stored connections

The [execute route](https://github.com/Demilade01/ai-workflow/blob/4ed8257220acbed641132edbce824cfa3538db92/app/api/workflows/%5Bid%5D/execute/route.ts) loads those same blocks and edges, recursively satisfies incoming dependencies, invokes the Vercel AI SDK for supported block types and records inputs, outputs, completion or failure for every block.

## AI assistance stops short of graph mutation

The [chat route](https://github.com/Demilade01/ai-workflow/blob/4ed8257220acbed641132edbce824cfa3538db92/app/api/chat/route.ts) can describe suggested workflow JSON, but the inspected source does not parse that answer into the canvas. AI-assisted authoring is therefore an interface direction, not a completed prompt-to-graph loop.

## Product ceiling

Execution is deliberately simple and sequential, with only a few implemented block types. The project still qualifies because a user can author, persist, run and inspect one coherent graph artifact.

## Pinned evidence

- [Repository](https://github.com/Demilade01/ai-workflow)
- [Inspected tree](https://github.com/Demilade01/ai-workflow/tree/4ed8257220acbed641132edbce824cfa3538db92)
- [Execution history UI](https://github.com/Demilade01/ai-workflow/blob/4ed8257220acbed641132edbce824cfa3538db92/components/execution-history.tsx)
