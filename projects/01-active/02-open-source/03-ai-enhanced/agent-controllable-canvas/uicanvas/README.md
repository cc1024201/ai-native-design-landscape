# UICanvas

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

UICanvas is a browser canvas that lets an MCP-connected agent create and modify UI artboards as HTML. Its key boundary is not design-to-code export: HTML/CSS is both what the agent writes and what the canvas renders.

## The browser canvas is a live HTML projection

[`lib/mcp-tools.js`](https://github.com/markvely/uicanvas/blob/ec17dd0bb889dc9868a83aa04218a66575aade64/lib/mcp-tools.js) defines the agent operations. A Node server relays them over WebSocket to [`public/js/canvas.js`](https://github.com/markvely/uicanvas/blob/ec17dd0bb889dc9868a83aa04218a66575aade64/public/js/canvas.js), where artboards are positioned and rendered. The design-spec template gives the model a reusable style brief rather than forcing every session to rediscover tokens.

```text
prompt + design spec -> MCP HTML/artboard operation
-> WebSocket -> browser canvas -> direct/history mutation
-> saved .uicanvas workspace or copied HTML
```

[`history.js`](https://github.com/markvely/uicanvas/blob/ec17dd0bb889dc9868a83aa04218a66575aade64/public/js/history.js) supplies in-session undo/redo. The example `.uicanvas` file demonstrates a portable workspace boundary, but the repository does not document a durable multi-user or version-history service. HTML remains editable and reusable, while a screenshot would only be downstream evidence.

The project is MIT-licensed. No reliable maintainer-region evidence was found.

## Pinned evidence

- [Repository](https://github.com/markvely/uicanvas/tree/ec17dd0bb889dc9868a83aa04218a66575aade64)
- [MCP tools](https://github.com/markvely/uicanvas/blob/ec17dd0bb889dc9868a83aa04218a66575aade64/lib/mcp-tools.js)
- [Design-spec template](https://github.com/markvely/uicanvas/blob/ec17dd0bb889dc9868a83aa04218a66575aade64/components/design-spec-template.js)
- [Workspace example](https://github.com/markvely/uicanvas/blob/ec17dd0bb889dc9868a83aa04218a66575aade64/UICanvas/Untitled.uicanvas)
- [MIT license](https://github.com/markvely/uicanvas/blob/ec17dd0bb889dc9868a83aa04218a66575aade64/LICENSE)
