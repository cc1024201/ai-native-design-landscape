# AI Agent Workflow Builder by Sanket Hatti

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

This project treats an agent workflow as an organization-owned ordered program. Users edit typed steps, trigger a run, watch persisted step results and explicitly release approval gates; the decisive artifact is relational data rather than a free-form node canvas.

## The workflow is an ordered set of durable steps

[The application page](https://github.com/Sanket-Hatti/ai-workflow-builder/blob/0457368bd9b1c6d192d081ff9876897f61c45464/frontend/src/app/page.tsx) reads and mutates `workflow_steps` through Hasura, preserving type, JSON configuration and `step_order`. It also subscribes to `step_runs`, so the authoring view and run evidence share the same server-backed workflow identity.

## Execution and approval are coupled to that record

[workflowExecutor.js](https://github.com/Sanket-Hatti/ai-workflow-builder/blob/0457368bd9b1c6d192d081ff9876897f61c45464/shared/workflowExecutor.js) reloads the ordered steps, calls Groq for LLM nodes, performs HTTP requests, records database and notification events and persists every output. An approval step creates an awaiting record and pauses the run; [approveStep.js](https://github.com/Sanket-Hatti/ai-workflow-builder/blob/0457368bd9b1c6d192d081ff9876897f61c45464/functions/approveStep.js) verifies membership before resuming after that exact step.

## Governance is part of the product artifact

The trigger handler checks organization membership, editor or owner authority and quota before creating a run. This makes tenant and approval state causal runtime inputs rather than dashboard decoration.

## Semantic and reproducibility ceiling

The editor is an ordered step list rather than a topology editor. A conditional step records whether a predicate passed but the executor still advances through the same sequence, so it does not establish divergent branch paths. The repository also omits the declared Nhost schema and permission metadata; the inspected source establishes the application and executor contract but not a self-contained deployment reproduction.

## Pinned evidence

- [Repository](https://github.com/Sanket-Hatti/ai-workflow-builder)
- [Inspected tree](https://github.com/Sanket-Hatti/ai-workflow-builder/tree/0457368bd9b1c6d192d081ff9876897f61c45464)
- [Run trigger](https://github.com/Sanket-Hatti/ai-workflow-builder/blob/0457368bd9b1c6d192d081ff9876897f61c45464/functions/triggerWorkflowRun.js)
