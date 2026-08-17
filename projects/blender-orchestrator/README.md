# Agentic Blender Orchestrator

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

Agentic Blender Orchestrator augments natural-language scene construction with an explicit spatial reasoning layer. The agent can query semantic relations, collisions and real-world dimensions, then inspect the scene as six-direction ASCII floor plans as well as rendered or viewport images.

## Spatial state is made cheaper than repeated vision calls

The [spatial handler](https://github.com/mlolson/blender-orchestrator/blob/a9dfb32d41709dd013b3c6ca0802bb869040656d/blender_addon/handlers/spatial.py) resolves relationships and safe moves against the live scene. [`object_dimensions.json`](https://github.com/mlolson/blender-orchestrator/blob/a9dfb32d41709dd013b3c6ca0802bb869040656d/mcp_server/data/object_dimensions.json) supplies real-scale priors, and the [scene-building guide](https://github.com/mlolson/blender-orchestrator/blob/a9dfb32d41709dd013b3c6ca0802bb869040656d/docs/SCENE_BUILDING_GUIDE.md) turns them into agent procedure. Rendering and viewport capture remain available for aesthetic correction.

Blender's scene graph is authoritative. ASCII plans and semantic summaries are compact agent projections that reduce spatial mistakes without replacing the native model.

## Evidence

- [Pinned repository](https://github.com/mlolson/blender-orchestrator/tree/a9dfb32d41709dd013b3c6ca0802bb869040656d)
- [Rendering tools](https://github.com/mlolson/blender-orchestrator/tree/a9dfb32d41709dd013b3c6ca0802bb869040656d/mcp_server/tools)
- [Maintainer profile: United States](https://github.com/mlolson)
