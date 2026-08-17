# DCC-MCP Maya mGear

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

DCC-MCP Maya mGear is a marketplace package for mGear Shifter rigging. It does not redistribute mGear; it translates a licensed installation and its scene guides into typed agent operations that remain inspectable in Maya.

## The guide is the reproducible design authority

The Skill first inspects the environment and available Shifter components. It can create a guide from a named template, build a rig, and export that guide as a reusable template. [`create_shifter_guide_from_template.py`](https://github.com/dcc-mcp/dcc-mcp-maya-mgear/blob/f1b0266cff26d4779584e201ef260db2bda7c04d/skill/maya-mgear/scripts/create_shifter_guide_from_template.py) establishes editable structure; [`build_shifter_rig.py`](https://github.com/dcc-mcp/dcc-mcp-maya-mgear/blob/f1b0266cff26d4779584e201ef260db2bda7c04d/skill/maya-mgear/scripts/build_shifter_rig.py) materializes controls from it.

A second bundled Skill imports mGear rigs through an AssetDescriptor contract. Both Skills share one release and dependency boundary, so they are one product rather than two census entries.

## Evidence

- [Pinned package](https://github.com/dcc-mcp/dcc-mcp-maya-mgear/tree/f1b0266cff26d4779584e201ef260db2bda7c04d)
- [Canonical mGear Skill](https://github.com/dcc-mcp/dcc-mcp-maya-mgear/blob/f1b0266cff26d4779584e201ef260db2bda7c04d/skill/maya-mgear/SKILL.md)
- [Template export](https://github.com/dcc-mcp/dcc-mcp-maya-mgear/blob/f1b0266cff26d4779584e201ef260db2bda7c04d/skill/maya-mgear/scripts/export_shifter_guide_template.py)
