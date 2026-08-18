# LiveDiagram

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

LiveDiagram is a collaborative native diagram product whose canvas can also be controlled through OAuth-protected MCP tools. Its product definition begins with a shareable diagram—not with AI chat.

## The diagram model is a shared authority

The monorepo contains a reusable diagram model and wire types, an editor, a REST/WebSocket API, and Cloudflare-backed persistence. Guest diagrams survive without sign-in; accounts add cross-device continuity. Nodes, connections, comments, and activity are durable product objects.

## Collaboration includes surgical recovery

Realtime rooms carry presence, cursors, and synchronized edits. The activity log and version snapshots support comparison and targeted revert rather than only whole-document replacement. Comments and visibility rules remain distinct from canvas mutation.

## MCP addresses the same product

The separate MCP worker exposes diagram tools to authenticated AI clients. An agent can act on the shared model instead of generating a detached picture. Tool authorization does not remove the need to review edits, and the public surface should not be assumed to expose every internal operation.

## Pinned evidence

- Repository: [livediagram-app/livediagram.app](https://github.com/livediagram-app/livediagram.app)
- Inspected monorepo: [`997b4a16534df2f62a36902d279e0287c18f70f3`](https://github.com/livediagram-app/livediagram.app/tree/997b4a16534df2f62a36902d279e0287c18f70f3)
- Immutable revision: [commit `997b4a1`](https://github.com/livediagram-app/livediagram.app/commit/997b4a16534df2f62a36902d279e0287c18f70f3)
