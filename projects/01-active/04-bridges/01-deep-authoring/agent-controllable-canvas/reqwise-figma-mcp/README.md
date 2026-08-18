# Reqwise Figma MCP

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

Reqwise Figma MCP moves layout safety and design-system discipline beneath the prompting layer. An agent executes JavaScript against a constrained `figma.*` proxy; the server and plugin validate operations, expose structured inspection and keep multiple open plugin windows from competing for commands.

## A proxy is the policy boundary

[`tools.ts`](https://github.com/hoangpm96/reqwise-figma-mcp/blob/c6b75b9fc1aa315bc75633bd70b6c9b297d04ce4/src/server/tools.ts) defines the MCP surface. Commands pass through validation and an executor to the active plugin session. On the Figma side, serialization and tree-walk utilities return compact design evidence, while layout math, paint and token helpers guard writes.

```text
agent JavaScript -> MCP validation -> elected plugin session
-> guarded Figma proxy -> native nodes/variables/styles
-> structured audit + screenshot evidence -> correction
```

Leader election and session files matter because Figma can open the plugin in more than one window; one target must own mutation. Design-system utilities normalize token names and prevent several common hard-coded or overlay mistakes. Figma remains the native persistence and version authority.

The project is MIT-licensed. The maintainer profile contains a URL in its location field, so region remains unknown.

## Commit-level sources

- [Pinned repository](https://github.com/hoangpm96/reqwise-figma-mcp/tree/c6b75b9fc1aa315bc75633bd70b6c9b297d04ce4)
- [Command executor](https://github.com/hoangpm96/reqwise-figma-mcp/blob/c6b75b9fc1aa315bc75633bd70b6c9b297d04ce4/src/server/executor.ts)
- [Plugin serializer](https://github.com/hoangpm96/reqwise-figma-mcp/blob/c6b75b9fc1aa315bc75633bd70b6c9b297d04ce4/src/plugin/serialize.ts)
- [Design-system utilities](https://github.com/hoangpm96/reqwise-figma-mcp/blob/c6b75b9fc1aa315bc75633bd70b6c9b297d04ce4/src/shared/design-system.ts)
- [MIT license](https://github.com/hoangpm96/reqwise-figma-mcp/blob/c6b75b9fc1aa315bc75633bd70b6c9b297d04ce4/LICENSE)
