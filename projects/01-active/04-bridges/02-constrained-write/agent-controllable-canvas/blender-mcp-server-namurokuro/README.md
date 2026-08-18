# Blender MCP Server by namurokuro

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

Blender MCP Server by namurokuro is a single-file host add-on that exposes modeling, materials, animation, physics, render and interchange operations to orchestrating agents such as PolyMCP.

## The add-on owns safe access, not creative state

[`blender_mcp.py`](https://github.com/namurokuro/Blender-MCP-Server/blob/1e79e663c15f7201677cd85512b47bfbbf86f251/blender_mcp.py) embeds the HTTP service, operation queue and monitoring panel inside Blender. [`blender_polymcp.py`](https://github.com/namurokuro/Blender-MCP-Server/blob/1e79e663c15f7201677cd85512b47bfbbf86f251/blender_polymcp.py) demonstrates agent orchestration without making that client the artifact authority.

The running Blender scene and saved `.blend` file remain canonical. Thread-safe queuing is decisive because agent concurrency must resolve into Blender's main-thread mutation model.

## Evidence

- [Pinned repository](https://github.com/namurokuro/Blender-MCP-Server/tree/1e79e663c15f7201677cd85512b47bfbbf86f251)
- [Install and tool contract](https://github.com/namurokuro/Blender-MCP-Server/blob/1e79e663c15f7201677cd85512b47bfbbf86f251/README.md)
