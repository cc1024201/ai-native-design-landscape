# No-Code AI Workflow by Codexnever

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

This browser application couples a React Flow draft to Appwrite-backed workflow and run records. Unlike a diagram-only demo, the saved edges determine traversal and the run creates durable per-node evidence.

## Two authorities are kept distinct

[workflowStore.ts](https://github.com/Codexnever/No-Code-AI-Workflow/blob/a9fd8568dc9de4f303227f11e116e5ce64fac3e9/src/store/workflowStore.ts) owns the mutable node/edge draft and undo history, then serializes it into an Appwrite workflow document. API keys and execution results use separate collections; they are not embedded into the canvas JSON.

## The browser executes the authored topology

[workflowExecutor.ts](https://github.com/Codexnever/No-Code-AI-Workflow/blob/a9fd8568dc9de4f303227f11e116e5ce64fac3e9/src/lib/workflowExecutor.ts) finds a start node, waits on dependencies, follows success/error edges and invokes registered task handlers. AI task nodes call OpenAI through [aiTaskHandler.ts](https://github.com/Codexnever/No-Code-AI-Workflow/blob/a9fd8568dc9de4f303227f11e116e5ce64fac3e9/src/lib/aiTaskHandler.ts).

## Runs are inspectable but scheduling is absent

Each run and node result is written to Appwrite with status, output and error counts, then fetched back into the execution panel. The inspected source does not show a server worker, scheduler, shared edit protocol, or immutable workflow versions; execution depends on an authenticated browser session remaining active.

## Pinned evidence

- [Repository](https://github.com/Codexnever/No-Code-AI-Workflow)
- [Inspected tree](https://github.com/Codexnever/No-Code-AI-Workflow/tree/a9fd8568dc9de4f303227f11e116e5ce64fac3e9)
- [Visual builder](https://github.com/Codexnever/No-Code-AI-Workflow/blob/a9fd8568dc9de4f303227f11e116e5ce64fac3e9/src/components/WorkflowBuilder.tsx)
