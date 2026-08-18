# FlowForge AI by Daniel

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

This FlowForge AI is a small React Flow prototype for arranging AI, fetch, decision and text nodes. It is kept separate from unrelated products also named FlowForge.

## The graph lives in one Zustand store

[flowStore.ts](https://github.com/0xDaniiel/flowforge-ai/blob/747546a6240dcd01dee9751d3680d27b35ce613e/stores/flowStore.ts) owns the node and edge arrays used by [FlowCanvas.tsx](https://github.com/0xDaniiel/flowforge-ai/blob/747546a6240dcd01dee9751d3680d27b35ce613e/components/flow/canvas/FlowCanvas.tsx). Direct canvas edits therefore change the working authority, but the inspected tree has no durable storage adapter or import/export contract.

## Simulation is topology animation

The store walks from a selected start node, pauses between nodes and chooses a decision edge by its handle. It does not invoke an LLM, fetch executor or external agent runtime. The useful product fact is visual reasoning about order and branching, not successful AI automation.

## Why it is still in the map

The ordinary loop is real at prototype depth: add typed nodes, connect them, configure conditions and inspect a simulated path. It defines a minimal visual-agent product direction, while its in-memory authority and deterministic runner sharply limit any delivery claim.

## Pinned evidence

- [Repository](https://github.com/0xDaniiel/flowforge-ai)
- [Inspected tree](https://github.com/0xDaniiel/flowforge-ai/tree/747546a6240dcd01dee9751d3680d27b35ce613e)
- [Node settings surface](https://github.com/0xDaniiel/flowforge-ai/blob/747546a6240dcd01dee9751d3680d27b35ce613e/components/flow/sidebar/NodeSettingsSidebar.tsx)
