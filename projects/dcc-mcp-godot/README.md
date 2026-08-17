# DCC-MCP Godot

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

DCC-MCP Godot is a packaged EditorPlugin, debugger bridge and sidecar for agentic 2D game creation. The Godot project and native scene/resource graph remain canonical while 163 typed tools are loaded by domain as a task needs them.

## Mutation stays inside editor semantics

The adapter inspects the target project and scene immediately before using node identities. Scene, UI, animation, audio, navigation, tile and resource operations run on the editor thread and use Godot's undo manager where the host supports it. Paths are restricted to `res://`; explicit save and validation separate a changed in-memory scene from a durable result.

[`dispatcher.py`](https://github.com/dcc-mcp/dcc-mcp-godot/blob/b377c79f9dfa30f72bfdad3f43c1a6b41396ca84/src/dcc_mcp_godot/dispatcher.py) is the main-thread boundary. The [export Skill](https://github.com/dcc-mcp/dcc-mcp-godot/blob/b377c79f9dfa30f72bfdad3f43c1a6b41396ca84/src/dcc_mcp_godot/skills/godot-export/SKILL.md) then advances saved project state toward delivery; live runtime and QA tools provide a separate acceptance projection.

## Evidence

- [Pinned adapter](https://github.com/dcc-mcp/dcc-mcp-godot/tree/b377c79f9dfa30f72bfdad3f43c1a6b41396ca84)
- [Node-authoring Skill](https://github.com/dcc-mcp/dcc-mcp-godot/blob/b377c79f9dfa30f72bfdad3f43c1a6b41396ca84/src/dcc_mcp_godot/skills/godot-node/SKILL.md)
- [Server capability surface](https://github.com/dcc-mcp/dcc-mcp-godot/blob/b377c79f9dfa30f72bfdad3f43c1a6b41396ca84/src/dcc_mcp_godot/server.py)
