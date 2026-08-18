# Serpentine3D

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

Serpentine3D is a cross-platform freeform NURBS modeller built on OpenCASCADE with native agent control. Manual commands, viewport interaction, headless scripts and MCP all call the same modeling core rather than translating through screenshots or mesh-only generation.

## Exact BREP state supports both human previews and agent mutation

[`scene.py`](https://github.com/chisomobanzi/Serpentine3D/blob/2e9986ade2af042b4cd37462772c719c4bb33bbe/serpentine3d/core/scene.py) owns curves, surfaces, solids, layers and history. [`tools.py`](https://github.com/chisomobanzi/Serpentine3D/blob/2e9986ade2af042b4cd37462772c719c4bb33bbe/serpentine3d/ai/tools.py) and the [MCP server](https://github.com/chisomobanzi/Serpentine3D/blob/2e9986ade2af042b4cd37462772c719c4bb33bbe/serpentine3d/mcp_server/server.py) expose that same command surface. Live gold previews, zebra/curvature analysis and viewport capture let a person or agent inspect geometric consequences before commitment.

The `.serp` container—JSON scene plus binary BREP—is authoritative. Autosave/crash recovery and a session journal preserve editing continuity; STEP, Rhino, mesh and vector formats are interchange projections.

## Evidence

- [Pinned repository](https://github.com/chisomobanzi/Serpentine3D/tree/2e9986ade2af042b4cd37462772c719c4bb33bbe)
- [AI/MCP usage guide](https://github.com/chisomobanzi/Serpentine3D/blob/2e9986ade2af042b4cd37462772c719c4bb33bbe/docs/howto/ai-mcp.md)
- [Maintainer profile: Taiwan](https://github.com/chisomobanzi)
