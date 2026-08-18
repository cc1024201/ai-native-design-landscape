# MyN8N

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

MyN8N is a self-hosted visual automation system in which a React Flow graph is persisted, triggered, executed by FastAPI, and inspected through run history.

## The saved graph is the runnable contract

Nodes, connections, settings, and expressions are stored in SQLite rather than existing only in browser state. Before a chat-triggered execution, the current graph is saved, so the backend runs the version the user can recover instead of an unsynchronized canvas draft.

## AI is both a node capability and an interaction route

Claude and OpenAI nodes can participate in ordinary workflows alongside data and integration steps. Schedules, webhooks, and chat triggers start the same underlying graph. JSON expressions pass prior outputs forward, making model calls composable with deterministic operations.

## Execution history is the correction surface

Run records expose whether a configured path actually completed and what each step returned. Users can revise the graph after failure rather than accepting a generated automation as final. The implementation demonstrates local persistence and execution; its security model and production-grade isolation require deployment-specific review.

## Pinned evidence

- Repository: [aliameenco-creator/my-personal-n8n](https://github.com/aliameenco-creator/my-personal-n8n)
- Inspected React and FastAPI source: [`d5612cf8d336dac11b103dc643f18b71101c2471`](https://github.com/aliameenco-creator/my-personal-n8n/tree/d5612cf8d336dac11b103dc643f18b71101c2471)
- Immutable revision: [commit `d5612cf`](https://github.com/aliameenco-creator/my-personal-n8n/commit/d5612cf8d336dac11b103dc643f18b71101c2471)
