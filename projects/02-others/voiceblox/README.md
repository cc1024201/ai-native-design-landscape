# Voiceblox

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

Voiceblox treats a visual voice-agent graph as a deployable configuration rather than an explanatory diagram. A serializer removes editor-only fields; the resulting config is reused by local tests and LiveKit worker deployment.

## Canvas state becomes a runtime contract

[`graph-serializer.ts`](https://github.com/okanaganrusty/voiceblox/blob/d3471abe4c2048afe8a7aac1c620d95875bbeef2/lib/graph-serializer.ts) strips positions selections and other UI metadata while preserving the nodes edges and provider settings required by the agent. [`graph-to-config.ts`](https://github.com/okanaganrusty/voiceblox/blob/d3471abe4c2048afe8a7aac1c620d95875bbeef2/lib/agent/graph-to-config.ts) converts that normalized graph into voice-agent configuration.

This explicit boundary lets the editor evolve without leaking canvas mechanics into the worker protocol.

## Natural language edits target graph operations

The builder chat uses Anthropic to propose operations over nodes and connections rather than replacing the whole project with opaque prose. Users can still inspect and correct the resulting graph before it is saved.

## Version restore and delivery share the same artifact

SQLite tables cover agents agent versions build conversations test sessions messages and deployment history. [`versioning.ts`](https://github.com/okanaganrusty/voiceblox/blob/d3471abe4c2048afe8a7aac1c620d95875bbeef2/lib/versioning.ts) snapshots and restores graph state. The TypeScript and Python agent packages consume the serialized config for LiveKit operation; deploy routes package the same authority rather than asking users to reimplement their voice flow.

## Boundary

Graph serialization and runnable worker code establish the mechanism. They do not prove a cloud deployment succeeded for every provider combination or that generated natural-language operations are always semantically safe. Saved versions provide the recovery point for that uncertainty.

## Evidence

- [Repository](https://github.com/okanaganrusty/voiceblox)
- [Pinned tree](https://github.com/okanaganrusty/voiceblox/tree/d3471abe4c2048afe8a7aac1c620d95875bbeef2)
- [LiveKit TypeScript runtime](https://github.com/okanaganrusty/voiceblox/blob/d3471abe4c2048afe8a7aac1c620d95875bbeef2/agent-typescript/livekit.ts)
