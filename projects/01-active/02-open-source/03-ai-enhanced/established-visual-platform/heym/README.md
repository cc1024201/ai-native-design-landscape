# Heym

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

Heym is a full visual workflow platform rather than a canvas demo. The inspected monorepo carries one workflow from optimistic editing through immutable versions, registry-backed execution, recovery, traces and several delivery surfaces.

## Editing is revision-aware

The frontend [workflow store](https://github.com/heymrun/heym/blob/a7919b1307cd2d34646d295f3ad6e2fc889ac9c6/frontend/src/stores/workflow.ts) manages nodes, edges, selection and save state while the API enforces optimistic revisions. Stale saves are a tested product condition, not silently accepted overwrites.

## Versions preserve executable snapshots

[workflow_version.py](https://github.com/heymrun/heym/blob/a7919b1307cd2d34646d295f3ad6e2fc889ac9c6/backend/app/services/workflow_version.py) creates and resolves immutable workflow versions. Executions can therefore point at a historical definition rather than whatever happens to be on the current canvas.

## Runtime is a registered graph engine

[workflow_executor.py](https://github.com/heymrun/heym/blob/a7919b1307cd2d34646d295f3ad6e2fc889ac9c6/backend/app/services/workflow_executor.py) schedules graph nodes and branches through the [node registry](https://github.com/heymrun/heym/blob/a7919b1307cd2d34646d295f3ad6e2fc889ac9c6/backend/app/services/node_execution/registry.py). The repository contains concrete implementations for agents, LLMs, MCP, code, data systems, triggers, control flow and output nodes.

## Failure and delivery are first-class

[execution_recovery.py](https://github.com/heymrun/heym/blob/a7919b1307cd2d34646d295f3ad6e2fc889ac9c6/backend/app/services/execution_recovery.py) reconstructs interrupted work, while run history and LLM traces expose what occurred. Portal, API, webhook, schedule and MCP endpoints deliver the same versioned workflow outside the editor.

## Product significance

Heym demonstrates a source-of-truth canvas backed by durable runtime semantics and multiple productization paths. Its breadth is evidence for one integrated product, not grounds to count each endpoint as a separate design system.

## Pinned evidence

- [Repository](https://github.com/heymrun/heym)
- [Inspected tree](https://github.com/heymrun/heym/tree/a7919b1307cd2d34646d295f3ad6e2fc889ac9c6)
- [Workflow API](https://github.com/heymrun/heym/blob/a7919b1307cd2d34646d295f3ad6e2fc889ac9c6/backend/app/api/workflows.py)
- [MCP API](https://github.com/heymrun/heym/blob/a7919b1307cd2d34646d295f3ad6e2fc889ac9c6/backend/app/api/mcp.py)
