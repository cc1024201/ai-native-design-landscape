# Mermalaid

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

Mermalaid combines a Mermaid source editor, visual feedback, AI syntax assistance, and an MCP server that can address the diagram currently open in the application.

## The open editor is an addressable runtime

Its MCP surface can get the current source, set revised source, and request a render. This creates a live relay between an external agent and the user's visible editing session. The agent is not forced to produce a detached Markdown snippet that the user must manually copy.

## Source remains portable

Mermaid text is still the authority. Preview, visual controls, and exported images are projections. Local storage and file operations preserve work, while ordinary source export prevents the project from becoming the only place where a diagram can be maintained.

## Repair is bounded by review

AI syntax fixes can move malformed Mermaid back to a renderable state, but the user can see and edit the actual source. The MCP setter is a powerful mutation edge; it does not expose evidence of multi-user conflict control or semantic validation of the depicted system.

## Pinned evidence

- Repository: [highvoltag3/mermalaid](https://github.com/highvoltag3/mermalaid)
- Inspected source tree: [`d113b012e649ac2ebf48c0f8b1974f3dd9727b1e`](https://github.com/highvoltag3/mermalaid/tree/d113b012e649ac2ebf48c0f8b1974f3dd9727b1e)
- Immutable revision: [commit `d113b01`](https://github.com/highvoltag3/mermalaid/commit/d113b012e649ac2ebf48c0f8b1974f3dd9727b1e)
