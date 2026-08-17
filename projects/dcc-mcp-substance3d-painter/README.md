# DCC-MCP Substance 3D Painter

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

DCC-MCP Substance 3D Painter embeds an agent adapter in Painter and routes native API work through the application's Qt thread. One project Skill covers a full material-authoring pass rather than exposing arbitrary JavaScript.

## Painter resource identity is preserved

The adapter inspects the project and texture sets, creates PBR fill or textured layers, searches Painter resources and applies a selected smart material. [`create_pbr_fill_layer.py`](https://github.com/dcc-mcp/dcc-mcp-substance3d-painter/blob/c371b025d53d18163948d7a23e074083e7860192/src/dcc_mcp_substance3d_painter/skills/painter-project/scripts/create_pbr_fill_layer.py) changes the native layer stack; [`apply_smart_material.py`](https://github.com/dcc-mcp/dcc-mcp-substance3d-painter/blob/c371b025d53d18163948d7a23e074083e7860192/src/dcc_mcp_substance3d_painter/skills/painter-project/scripts/apply_smart_material.py) uses resource URLs returned by Painter rather than guessed names.

The `.spp` project remains authoritative. Save-as and export-preset operations deliberately separate editable work from texture delivery. Camera inspection and orbit provide a review surface without becoming a second scene graph.

## Evidence

- [Pinned Painter adapter](https://github.com/dcc-mcp/dcc-mcp-substance3d-painter/tree/c371b025d53d18163948d7a23e074083e7860192)
- [Project Skill](https://github.com/dcc-mcp/dcc-mcp-substance3d-painter/blob/c371b025d53d18163948d7a23e074083e7860192/src/dcc_mcp_substance3d_painter/skills/painter-project/SKILL.md)
- [Texture export](https://github.com/dcc-mcp/dcc-mcp-substance3d-painter/blob/c371b025d53d18163948d7a23e074083e7860192/src/dcc_mcp_substance3d_painter/skills/painter-project/scripts/export_textures.py)
