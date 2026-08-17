# DCC-MCP Marmoset

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

DCC-MCP Marmoset connects agents to Marmoset Toolbag 4.03+ and 5.x for look development, rendering and validation. A pure-Python plugin executes `mset` calls during Toolbag's periodic callback while the external process owns MCP and long-lived jobs.

## The acceptance loop is visible in one real scene

The adapter's published showcase imports an FBX, assigns explicit albedo/normal/roughness/metalness/occlusion maps, frames the exact object, finds missing references, saves the scene and renders a 1920×1080 camera. Those are the same operations exposed by the [scene Skill](https://github.com/dcc-mcp/dcc-mcp-marmoset/blob/47f82e327f6860b14fd6ca0f30de8dc3b361cdde/src/dcc_mcp_marmoset/skills/marmoset-scene/SKILL.md).

Rendering is an asynchronous job around Toolbag's monolithic native call. A timeout is not permission to issue the same render again; the agent must inspect job and output state. The `.tbscene` remains the lookdev authority while camera images and diagnostics are review evidence.

## Evidence

- [Pinned Toolbag adapter](https://github.com/dcc-mcp/dcc-mcp-marmoset/tree/47f82e327f6860b14fd6ca0f30de8dc3b361cdde)
- [PBR material creation](https://github.com/dcc-mcp/dcc-mcp-marmoset/blob/47f82e327f6860b14fd6ca0f30de8dc3b361cdde/src/dcc_mcp_marmoset/skills/marmoset-scene/scripts/create_pbr_material.py)
- [Camera render operation](https://github.com/dcc-mcp/dcc-mcp-marmoset/blob/47f82e327f6860b14fd6ca0f30de8dc3b361cdde/src/dcc_mcp_marmoset/skills/marmoset-scene/scripts/render_camera.py)
