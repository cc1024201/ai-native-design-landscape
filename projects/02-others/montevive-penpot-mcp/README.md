# Montevive Penpot MCP

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

Montevive Penpot MCP exposes a Penpot file to coding agents as a normalized object tree with screenshots and exports. It is intentionally read-only: the agent gets visual and structural grounding for implementation or review, while Penpot remains the place where the design is authored.

## A normalized tree joins visual evidence to design structure

The server fetches Penpot data, validates it against committed Penpot/tree schemas and caches the normalized result. The tree preserves object relationships that a screenshot alone loses; screenshots and asset exports preserve appearance that a tree alone cannot establish. Together they form a bounded design-to-code and verification interface.

Because there is no write tool at the reviewed revision, this record is not classified as native artifact authoring. It is a separate read-only product surface whose decisive mechanism is the tree-plus-image evidence contract.

## Evidence

- [Pinned repository](https://github.com/montevive/penpot-mcp/tree/37ec03275f0eb46035cf730a481f46255e7220d5)
- [Penpot tree tool](https://github.com/montevive/penpot-mcp/blob/37ec03275f0eb46035cf730a481f46255e7220d5/penpot_mcp/tools/penpot_tree.py)
- [Tree schema](https://github.com/montevive/penpot-mcp/blob/37ec03275f0eb46035cf730a481f46255e7220d5/penpot_mcp/resources/penpot-tree-schema.json)
- [Organization profile](https://github.com/montevive)
