# Better Design

> Research status: **Architecture-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

Better Design couples a hosted MCP selection/review service with an open shadcn-compatible design-system registry. Its definition of Design is system selection before generation: an agent receives semantic tokens, actual components and review rules rather than inventing a visual language per prompt.

## Registry assets ground the hosted guidance

The MCP contract exposes design-system resolution, system documentation, UI principles and review rules. Once a system is selected, the open repository supplies installable component JSON and `globals.css` token layers. The agent writes ordinary application source, then reviews it against accessibility and visual rules.

```text
product brief -> hosted MCP resolves design system
-> open CSS tokens + component registry + principles
-> agent writes repository UI -> review rules -> source correction
```

Application source becomes runtime authority; Better Design does not maintain a bidirectional canvas. The evidence level is deliberately `architecture`: hundreds of registry artifacts are open and pinned, but the hosted MCP server implementation is not in this repository. We can verify what components contain, not how semantic matching or review is executed.

The repository is MIT-licensed. The maintainer profile reports San Francisco, United States.

## Evidence

- [Pinned repository](https://github.com/marvkr/better-design/tree/703bbcace9dd680aeddd263de363827e45108f9b)
- [Product and MCP contract](https://github.com/marvkr/better-design/blob/703bbcace9dd680aeddd263de363827e45108f9b/README.md)
- [Example token layer](https://github.com/marvkr/better-design/blob/703bbcace9dd680aeddd263de363827e45108f9b/components/vibrant-dark/globals.css)
- [Example component payload](https://github.com/marvkr/better-design/blob/703bbcace9dd680aeddd263de363827e45108f9b/registry/vibrant-dark/button.json)
- [MIT license](https://github.com/marvkr/better-design/blob/703bbcace9dd680aeddd263de363827e45108f9b/LICENSE)
