# Buildev

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

Buildev is an open design-as-code platform built around `.op` JSON documents. The same PenNode AST can be manipulated on a GPU canvas, through a terminal CLI, by MCP clients or by concurrent generation agents and can be rendered into several code targets.

## `.op` is the convergence point

The editor's canvas-document synchronizer keeps the Skia projection aligned with the document store. [`canvas-document-sync.ts`](https://github.com/bryfar/Buildev/blob/eebe199c2ee4fa54198a08efbe01c28d67e9477b/apps/web/src/canvas/canvas-document-sync.ts) makes that relationship explicit. Agent tools execute document and node operations rather than returning a disconnected mockup; corresponding CLI commands expose document reads and writes.

The unusual second direction is Code Mode. React, Vue and HTML parsers can update the visual graph after source edits, while exporters materialize the graph into React, HTML, Vue, Svelte, Flutter, SwiftUI, Jetpack Compose or React Native.

```text
prompt/vision/CLI/MCP -> .op AST <-> infinite Skia canvas
                              <-> supported code parsers
                              -> framework exports + Git history
```

Concurrent agents are spatially scoped but ultimately merge into one document. Git integration supplies diff and recovery around the portable JSON; provider job state is not a substitute for that artifact. Framework export fidelity and reverse parsing are target-specific, so “bidirectional” should not be generalized to every export format.

The project is MIT-licensed. The maintainer profile reports Lima in Peru.

## Implementation map

- [Pinned monorepo](https://github.com/bryfar/Buildev/tree/eebe199c2ee4fa54198a08efbe01c28d67e9477b)
- [MCP document endpoint](https://github.com/bryfar/Buildev/blob/eebe199c2ee4fa54198a08efbe01c28d67e9477b/apps/web/server/api/mcp/document.post.ts)
- [Agent tool executor](https://github.com/bryfar/Buildev/blob/eebe199c2ee4fa54198a08efbe01c28d67e9477b/apps/web/src/services/ai/agent-tool-executor.ts)
- [MIT license](https://github.com/bryfar/Buildev/blob/eebe199c2ee4fa54198a08efbe01c28d67e9477b/LICENSE)
