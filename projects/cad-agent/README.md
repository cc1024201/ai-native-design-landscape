# CAD Agent

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

CAD Agent is a self-contained CAD execution and rendering service intended to give external agents a fast visual feedback loop. Modeling, rendering, dimensioning, printability analysis and export all run inside one container rather than being reimplemented by the calling model.

## The container owns CAD semantics; images provide sight

HTTP and MCP commands invoke a CAD/OpenSCAD engine. VTK produces shaded and multiview renders; separate paths create orthographic views and dimensioned blueprints. The same model can be exported to STL, STEP or 3MF and checked for production constraints. An embedded viewer exposes the result without moving geometry authority into the browser.

This is more than a screenshot helper because the service owns executable modeling commands and downstream engineering exports. Conversely, the PNG is never treated as the model: it is feedback around the container's CAD representation.

## Evidence

- [Pinned repository](https://github.com/Svetlana-DAO-LLC/cad-agent/tree/5bbf716870128af0e6e1ac49fff6a315e79a417a)
- [CAD engine](https://github.com/Svetlana-DAO-LLC/cad-agent/blob/5bbf716870128af0e6e1ac49fff6a315e79a417a/src/cad_engine.py)
- [MCP interface](https://github.com/Svetlana-DAO-LLC/cad-agent/blob/5bbf716870128af0e6e1ac49fff6a315e79a417a/src/mcp_server.py)
- [VTK renderer](https://github.com/Svetlana-DAO-LLC/cad-agent/blob/5bbf716870128af0e6e1ac49fff6a315e79a417a/src/vtk_renderer.py)
