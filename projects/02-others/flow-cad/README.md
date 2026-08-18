# Flow CAD

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

Flow CAD is a reusable project-local CAD workbench for agents and humans. A `flow` CLI creates models, review bundles and exports while repository instructions define where geometry, reports, cache state and viewer evidence belong.

## STEP-first authority is explicit

Parametric source and STEP preserve engineering intent. Derived meshes feed a local viewer, but a geometry-authority module prevents the projection from silently becoming the canonical model. Export bundles and review reports record what source produced each deliverable, and cached views can be invalidated when authority changes.

This structure makes a CAD task reviewable across sessions: another agent can inspect the same source, regenerate evidence and distinguish a stale render from the accepted model instead of relying on conversational memory.

- [Pinned repository](https://github.com/gnulnx/flow-cad/tree/bb2e28596433e458d40ff96c75f468f466cc5a16)
- [Project skill](https://github.com/gnulnx/flow-cad/blob/bb2e28596433e458d40ff96c75f468f466cc5a16/skills/flow-cad-project/SKILL.md)
- [Geometry-authority implementation](https://github.com/gnulnx/flow-cad/blob/bb2e28596433e458d40ff96c75f468f466cc5a16/src/flow_cad/viewer/geometry_authority.py)
- [Maintainer location evidence](https://github.com/gnulnx)
