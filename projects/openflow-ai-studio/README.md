# OpenFlow

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

OpenFlow is a node-based creative studio for image, video, audio, text, and review work whose `openAgent` can operate on the same graph that a user edits directly.

## Typed handles define what can compose

Zustand holds the node and edge graph; connection rules and workflow validation reject incompatible media paths. Execution performs dependency ordering and writes outputs back into node data, so the canvas records both intended topology and observable results.

## The agent submits graph operations

The Flowy planner receives a bounded canvas snapshot and returns allowlisted add, update, connect, delete, and execution targets. A deterministic apply path validates node types, handle compatibility, selection context, and approval policy before mutating state. Assist, Plan, and Auto modes therefore differ in authority rather than only tone.

## Review material lives beside generation

Annotations, comments, comparison branches, uploaded references, and generation nodes share the graph. Workflows can be saved, imported, or exported as JSON; generated media can be persisted separately. The dossier treats those two artifact layers as related but not identical.

## Pinned evidence

- Repository: [nazihkhelifa/openflow](https://github.com/nazihkhelifa/openflow)
- Inspected canvas, execution, agent planner, validation, and persistence tree: [`d791d690021482518dee4b8d3dbad0b5aaede5aa`](https://github.com/nazihkhelifa/openflow/tree/d791d690021482518dee4b8d3dbad0b5aaede5aa)
- Immutable revision: [commit `d791d69`](https://github.com/nazihkhelifa/openflow/commit/d791d690021482518dee4b8d3dbad0b5aaede5aa)
