# TemPad Dev

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

TemPad Dev is a local browser-extension/MCP bridge that turns a selected Figma node into implementation-grade semantic context. Its purpose is not to write the design; it constrains design-to-code work with structure, screenshots, assets, variables and token evidence under explicit context budgets.

## A canonical intermediate representation is assembled under budget

The extension runs inside Figma's permission boundary and builds a semantic tree for the selected node. The code tool normalizes auto-layout, stacking, overflow, text, fills and vectors; it resolves variables and token candidates, exports assets and includes a screenshot. A preflight budget decides how much context can be returned instead of silently truncating critical structure.

A local browser gateway brokers sessions between the extension and MCP server. Plugin sandbox limits and permissions are documented, and the reviewed toolset is read-only with respect to the Figma document. The design graph remains authoritative; TemPad's intermediate representation grounds the repository code that an external agent writes.

## Evidence

- [Pinned repository](https://github.com/ecomfe/tempad-dev/tree/7cfcb877d673c0eb161bbac04fc87435a4ce4672)
- [Semantic tree](https://github.com/ecomfe/tempad-dev/blob/7cfcb877d673c0eb161bbac04fc87435a4ce4672/packages/extension/mcp/semantic-tree.ts)
- [Context-budget preflight](https://github.com/ecomfe/tempad-dev/blob/7cfcb877d673c0eb161bbac04fc87435a4ce4672/packages/extension/mcp/tools/code/budget-preflight.ts)
- [Design-to-code skill](https://github.com/ecomfe/tempad-dev/blob/7cfcb877d673c0eb161bbac04fc87435a4ce4672/agent-plugins/tempad-dev/skills/figma-design-to-code/SKILL.md)
