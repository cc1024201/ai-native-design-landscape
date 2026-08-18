# KiCAD MCP Server

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

KiCAD MCP Server is the original TypeScript agent surface from the mixelpixx lineage. It turns a KiCad project into a tool-addressable engineering artifact: agents can create and inspect schematics and boards, route, apply design rules, export manufacturing files and resolve parts data rather than merely generate a PCB image.

## Registry-driven operations converge on native KiCad files

The server registers separate board, component, footprint, routing, schematic-batch, hierarchy, export and design-rule tools. Those operations ultimately read or write KiCad project artifacts; the server is an orchestration boundary, not a replacement document format. Its prompts and resources expose enough project structure for an agent to plan operations, while KiCad files and KiCad-compatible downstream tools remain the engineering authority.

The same maintainer now describes Konnect as the successor, but the two are not aliases. This repository remains a separately installable TypeScript server with its own tool contract; Konnect is a Rust/KiCad-10 redesign with a native IPC path. Both are therefore counted, with the successor relationship recorded explicitly.

## Evidence

- [Pinned repository](https://github.com/mixelpixx/KiCAD-MCP-Server/tree/d35dd01342c2ee6adbcd4522c60e0a8ac339f35f)
- [Tool registry](https://github.com/mixelpixx/KiCAD-MCP-Server/blob/d35dd01342c2ee6adbcd4522c60e0a8ac339f35f/src/tools/registry.ts)
- [Schematic batch tools](https://github.com/mixelpixx/KiCAD-MCP-Server/blob/d35dd01342c2ee6adbcd4522c60e0a8ac339f35f/src/tools/schematic-batch.ts)
- [Maintainer profile](https://github.com/mixelpixx)
