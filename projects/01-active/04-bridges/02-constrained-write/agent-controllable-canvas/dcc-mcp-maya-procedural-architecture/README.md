# DCC-MCP Maya Procedural Architecture

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

This domain Skill generates residential exterior concepts in Maya with Bifrost and Arnold. It owns house-specific procedural logic that the generic Maya adapter deliberately does not: six architectural styles, realistic or stylized looks, seeded variation, material roles and a staged review orbit.

## Seeded variation remains editable Maya structure

[`generate_realistic_house.py`](https://github.com/dcc-mcp/dcc-mcp-maya-procedural-architecture/blob/8b5344d6c87df45ba9367454eebb2ac14626cee4/skill/maya-procedural-architecture/scripts/generate_realistic_house.py) produces material-separated Bifrost structural graphs and instanced finish details. Generation is capped at 420 planned parts; prototypes are reused by role and partial nodes are removed after errors or cancellation.

The user can select craftsman, farmhouse, cottage, Tudor, coastal or modern-farmhouse and keep a deterministic seed. PBR source descriptors preserve license and attribution; Arnold lights, HDR environment and camera orbit provide a shared comparison projection. The `.ma` scene and Bifrost graph remain the artifact authority.

## Evidence

- [Pinned domain package](https://github.com/dcc-mcp/dcc-mcp-maya-procedural-architecture/tree/8b5344d6c87df45ba9367454eebb2ac14626cee4)
- [Skill constraints and inputs](https://github.com/dcc-mcp/dcc-mcp-maya-procedural-architecture/blob/8b5344d6c87df45ba9367454eebb2ac14626cee4/skill/maya-procedural-architecture/SKILL.md)
- [Interactive generator UI](https://github.com/dcc-mcp/dcc-mcp-maya-procedural-architecture/blob/8b5344d6c87df45ba9367454eebb2ac14626cee4/skill/maya-procedural-architecture/scripts/show_house_generator.py)
