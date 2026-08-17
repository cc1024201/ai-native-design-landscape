# Draw.io Engineering MCP

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

Draw.io Engineering MCP gives an agent domain-aware creation and redlining tools inside draw.io. It generates RF block diagrams, PCB stack-ups and EMC test setups from structured engineering inputs rather than merely opening a generic diagram editor.

## Structured generators materialize editable draw.io XML

[`rf-signal-chain.js`](https://github.com/RFingAdam/drawio-engineering-mcp/blob/671e63a9946c4f8de682f561d116118b3f3af1fa/src/generators/rf-signal-chain.js) couples auto-layout with Friis gain/noise calculations. PCB and EMC generators apply material and standards data; [`markup-schematic.js`](https://github.com/RFingAdam/drawio-engineering-mcp/blob/671e63a9946c4f8de682f561d116118b3f3af1fa/src/tools/markup-schematic.js) adds revision clouds and callouts to screenshots.

The canonical artifact remains editable draw.io XML in the browser. SVG/PNG export is a projection. This product extends the official draw.io MCP but adds an independently released engineering vocabulary and symbol library.

## Evidence

- [Pinned repository](https://github.com/RFingAdam/drawio-engineering-mcp/tree/671e63a9946c4f8de682f561d116118b3f3af1fa)
- [PCB stack-up generator](https://github.com/RFingAdam/drawio-engineering-mcp/blob/671e63a9946c4f8de682f561d116118b3f3af1fa/src/generators/pcb-stackup.js)
- [Engineering symbol data](https://github.com/RFingAdam/drawio-engineering-mcp/tree/671e63a9946c4f8de682f561d116118b3f3af1fa/src/data)
