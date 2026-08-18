# Massing

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

Massing is an IFC-native AEC workspace that places AI assistance inside a much larger model lifecycle. The relevant product fact is not its feature count: manual drafting, natural-language authoring, external agents, validation, construction documents and downstream operations all address one GUID-keyed IFC model.

## Server recipes protect native model identity

The browser can start a blank model, draw or drag elements and issue CAD-style commands. Natural-language authoring in [`nlauthor.py`](https://github.com/ibuilder/massing/blob/57f32b24fd95c6abf00fda84c8ee149a5ad281ce/services/data/src/aec_data/nlauthor.py) maps instructions to the same server-side recipes. [`guards.py`](https://github.com/ibuilder/massing/blob/57f32b24fd95c6abf00fda84c8ee149a5ad281ce/services/data/src/aec_data/guards.py) rejects invalid dimensions and coordinates before model mutation.

```text
manual draw/drag or natural language/MCP -> validated IFC recipe
-> GUID-stable model revision -> reconvert/reindex -> browser projection
-> IDS/clash/code/drawing QA -> BCF issues or correction
-> plans/sections/schedules/PDF/DXF/COBie and lifecycle records
```

[`mcp_tools.py`](https://github.com/ibuilder/massing/blob/57f32b24fd95c6abf00fda84c8ee149a5ad281ce/services/api/src/aec_api/mcp_tools.py) exposes authoring and analysis to external agents through the same engines. GUID stability preserves issue, clash and schedule references across edits. Draft and project version structures provide undo/recovery, while Common Data Environment states distinguish WIP, Shared, Published and Archived. IFC remains portable authority; Fragments are a viewing projection.

The scope is exceptionally broad, so this dossier relies on concrete shared-model paths rather than treating every README claim as independently validated. The project is MIT-licensed. The maintainer profile reports Phoenix, Arizona, United States.

## Commit-level evidence

- [Pinned repository](https://github.com/ibuilder/massing/tree/57f32b24fd95c6abf00fda84c8ee149a5ad281ce)
- [MCP server](https://github.com/ibuilder/massing/blob/57f32b24fd95c6abf00fda84c8ee149a5ad281ce/services/api/mcp_server.py)
- [IFC audit](https://github.com/ibuilder/massing/blob/57f32b24fd95c6abf00fda84c8ee149a5ad281ce/services/data/src/massingifc_ifc/audit.py)
- [Drawing generation](https://github.com/ibuilder/massing/blob/57f32b24fd95c6abf00fda84c8ee149a5ad281ce/services/data/src/aec_data/drawing.py)
- [Project version schema](https://github.com/ibuilder/massing/blob/57f32b24fd95c6abf00fda84c8ee149a5ad281ce/apps/web/src/vendor/massingifc/project-schema/versioning.ts)
- [MIT license](https://github.com/ibuilder/massing/blob/57f32b24fd95c6abf00fda84c8ee149a5ad281ce/LICENSE)
