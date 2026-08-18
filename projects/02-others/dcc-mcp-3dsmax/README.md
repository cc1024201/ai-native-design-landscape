# DCC-MCP 3ds Max

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

DCC-MCP 3ds Max is the independently released 3ds Max host adapter in the DCC-MCP ecosystem. A sidecar owns network and job concerns while scene-changing operations return to the application's main thread.

## Capability groups follow 3ds Max's native failure domains

The adapter does not expose one unrestricted script box as its product surface. Modeling, mesh topology, materials, cameras/lights, animation, rigging, display, import/export and rendering are separately declared typed Skills. For example the [mesh operations contract](https://github.com/dcc-mcp/dcc-mcp-3dsmax/blob/c42210f50f0dcbadcea1704310a6adf9dc41ec3f/src/dcc_mcp_3dsmax/skills/3dsmax-mesh-ops/SKILL.md) distinguishes topology inspection from destructive cleanup, while the [render contract](https://github.com/dcc-mcp/dcc-mcp-3dsmax/blob/c42210f50f0dcbadcea1704310a6adf9dc41ec3f/src/dcc_mcp_3dsmax/skills/3dsmax-render/SKILL.md) owns viewport capture, preview and final outputs.

The live Max scene and saved native file remain authoritative. Material creation and bitmap binding mutate real host objects; viewport captures and render statistics are verification projections rather than a replacement scene graph.

## Evidence

- [Pinned adapter](https://github.com/dcc-mcp/dcc-mcp-3dsmax/tree/c42210f50f0dcbadcea1704310a6adf9dc41ec3f)
- [PBR material operation](https://github.com/dcc-mcp/dcc-mcp-3dsmax/blob/c42210f50f0dcbadcea1704310a6adf9dc41ec3f/src/dcc_mcp_3dsmax/skills/3dsmax-materials/action_create_pbr_material.py)
- [Main server boundary](https://github.com/dcc-mcp/dcc-mcp-3dsmax/blob/c42210f50f0dcbadcea1704310a6adf9dc41ec3f/src/dcc_mcp_3dsmax/server.py)
