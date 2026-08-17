# RFingAdam mcp-blender

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

RFingAdam's mcp-blender is a broad native Blender control system with 218 tools spanning modeling, materials, animation, simulation, rendering, AI-generated assets and Microsoft Flight Simulator delivery.

## Render–analyze–refine is implemented as a product loop

The MCP [`server.py`](https://github.com/RFingAdam/mcp-blender/blob/4dd91799a492bbb297bd0f92a8a78d2df354702a/src/mcp_blender/server.py) sends typed commands through a socket client to the Blender add-on. Host-side handlers mutate the live scene for mesh editing, geometry nodes, materials and animation.

A self-refinement session renders multiple angles, sends viewport evidence to a local vision model and records successive scores and changes. Text/image-to-3D backends can auto-import results, but Blender's scene graph remains authoritative. This is independent from the separately maintained `blender-mcp-n8n` studio.

## Evidence

- [Pinned repository](https://github.com/RFingAdam/mcp-blender/tree/4dd91799a492bbb297bd0f92a8a78d2df354702a)
- [Host-side AI handlers](https://github.com/RFingAdam/mcp-blender/blob/4dd91799a492bbb297bd0f92a8a78d2df354702a/addon/blender_mcp_addon/handlers/ai.py)
- [Scene tools](https://github.com/RFingAdam/mcp-blender/blob/4dd91799a492bbb297bd0f92a8a78d2df354702a/src/mcp_blender/tools/scene.py)
