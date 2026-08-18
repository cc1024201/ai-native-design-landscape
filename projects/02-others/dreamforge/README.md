# DreamForge

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

DreamForge uses a visual graph to expose an AI-authored fictional universe. The diagram is a projection of persisted domain entities and relationships rather than the primary drawing format.

## World model before canvas

At commit [`3a1d87cf`](https://github.com/notfromaustralia/dream_forge_AI/tree/3a1d87cfd2448517b6939eded5b0a3b56fd1e165), PostgreSQL models retain universes, entities and relationship edges. Backend graph logic and APIs deliver that semantic structure to the frontend.

## React Flow is an exploration surface

`UniverseGraph` lays out the model for navigation and inspection. Users explore characters, places and connections while agent services can create additional lore and quests through application and MCP routes.

## Design definition and limit

DreamForge defines design as constructing and coordinating a world model. The graph helps reason about the result but does not appear to be a freeform bidirectional canvas; durable changes flow through domain operations and agents.

## Evidence

- [Pinned repository](https://github.com/notfromaustralia/dream_forge_AI/tree/3a1d87cfd2448517b6939eded5b0a3b56fd1e165)
- [Database model](https://github.com/notfromaustralia/dream_forge_AI/blob/3a1d87cfd2448517b6939eded5b0a3b56fd1e165/backend/app/db/models.py)
- [Graph engine](https://github.com/notfromaustralia/dream_forge_AI/blob/3a1d87cfd2448517b6939eded5b0a3b56fd1e165/backend/app/engines/graph.py)
- [Universe API](https://github.com/notfromaustralia/dream_forge_AI/blob/3a1d87cfd2448517b6939eded5b0a3b56fd1e165/backend/app/api/universes.py)
- [Visual graph](https://github.com/notfromaustralia/dream_forge_AI/blob/3a1d87cfd2448517b6939eded5b0a3b56fd1e165/frontend/components/graph/UniverseGraph.tsx)
