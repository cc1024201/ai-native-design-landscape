# Naaviq

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

Naaviq defines an agent as a channel-independent executable graph. The product is split across a Next.js visual editor and a Python package/runtime repository; counting those repositories as two products would erase the actual boundary.

## Browser graph and backend graph are reversible representations

The web client's [graph-transform.ts](https://github.com/chandradot99/naaviq-web/blob/436959b4fa629215e76d15b890e9c7625d770941/features/agents/utils/graph-transform.ts) converts persisted `GraphConfig` into React Flow nodes and reconstructs backend nodes, edges, groups, entry point, and viewport on save. Synthetic `goto` display nodes are explicitly removed before persistence, so screen geometry does not silently become runtime logic.

## The saved graph is compiled, not replayed by the UI

In the API repository, [builder.py](https://github.com/chandradot99/naaviq-api/blob/91d66f8d691def20efde3f18d6db1ff50c08d458/packages/naaviq-graph/naaviq/graph/builder.py) deserializes the graph into a LangGraph `StateGraph`, resolves typed nodes, installs conditional routing and compiles it with a checkpointer. The chat and voice services then invoke that graph across web chat, WhatsApp and LiveKit-backed voice sessions.

## Debugging projects runtime evidence back onto the authoring surface

The web product stores session timelines separately from the graph and renders node visits, tool calls, errors and transcript state in its execution view. That makes correction a first-class loop: edit the graph, save a new graph version, test through chat or voice, then inspect the trace on the same topology.

## Authority and delivery boundary

PostgreSQL agent records hold the graph configuration and version; runtime session events and checkpoints are evidence, not an alternate design. Delivery is channel binding rather than source export. The inspected sources do not establish collaborative branch-style design versioning.

## Pinned evidence

- [Web repository at inspected commit](https://github.com/chandradot99/naaviq-web/tree/436959b4fa629215e76d15b890e9c7625d770941)
- [API/runtime repository at inspected commit](https://github.com/chandradot99/naaviq-api/tree/91d66f8d691def20efde3f18d6db1ff50c08d458)
- [Graph save endpoint used by the editor](https://github.com/chandradot99/naaviq-web/blob/436959b4fa629215e76d15b890e9c7625d770941/features/agents/api.ts)
