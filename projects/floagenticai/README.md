# FloAgenticAI

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

FloAgenticAI is a self-hostable multi-agent workflow platform whose visual graph is consumed by a durable distributed runner. Its technical definition centers on versioned server authority and live execution events rather than a browser-only draft.

## The canvas stages encrypted server state

The frontend [workflow canvas hook](https://github.com/dearzubi/floagenticai/blob/4b6c4cf0985168a070a9faa17dcb407bcc31346e/apps/frontend/src/hooks/workflow/workflow.canvas.hook.ts) manages XYFlow nodes, edges, cycle checks and undo snapshots. Saved flow data belongs to a PostgreSQL workflow entity; [version service](https://github.com/dearzubi/floagenticai/blob/4b6c4cf0985168a070a9faa17dcb407bcc31346e/apps/backend/src/services/workflow/version/index.ts) creates encrypted historical copies and can restore one after first backing up the current state.

## Hatchet executes the persisted graph

[workflow-orchestrator.task.ts](https://github.com/dearzubi/floagenticai/blob/4b6c4cf0985168a070a9faa17dcb407bcc31346e/apps/backend/src/services/workflow/execution-engine/tasks/workflow-orchestrator.task.ts) parses saved React Flow data, derives dependencies, resolves upstream references, runs ready nodes concurrently and waits for tool-approval events when required. Node results are published through Redis and Socket.IO for the editor and chat surfaces.

## Versioning and run evidence answer different questions

Workflow versions recover authored intent; execution events show what happened. Credentials are attached separately and decrypted only for execution. Export/import and chat triggers provide additional promotion paths without changing which graph revision the worker consumes.

## Pinned evidence

- [Repository](https://github.com/dearzubi/floagenticai)
- [Inspected tree](https://github.com/dearzubi/floagenticai/tree/4b6c4cf0985168a070a9faa17dcb407bcc31346e)
- [Workflow parser and dependency resolver](https://github.com/dearzubi/floagenticai/blob/4b6c4cf0985168a070a9faa17dcb407bcc31346e/apps/backend/src/services/workflow/execution-engine/utils.ts)
