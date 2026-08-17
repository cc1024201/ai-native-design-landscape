# Draw.io MCP

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

Draw.io MCP is the official agent interface for creating diagrams in draw.io. It offers an inline MCP App, a browser-opening MCP tool server and coding-agent plugins that all converge on editable draw.io XML.

## Four delivery surfaces share one XML contract

[`shared/xml-reference.md`](https://github.com/jgraph/drawio-mcp/blob/14b318b19cc37b159f841227b9d11fbd18ce18ea/shared/xml-reference.md) is the single generation contract used by hosted/self-hosted MCP Apps, the local tool server, Claude/Codex/Copilot plugins and project instructions. A committed shape index gives agents exact draw.io style strings instead of guessed icon names.

The app server can render an interactive diagram inline; the tool server opens XML/CSV/Mermaid in the editor; plugins write `.drawio` files and can export PNG/SVG/PDF with embedded XML. Auto-layout and edge routing modify the editable graph. The native `.drawio` file remains authority across every surface.

The separately counted Draw.io Engineering MCP extends this official product with RF/PCB/EMC semantics rather than representing the same product release.

## Evidence

- [Pinned repository](https://github.com/jgraph/drawio-mcp/tree/14b318b19cc37b159f841227b9d11fbd18ce18ea)
- [MCP App server](https://github.com/jgraph/drawio-mcp/tree/14b318b19cc37b159f841227b9d11fbd18ce18ea/mcp-app-server)
- [MCP tool server](https://github.com/jgraph/drawio-mcp/tree/14b318b19cc37b159f841227b9d11fbd18ce18ea/mcp-tool-server)
- [Agent plugins](https://github.com/jgraph/drawio-mcp/tree/14b318b19cc37b159f841227b9d11fbd18ce18ea/plugins)
