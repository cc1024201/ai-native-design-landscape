# Ladislav Gazo Draw.io MCP Server

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

Ladislav Gazo's Draw.io MCP Server is an independent browser-extension bridge for reading and changing a live diagrams.net document. It predates and differs from JGraph's official Draw.io MCP product, so shared host choice does not make the two one lineage.

## Extension, compatibility layer and server share one live canvas

The monorepo separates the MCP server, browser extension, compatibility package and development proxy. The extension crosses the browser-world boundary to reach the running Draw.io editor; server tools then expose structured diagram operations to the agent. The committed architecture and tool catalog document the message route and supported mutations.

The native Draw.io graph is authoritative. The bridge does not own a shadow diagram database: agent operations are relayed into the editor, and ordinary Draw.io saving/export remains the persistence boundary.

## Evidence

- [Pinned repository](https://github.com/lgazo/drawio-mcp-server/tree/530342d2d065ee235e81bf9b0ec15d31de1883ec)
- [Architecture document](https://github.com/lgazo/drawio-mcp-server/blob/530342d2d065ee235e81bf9b0ec15d31de1883ec/ARCHITECTURE.md)
- [Tool catalog](https://github.com/lgazo/drawio-mcp-server/blob/530342d2d065ee235e81bf9b0ec15d31de1883ec/TOOLS.md)
- [Browser extension](https://github.com/lgazo/drawio-mcp-server/tree/530342d2d065ee235e81bf9b0ec15d31de1883ec/packages/drawio-mcp-extension)
