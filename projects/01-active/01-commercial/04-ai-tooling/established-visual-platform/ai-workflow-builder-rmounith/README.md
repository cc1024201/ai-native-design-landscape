# AI Workflow Builder by R. Mounith Reddy

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

This AI Workflow Builder joins a React Flow authoring surface to a Supabase-backed Python executor for question, knowledge, model and output nodes. Its artifact boundary is unusually direct for a small learning project: saved nodes, edges and encrypted configuration are loaded again by the run service.

## The store is also the persistence adapter

[workflowStore.ts](https://github.com/rmounithreddy/AI-workflow/blob/093cb3b8020cb0a2e51bce19c70a8416f51895b6/Client/src/store/workflowStore.ts) owns React Flow state and creates, updates and reloads workflow records through the FastAPI service. It serializes graph positions, connections, node configuration and workflow-level model keys rather than saving only a name or screenshot.

## Runtime reloads the saved graph

[workflow_orchestrator.py](https://github.com/rmounithreddy/AI-workflow/blob/093cb3b8020cb0a2e51bce19c70a8416f51895b6/Server/services/workflow_orchestrator.py) fetches the Supabase record, decrypts configured credentials, identifies the entry node and follows the stored edges. Node handlers can embed and query PDF material through ChromaDB, call Gemini with optional search context and return the result through an output node.

## Chat is a delivery and evidence surface

[run.py](https://github.com/rmounithreddy/AI-workflow/blob/093cb3b8020cb0a2e51bce19c70a8416f51895b6/Server/api/routers/run.py) executes by workflow ID, persists both sides of the exchange and returns the accumulated chat history. The graph therefore remains the reusable authority behind subsequent conversations.

## Current constraints

The node grammar is fixed and the orchestrator follows a simple successor model rather than a general concurrent DAG scheduler. OpenAI appears in labels and product text, while the inspected execution path is Gemini-based. Those limits do not break the saved-graph-to-model loop, but they bound the claimed architecture.

## Pinned evidence

- [Repository](https://github.com/rmounithreddy/AI-workflow)
- [Inspected tree](https://github.com/rmounithreddy/AI-workflow/tree/093cb3b8020cb0a2e51bce19c70a8416f51895b6)
- [Workflow API](https://github.com/rmounithreddy/AI-workflow/blob/093cb3b8020cb0a2e51bce19c70a8416f51895b6/Server/api/routers/workflow.py)
- [Gemini node](https://github.com/rmounithreddy/AI-workflow/blob/093cb3b8020cb0a2e51bce19c70a8416f51895b6/Server/services/nodes/llm_engine_node.py)
