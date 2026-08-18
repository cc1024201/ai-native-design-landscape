# MCP-Link for Autodesk Fusion

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

MCP-Link is an Autodesk Fusion add-in that gives external agents access to the live native CAD session. Its unusual scope is discovery: the agent can inspect Fusion's API and other loaded add-ins, then execute Python against the host rather than waiting for every CAD action to be wrapped as a fixed tool.

## One execution tool opens a large native surface

[`mcp_main.py`](https://github.com/AuraFriday/Fusion-360-MCP-Server/blob/515e9010c2c41b2caf6faafd4ec6721270436691/mcp_main.py) and [`mcp_integration.py`](https://github.com/AuraFriday/Fusion-360-MCP-Server/blob/515e9010c2c41b2caf6faafd4ec6721270436691/mcp_integration.py) connect the add-in to MCP-Link. Documentation operations provide class/member signatures and online samples; execution can create constrained sketches, extrusions and arbitrary Fusion API sequences.

```text
agent -> inspect API/add-ins/docs -> Python operation
-> MCP-Link relay -> Fusion add-in -> native parametric document
-> host geometry/properties -> next operation or user review
```

Fusion owns the design graph, dependencies, save files and undo history. The bridge itself does not define a separate CAD format. Arbitrary execution increases capability and risk; the documented transaction patterns and best-practices guide are therefore part of the mechanism, not optional prose.

The repository is source-available under a proprietary all-rights-reserved license, not OSI open source. The organization profile reports Queensland's Sunshine Coast, Australia.

## Evidence

- [Pinned repository](https://github.com/AuraFriday/Fusion-360-MCP-Server/tree/515e9010c2c41b2caf6faafd4ec6721270436691)
- [MCP bridge](https://github.com/AuraFriday/Fusion-360-MCP-Server/blob/515e9010c2c41b2caf6faafd4ec6721270436691/lib/mcp_bridge.py)
- [Generic API design](https://github.com/AuraFriday/Fusion-360-MCP-Server/blob/515e9010c2c41b2caf6faafd4ec6721270436691/docs/GENERIC_API_DESIGN.md)
- [Best practices](https://github.com/AuraFriday/Fusion-360-MCP-Server/blob/515e9010c2c41b2caf6faafd4ec6721270436691/best_practices.md)
- [License](https://github.com/AuraFriday/Fusion-360-MCP-Server/blob/515e9010c2c41b2caf6faafd4ec6721270436691/LICENSE)
