# AgenticBuilder by showjihyun

> Research status: **Source-level** · Lifecycle: **active-transition** · Last reviewed: **2026-08-12**

AgenticBuilder is a large visual agent-platform implementation inside the `agentrag-v1` repository. The relevant product boundary is narrower than its README: a persisted React Flow workflow can be validated and submitted to a real multi-provider agent execution service.

## The graph is stored as a first-class workflow

[The workflow designer](https://github.com/showjihyun/agentrag-v1/blob/b8db77cb7ec9765f3179594380153c572580d0ee/frontend/app/agent-builder/workflows/%5Bid%5D/designer/page.tsx) edits agent, block and control nodes and saves `nodes` plus `edges`. [workflows.py](https://github.com/showjihyun/agentrag-v1/blob/b8db77cb7ec9765f3179594380153c572580d0ee/backend/api/agent_builder/workflows.py) persists the graph behind ownership checks and returns the same graph definition to the editor.

## Execution reaches real providers

[workflow_execution_service.py](https://github.com/showjihyun/agentrag-v1/blob/b8db77cb7ec9765f3179594380153c572580d0ee/backend/services/agent_builder/workflow_execution_service.py) builds a dependency graph, topologically orders it and dispatches LLM, tool, condition, agent and orchestration nodes. The agent engine instantiates LangChain OpenAI or Anthropic clients; synchronous and streaming paths expose node results and errors.

## Breadth is not treated as verified completeness

The repository contains one very large commit and many overlapping execution generations, roadmap claims and future-oriented modules. This dossier relies only on the designer, CRUD and execution path named above; it does not promote the README's versioning, scaling or integration counts into verified product facts.

## Graph-semantics ceiling

Edges impose order, but the inspected executor merges each node output into one global `current_data` object. Conditions produce a boolean without pruning the topological traversal, and edge handles do not select per-parent payloads. The implementation therefore establishes a real graph-backed platform while remaining transitional as a branching dataflow runtime.

## Pinned evidence

- [Repository](https://github.com/showjihyun/agentrag-v1)
- [Inspected tree](https://github.com/showjihyun/agentrag-v1/tree/b8db77cb7ec9765f3179594380153c572580d0ee)
- [Agent execution engine](https://github.com/showjihyun/agentrag-v1/blob/b8db77cb7ec9765f3179594380153c572580d0ee/backend/services/agent_builder/execution/agent_execution_engine.py)
