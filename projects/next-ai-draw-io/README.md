# Next AI Draw.io

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

Next AI Draw.io is a dedicated human–AI diagram editor with an embedded Draw.io surface, chat generation, multi-page editing, file import, history and a separately distributable MCP server.

## The edit gate protects a versioned XML authority

The MCP package loads existing diagrams, applies page-aware XML operations and validates the result before accepting an edit. An explicit edit gate separates proposed agent changes from committed canvas state. History records can then be restored through the product UI; end-to-end tests cover generation, history and restoration rather than only schema validity.

This gives the product two equivalent entry paths—its own chat UI and an external MCP client—but one durable authority: the versioned Draw.io document. A preview is not treated as the artifact, and invalid XML is rejected before it becomes a recoverable version.

## Evidence

- [Pinned repository](https://github.com/DayuanJiang/next-ai-draw-io/tree/96bca2b37b7c02e03e33343ace7f1af3cdf355d9)
- [MCP edit gate](https://github.com/DayuanJiang/next-ai-draw-io/blob/96bca2b37b7c02e03e33343ace7f1af3cdf355d9/packages/mcp-server/src/edit-gate.ts)
- [History implementation](https://github.com/DayuanJiang/next-ai-draw-io/blob/96bca2b37b7c02e03e33343ace7f1af3cdf355d9/packages/mcp-server/src/history.ts)
- [History restore test](https://github.com/DayuanJiang/next-ai-draw-io/blob/96bca2b37b7c02e03e33343ace7f1af3cdf355d9/tests/e2e/history-restore.spec.ts)
