# MCP-Link for Autodesk Fusion

MCP-Link answers "what is design" by deferring entirely to Autodesk Fusion: the design is the live parametric document a user has open, and the add-in's job is not to re-derive a model but to let an external agent drive the native CAD session itself. Its distinctive move is discovery over enumeration — instead of wrapping every CAD action as a fixed tool, it lets the agent find more capability at runtime.

## One execution tool is the whole control surface

[`mcp_main.py`](https://github.com/AuraFriday/Fusion-360-MCP-Server/blob/515e9010c2c41b2caf6faafd4ec6721270436691/mcp_main.py) and [`mcp_integration.py`](https://github.com/AuraFriday/Fusion-360-MCP-Server/blob/515e9010c2c41b2caf6faafd4ec6721270436691/mcp_integration.py) connect the add-in to MCP-Link. Documentation operations expose class/member signatures and online samples; the execution operation can create constrained sketches, extrusions and arbitrary Fusion API sequences — the agent inspects, then runs Python, rather than waiting for a hand-built tool per command.

```text
agent -> inspect API/add-ins/docs -> Python operation
-> MCP-Link relay -> Fusion add-in -> native parametric document
-> host geometry/properties -> next operation or user review
```

Fusion retains the design graph, dependencies, save files and undo history; the bridge defines no separate CAD format. Arbitrary execution is a capability/risk trade that the documented transaction patterns and best-practices guide manage as part of the mechanism, not optional prose. The repository is source-available under a proprietary all-rights-reserved license, and the organization reports Queensland's Sunshine Coast, Australia — see the [pinned repository](https://github.com/AuraFriday/Fusion-360-MCP-Server/tree/515e9010c2c41b2caf6faafd4ec6721270436691), its [MCP bridge](https://github.com/AuraFriday/Fusion-360-MCP-Server/blob/515e9010c2c41b2caf6faafd4ec6721270436691/lib/mcp_bridge.py), [generic API design](https://github.com/AuraFriday/Fusion-360-MCP-Server/blob/515e9010c2c41b2caf6faafd4ec6721270436691/docs/GENERIC_API_DESIGN.md), [best practices](https://github.com/AuraFriday/Fusion-360-MCP-Server/blob/515e9010c2c41b2caf6faafd4ec6721270436691/best_practices.md) and [license](https://github.com/AuraFriday/Fusion-360-MCP-Server/blob/515e9010c2c41b2caf6faafd4ec6721270436691/LICENSE).
