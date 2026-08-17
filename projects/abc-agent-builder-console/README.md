# ABC Agent Builder Console

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

ABC Agent Builder Console defines visual agent authoring as a governed public-sector workflow artifact: graph edits, model/tool execution, dry runs, version comparison, retention, budgets and auditability share one product boundary.

## Canvas authority

[WorkflowCanvas.vue](https://github.com/Magpiefelt/abc-agent-builder-console/blob/b034a73313f9bc818624d33dcccbf67832169d7c/frontend/src/components/workflow/WorkflowCanvas.vue) renders Vue Flow nodes and edges and emits their mutations back to the workflow view. Its version-diff overlay can show removed elements and ghost the elements that would return on restore, making history a visual property of the artifact rather than a separate changelog.

## Execution follows the saved graph

[workflowExecutor.ts](https://github.com/Magpiefelt/abc-agent-builder-console/blob/b034a73313f9bc818624d33dcccbf67832169d7c/backend/src/services/workflowExecutor.ts) loads `canvas_data`, validates its shape, analyzes the graph topologically and runs independent nodes in layers. Agent nodes call the configured model with upstream context, function nodes use a registry, tool nodes reuse the console's dispatcher, and SSE exposes stage progress. Dry run shares the topology while replacing external effects with explicit stubs.

## Governance is part of the runtime contract

The database migrations retain workflows, versions, executions and stage results; related services enforce classification, token budgets, retention and audit events. The key distinction is that governance does not merely annotate a generic agent runtime: it gates the same graph that users edit and execute.

## Product significance

This is an unusually complete example of “design” meaning accountable configuration of agent behavior. The artifact is inspectable before a run, replayable through versions and measurable after a run.

## Pinned evidence

- [Repository](https://github.com/Magpiefelt/abc-agent-builder-console)
- [Inspected tree](https://github.com/Magpiefelt/abc-agent-builder-console/tree/b034a73313f9bc818624d33dcccbf67832169d7c)
- [Database contract](https://github.com/Magpiefelt/abc-agent-builder-console/blob/b034a73313f9bc818624d33dcccbf67832169d7c/docs/02_database_migrations.sql)
- [Agent orchestration](https://github.com/Magpiefelt/abc-agent-builder-console/blob/b034a73313f9bc818624d33dcccbf67832169d7c/backend/src/services/agentOrchestrator.ts)
