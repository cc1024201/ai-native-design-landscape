# GENESIS HighLevel App Builder

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-13**

GENESIS narrows app generation to HighLevel marketplace applications. That vertical choice changes the runtime contract: generated Vue source calls a platform gateway while OAuth tokens remain outside the generated artifact.

## Pending snapshots make generation transactional

Pinned revision: `0fc48735466f7d06ac53ba589af5a5d096db1fa9`.

Before an agent run, GENESIS creates a Firestore snapshot. File tools write beneath that snapshot; success activates it and failure or cancellation rolls back without corrupting the previous active snapshot. Refinement preloads the active files and writes a new snapshot rather than mutating them in place.

## Preview identity is relayed without leaking credentials

A WebContainer runs the generated Vue app. Its isolated frame sends HighLevel requests to the parent with `postMessage`; the parent attaches Firebase identity and calls the backend gateway, which resolves the owner's HighLevel token. The generated files therefore stay portable and token-free.

```mermaid
flowchart LR
    A["Agent file tools"] --> S["Pending Firestore snapshot"]
    S -->|finalize| C["Active source snapshot"]
    C --> W["WebContainer Vue preview"]
    W --> R["Parent-window relay"]
    R --> G["HighLevel gateway with server token"]
```

## Pinned evidence

- [Repository](https://github.com/bhavesh116/highlevel-dev)
- [Agent file contract](https://github.com/bhavesh116/highlevel-dev/blob/0fc48735466f7d06ac53ba589af5a5d096db1fa9/functions/src/core/agent.ts)
- [Snapshot service](https://github.com/bhavesh116/highlevel-dev/blob/0fc48735466f7d06ac53ba589af5a5d096db1fa9/functions/src/services/storage/snapshots.ts)
- [Generation route](https://github.com/bhavesh116/highlevel-dev/blob/0fc48735466f7d06ac53ba589af5a5d096db1fa9/functions/src/routes/generate.routes.ts)
- [Browser runtime](https://github.com/bhavesh116/highlevel-dev/blob/0fc48735466f7d06ac53ba589af5a5d096db1fa9/frontend/src/composables/useWebContainer.ts)
- [HighLevel gateway](https://github.com/bhavesh116/highlevel-dev/blob/0fc48735466f7d06ac53ba589af5a5d096db1fa9/functions/src/routes/highlevel/gateway/index.ts)
