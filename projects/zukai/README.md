# Zukai

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

Zukai is a file-first canvas for cloud architectures, mind maps, and sequence diagrams. Its plain `.zu` JSON is intentionally accessible to humans, browser code, coding agents, and MCP clients.

## `.zu` is the authority

Shapes, links, anchors, routes, icon references, and canvas state serialize into a portable JSON document. The 4096×4096 canvas is a projection over that file. Import/export and localStorage session restore prevent the hosted demo from becoming the only custodian of a design.

## Four agent edges meet the same document

Users can bring Claude or OpenAI keys to in-app panels, use a development server with live `.zu` reload, call the `window.ZU` command API, or connect Cursor through MCP. MCP operations can get state, apply operations, and save, allowing external agents to change the visible diagram without inventing another format.

## Undo and reload define recovery

Direct editing and agent mutations enter the same operation/history path, so users can undo or reload from disk. That does not make concurrent filesystem and browser changes conflict-free; the current file should be reread before an external agent writes.

## Pinned evidence

- Repository: [Satachito/Zukai](https://github.com/Satachito/Zukai)
- Inspected editor and tools: [`7e87fc4cf274de0f8763c04bf5585b87964b422c`](https://github.com/Satachito/Zukai/tree/7e87fc4cf274de0f8763c04bf5585b87964b422c)
- Immutable revision: [commit `7e87fc4`](https://github.com/Satachito/Zukai/commit/7e87fc4cf274de0f8763c04bf5585b87964b422c)
