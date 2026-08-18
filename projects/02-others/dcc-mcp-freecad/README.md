# DCC-MCP FreeCAD

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

DCC-MCP FreeCAD is a headless parametric-CAD adapter. Its central contract is not mesh generation but safe mutation and validation of an `.FCStd` document whose features and dependencies remain authoritative.

## Recompute is part of every design claim

Session tools create, inspect and validate the native document. Modeling calls are executed in FreeCAD's Python runtime, the dependency graph is recomputed and the staged document is accepted only when the requested invariants hold. [`validate_document.py`](https://github.com/dcc-mcp/dcc-mcp-freecad/blob/6e83d40432bc79c75379891db808f440fbf6d9ca/src/dcc_mcp_freecad/skills/freecad-session/scripts/validate_document.py) makes that check explicit.

Edits are dependency-aware and failures leave the original bytes unchanged. STEP, IGES, BREP, STL and OBJ are interchange outputs derived from the FCStd authority rather than silently replacing its parametric intent. This failure behavior distinguishes the adapter from a text-to-mesh wrapper.

## Evidence

- [Pinned repository](https://github.com/dcc-mcp/dcc-mcp-freecad/tree/6e83d40432bc79c75379891db808f440fbf6d9ca)
- [Modeling Skill contract](https://github.com/dcc-mcp/dcc-mcp-freecad/blob/6e83d40432bc79c75379891db808f440fbf6d9ca/src/dcc_mcp_freecad/skills/freecad-modeling/SKILL.md)
- [Host bridge](https://github.com/dcc-mcp/dcc-mcp-freecad/blob/6e83d40432bc79c75379891db808f440fbf6d9ca/src/dcc_mcp_freecad/bridge.py)
