# ALICE-SDF

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

ALICE-SDF is a signed-distance-field geometry runtime with an LLM-facing text-to-3D server, GPU ray-marching, constraints, mesh export and bindings for DCC, game, Web, mobile and XR hosts. Its Design surface is not a conventional mesh editor: the model composes mathematical geometry that remains evaluable across targets.

## The SDF program precedes every projection

Compiled instructions and constraints are the geometry authority. GPU renders, browser views and host bindings project the same field for inspection, while meshing and export create downstream deliverables in conventional formats. The server translates a request into scene operations but does not make one rendered frame authoritative over the underlying field.

This combination supports an agent loop from text intent through constrained implicit modeling, visual feedback and export. ALICE-SDF is counted once across its many bindings because those adapters share one geometry runtime and product lineage.

- [Pinned repository](https://github.com/ext-sakamoro/ALICE-SDF/tree/5748479f54a42bc7a682062fedd8a492f7da15be)
- [Implicit-CAD agent skill](https://github.com/ext-sakamoro/ALICE-SDF/blob/5748479f54a42bc7a682062fedd8a492f7da15be/skills/implicit-cad/SKILL.md)
- [Constraint implementation](https://github.com/ext-sakamoro/ALICE-SDF/blob/5748479f54a42bc7a682062fedd8a492f7da15be/src/constraint.rs)
- [Maintainer location evidence](https://github.com/ext-sakamoro)
