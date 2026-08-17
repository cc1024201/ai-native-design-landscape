# DCC-MCP Nuke

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

DCC-MCP Nuke embeds a server in Nuke and dispatches typed operations through the application's main thread. Its current product is a constrained compositing and reusable-node workflow rather than unrestricted Python execution.

## Corrections are scoped to graph and material identity

The layered-compositing Skill can apply ordered gain, saturation, edge-feather and albedo-fill adjustments globally or through Cryptomatte selection. It is designed to leave pixels outside the selected material unchanged. [`render_write_node.py`](https://github.com/dcc-mcp/dcc-mcp-nuke/blob/709be8b6fe45cd7c2dcebae8275357290c40d774/src/dcc_mcp_nuke/skills/nuke-layered-compositing/scripts/render_write_node.py) materializes a graph result through an explicit Write node.

A separate node-assets Skill packages versioned Gizmos with bounded public knobs, instantiates them and validates the live instance. This creates a reusable component-governance loop inside Nuke. The `.nk` script and native node graph remain authoritative; sampled AOV statistics and renders are evidence.

## Evidence

- [Pinned Nuke adapter](https://github.com/dcc-mcp/dcc-mcp-nuke/tree/709be8b6fe45cd7c2dcebae8275357290c40d774)
- [Layered-compositing contract](https://github.com/dcc-mcp/dcc-mcp-nuke/blob/709be8b6fe45cd7c2dcebae8275357290c40d774/src/dcc_mcp_nuke/skills/nuke-layered-compositing/SKILL.md)
- [Gizmo validation](https://github.com/dcc-mcp/dcc-mcp-nuke/blob/709be8b6fe45cd7c2dcebae8275357290c40d774/src/dcc_mcp_nuke/skills/nuke-node-assets/scripts/gizmo_validate.py)
