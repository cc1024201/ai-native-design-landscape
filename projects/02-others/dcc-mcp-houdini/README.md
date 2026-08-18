# DCC-MCP Houdini

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

DCC-MCP Houdini embeds an agent-facing server in Houdini or `hython` and maps typed Skills onto the procedural node graph. It spans scene assembly, SOP/DOP/LOP/CHOP work, materials, animation, cameras, rendering and pipeline jobs without treating generated Python as the durable product.

## The node network remains inspectable authority

Agents first read bounded graph state through [`_node_graph_inspection.py`](https://github.com/dcc-mcp/dcc-mcp-houdini/blob/4afa6d35463f3a4b6d673c643e3d6c0609e60177/src/dcc_mcp_houdini/_node_graph_inspection.py). Mutations are dispatched to Houdini's host thread; atomic chain builders make a requested procedural structure visible as native nodes instead of hiding it behind one monolithic script.

Rendering and project state are separate responsibilities. [`_render_artifacts.py`](https://github.com/dcc-mcp/dcc-mcp-houdini/blob/4afa6d35463f3a4b6d673c643e3d6c0609e60177/src/dcc_mcp_houdini/_render_artifacts.py) records bounded outputs for review while `_project_tools.py` owns durable attachment and save semantics. Long jobs remain queryable rather than being inferred complete from an MCP timeout.

## Evidence

- [Pinned adapter](https://github.com/dcc-mcp/dcc-mcp-houdini/tree/4afa6d35463f3a4b6d673c643e3d6c0609e60177)
- [Atomic node-chain implementation](https://github.com/dcc-mcp/dcc-mcp-houdini/blob/4afa6d35463f3a4b6d673c643e3d6c0609e60177/src/dcc_mcp_houdini/skills/houdini-automation/scripts/build_node_chain.py)
- [Host lifecycle](https://github.com/dcc-mcp/dcc-mcp-houdini/blob/4afa6d35463f3a4b6d673c643e3d6c0609e60177/src/dcc_mcp_houdini/host.py)
