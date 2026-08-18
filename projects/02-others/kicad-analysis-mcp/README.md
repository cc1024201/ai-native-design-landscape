# KiCad Analysis MCP

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

Lama Al Rajih's KiCad MCP takes a deliberately read-mostly view of electronic design. It gives an agent project discovery, BOM, netlist, DRC, pattern-recognition, validation, export and thumbnail evidence without claiming to be the authoring authority for the board.

## Read-only access can still define a Design verification product

The server parses native KiCad artifacts, calls `kicad-cli` through a bounded subprocess layer and records DRC history. Its ordinary loop is inspect project → identify structural or rule problems → render/export evidence → let the user or another authoring tool change the native project. That is a visual decision and verification workspace, not a native canvas editor.

This boundary is why it remains independent from write-capable KiCad MCPs: its product promise is trustworthy analysis and evidence, and its source explicitly constrains paths and process execution rather than silently mutating the project.

## Evidence

- [Pinned repository](https://github.com/lamaalrajih/kicad-mcp/tree/98c9ea41cb393393a8bafd157a93e84431e00afb)
- [Analysis tools](https://github.com/lamaalrajih/kicad-mcp/blob/98c9ea41cb393393a8bafd157a93e84431e00afb/kicad_mcp/tools/analysis_tools.py)
- [DRC history](https://github.com/lamaalrajih/kicad-mcp/blob/98c9ea41cb393393a8bafd157a93e84431e00afb/kicad_mcp/utils/drc_history.py)
- [Maintainer profile](https://github.com/lamaalrajih)
