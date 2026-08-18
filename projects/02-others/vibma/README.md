# Vibma

> Research status: **Source-level** · Lifecycle: **historical** · Last reviewed: **2026-08-12**

Vibma was an independent MCP-to-Figma bridge designed around design-system quality, not just raw node creation. The maintainers now state that development has stopped after Figma introduced its own agent interface and the Vibma plugin was not accepted to the marketplace.

## Typed endpoints mutate the native Figma graph

Tool definitions live as YAML schemas and compile into MCP contracts, response types and Figma-side handlers. Homogeneous resources—frames, text, components, instances, styles, variables and collections—use method-dispatched CRUD endpoints. Specialized operations cover selection, images, prototypes, lint, libraries and document inspection.

```text
agent -> generated MCP schema -> WebSocket relay -> Figma plugin handler
-> native node/component/token mutation -> lint/warnings -> host selection
-> named Figma version-history checkpoint
```

The relay checks package/plugin version compatibility and channels commands to the open plugin. After a mutation, the plugin selects and scrolls to affected nodes so a human can see the result. Lint responses warn about hard-coded colors, missing auto-layout and unbound tokens. [`version-history.ts`](https://github.com/ufira-ai/Vibma/blob/cdadc728057c04c566b1e1ee8cc9ef1b1b3fe471/packages/adapter-figma/src/handlers/version-history.ts) calls Figma's native named-version API; persistence and recovery therefore remain properties of the Figma file.

Vibma credits `cursor-talk-to-figma-mcp` as its foundation but maintains a distinct schema compiler, tool surface and lifecycle, so it is an independent historical implementation rather than another count for the upstream project. It is MIT-licensed. No reliable team-region evidence was found.

## Decisive evidence

- [Pinned repository and lifecycle notice](https://github.com/ufira-ai/Vibma/tree/cdadc728057c04c566b1e1ee8cc9ef1b1b3fe471)
- [MCP server](https://github.com/ufira-ai/Vibma/blob/cdadc728057c04c566b1e1ee8cc9ef1b1b3fe471/packages/core/src/mcp.ts)
- [Frame schema](https://github.com/ufira-ai/Vibma/blob/cdadc728057c04c566b1e1ee8cc9ef1b1b3fe471/schema/tools/frames.yaml)
- [Figma plugin dispatcher](https://github.com/ufira-ai/Vibma/blob/cdadc728057c04c566b1e1ee8cc9ef1b1b3fe471/packages/adapter-figma/src/plugin/code.ts)
- [MIT license](https://github.com/ufira-ai/Vibma/blob/cdadc728057c04c566b1e1ee8cc9ef1b1b3fe471/LICENSE)
