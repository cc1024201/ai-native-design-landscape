# FableCut

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

FableCut is a browser non-linear editor designed around one unusually explicit contract: `project.json` is both the durable timeline and the agent interface. The human editor, direct file changes, REST clients and MCP clients all mutate the same tracks, clips, effects, keyframes and transitions.

## Source and projection stay in a live loop

[`server.js`](https://github.com/ronak-create/FableCut/blob/5ecbf00ee4476e2d58d5b9249a05c6949092c770/server.js) owns the project file, media, analysis and export endpoints. A revision counter prevents silent last-writer-wins collisions, while server-sent events tell the open browser to reload after an external edit. [`app.js`](https://github.com/ronak-create/FableCut/blob/5ecbf00ee4476e2d58d5b9249a05c6949092c770/app.js) projects that document into a direct-manipulation monitor and multitrack timeline with undo/redo.

[`mcp-server.js`](https://github.com/ronak-create/FableCut/blob/5ecbf00ee4476e2d58d5b9249a05c6949092c770/mcp-server.js) does not hide the edit behind a generate endpoint: it exposes structured timeline operations and reference-analysis tools. An agent-authored animated SVG can remain editable source while the compositor freezes it at the exact export time.

## Delivery is derived from the same timeline

The browser renders every frame and an offline audio mix before ffmpeg encodes the final MP4. Reference-video analysis produces an inspectable blueprint of cuts, beats, loudness and energy rather than copying pixels. Moving `FABLECUT_DATA_DIR` relocates the project JSON and its media as one user-owned workspace.

## Evidence

- [Pinned repository](https://github.com/ronak-create/FableCut/tree/5ecbf00ee4476e2d58d5b9249a05c6949092c770)
- [Agent-facing project schema](https://github.com/ronak-create/FableCut/blob/5ecbf00ee4476e2d58d5b9249a05c6949092c770/CLAUDE.md)
- [Application manifest](https://github.com/ronak-create/FableCut/blob/5ecbf00ee4476e2d58d5b9249a05c6949092c770/manifest.json)
