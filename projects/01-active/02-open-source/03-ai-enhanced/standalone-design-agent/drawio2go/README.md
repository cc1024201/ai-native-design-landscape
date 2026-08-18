# DrawIO2Go

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

DrawIO2Go is a desktop/web Draw.io editor designed around human–AI collaboration. It combines embedded chat, model configuration, selected-canvas context, multi-page editing and an MCP service with canvas-content version management.

## Selection narrows context; versions bound mutation

In the desktop build, a user can select elements on the canvas and the application serializes that subset into the conversation context. The agent can modify just the relevant page or objects rather than reissuing the whole document. The MCP surface exposes the same canvas to other applications, while the product records content versions so changes can be inspected and recovered.

The editable Draw.io graph remains the working artifact. Model messages are proposals and context; they do not replace the multi-page XML or the user's direct canvas editing.

## Evidence

- [Pinned repository](https://github.com/Menghuan1918/drawio2go/tree/00a2d5b0bf8deb7b9f37a42eb713c5a6848f15b3)
- [Diagram context](https://github.com/Menghuan1918/drawio2go/blob/00a2d5b0bf8deb7b9f37a42eb713c5a6848f15b3/contexts/diagram-context.tsx)
- [MCP types](https://github.com/Menghuan1918/drawio2go/blob/00a2d5b0bf8deb7b9f37a42eb713c5a6848f15b3/app/types/mcp.ts)
- [Product contract](https://github.com/Menghuan1918/drawio2go/blob/00a2d5b0bf8deb7b9f37a42eb713c5a6848f15b3/README.md)
