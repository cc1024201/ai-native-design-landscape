# DCC-MCP Cinema 4D

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

DCC-MCP Cinema 4D is a headless-first adapter built around Maxon's licensed `c4dpy` runtime. Unlike a live UI bridge it stages a native document in an isolated worker and only promotes the result when the whole operation succeeds.

## Atomic native-document promotion

[`create_document.py`](https://github.com/dcc-mcp/dcc-mcp-cinema4d/blob/fe9e46cb89c2030d6759e998bdc688fd626ee9c2/src/dcc_mcp_cinema4d/skills/cinema4d-session/scripts/create_document.py) establishes a C4D document; session tools then inspect and validate it. Modeling operations work on the staged copy. A successful run atomically replaces the durable `.c4d` target, so a failed mutation cannot leave a half-written authority.

The same controlled bridge can render bounded previews and export C4D, OBJ, FBX, glTF, STL, Alembic or Collada. Rendering is evidence derived from the document; exports are delivery artifacts with a distinct format boundary. This transaction-like staging is the decisive technical direction of the product.

## Evidence

- [Pinned source](https://github.com/dcc-mcp/dcc-mcp-cinema4d/tree/fe9e46cb89c2030d6759e998bdc688fd626ee9c2)
- [Host bridge](https://github.com/dcc-mcp/dcc-mcp-cinema4d/blob/fe9e46cb89c2030d6759e998bdc688fd626ee9c2/src/dcc_mcp_cinema4d/bridge.py)
- [Render operation](https://github.com/dcc-mcp/dcc-mcp-cinema4d/blob/fe9e46cb89c2030d6759e998bdc688fd626ee9c2/src/dcc_mcp_cinema4d/skills/cinema4d-modeling/scripts/render_document.py)
