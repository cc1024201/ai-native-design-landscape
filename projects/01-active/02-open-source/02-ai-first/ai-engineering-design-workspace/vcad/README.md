# vCAD

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

vCAD is a browser and desktop parametric CAD system built around its own `.vcad` document and Rust exact-geometry kernel. It joins a direct visual editor, versioned cloud persistence, MCP and an in-product AI chat around that single model authority.

## The document survives every control surface

[`packages/core/src/stores/document-store.ts`](https://github.com/ecto/vcad/blob/4517f564a98c4d61700dd27dea66bfe308caae94/packages/core/src/stores/document-store.ts) and document mutation commands own the application state. The IR has an executable exact geometry implementation rather than a mesh-only preview. Database migrations persist documents, history, sharing and MCP sessions; the service exposes higher-level modeling tools rather than asking an agent to manufacture raw UI events.

```text
visual editor / AI chat / MCP -> document mutations
-> .vcad IR -> Rust BRep kernel -> viewport and measured geometry
-> version history / share / export
```

The current changelog explicitly records text-to-CAD and higher-level AI tools, making AI participation a shipped product mechanism instead of an inferred possibility. The maintainer profile reports the United States.

## Evidence

- [Pinned repository](https://github.com/ecto/vcad/tree/4517f564a98c4d61700dd27dea66bfe308caae94)
- [Document mutation commands](https://github.com/ecto/vcad/blob/4517f564a98c4d61700dd27dea66bfe308caae94/packages/core/src/commands/document-mutations.ts)
- [AI higher-level tools release evidence](https://github.com/ecto/vcad/blob/4517f564a98c4d61700dd27dea66bfe308caae94/changelog/entries/2026-04-23-ai-chat-higher-level-tools.json)
- [Maintainer location evidence](https://github.com/ecto)
