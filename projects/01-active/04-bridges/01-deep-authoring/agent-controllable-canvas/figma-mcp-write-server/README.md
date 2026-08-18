# Figma MCP Write Server

> Research status: **Source-level** · Lifecycle: **active-transition** · Last reviewed: **2026-08-12**

Figma MCP Write Server is a pre-release general-purpose bridge from MCP clients to the native Figma Plugin API. Its design contribution is breadth: twenty-four typed operation families cover basic nodes through components, variables, vectors, annotations, measurements and export.

## Typed handlers meet a plugin operation router

[`mcp-server.ts`](https://github.com/oO/figma-mcp-write-server/blob/299e1d83b23ebc77ec488d5a9b367141ea929768/src/mcp-server.ts) registers the agent-facing tools. Handler modules validate and normalize parameters, then a WebSocket relay sends operations to [`operation-router.ts`](https://github.com/oO/figma-mcp-write-server/blob/299e1d83b23ebc77ec488d5a9b367141ea929768/figma-plugin/src/operation-router.ts). The router dispatches against the open Figma document and returns structured results.

```text
MCP tool call -> typed server handler -> WebSocket
-> plugin operation router -> native Figma graph
-> structured response/export -> next agent action
```

Dedicated helpers handle font loading, variable binding, smart positioning, bulk operations and paint conversion. Functional tests use a mock plugin, while unit tests cover individual handler contracts. These are strong source facts but do not prove production-scale reliability; the README itself marks the package pre-release. Figma provides persistence, collaboration and version history.

The project is MIT-licensed. No reliable maintainer-region evidence was found.

## Evidence

- [Pinned repository](https://github.com/oO/figma-mcp-write-server/tree/299e1d83b23ebc77ec488d5a9b367141ea929768)
- [Component handler](https://github.com/oO/figma-mcp-write-server/blob/299e1d83b23ebc77ec488d5a9b367141ea929768/src/handlers/components-handler.ts)
- [Variable binding validator](https://github.com/oO/figma-mcp-write-server/blob/299e1d83b23ebc77ec488d5a9b367141ea929768/figma-plugin/src/utils/variable-binding-validator.ts)
- [MIT license](https://github.com/oO/figma-mcp-write-server/blob/299e1d83b23ebc77ec488d5a9b367141ea929768/LICENSE)
