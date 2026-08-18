# DCC-MCP Photoshop

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

DCC-MCP Photoshop is the Photoshop-specific typed product built over the adobepy Rust broker and UXP bridge. It makes the layered native document accessible through progressively loaded skills rather than flattening every request into generated JavaScript.

## Layers are not pixels in an anonymous output

The adapter can create/open documents, inspect the layer stack, create or delete layers, change opacity/visibility/blend mode, edit text, make selections, apply filters and work with smart objects. [`photoshop-image`](https://github.com/dcc-mcp/dcc-mcp-photoshop/blob/7e74204b9073fd79313cdbd94c2d4e89e6f04a4c/src/dcc_mcp_photoshop/skills/photoshop-image/SKILL.md) owns document creation, resize, save and export; layer and selection Skills preserve the editable PSD graph before delivery.

The Python sidecar never becomes the image authority. Calls traverse the local broker to a UXP plugin and return host-observed state. Bridge watchdog behavior and session-bound references force reinspection after disconnects.

## Evidence

- [Pinned Photoshop adapter](https://github.com/dcc-mcp/dcc-mcp-photoshop/tree/7e74204b9073fd79313cdbd94c2d4e89e6f04a4c)
- [Layer Skill contract](https://github.com/dcc-mcp/dcc-mcp-photoshop/blob/7e74204b9073fd79313cdbd94c2d4e89e6f04a4c/src/dcc_mcp_photoshop/skills/photoshop-layers/SKILL.md)
- [Create-document implementation](https://github.com/dcc-mcp/dcc-mcp-photoshop/blob/7e74204b9073fd79313cdbd94c2d4e89e6f04a4c/src/dcc_mcp_photoshop/skills/photoshop-image/scripts/create_document.py)
- [Bridge watchdog](https://github.com/dcc-mcp/dcc-mcp-photoshop/blob/7e74204b9073fd79313cdbd94c2d4e89e6f04a4c/src/dcc_mcp_photoshop/_bridge_watchdog.py)
