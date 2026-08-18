# blender-mcp by vinhelysia

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

This MCP server and companion skill expose a running Blender scene to coding agents through 26 tools. The loop starts by inspecting scene state, applies a focused Python or tool-level mutation, then verifies with object measurements, screenshots or a saved render before export.

## Blender retains native authority

The bridge does not invent a parallel scene graph. Commands travel through a Python MCP process to Blender's official Lab MCP extension on TCP 9876; `.blend` state remains canonical. Headless CLI variants can inspect files without touching the open session, while GLB and image outputs are delivery projections.

The source proves transport and tool contracts. It does not establish collaboration, undo or durable agent-session semantics beyond Blender and the saved file.

- [Pinned repository](https://github.com/vinhelysia/blender-mcp/tree/a23c7fc4ca0a62ee09f3ee1f0edc0cb11191ceb2)
- [MCP server](https://github.com/vinhelysia/blender-mcp/blob/a23c7fc4ca0a62ee09f3ee1f0edc0cb11191ceb2/blender_mcp_server.py)
- [Agent workflow](https://github.com/vinhelysia/blender-mcp/blob/a23c7fc4ca0a62ee09f3ee1f0edc0cb11191ceb2/skill/blender-mcp/SKILL.md)
- [Maintainer profile: Vietnam](https://github.com/vinhelysia)
