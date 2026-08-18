# OpenTopos

> Research status: **Source-level** · Lifecycle: **active research preview** · Last reviewed: **2026-08-12**

OpenTopos turns a text or image prompt into a standalone Blender Python project for a static or articulated 3D object. A design agent defines parts and world-space bounding-box contracts; part agents implement them; Blender materializes and renders the assembly; a vision judge can send failures back into the source.

## Code is the recoverable authority

`outputs/<slug>/src/` contains `design.json`, per-part builders, assembly code and joint declarations. Renders, GLB and URDF under `artifacts/` are disposable projections. `topos inspect` runs Blender headlessly, measures boxes, detects floating or overlapping parts and renders previews before handoff.

The stateless runtime permits parallel part work without shared Blender state, but procedural geometry remains strongest for relatively clean blocky forms. Work-in-progress status and model judgment prevent this from being treated as a general fidelity guarantee.

- [Pinned repository](https://github.com/gaoypeng/opentopos/tree/8c970a8f1ca2847d200cddcdfff2edb41130fbee)
- [Architecture](https://github.com/gaoypeng/opentopos/blob/8c970a8f1ca2847d200cddcdfff2edb41130fbee/docs/architecture.md)
- [Blender verifier](https://github.com/gaoypeng/opentopos/blob/8c970a8f1ca2847d200cddcdfff2edb41130fbee/topos/tools/blender_verifier/tool.py)
- [Maintainer profile: Los Angeles United States](https://github.com/gaoypeng)
