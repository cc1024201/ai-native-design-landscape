# AI Agents Talk to Figma MCP (arinspunk)

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

This project adapts and extends the earlier Cursor Talk to Figma pattern for Claude Desktop and other MCP clients. It is an independent implementation lineage: an MCP server sends typed commands through a WebSocket channel to a development plugin running inside Figma.

## Native Figma nodes remain authoritative

The ordinary loop connects an agent to a channel, opens the Figma plugin, reads the current document and invokes creation, modification, text, style, variable, component, FigJam and SVG tools. The plugin executes those operations through the Figma API. Native nodes, variables and host history therefore retain authority; the MCP server is a control plane rather than a parallel file format.

The server queues requests so multiple agents do not concurrently overwhelm the plugin. Transport success alone is insufficient: the returned Figma operation result and visible document must establish whether a mutation landed.

## Derivative identity without duplicate counting

The repository credits `cursor-talk-to-figma-mcp` as its base but adds its own packaging, tools and ongoing maintenance and is not marked as a GitHub fork. It is counted as an independent derivative, while its DXT, npm command, WebSocket relay and plugin are delivery surfaces of one project.

- [Pinned arinspunk implementation](https://github.com/arinspunk/claude-talk-to-figma-mcp/tree/c7adf243fc2967fcda3862415d3283bd239af56d)
- [Architecture and lineage declaration](https://github.com/arinspunk/claude-talk-to-figma-mcp/blob/c7adf243fc2967fcda3862415d3283bd239af56d/readme.md)
- [MCP server](https://github.com/arinspunk/claude-talk-to-figma-mcp/blob/c7adf243fc2967fcda3862415d3283bd239af56d/src/talk_to_figma_mcp/server.ts)
- [Figma plugin implementation](https://github.com/arinspunk/claude-talk-to-figma-mcp/blob/c7adf243fc2967fcda3862415d3283bd239af56d/src/claude_mcp_plugin/code.js)
