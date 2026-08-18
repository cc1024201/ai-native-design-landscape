# Onshape MCP

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

Onshape MCP gives an external agent typed access to live Onshape documents. It does not recreate CAD in a local shadow scene: document IDs, workspaces and element IDs address the established cloud model directly.

## Its tool surface follows the engineering object model

[`server.py`](https://github.com/hedless/onshape-mcp/blob/54d21ccc4a5376f692cddd01959305be01e40a53/onshape_mcp/server.py) registers tools for documents, Part Studios, sketches, constraints, features, assemblies, variables, measurements, interference analysis and export. Builder modules validate structured operations such as extrude, revolve, fillet, pattern and mates before calling the Onshape APIs.

The ordinary loop is a live engineering loop: an agent selects or creates a document, applies feature-level mutations, inspects measured state and exports the authoritative cloud result. Native Onshape history and workspace semantics remain the version boundary; the MCP server is a control adapter.

The maintainer profile reports California, United States.

## Evidence

- [Pinned repository and tool catalog](https://github.com/hedless/onshape-mcp/tree/54d21ccc4a5376f692cddd01959305be01e40a53)
- [MCP registration](https://github.com/hedless/onshape-mcp/blob/54d21ccc4a5376f692cddd01959305be01e40a53/onshape_mcp/server.py)
- [Feature builders](https://github.com/hedless/onshape-mcp/tree/54d21ccc4a5376f692cddd01959305be01e40a53/onshape_mcp/builders)
- [Maintainer location evidence](https://github.com/hedless)
