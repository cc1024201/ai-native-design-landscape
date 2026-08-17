# DCC-MCP ZBrush

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

DCC-MCP ZBrush is a pre-alpha but operational adapter for ZBrush 2026.1+'s official Python SDK. The supported production path uses an external sidecar and a small main-thread socket plugin; it does not rely on the nonexistent HTTP server assumed by an earlier scaffold.

## Synchronous sculpt operations require busy-state recovery

Only one SDK request enters the host at a time. If a long remesh or bake times out while still running, the caller must poll bridge health instead of repeating the mutation. [`refine_active_subtool.py`](https://github.com/dcc-mcp/dcc-mcp-zbrush/blob/dc06bc6ff5041b4ad3fe9dcc5c28e5ffa5ac7a2d/src/dcc_mcp_zbrush/skills/zbrush-subtool/scripts/refine_active_subtool.py), remesh and bake tools all operate the selected native subtool.

The adapter can inspect mesh counts, select subtools, export OBJ and capture a turntable. The ZBrush Tool/SubTool graph remains authoritative; OBJ is interchange and the turntable is review evidence. A first-party case verifies a five-million-face source before export.

## Evidence

- [Pinned ZBrush adapter](https://github.com/dcc-mcp/dcc-mcp-zbrush/tree/dc06bc6ff5041b4ad3fe9dcc5c28e5ffa5ac7a2d)
- [Bridge implementation](https://github.com/dcc-mcp/dcc-mcp-zbrush/blob/dc06bc6ff5041b4ad3fe9dcc5c28e5ffa5ac7a2d/src/dcc_mcp_zbrush/bridge.py)
- [Subtool Skill](https://github.com/dcc-mcp/dcc-mcp-zbrush/blob/dc06bc6ff5041b4ad3fe9dcc5c28e5ffa5ac7a2d/src/dcc_mcp_zbrush/skills/zbrush-subtool/SKILL.md)
- [Turntable capture](https://github.com/dcc-mcp/dcc-mcp-zbrush/blob/dc06bc6ff5041b4ad3fe9dcc5c28e5ffa5ac7a2d/src/dcc_mcp_zbrush/skills/zbrush-viewport/scripts/capture_turntable.py)
