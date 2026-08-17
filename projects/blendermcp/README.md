# BlenderMCP

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

BlenderMCP is the independently released upstream bridge that made a running Blender scene addressable by MCP clients. It supports scene inspection, viewport screenshots, object creation and deletion, material changes and an unrestricted Python escape hatch, with optional external asset and 3D-generation providers.

## The bridge transports intent; Blender owns the scene

The [addon](https://github.com/ahujasid/blender-mcp/blob/3ab892510cc0e5435ba5e611c01fb1021fbde8de/addon.py) runs a socket endpoint inside Blender, where commands can reach the live dependency graph and Blender Python API. The [MCP server](https://github.com/ahujasid/blender-mcp/blob/3ab892510cc0e5435ba5e611c01fb1021fbde8de/src/blender_mcp/server.py) translates client tools into that protocol and returns scene facts or rendered viewport evidence.

There is no parallel scene model in the adapter: the open Blender document is the live authority and a saved `.blend` file is its durable form. Screenshots close an inspect-correct-inspect loop, while arbitrary Python makes the surface extensible but also moves safety and save discipline to the user. Downstream forks and workflow packages are not aliases when they ship their own transport or correction contract; this record names the original released addon/server boundary.

## Evidence

- [Pinned repository](https://github.com/ahujasid/blender-mcp/tree/3ab892510cc0e5435ba5e611c01fb1021fbde8de)
- [Official product site](https://blendermcp.org/)
- [Installation and capability contract](https://github.com/ahujasid/blender-mcp/blob/3ab892510cc0e5435ba5e611c01fb1021fbde8de/README.md)
