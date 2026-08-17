# PolySynergy

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

PolySynergy is a deliberately split visual automation platform. Its root repository is the release assembly and documentation boundary; the browser studio, local API, router, node libraries, field system and node runner live in pinned component repositories.

## Identity starts at the superproject

At commit `c79b64a612acb140a1b7c943e06e465a148f6616`, [.gitmodules](https://github.com/dionsnoeijen/polysynergy/blob/c79b64a612acb140a1b7c943e06e465a148f6616/.gitmodules) declares eight components. Their gitlinks pin exact commits, so the components are evidence for one product lineage, not eight additional products.

## The canvas owns executable structure

The pinned portal's [nodesStore.ts](https://github.com/dionsnoeijen/polysynergy-portal/blob/1ed5a576cb3752807b128fbcbc2061c5b57f729e/src/stores/nodesStore.ts) participates in a DOM-based visual editor with node history, connector validation, grouping, project state and execution feedback. The root [flow tutorial](https://github.com/dionsnoeijen/polysynergy/blob/c79b64a612acb140a1b7c943e06e465a148f6616/documentation/tutorials/flow-basics.md) traces an ordinary-user loop from an empty blueprint through connected nodes to branch-specific results and logs.

## Materialization crosses repository boundaries

The API component's [execution route](https://github.com/dionsnoeijen/polysynergy-api-local/blob/63df5592cdc1975b3cb6a2871a62e1fa456f485f/api/v1/execution/route.py) gathers project state for execution and publication. The node runner's [flow.py](https://github.com/dionsnoeijen/polysynergy-node-runner/blob/7a78a6057a76b12628b988c559caf13b332f3207/polysynergy_node_runner/execution_context/flow.py) consumes executable nodes and connections, propagates true/false paths and emits flow events.

## Product shape

PolySynergy combines visual coordination, agent/tool composition and product delivery. Routes, schedules, chat windows and published project services are downstream forms of the same blueprint rather than disconnected demos.

## Pinned evidence

- [Superproject](https://github.com/dionsnoeijen/polysynergy)
- [Inspected superproject tree](https://github.com/dionsnoeijen/polysynergy/tree/c79b64a612acb140a1b7c943e06e465a148f6616)
- [Pinned portal tree](https://github.com/dionsnoeijen/polysynergy-portal/tree/1ed5a576cb3752807b128fbcbc2061c5b57f729e)
- [Pinned runner tree](https://github.com/dionsnoeijen/polysynergy-node-runner/tree/7a78a6057a76b12628b988c559caf13b332f3207)
