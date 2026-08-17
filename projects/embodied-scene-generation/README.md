# Embodied Scene Generation

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

Embodied Scene Generation is an editable indoor-scene system: an agent can construct or incrementally alter a structured room, while a browser editor lets a person inspect geometry, relationships and constraints instead of accepting a flattened render.

## Scene JSON is the shared authority

[`scene.schema.json`](https://github.com/PudPawat/Embodied-Scene-Generation/blob/522e7ed24041485010e34e6ce89c090e6ad21a47/scene-generation/schemas/scene.schema.json) defines objects, transforms and semantic relations. The web-side [`document.js`](https://github.com/PudPawat/Embodied-Scene-Generation/blob/522e7ed24041485010e34e6ce89c090e6ad21a47/scene-generation/web/js/scene/document.js) owns that document, while [`constraints.js`](https://github.com/PudPawat/Embodied-Scene-Generation/blob/522e7ed24041485010e34e6ce89c090e6ad21a47/scene-generation/web/js/scene/constraints.js) resolves spatial rules and the editor history records reversible changes.

The agent pipeline assembles scenes from text and an object library; MCP scene operations then address the same structured entities for follow-up edits. This is a design loop because the generated scene remains manipulable and constraint-aware, not merely a 3D image-generation result.

## Evidence

- [Pinned repository](https://github.com/PudPawat/Embodied-Scene-Generation/tree/522e7ed24041485010e34e6ce89c090e6ad21a47)
- [Agent pipeline](https://github.com/PudPawat/Embodied-Scene-Generation/blob/522e7ed24041485010e34e6ce89c090e6ad21a47/scene-generation/agent/pipeline.py)
- [MCP scene operations](https://github.com/PudPawat/Embodied-Scene-Generation/blob/522e7ed24041485010e34e6ce89c090e6ad21a47/scene-generation/mcp/scene_ops.py)
- [Editor history](https://github.com/PudPawat/Embodied-Scene-Generation/blob/522e7ed24041485010e34e6ce89c090e6ad21a47/scene-generation/web/js/editor/history.js)
