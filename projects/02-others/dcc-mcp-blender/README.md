# DCC-MCP Blender

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

DCC-MCP Blender is the Blender host adapter in the wider DCC-MCP ecosystem. It embeds a Streamable HTTP server in Blender and exposes typed, progressively loadable skills across scene assembly, mesh/UV work, rigging, materials, node graphs, physics, rendering and interchange.

## Typed capabilities replace unrestricted host scripting

[`_capability_manifest.py`](https://github.com/dcc-mcp/dcc-mcp-blender/blob/1f1dacc54c1bb9fa0f8b347f345437f59c23e40d/src/dcc_mcp_blender/_capability_manifest.py) declares the available surface; host dispatchers serialize calls into Blender's UI thread. [`context_snapshot.py`](https://github.com/dcc-mcp/dcc-mcp-blender/blob/1f1dacc54c1bb9fa0f8b347f345437f59c23e40d/src/dcc_mcp_blender/context_snapshot.py) gives agents bounded scene context, while render-job and readiness modules keep long operations inspectable.

The live scene and `.blend` file remain authoritative. This adapter is counted independently from the shared DCC-MCP core because it has its own installable release, Blender extension, tested host dispatcher and artifact-specific tool graph.

## Evidence

- [Pinned repository](https://github.com/dcc-mcp/dcc-mcp-blender/tree/1f1dacc54c1bb9fa0f8b347f345437f59c23e40d)
- [Scene operations](https://github.com/dcc-mcp/dcc-mcp-blender/blob/1f1dacc54c1bb9fa0f8b347f345437f59c23e40d/src/dcc_mcp_blender/_scene_ops.py)
- [Blender setup skill](https://github.com/dcc-mcp/dcc-mcp-blender/blob/1f1dacc54c1bb9fa0f8b347f345437f59c23e40d/skills/dcc-mcp-blender-setup/SKILL.md)
