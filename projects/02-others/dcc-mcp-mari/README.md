# DCC-MCP Mari

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

DCC-MCP Mari is a production-oriented host adapter for texture and look-development projects. A small standard-library plugin stays on Mari's GUI thread while an external Python sidecar owns networking, discovery and jobs.

## Host thread and production graph are both explicit

A Qt timer executes bounded Mari API commands so mutations do not race the host UI. The capability surface follows Mari's own project structure: project lifecycle, geometry and channels, node graph and layers, then shaders, images and texture export. [`create_node.py`](https://github.com/dcc-mcp/dcc-mcp-mari/blob/84819b7b8fd6687c719d4bf6f751496939f1c29b/src/dcc_mcp_mari/skills/mari-nodegraph/scripts/create_node.py) and [`create_layer.py`](https://github.com/dcc-mcp/dcc-mcp-mari/blob/84819b7b8fd6687c719d4bf6f751496939f1c29b/src/dcc_mcp_mari/skills/mari-nodegraph/scripts/create_layer.py) operate the native graph rather than generating an external approximation.

All mutations require a live Mari process. Absolute file inputs and existing output parents are required, and destructive tools are annotated for the client. The saved Mari project is authoritative; exported textures are delivery products derived from it.

## Evidence

- [Pinned adapter](https://github.com/dcc-mcp/dcc-mcp-mari/tree/84819b7b8fd6687c719d4bf6f751496939f1c29b)
- [Host dispatcher](https://github.com/dcc-mcp/dcc-mcp-mari/blob/84819b7b8fd6687c719d4bf6f751496939f1c29b/src/dcc_mcp_mari/dispatcher.py)
- [Look-development Skill](https://github.com/dcc-mcp/dcc-mcp-mari/blob/84819b7b8fd6687c719d4bf6f751496939f1c29b/src/dcc_mcp_mari/skills/mari-lookdev/SKILL.md)
