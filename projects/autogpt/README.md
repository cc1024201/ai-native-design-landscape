# AutoGPT

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

AutoGPT's current platform defines an agent as a versioned executable graph that can be built visually, generated conversationally, scheduled, triggered, shared, and published.

## Build and AutoPilot converge on graph state

The Build surface exposes nodes, blocks, connections, inputs, and outputs. AutoPilot can draft an agent from an outcome, but the result returns to the same builder for direct correction. A graph store and draft service distinguish unsaved edits from persisted versions.

## Execution has operational identities

Backend graph and execution records track graph versions, node runs, credentials, costs, schedules, webhooks, and pending human review. Running an agent is therefore not equivalent to replaying a chat response; it binds a specific graph version to observable execution state.

## Publishing changes the audience, not the authority

Marketplace publication and reusable agents expose a saved graph to others, while schedules and triggers invoke it in production. The same repository contains hosted and self-hostable platform code, but this dossier does not treat every marketplace listing as a new product definition.

## Pinned evidence

- Repository: [Significant-Gravitas/AutoGPT](https://github.com/Significant-Gravitas/AutoGPT)
- Inspected builder, graph-version, execution, scheduling, and review tree: [`3b05496c1ec819b08b829c186f7cc9ad3c5b4376`](https://github.com/Significant-Gravitas/AutoGPT/tree/3b05496c1ec819b08b829c186f7cc9ad3c5b4376)
- Immutable revision: [commit `3b05496`](https://github.com/Significant-Gravitas/AutoGPT/commit/3b05496c1ec819b08b829c186f7cc9ad3c5b4376)
