# Reicon

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

Reicon is a governed icon system distributed across web frameworks, Flutter, Figma, VS Code and MCP. Its agent surface can search the canonical catalog, preview a result, generate framework code and apply a selected icon rather than asking a model to redraw it.

## One icon identity is materialized into many hosts

`data/icon-data.json` is the catalog authority. An index builder and search core resolve names and categories; MCP tools expose search, view and apply operations, while code generation chooses the target framework representation. The Figma plugin and framework packages consume the same identities.

This is system governance at asset scale: the agent selects an approved object and materializes it into the host. A preview image is evidence for selection, not a replacement authority, and generated code can be traced back to the catalog entry.

## Evidence

- [Pinned repository](https://github.com/dqev/reicon/tree/218678f5116ec6956143def57808de2258e19655)
- [Canonical icon data](https://github.com/dqev/reicon/blob/218678f5116ec6956143def57808de2258e19655/data/icon-data.json)
- [MCP search tool](https://github.com/dqev/reicon/blob/218678f5116ec6956143def57808de2258e19655/packages/reicon-mcp/src/server/tools/search-icons.ts)
- [Framework code generator](https://github.com/dqev/reicon/blob/218678f5116ec6956143def57808de2258e19655/packages/reicon-mcp/src/core/codegen.ts)
