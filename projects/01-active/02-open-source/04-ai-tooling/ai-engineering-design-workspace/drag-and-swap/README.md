# Drag-and-Swap

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

Drag-and-Swap is a browser-native visual automation product specialized for crypto and trading agents. Its graph is both the editor artifact and the model consumed by active trigger subscriptions.

## Wallet-scoped agents are the persistence boundary

[AgentsContext.tsx](https://github.com/FarrellJoswara/Drag-and-Swap/blob/a177ebab88b4e7037d39caa2f28f10767aa9b3b1/src/contexts/AgentsContext.tsx) stores deployed-agent records per wallet in local storage. Each record carries its nodes, edges and active state; there is no server-side version history at this commit.

## Unsaved canvas corrections can affect a live runner

[CurrentFlowContext.tsx](https://github.com/FarrellJoswara/Drag-and-Swap/blob/a177ebab88b4e7037d39caa2f28f10767aa9b3b1/src/contexts/CurrentFlowContext.tsx) exposes the current editor graph. [useActiveAgentRunners.ts](https://github.com/FarrellJoswara/Drag-and-Swap/blob/a177ebab88b4e7037d39caa2f28f10767aa9b3b1/src/hooks/useActiveAgentRunners.ts) prefers that graph when building the connected model, re-subscribes when trigger inputs change and reports block-level progress.

## Runtime is domain-specific but real

[runAgent.ts](https://github.com/FarrellJoswara/Drag-and-Swap/blob/a177ebab88b4e7037d39caa2f28f10767aa9b3b1/src/lib/runAgent.ts) traverses downstream blocks from triggers, while registered blocks connect streams, transformations, display output and swap actions. This is stronger than a timed simulation, but carries the security and durability limits of a browser-held wallet workflow.

## Classification boundary

The product defines visual agent composition through a trading-specific vocabulary. It is not a general-purpose agent platform, and local storage is not described as collaborative persistence.

## Pinned evidence

- [Repository](https://github.com/FarrellJoswara/Drag-and-Swap)
- [Inspected tree](https://github.com/FarrellJoswara/Drag-and-Swap/tree/a177ebab88b4e7037d39caa2f28f10767aa9b3b1)
- [Block registry](https://github.com/FarrellJoswara/Drag-and-Swap/blob/a177ebab88b4e7037d39caa2f28f10767aa9b3b1/src/lib/blockRegistry.ts)
