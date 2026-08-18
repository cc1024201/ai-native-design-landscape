# Unreal-Blender MCP

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

Unreal-Blender MCP is a unified agent bridge that can operate two native 3D authorities in one session. It incorporates the upstream Blender MCP as a submodule and adds an Unreal plugin plus a central server that routes host-specific operations.

## One control plane, two non-collapsed scene graphs

[`server.py`](https://github.com/tahooki/unreal-blender-mcp/blob/9266c70cf61cc7e8090949cbbc5df6fbb235e2b0/src/unreal_blender_mcp/server.py) coordinates the MCP surface. The extended [Blender add-on](https://github.com/tahooki/unreal-blender-mcp/blob/9266c70cf61cc7e8090949cbbc5df6fbb235e2b0/src/unreal_blender_mcp/blender_addon/extended_addon.py) listens separately from the [Unreal connection](https://github.com/tahooki/unreal-blender-mcp/blob/9266c70cf61cc7e8090949cbbc5df6fbb235e2b0/src/unreal_blender_mcp/unreal_connection.py).

Blender's `.blend` scene and Unreal's project/level graph remain distinct authorities; the bridge does not invent a merged intermediate format. Its independent product boundary is the cross-host server, extension layer and Unreal plugin absent from the upstream Blender-only project.

## Evidence

- [Pinned repository](https://github.com/tahooki/unreal-blender-mcp/tree/9266c70cf61cc7e8090949cbbc5df6fbb235e2b0)
- [Agent tool definitions](https://github.com/tahooki/unreal-blender-mcp/blob/9266c70cf61cc7e8090949cbbc5df6fbb235e2b0/src/unreal_blender_mcp/ai_tools/tool_definitions.py)
- [Unreal plugin source](https://github.com/tahooki/unreal-blender-mcp/tree/9266c70cf61cc7e8090949cbbc5df6fbb235e2b0/UEPythonServer)
