# DCC-MCP Maya

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

DCC-MCP Maya is the ecosystem's broad Maya host product. It couples a Rust sidecar and stable gateway with a Qt dispatcher into Maya, then progressively exposes more than seventy typed operations across scene, mesh, UV, material, rig, animation, simulation, rendering and pipeline work.

## Native nodes and stable project state beat repeated script generation

The plugin starts or joins the local gateway and sends actual Maya API work through the UI dispatcher. [`ui.py`](https://github.com/dcc-mcp/dcc-mcp-maya/blob/a4fe95abc78360d1ad45072be08392e12d3d287c/src/dcc_mcp_maya/dispatcher/ui.py) owns that affinity boundary. Skills are loaded only when needed, but the resulting objects are ordinary DAG, DG, Bifrost, material, animation and render structures visible to Maya users.

Project attachment, readiness, resources and persistent jobs distinguish the product from a pile of one-shot scripts. Long work can be cancelled or recovered by job identity; scene and project tools make save state explicit. The adapter also supports independently released domain Skills such as mGear and procedural architecture without absorbing their workflow identities.

## Evidence

- [Pinned Maya adapter](https://github.com/dcc-mcp/dcc-mcp-maya/tree/a4fe95abc78360d1ad45072be08392e12d3d287c)
- [Server and progressive catalog](https://github.com/dcc-mcp/dcc-mcp-maya/blob/a4fe95abc78360d1ad45072be08392e12d3d287c/src/dcc_mcp_maya/server.py)
- [Bifrost authoring Skill](https://github.com/dcc-mcp/dcc-mcp-maya/blob/a4fe95abc78360d1ad45072be08392e12d3d287c/src/dcc_mcp_maya/skills/maya-bifrost/SKILL.md)
- [Project-state tools](https://github.com/dcc-mcp/dcc-mcp-maya/blob/a4fe95abc78360d1ad45072be08392e12d3d287c/src/dcc_mcp_maya/_project_tools.py)
