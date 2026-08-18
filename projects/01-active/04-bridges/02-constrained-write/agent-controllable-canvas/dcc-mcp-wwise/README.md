# DCC-MCP Wwise

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

DCC-MCP Wwise connects to the official loopback WAAPI endpoint and binds its service identity to one concrete Wwise Authoring process. It treats interactive audio as a native graph of objects, events, containers, switches, states, RTPC curves, SoundBanks and Work Units.

## Audible preview is a design check, not persistence

Audio Skills import SFX and music segments, build Random/Sequence or Switch containers, create events and set properties/references. [`configure_rtpc_curve.py`](https://github.com/dcc-mcp/dcc-mcp-wwise/blob/ac2b61078b84f088f2ee011c7ce93771c2cae1f9/src/dcc_mcp_wwise/skills/wwise-audio/scripts/configure_rtpc_curve.py) authors interactive behavior; [`preview_object.py`](https://github.com/dcc-mcp/dcc-mcp-wwise/blob/ac2b61078b84f088f2ee011c7ce93771c2cae1f9/src/dcc_mcp_wwise/skills/wwise-audio/scripts/preview_object.py) provides bounded audible evidence.

Explicit project save and Work Unit source-control paths own persistence. SoundBank generation and ProjectInfo reconciliation then verify what can be handed to an engine. The adapter never exposes arbitrary scripts inside Wwise.

## Evidence

- [Pinned WAAPI adapter](https://github.com/dcc-mcp/dcc-mcp-wwise/tree/ac2b61078b84f088f2ee011c7ce93771c2cae1f9)
- [Interactive-audio Skill](https://github.com/dcc-mcp/dcc-mcp-wwise/blob/ac2b61078b84f088f2ee011c7ce93771c2cae1f9/src/dcc_mcp_wwise/skills/wwise-audio/SKILL.md)
- [SoundBank delivery](https://github.com/dcc-mcp/dcc-mcp-wwise/blob/ac2b61078b84f088f2ee011c7ce93771c2cae1f9/src/dcc_mcp_wwise/skills/wwise-project/scripts/generate_soundbank.py)
- [Work Unit files](https://github.com/dcc-mcp/dcc-mcp-wwise/blob/ac2b61078b84f088f2ee011c7ce93771c2cae1f9/src/dcc_mcp_wwise/skills/wwise-project/scripts/source_control_files.py)
