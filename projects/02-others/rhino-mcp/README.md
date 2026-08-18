# RhinoMCP

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

RhinoMCP connects an external agent to a running Rhino document for prompt-assisted NURBS and scene work. It can create and modify objects, operate layers and selection, inspect scene metadata, capture the viewport and execute Rhino Python.

## A socket bridge preserves Rhino as the geometric authority

[`rhino_script.py`](https://github.com/reer-ide/rhino_mcp/blob/d0d5e66a73af177c3dbff7aaffdbf8d79667124f/rhino_script.py) runs inside Rhino and serializes host operations. [`server.py`](https://github.com/reer-ide/rhino_mcp/blob/d0d5e66a73af177c3dbff7aaffdbf8d79667124f/rhino_mcp/server.py) exposes the MCP surface, with host-specific tools in [`rhino_tools.py`](https://github.com/reer-ide/rhino_mcp/blob/d0d5e66a73af177c3dbff7aaffdbf8d79667124f/rhino_mcp/rhino_tools.py).

Rhino's native document, layer model and geometry kernel remain authoritative. Screenshots provide correction evidence; the advertised Grasshopper path stays excluded from current capability claims because the maintainer labels it under development.

## Evidence

- [Pinned repository](https://github.com/reer-ide/rhino_mcp/tree/d0d5e66a73af177c3dbff7aaffdbf8d79667124f)
- [Install and lifecycle contract](https://github.com/reer-ide/rhino_mcp/blob/d0d5e66a73af177c3dbff7aaffdbf8d79667124f/README.md)
