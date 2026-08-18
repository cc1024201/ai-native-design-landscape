# DCC-MCP Unity

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

DCC-MCP Unity combines a UPM Editor package, loopback WebSocket bridge and external sidecar. It treats a Unity project as a managed product graph: source, assets, scenes, compilation, Play Mode, tests, captures and builds are connected but separately verified states.

## Two mutation paths have different safety contracts

Scene operations create GameObjects and change transforms through Unity Undo before an explicit scene save. Source writes are off by default; when enabled [`upsert_text_asset.py`](https://github.com/dcc-mcp/dcc-mcp-unity/blob/bebae02babc3c82902e089370ecdfb934ea8c7be/src/dcc_mcp_unity/skills/unity-project/scripts/upsert_text_asset.py) accepts only allowlisted assets under `Assets`, uses expected SHA-256 compare-and-swap and atomically replaces content.

Compilation and Play Mode are persistent jobs. The agent must reconnect to the same request ID after assembly reload rather than treating a socket drop as success. [`capture_game_view.py`](https://github.com/dcc-mcp/dcc-mcp-unity/blob/bebae02babc3c82902e089370ecdfb934ea8c7be/src/dcc_mcp_unity/skills/unity-diagnostics/scripts/capture_game_view.py) requires an active rendered frame; tests and Windows player builds create independent acceptance artifacts.

## Evidence

- [Pinned Unity adapter](https://github.com/dcc-mcp/dcc-mcp-unity/tree/bebae02babc3c82902e089370ecdfb934ea8c7be)
- [Undo-backed scene Skill](https://github.com/dcc-mcp/dcc-mcp-unity/blob/bebae02babc3c82902e089370ecdfb934ea8c7be/src/dcc_mcp_unity/skills/unity-scene/SKILL.md)
- [Editor bridge](https://github.com/dcc-mcp/dcc-mcp-unity/blob/bebae02babc3c82902e089370ecdfb934ea8c7be/src/dcc_mcp_unity/unity_package/Editor/DccMcpBridge.cs)
- [Player build operation](https://github.com/dcc-mcp/dcc-mcp-unity/blob/bebae02babc3c82902e089370ecdfb934ea8c7be/src/dcc_mcp_unity/skills/unity-project/scripts/build_windows_player.py)
