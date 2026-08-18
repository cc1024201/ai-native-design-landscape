# Graph AI

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

Graph AI is a visual workflow product whose saved graph, immutable run snapshot and per-node execution records form one unusually explicit chain of authority.

## The editor owns a typed graph

[GraphCanvas.tsx](https://github.com/musashimiyomoto/graph-ai/blob/493dd894d4b53543246b77880358082137cff148/frontend/src/components/GraphCanvas.tsx) is the React Flow surface for catalog-driven nodes, typed ports and connections. Adjacent hooks cover save/load, import/export, templates, undo/redo and execution history rather than treating the canvas as a disposable visualization.

## Every run pins what it means to execute

[execution.py](https://github.com/musashimiyomoto/graph-ai/blob/493dd894d4b53543246b77880358082137cff148/backend/usecases/execution.py) validates the workflow and creates or selects an immutable `WorkflowVersion` snapshot before enqueueing work. Reruns can target that snapshot, so later graph edits or deletion of a called workflow do not silently change past semantics.

## Runtime state remains observable and durable

ARQ and Redis dispatch background work while PostgreSQL retains executions and named per-node values. Nodes cover real OpenAI, Anthropic and Ollama calls alongside web, HTTP, code, branching, loops, retrieval, delays and human approval. Token streams use SSE with polling fallback; completed outputs, artifacts, costs and node results remain attached to the run.

## The graph also defines delivery

Manual runs, web chat, Telegram, email, schedules and signed webhooks produce a common trigger envelope. Channel adapters normalize ingress and egress, so delivery is a consumer of the same versioned artifact rather than a separate copied configuration.

## Pinned evidence

- [Repository](https://github.com/musashimiyomoto/graph-ai)
- [Inspected tree](https://github.com/musashimiyomoto/graph-ai/tree/493dd894d4b53543246b77880358082137cff148)
- [Workflow-version repository](https://github.com/musashimiyomoto/graph-ai/blob/493dd894d4b53543246b77880358082137cff148/backend/db/repositories/workflow_version.py)
- [ARQ worker](https://github.com/musashimiyomoto/graph-ai/blob/493dd894d4b53543246b77880358082137cff148/backend/worker.py)
