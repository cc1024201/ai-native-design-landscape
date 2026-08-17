# DCC-MCP TouchDesigner

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

DCC-MCP TouchDesigner embeds a server inside TouchDesigner so an agent can traverse operators, read and write parameters, load or save `.toe`/`.tox` state and capture visual output. TouchDesigner's operator network remains the canonical executable visual graph.

## Script access is a host feature, not the only product surface

The adapter does expose Python because `td` is TouchDesigner's native automation model, but it also supplies typed operations for project info, hierarchy, parameters and viewport/TOP capture. Deployments can disable `execute_python` while retaining the structured surface.

[`capture_viewport.py`](https://github.com/dcc-mcp/dcc-mcp-touchdesigner/blob/b6f7f1d97272658afc9a3391bd6eb7420d8fd9c9/src/dcc_mcp_touchdesigner/skills/touchdesigner-scripting/scripts/capture_viewport.py) creates post-mutation evidence; [`dispatcher`](https://github.com/dcc-mcp/dcc-mcp-touchdesigner/tree/b6f7f1d97272658afc9a3391bd6eb7420d8fd9c9/src/dcc_mcp_touchdesigner/dispatcher) keeps those host calls on the correct thread. Limited undo support is reported as a host boundary rather than simulated by the adapter.

## Evidence

- [Pinned adapter](https://github.com/dcc-mcp/dcc-mcp-touchdesigner/tree/b6f7f1d97272658afc9a3391bd6eb7420d8fd9c9)
- [Scripting Skill contract](https://github.com/dcc-mcp/dcc-mcp-touchdesigner/blob/b6f7f1d97272658afc9a3391bd6eb7420d8fd9c9/src/dcc_mcp_touchdesigner/skills/touchdesigner-scripting/SKILL.md)
- [Server composition](https://github.com/dcc-mcp/dcc-mcp-touchdesigner/blob/b6f7f1d97272658afc9a3391bd6eb7420d8fd9c9/src/dcc_mcp_touchdesigner/server.py)
