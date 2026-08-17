# AI Workflow Builder by Nidhi Sarda

> Research status: **Source-level** · Lifecycle: **active-transition** · Last reviewed: **2026-08-12**

This project is a visual document-question workflow prototype. It qualifies through a real graph-to-Gemini loop, but its runtime understands a fixed semantic recipe rather than executing arbitrary topology.

## What users can author

[WorkflowBuilder.js](https://github.com/nids12/ai-workflow-builder/blob/3d064a6a78d6069c280fbe3e3ec9edff8b9f8033/frontend/src/components/WorkflowBuilder.js) provides a React Flow canvas, node configuration, validation, JSON import/export and a run action. Users choose a PDF-backed knowledge node, write the user query and select an LLM node before submitting nodes and edges.

## What the backend actually executes

[workflow.py](https://github.com/nids12/ai-workflow-builder/blob/3d064a6a78d6069c280fbe3e3ec9edff8b9f8033/backend/routes/workflow.py) locates nodes by the labels `User Query` and `KnowledgeBase`, extracts the selected PDF and sends query plus document text to Gemini. [llm_utils.py](https://github.com/nids12/ai-workflow-builder/blob/3d064a6a78d6069c280fbe3e3ec9edff8b9f8033/backend/utils/llm_utils.py) selects an available Gemini content model and performs the real provider call.

## The graph/runtime mismatch matters

Edges are validated in the client and returned in the response, but the server neither traverses them nor dispatches per node. Choosing “OpenAI” in the visual inspector also does not alter this route's Gemini-only execution. Workflow durability is file export/import; PostgreSQL stores document metadata, not the graph.

## Product significance

The prototype demonstrates an ordinary-user visual loop with model participation, while also showing why a canvas alone is not proof of a general workflow engine. It is counted with that ceiling explicit.

## Pinned evidence

- [Repository](https://github.com/nids12/ai-workflow-builder)
- [Inspected tree](https://github.com/nids12/ai-workflow-builder/tree/3d064a6a78d6069c280fbe3e3ec9edff8b9f8033)
- [Knowledge-base upload route](https://github.com/nids12/ai-workflow-builder/blob/3d064a6a78d6069c280fbe3e3ec9edff8b9f8033/backend/routes/knowledge_base.py)
