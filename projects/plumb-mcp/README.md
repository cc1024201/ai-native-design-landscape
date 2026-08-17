# Plumb

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

Plumb is an MCP-native design-engineering hub rather than a one-direction Figma exporter. It normalizes either a live Figma document or a rendered website into a Plumb Design Spec and semantic graph; agents can then inspect it, emit React, compare an implementation against it or run the direction in reverse to author native Figma nodes.

## There is no false single authority

Plumb's graph is a portable working model, but authority depends on the route:

- on Figma-to-code work, the Figma graph is the design reference and the application repository is the delivery authority;
- on web reconstruction, the captured DOM and computed styles are evidence and generated code is a new artifact;
- on prompt-to-design, [`design.ts`](https://github.com/tathagat22/plumb-mcp/blob/493ed6893db36c0953732927f199c90d79199013/src/tools/design.ts) materializes real nodes into Figma, where later edits persist.

[`store.ts`](https://github.com/tathagat22/plumb-mcp/blob/493ed6893db36c0953732927f199c90d79199013/src/bridge/store.ts) holds normalized graph state. The web source adapters and Figma plugin feed that model. [`verify.ts`](https://github.com/tathagat22/plumb-mcp/blob/493ed6893db36c0953732927f199c90d79199013/src/tools/verify.ts) compares rendered layout and visual properties; `fit` turns ranked deltas into another agent correction pass.

```text
Figma or live web -> semantic graph -> code
        ^                 |          -> render -> verify -> fix
brief -> design DSL ------+----------> native Figma nodes -> review
```

Verification is structural and perceptual evidence rather than proof of user acceptance. Cache files can recover extracted specs; native Figma and repository histories govern the two durable endpoints. The project is MIT-licensed. No reliable team-region evidence was found.

## Pinned evidence

- [Source tree](https://github.com/tathagat22/plumb-mcp/tree/493ed6893db36c0953732927f199c90d79199013)
- [Architecture](https://github.com/tathagat22/plumb-mcp/blob/493ed6893db36c0953732927f199c90d79199013/docs/architecture.md)
- [Design blueprint](https://github.com/tathagat22/plumb-mcp/blob/493ed6893db36c0953732927f199c90d79199013/docs/plumb-design-blueprint.md)
- [MIT license](https://github.com/tathagat22/plumb-mcp/blob/493ed6893db36c0953732927f199c90d79199013/LICENSE)
