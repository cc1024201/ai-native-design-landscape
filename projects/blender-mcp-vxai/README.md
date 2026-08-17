# Blender MCP VXAI

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

Blender MCP VXAI lets an external agent create, modify, inspect, render and export objects and scenes in a running Blender instance. The user can give image references through the MCP client and continue ordinary editing in Blender after agent operations.

## A socket bridge delegates authority to Blender

The Python MCP server translates tool calls into requests for the installed Blender add-on. The add-on executes Blender Python against the live scene and returns state or rendered feedback. Export tools materialize the selected scene into project formats for downstream applications.

The `.blend` scene graph and Blender's own operators remain authoritative; the MCP conversation does not own a parallel model. Versioned server/add-on compatibility matters because both sides share the bridge protocol, and the repository explicitly tells users to pair the release components.

## Evidence

- [Pinned repository](https://github.com/VxASI/blender-mcp-vxai/tree/927a61c6c8cd41b2b8c171892403f1b7637cf6da)
- [MCP server](https://github.com/VxASI/blender-mcp-vxai/blob/927a61c6c8cd41b2b8c171892403f1b7637cf6da/blender_mcp_vxai/server.py)
- [Blender add-on](https://github.com/VxASI/blender-mcp-vxai/blob/927a61c6c8cd41b2b8c171892403f1b7637cf6da/blender_mcp_addon.py)
- [Version-pairing and workflow contract](https://github.com/VxASI/blender-mcp-vxai/blob/927a61c6c8cd41b2b8c171892403f1b7637cf6da/README.md)
