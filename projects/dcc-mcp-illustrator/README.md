# DCC-MCP Illustrator

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

DCC-MCP Illustrator is the Illustrator-specific product layer above adobepy's broker and CEP bridge. It exposes vector document semantics as progressively loaded Skills and requires the bridge to advertise a complete typed official-DOM contract before reporting ready.

## Vector identity is session-scoped

Document tools inspect artboards, layers, selections, placed/raster items, text, stories and swatches. Artwork tools can update text and path points and apply translation, scale or rotation. Opaque DOM references are valid only for the current bridge session, so a restarted Illustrator must be inspected again instead of accepting stale object IDs.

[`illustrator-artwork`](https://github.com/dcc-mcp/dcc-mcp-illustrator/blob/2754a8a80e4de8a192e76a7965f2a327d4c6f9f7/src/dcc_mcp_illustrator/skills/illustrator-artwork/SKILL.md) owns the edit surface. The separate export Skill saves AI, PDF or EPS and exports PNG, JPEG or SVG, preserving the difference between the native graph and delivery materializations.

## Evidence

- [Pinned adapter](https://github.com/dcc-mcp/dcc-mcp-illustrator/tree/2754a8a80e4de8a192e76a7965f2a327d4c6f9f7)
- [Document inspection](https://github.com/dcc-mcp/dcc-mcp-illustrator/blob/2754a8a80e4de8a192e76a7965f2a327d4c6f9f7/src/dcc_mcp_illustrator/skills/illustrator-document/scripts/inspect_document.py)
- [Native save and export contract](https://github.com/dcc-mcp/dcc-mcp-illustrator/blob/2754a8a80e4de8a192e76a7965f2a327d4c6f9f7/src/dcc_mcp_illustrator/skills/illustrator-export/SKILL.md)
