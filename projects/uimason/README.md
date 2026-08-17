# UiMason

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-13**

UiMason defines application design as a governed source workspace: a prompt becomes a planned React project, an agent mesh writes files, a browser runtime renders them, and later instructions return as proposed source changes rather than direct canvas mutations.

## The generated file set is the product authority

Pinned revision: `e1e4a8345c86df88eb78dc565d1a4b00e107f931`.

Fresh work passes through architect, planner, executor, reviewer and build-verifier roles. Follow-up work first indexes the existing codebase and narrows the relevant files. The executor still returns a complete generated file set, but the modification path packages it as a diff proposal and waits for the UI to accept or reject it. This makes human approval part of source mutation, not merely a chat convention.

Current plans, files, logs and agent state are serialized in a PostgreSQL `agent_sessions` row. Uploaded workspaces have their own persisted tree, while chat sessions reference a workspace id; these are related records rather than one normalized project graph.

## Runtime evidence and delivery use different execution paths

The browser mounts generated files into WebContainer, installs dependencies, runs build, lint and tests when scripts exist, and listens for `server-ready` to expose the live iframe URL. A separate server sandbox route can execute bounded filesystem builds. Vercel and Netlify delivery are implemented as provider API calls and recorded as deployment rows, so the preview URL and the published URL are distinct projections of the same file authority.

## Recovery is local even though the current project is server-backed

Named checkpoints contain the full files, diff summary, verification result and parent id, but they live in browser `localStorage` and are capped at forty per normalized project name. Restoring one replaces the active file set; it does not restore the PostgreSQL chat or deployment records. Patch history and project-memory indexes are also browser-local. UiMason therefore has a real approval and rollback surface, but recovery is device-scoped and can diverge from the server-owned current session.

## Pinned evidence

- [Repository](https://github.com/uimason53-rgb/UiMason-App)
- [Agent mesh and targeted-edit orchestration](https://github.com/uimason53-rgb/UiMason-App/blob/e1e4a8345c86df88eb78dc565d1a4b00e107f931/src/agents/orchestrator.ts)
- [Modification proposal and approval boundary](https://github.com/uimason53-rgb/UiMason-App/blob/e1e4a8345c86df88eb78dc565d1a4b00e107f931/src/services/agentService.ts)
- [WebContainer build and preview runtime](https://github.com/uimason53-rgb/UiMason-App/blob/e1e4a8345c86df88eb78dc565d1a4b00e107f931/src/services/sandboxService.ts)
- [Persisted session, workspace and deployment schema](https://github.com/uimason53-rgb/UiMason-App/blob/e1e4a8345c86df88eb78dc565d1a4b00e107f931/server/db/schema.ts)
- [Browser-local checkpoint model](https://github.com/uimason53-rgb/UiMason-App/blob/e1e4a8345c86df88eb78dc565d1a4b00e107f931/src/services/workflowService.ts)
- [Provider deployment routes](https://github.com/uimason53-rgb/UiMason-App/blob/e1e4a8345c86df88eb78dc565d1a4b00e107f931/server/routes/deployments.ts)
