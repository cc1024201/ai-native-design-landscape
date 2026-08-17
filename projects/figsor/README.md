# Figsor

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

Figsor connects an external coding agent to a sideloaded Figma plugin. The product does not replace Figma with generated screenshots: it creates and edits native frames, text, vectors, components, variables and auto-layout inside the open Figma document.

## One authenticated command bridge reaches native nodes

[`server.ts`](https://github.com/AsifKabirAntu/figsor/blob/b7e12cfc3ac6f0b5843b7b1b862580dbd5354162/mcp-server/src/server.ts) combines an MCP stdio server with a nonce/HMAC-authenticated local WebSocket. Each tool call carries a request ID and waits for a correlated plugin result; a disconnected or timed-out plugin surfaces as an error rather than a claimed edit.

[`code.js`](https://github.com/AsifKabirAntu/figsor/blob/b7e12cfc3ac6f0b5843b7b1b862580dbd5354162/figma-plugin/code.js) is the host-side executor. It resolves node IDs through the Figma API, serializes the current hierarchy and applies creation, parenting, fills, strokes, effects, vectors, component instances, variables and selection changes. The returned IDs let later turns inspect or revise the same layer rather than regenerate a replacement image.

## Persistence belongs to Figma

Figsor adds no shadow project database. Figma's document graph, versioning and collaboration remain authoritative; Figsor is an independently installable mutation and inspection surface. Its SVG preview/export path is derivative delivery, not a second source of truth.

## Evidence

- [Pinned repository](https://github.com/AsifKabirAntu/figsor/tree/b7e12cfc3ac6f0b5843b7b1b862580dbd5354162)
- [Plugin manifest and allowed bridge domains](https://github.com/AsifKabirAntu/figsor/blob/b7e12cfc3ac6f0b5843b7b1b862580dbd5354162/figma-plugin/manifest.json)
- [Design knowledge modules](https://github.com/AsifKabirAntu/figsor/tree/b7e12cfc3ac6f0b5843b7b1b862580dbd5354162/mcp-server/src/design-knowledge)
