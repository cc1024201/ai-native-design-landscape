# SketchForge

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

SketchForge is a local-first browser 3D editor with a development MCP bridge. Human and agent operations share the same live scene, history and `.skf` project rather than exchanging screenshots or generated meshes as the only authority.

## MCP controls the editor tab users can see

[`sketchforge-mcp-server.mjs`](https://github.com/Formsmith746/SketchForge-3D/blob/a42922c4f3f4132c1892ae7e447cb2dbe657e860/scripts/sketchforge-mcp-server.mjs) relays tools to the active browser editor. The agent can read the scene, create or update objects, group them, apply boolean cuts and edge treatments, and capture an image. [`SKF_PROJECT_FORMAT.md`](https://github.com/Formsmith746/SketchForge-3D/blob/a42922c4f3f4132c1892ae7e447cb2dbe657e860/docs/SKF_PROJECT_FORMAT.md) documents the persisted project boundary.

Editor history includes transformations and edge-treatment changes. STL and OBJ serve mesh workflows while STEP provides a more engineering-oriented interchange path. The bridge is currently development-oriented rather than a hosted multi-user control plane. Maintainer region remains unknown because no reliable first-party location was found.

## Evidence

- [Pinned repository](https://github.com/Formsmith746/SketchForge-3D/tree/a42922c4f3f4132c1892ae7e447cb2dbe657e860)
- [Project format](https://github.com/Formsmith746/SketchForge-3D/blob/a42922c4f3f4132c1892ae7e447cb2dbe657e860/docs/SKF_PROJECT_FORMAT.md)
- [MCP server](https://github.com/Formsmith746/SketchForge-3D/blob/a42922c4f3f4132c1892ae7e447cb2dbe657e860/scripts/sketchforge-mcp-server.mjs)
- [Editor history](https://github.com/Formsmith746/SketchForge-3D/blob/a42922c4f3f4132c1892ae7e447cb2dbe657e860/apps/web/src/lib/editorHistory.ts)
