# Simon Kurtz Draw.io MCP Server

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

Simon Kurtz's Draw.io MCP Server is a non-fork GitHub repository that generates Draw.io XML directly without requiring a running browser extension. It is related to the wider Draw.io MCP ecosystem but has its own diagram model, Azure icon library and transaction semantics.

## Transaction mode stages graph operations before serialization

Tool definitions map agent requests into a structured diagram model. Basic and Azure shapes use committed identifiers; batch and layer operations reduce repeated whole-document rewrites. Transactional mode stages a coherent set of edits and commits or abandons it as a unit, addressing the partial-diagram failures that arise when many independent tool calls mutate XML incrementally.

The generated `.drawio` XML is the editable handoff artifact. No live Draw.io instance is authoritative during generation; users open the resulting file in diagrams.net for direct continuation.

## Evidence

- [Pinned repository](https://github.com/simonkurtz-MSFT/drawio-mcp-server/tree/511aa073ba1133e7b00ebdd16cbc021f1ed4f105)
- [Diagram model](https://github.com/simonkurtz-MSFT/drawio-mcp-server/blob/511aa073ba1133e7b00ebdd16cbc021f1ed4f105/src/diagram_model.ts)
- [Tool definitions](https://github.com/simonkurtz-MSFT/drawio-mcp-server/blob/511aa073ba1133e7b00ebdd16cbc021f1ed4f105/src/tool_definitions.ts)
- [Transactional-mode design](https://github.com/simonkurtz-MSFT/drawio-mcp-server/blob/511aa073ba1133e7b00ebdd16cbc021f1ed4f105/docs/transactional_mode_design.md)
