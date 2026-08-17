# AI Workflow Builder by Anshi Jain

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

This application defines workflow authoring as an organization-scoped sequence of typed steps and triggers rather than as a free-positioned canvas. Its visual interface is a structured editor over relational records.

## Relational rows are the workflow

Nhost metadata defines workflows, ordered workflow_steps, triggers and runs as tenant-scoped tables. [edit/page.tsx](https://github.com/anshiiijain/ai-workflow-builder/blob/871cb5355f0a2b0f73ea75a2136a406048a5725c/web/app/orgs/%5BorgId%5D/workflows/%5Bid%5D/edit/page.tsx) adds LLM, HTTP, transform, delay and approval steps plus manual, schedule, webhook and database triggers.

## Authorization precedes execution

[triggerWorkflowRun.ts](https://github.com/anshiiijain/ai-workflow-builder/blob/871cb5355f0a2b0f73ea75a2136a406048a5725c/functions/triggerWorkflowRun.ts) checks membership and quota, creates a run and hands the durable workflow ID to the engine. Progress and approval state return through stored run records.

## Why form authoring matters here

The product's technical direction is governance-first interactive composition: tenant boundaries, RBAC, quotas and human approval are more decisive than canvas geometry. Calling it a weak React Flow clone would miss that definition.

## Pinned evidence

- [Repository](https://github.com/anshiiijain/ai-workflow-builder)
- [Inspected tree](https://github.com/anshiiijain/ai-workflow-builder/tree/871cb5355f0a2b0f73ea75a2136a406048a5725c)
- [Run engine](https://github.com/anshiiijain/ai-workflow-builder/blob/871cb5355f0a2b0f73ea75a2136a406048a5725c/functions/lib/runEngine.ts)
