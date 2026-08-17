# Foblex Flow

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

Foblex Flow is infrastructure for building Angular node editors. Its AI-native contribution is not a hosted generation feature; it is a deliberately machine-readable editing contract that lets coding agents assemble correct graph applications.

## Typed graph primitives are the product

Nodes, connectors, connections, groups, selection, transforms, snapping, and viewport behavior are exposed as Angular components and directives. Applications retain their own domain model while Foblex supplies deterministic canvas mechanics. Snapshots and undo support recovery at the editor layer.

## Documentation is part of the agent interface

Version-matched `AI.md` guidance and installation-time agent rules describe the exact API available for the installed package. Diagnostics help detect invalid wiring. This narrows the gap between a model's generic recollection and the concrete version in a user's workspace.

## A framework, not an autonomous designer

Foblex does not itself decide what graph a user needs. It is counted because it enables agents to produce and modify native visual-editor code with explicit constraints. Domain generation, persistence, collaboration, and approval remain responsibilities of the application built on top.

## Pinned evidence

- Repository: [Foblex/f-flow](https://github.com/Foblex/f-flow)
- Inspected package source: [`bd02be5a87160f6f5b5e875efd14911f4858db64`](https://github.com/Foblex/f-flow/tree/bd02be5a87160f6f5b5e875efd14911f4858db64)
- Immutable revision: [commit `bd02be5`](https://github.com/Foblex/f-flow/commit/bd02be5a87160f6f5b5e875efd14911f4858db64)
