# Decibel Designer

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

Decibel Designer is an MCP-backed design memory. It persists principles, decisions, progress, moodboards and visual direction so a design agent can recover why a system looks and behaves as it does across conversations.

## Files preserve rationale; Figma supplies live system facts

[`fsStore.ts`](https://github.com/decibelsystems/decibel-designer-mcp/blob/ec362708b22919a1c0be16dd706c048ba0d96c24/src/store/fsStore.ts) owns project-local structured artifacts. Agent tools upsert principles, log decisions and append notes rather than hiding context in model memory. [`figmaStore.ts`](https://github.com/decibelsystems/decibel-designer-mcp/blob/ec362708b22919a1c0be16dd706c048ba0d96c24/src/store/figmaStore.ts) reads tokens and components from a configured Figma file.

Token sync, component queries, documentation and principle-based reviews connect remembered intent to the live design system. Decibel does not replace the Figma graph; its canonical contribution is the durable rationale and governance layer.

## Evidence

- [Pinned repository](https://github.com/decibelsystems/decibel-designer-mcp/tree/ec362708b22919a1c0be16dd706c048ba0d96c24)
- [Token-sync tool](https://github.com/decibelsystems/decibel-designer-mcp/blob/ec362708b22919a1c0be16dd706c048ba0d96c24/src/tools/syncTokens.ts)
- [Decision logger](https://github.com/decibelsystems/decibel-designer-mcp/blob/ec362708b22919a1c0be16dd706c048ba0d96c24/src/tools/logDecision.ts)
