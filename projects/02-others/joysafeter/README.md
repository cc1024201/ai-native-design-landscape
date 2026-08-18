# JoySafeter

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

JoySafeter is JD.com's AI-native security-agent platform. Its design surface spans an editable graph, versioned deployment definitions, skill source and a durable run/event system; the security domain is what gives the nodes their vocabulary.

## Builder state carries an executable graph

The workspace [builderStore.ts](https://github.com/jd-opensource/JoySafeter/blob/12234a11a9d96acef85577afb1fa5682169d6171/frontend/app/workspace/%5BworkspaceId%5D/%5BagentId%5D/stores/builderStore.ts) owns nodes, edges, dirty state and graph mutation. Import/export and a preview surface operate on that same structure rather than recreating a screenshot.

## Deployment preserves versions

[graph_deployment_version.py](https://github.com/jd-opensource/JoySafeter/blob/12234a11a9d96acef85577afb1fa5682169d6171/backend/app/models/graph_deployment_version.py) retains deployment snapshots, while [graph_service.py](https://github.com/jd-opensource/JoySafeter/blob/12234a11a9d96acef85577afb1fa5682169d6171/backend/app/services/graph_service.py) validates and manages graph authority. Skills have a separate version and collaboration model because their file bundles are reusable execution inputs, not canvas geometry.

## Execution is observable and resumable

The backend builds LangGraph/DeepAgents runtimes from graph and skill configuration. Persisted runs, ordered events and WebSocket catch-up let the frontend reconnect without inventing a new run state; the run center and graph status bar project that evidence back onto the workspace.

## Product boundary

JoySafeter defines agent composition for security operations, including skill creation, tool access and deployment. The graph, skills and run history are counted as one integrated platform, not separate candidate products.

## Pinned evidence

- [Repository](https://github.com/jd-opensource/JoySafeter)
- [Inspected tree](https://github.com/jd-opensource/JoySafeter/tree/12234a11a9d96acef85577afb1fa5682169d6171)
- [Graph execution model](https://github.com/jd-opensource/JoySafeter/blob/12234a11a9d96acef85577afb1fa5682169d6171/backend/app/models/graph_execution.py)
