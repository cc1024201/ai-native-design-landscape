# RAGFlow

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

RAGFlow combines a visual agent canvas with retrieval and data-pipeline infrastructure. Its decisive Design object is the persisted agent DSL: the web canvas edits it, backend services version it and the Python canvas runtime interprets it.

## The canvas is a typed DSL editor

[canvas/index.tsx](https://github.com/infiniflow/ragflow/blob/eada2f6b6c90d02504e06cbd20dc3f26badc9b8f/web/src/pages/agent/canvas/index.tsx) assembles typed begin, agent, retrieval, iteration, loop, parser, message and data-operation nodes using the React Flow ecosystem. The database agent interfaces define the serialized component and edge shapes consumed by the editor.

## Persistence has explicit replica and version services

[canvas_service.py](https://github.com/infiniflow/ragflow/blob/eada2f6b6c90d02504e06cbd20dc3f26badc9b8f/api/db/services/canvas_service.py) owns stored canvases. Replica and user-canvas-version services preserve copies and history rather than relying on browser-only state. Templates use the same DSL and can seed editable agents.

## Runtime follows the authored topology

[agent/canvas.py](https://github.com/infiniflow/ragflow/blob/eada2f6b6c90d02504e06cbd20dc3f26badc9b8f/agent/canvas.py) loads the DSL, instantiates registered components and advances through their links while emitting state. This ties execution to the authored graph; retrieval resources and model/tool configuration decorate its nodes instead of replacing the graph as authority.

## Identity correction

854875058/boncflow retains RAGFlow's package identity, release notes and implementation while changing visible branding. It is a copied mirror and cannot support another team count.

## Pinned evidence

- [Canonical repository](https://github.com/infiniflow/ragflow)
- [Inspected tree](https://github.com/infiniflow/ragflow/tree/eada2f6b6c90d02504e06cbd20dc3f26badc9b8f)
- [Agent API](https://github.com/infiniflow/ragflow/blob/eada2f6b6c90d02504e06cbd20dc3f26badc9b8f/api/apps/restful_apis/agent_api.py)
