# figma-ui-mcp

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

figma-ui-mcp lets a coding agent read and draw directly in an open Figma Desktop document without a Figma REST API key. Its defining authority is the native Figma node graph; the MCP server is a transport and operation layer around that graph.

## One localhost bridge can address several Figma tabs

The Figma plugin maintains a localhost long-poll connection to the Node bridge. Each connected file advertises a session identifier, allowing an agent to target the intended document instead of mutating whichever tab answered first. The bridge then dispatches code and structured operations back to the plugin.

The pinned MCP schema separates responsibilities:

- [`figma_read`](https://github.com/TranHoaiHung/figma-ui-mcp/blob/0ee03b7dd01ecb6e590b7bd4653c4a1e371ef170/server/tool-definitions.js) obtains selections, node trees, design properties, SVG and screenshots;
- `figma_write` runs bounded JavaScript against the plugin host to create or change editable nodes;
- documentation and rules tools supply the operation contract before writes;
- optional `sessionId` fields route work to a specific Figma file.

[`handlers-write.js`](https://github.com/TranHoaiHung/figma-ui-mcp/blob/0ee03b7dd01ecb6e590b7bd4653c4a1e371ef170/src/plugin/handlers-write.js), [`handlers-read.js`](https://github.com/TranHoaiHung/figma-ui-mcp/blob/0ee03b7dd01ecb6e590b7bd4653c4a1e371ef170/src/plugin/handlers-read.js) and the token handlers show that the result is composed of Figma objects and variables rather than a flattened image.

## Ordinary correction loop

```text
select or inspect Figma document -> agent reads graph/screenshot
-> agent writes native frames/components/styles -> designer inspects in Figma
-> direct Figma edit or another addressed agent write
```

Figma owns persistence and version history. The local bridge does not create a second project authority, so recovery and collaboration claims must be evaluated in the host document. The repository is MIT-licensed. The maintainer profile identifies Ho Chi Minh City in Vietnam.

## Source anchors

- [Pinned repository](https://github.com/TranHoaiHung/figma-ui-mcp/tree/0ee03b7dd01ecb6e590b7bd4653c4a1e371ef170)
- [Bridge server](https://github.com/TranHoaiHung/figma-ui-mcp/blob/0ee03b7dd01ecb6e590b7bd4653c4a1e371ef170/server/bridge-server.js)
- [Multi-session test](https://github.com/TranHoaiHung/figma-ui-mcp/blob/0ee03b7dd01ecb6e590b7bd4653c4a1e371ef170/scripts/test-multi-session.mjs)
- [MIT license](https://github.com/TranHoaiHung/figma-ui-mcp/blob/0ee03b7dd01ecb6e590b7bd4653c4a1e371ef170/LICENSE)
