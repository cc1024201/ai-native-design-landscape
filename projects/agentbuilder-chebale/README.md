# AgentBuilder by Omkar Chebale

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

AgentBuilder is a form-led multi-agent authoring platform. Its design surface is an ordered agent roster plus a coordination strategy, not a free spatial canvas; that difference is central to how the product constrains workflows.

## Authoring chooses a team protocol

The [workflow creation page](https://github.com/Chebaleomkar/AgentBuilder/blob/51c2917387117b51e33832f39724f8836700abbb/frontend/src/app/workflows/create/page.tsx) asks for at least two existing agents, records their order, and selects sequential, supervisor, peer, or conditional coordination. The deeper [workflow schema](https://github.com/Chebaleomkar/AgentBuilder/blob/51c2917387117b51e33832f39724f8836700abbb/backend/app/models/workflow.py) can also express typed steps, branches, loops and handoffs.

## MongoDB records are the workflow authority

Workflow documents retain agent identifiers, typed steps, coordination and execution mode. Status changes from draft through active or paused affect the saved object; the UI is a client of that record rather than the only copy of the design.

## Runtime materializes a team from the record

The [workflow API](https://github.com/Chebaleomkar/AgentBuilder/blob/51c2917387117b51e33832f39724f8836700abbb/backend/app/api/workflows.py) creates an execution record, hands saved agents and coordination to the orchestrator, then persists status, context and results. This supports a real create → activate → run → inspect-log loop, although the current creation UI exposes a smaller subset than the backend step model.

## Product ceiling

There is no visual edge editor or source-code export in the inspected tree. Its contribution to the map is constraint-driven team composition and operational governance, not canvas geometry.

## Pinned evidence

- [Repository](https://github.com/Chebaleomkar/AgentBuilder)
- [Inspected tree](https://github.com/Chebaleomkar/AgentBuilder/tree/51c2917387117b51e33832f39724f8836700abbb)
- [Execution orchestrator](https://github.com/Chebaleomkar/AgentBuilder/blob/51c2917387117b51e33832f39724f8836700abbb/backend/app/engine/orchestrator.py)
