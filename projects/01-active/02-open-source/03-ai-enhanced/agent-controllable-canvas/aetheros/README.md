# AETHEROS

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

AETHEROS is a local-first visual-agent prototype with two genuinely implemented authoring paths: manual React Flow editing and prompt-to-graph generation. Its repository also contains a capable token-passing engine, but the inspected UI does not yet connect the authored graph to that engine.

## AI can replace the working graph

[ArchitectPanel.tsx](https://github.com/DaFum/github-repository-vi/blob/23239cdc19e25ee4ba8b0c04b826cf1fb0bc8f69/src/components/flow/ArchitectPanel.tsx) asks a selected model for constrained node/edge JSON, validates the arrays and hydrates the same Zustand state used by manual drag-and-drop. Users can then correct that result directly.

## Portability is stronger than persistence

[BlueprintRegistry.ts](https://github.com/DaFum/github-repository-vi/blob/23239cdc19e25ee4ba8b0c04b826cf1fb0bc8f69/src/lib/store/BlueprintRegistry.ts) exports the current graph as a ZIP containing `blueprint.json` and can rehydrate it on import. The graph store itself is in memory; the separate vault persists generated artifacts through Spark KV but is not the canvas authority.

## Important runtime gap

[GraphEngine.ts](https://github.com/DaFum/github-repository-vi/blob/23239cdc19e25ee4ba8b0c04b826cf1fb0bc8f69/src/lib/engine/GraphEngine.ts) implements concurrency, token propagation, retries, history and deadlock detection. However, [FlowEditor.tsx](https://github.com/DaFum/github-repository-vi/blob/23239cdc19e25ee4ba8b0c04b826cf1fb0bc8f69/src/components/flow/FlowEditor.tsx) only initializes a singleton created with an empty graph; it never calls `updateGraph`, and that engine registry is separate from the UI node registry. `RUN_FLOW` therefore does not execute the visible design at this commit.

## Why it remains included

Prompt → editable graph → portable blueprint is a real ordinary-user artifact loop. The dossier deliberately records execution as an unwired implementation direction, not as delivered automation.

## Pinned evidence

- [Repository](https://github.com/DaFum/github-repository-vi)
- [Inspected tree](https://github.com/DaFum/github-repository-vi/tree/23239cdc19e25ee4ba8b0c04b826cf1fb0bc8f69)
- [Flow store](https://github.com/DaFum/github-repository-vi/blob/23239cdc19e25ee4ba8b0c04b826cf1fb0bc8f69/src/store/flowStore.ts)
