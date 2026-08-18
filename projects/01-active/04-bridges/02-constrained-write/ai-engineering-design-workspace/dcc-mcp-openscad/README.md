# DCC-MCP OpenSCAD

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

DCC-MCP OpenSCAD is a standalone adapter for deterministic inspection, validation, parameterized rendering and geometry export. It does not write arbitrary source; its Design loop begins with an existing `.scad` authority and safely explores or materializes parameter choices.

## Parameters are data, never injected expressions

The adapter parses modules, functions, variables and `include`/`use` relationships without executing source. JSON scalar and array parameters are encoded internally; callers cannot pass raw `-D` expressions or arbitrary command-line options. [`render_preview.py`](https://github.com/dcc-mcp/dcc-mcp-openscad/blob/3550a9e00bc0574f232edc11189945e8df9645c1/src/dcc_mcp_openscad/skills/openscad-pipeline/scripts/render_preview.py) exposes bounded camera, projection, color scheme and image-size inputs.

STL, 3MF, AMF, OFF, CSG, DXF, SVG, PDF and diagnostics are staged beside the destination and become visible only after success. Existing outputs require explicit overwrite. File size and SHA-256 link every render or export to the chosen source and parameters.

## Evidence

- [Pinned adapter](https://github.com/dcc-mcp/dcc-mcp-openscad/tree/3550a9e00bc0574f232edc11189945e8df9645c1)
- [Pipeline Skill and safety contract](https://github.com/dcc-mcp/dcc-mcp-openscad/blob/3550a9e00bc0574f232edc11189945e8df9645c1/src/dcc_mcp_openscad/skills/openscad-pipeline/SKILL.md)
- [Host bridge](https://github.com/dcc-mcp/dcc-mcp-openscad/blob/3550a9e00bc0574f232edc11189945e8df9645c1/src/dcc_mcp_openscad/bridge.py)
