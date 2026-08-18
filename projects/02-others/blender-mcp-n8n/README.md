# Blender MCP for n8n

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

Blender MCP for n8n is a live Blender automation system with an unusually explicit visual coordination surface. It combines agent-callable modeling tools with a studio that records, edits and replays sessions against the native Blender scene graph.

## Session JSON makes an agent run inspectable and replayable

[`src/server.py`](https://github.com/seehiong/blender-mcp-n8n/blob/64e618b037b023472caefbcc91a209197b893611/src/server.py) exposes the MCP service, while the Blender add-on server executes operations inside the application. Tool history captures calls and results; community [`session.json`](https://github.com/seehiong/blender-mcp-n8n/tree/64e618b037b023472caefbcc91a209197b893611/community) files make a workflow portable and editable rather than hiding it in a chat transcript.

The visual Studio supports multi-provider assistance and record/replay over ninety-three modeled tools, including architectural operations. Blender's native scene remains authoritative; session JSON is the coordination and reproducibility layer.

The maintainer's first-party profile identifies Singapore.

## Evidence

- [Pinned repository](https://github.com/seehiong/blender-mcp-n8n/tree/64e618b037b023472caefbcc91a209197b893611)
- [Session manager](https://github.com/seehiong/blender-mcp-n8n/blob/64e618b037b023472caefbcc91a209197b893611/src/sessions.py)
- [Tool history](https://github.com/seehiong/blender-mcp-n8n/blob/64e618b037b023472caefbcc91a209197b893611/blender_mcp_addon/tools/history.py)
- [Architectural tools](https://github.com/seehiong/blender-mcp-n8n/blob/64e618b037b023472caefbcc91a209197b893611/blender_mcp_addon/tools/modeling/architectural.py)
- [Maintainer profile](https://github.com/seehiong)
