# AI Workflow Builder Platform by VMK-004

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

This project is a database-backed visual DAG editor whose stored graph is read directly by a real multi-handler runtime.

## One graph across editor and runtime

The frontend [Canvas](https://github.com/VMK-004/AI-workflow-automation/blob/233137ecb61c372974bf8f70d7e8bc896b7fe896/frontend/src/components/editor/Canvas.tsx) works through node edge and workflow APIs rather than maintaining a separate export-only graph. PostgreSQL models preserve workflows nodes edges runs and per-node executions.

## Validation precedes execution

[GraphService](https://github.com/VMK-004/AI-workflow-automation/blob/233137ecb61c372974bf8f70d7e8bc896b7fe896/backend/app/services/graph_service.py) finds start nodes rejects cycles checks reachability and returns a Kahn-sorted order. [ExecutionService](https://github.com/VMK-004/AI-workflow-automation/blob/233137ecb61c372974bf8f70d7e8bc896b7fe896/backend/app/services/execution_service.py) creates durable run records and dispatches that order while accumulating outputs.

## Node authority is concrete

The runtime calls a local Qwen model through Ollama and implements HTTP requests FAISS retrieval and database writes. Handler templates can reference workflow input and prior outputs. The product is therefore not dependent on its included demo animation to establish execution.

## Execution ceiling

Topological order respects dependency precedence but each node receives the global map of all previous outputs rather than only its incoming-edge values. The graph has no branch handles loop semantics or parallel scheduling. The local Ollama URL and model are fixed in source.

## Pinned evidence

- [Repository](https://github.com/VMK-004/AI-workflow-automation)
- [Inspected tree](https://github.com/VMK-004/AI-workflow-automation/tree/233137ecb61c372974bf8f70d7e8bc896b7fe896)
- [LLM handler](https://github.com/VMK-004/AI-workflow-automation/blob/233137ecb61c372974bf8f70d7e8bc896b7fe896/backend/app/node_handlers/llm_call.py)
- [Run interface](https://github.com/VMK-004/AI-workflow-automation/blob/233137ecb61c372974bf8f70d7e8bc896b7fe896/frontend/src/components/execution/ExecutionRunModal.tsx)
