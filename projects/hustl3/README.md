# Hustl3

> Research status: **Source-level** · Lifecycle: **active-transition** · Last reviewed: **2026-08-12**

Hustl3 is a hackathon-scale decentralized agent marketplace whose visual builder writes a reusable team blueprint into the same storage boundary used by its orchestration services. The implemented graph-to-runtime handoff is real, but its edge semantics are still much thinner than the product language suggests.

## A deployment starts with a graph and a wallet

[VisualBuilder.tsx](https://github.com/nisargpatel7042lva/Hustl3/blob/6a8f35196d9067941ed298a80d5019b7926b8e4c/apps/web/src/components/agent-builder/VisualBuilder.tsx) owns React Flow nodes and edges, serializes them with the connected wallet and first stores the blueprint through an API route. It then records an on-chain registration transaction and updates the same blueprint with deployment metadata rather than replacing the visual artifact with an unrelated form record.

## Storage gives the blueprint a stable address

[route.ts](https://github.com/nisargpatel7042lva/Hustl3/blob/6a8f35196d9067941ed298a80d5019b7926b8e4c/apps/web/src/app/api/agents/blueprint/route.ts) hashes nodes and edges into a deterministic identifier, saves both an ID-keyed and owner-keyed record through the 0G KV adapter, and appends a deployment event. That identifier can later travel as a `blueprintHash` with an order.

## The harness consumes the artifact, with a material ceiling

[harness.ts](https://github.com/nisargpatel7042lva/Hustl3/blob/6a8f35196d9067941ed298a80d5019b7926b8e4c/apps/web/src/lib/agents/harness.ts) reloads the saved blueprint, turns its agent nodes into tasks, invokes real 0G compute calls, retains state transitions and stores the final delivery. However, it currently assigns every imported node an empty dependency list and then executes nodes sequentially. The builder's edges are durable source data but do not yet govern scheduling.

## Why it is a transition record

The repository closes visual authoring, storage, model execution and delivery, so it is more than an animated prototype. It remains `active-transition` because the runtime reduces a drawn DAG to a node list; claims about parallel forks and exact canvas dependency semantics are not counted as implemented.

## Pinned evidence

- [Repository](https://github.com/nisargpatel7042lva/Hustl3)
- [Inspected tree](https://github.com/nisargpatel7042lva/Hustl3/tree/6a8f35196d9067941ed298a80d5019b7926b8e4c)
- [0G storage adapter](https://github.com/nisargpatel7042lva/Hustl3/blob/6a8f35196d9067941ed298a80d5019b7926b8e4c/apps/web/src/lib/storage/zerog.ts)
- [Order creation boundary](https://github.com/nisargpatel7042lva/Hustl3/blob/6a8f35196d9067941ed298a80d5019b7926b8e4c/apps/web/src/app/api/orders/create/route.ts)
