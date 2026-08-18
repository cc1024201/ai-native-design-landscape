# 3dmodel Skill

> Research status: **Architecture-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

3dmodel is a Claude Code skill for choosing and operating a 3D production route across generative base meshes, Blender, Fusion 360 and Three.js. It treats target selection as a design decision: organic one-offs, precise manufacturable parts, reusable assets and interactive explainers require different authorities and optimization work.

## Every route must close a visual feedback loop

The shared method is generate or model, render, inspect the image, critique the worst defect and correct it. Blender source and GLB own asset work, Fusion's parametric model owns precision, and Three.js source owns the interactive viewer. Screenshots and renders are evidence rather than interchangeable masters.

The repository supplies operational guidance and reusable code patterns but no independent modeling runtime or persistence service. Its evidence ceiling is therefore architecture level even though the artifact and handoff boundaries are explicit.

- [Pinned repository](https://github.com/fletcherholt/3dmodel-skill/tree/857c2415c21421558ff8b33bfd92c921e3b7af25)
- [3dmodel skill](https://github.com/fletcherholt/3dmodel-skill/blob/857c2415c21421558ff8b33bfd92c921e3b7af25/SKILL.md)
- [Blender pipeline reference](https://github.com/fletcherholt/3dmodel-skill/blob/857c2415c21421558ff8b33bfd92c921e3b7af25/references/blender-pipeline.md)
- [Maintainer profile checked; no location published](https://github.com/fletcherholt)
