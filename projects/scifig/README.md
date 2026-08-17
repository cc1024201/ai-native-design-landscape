# SciFig

> Research status: **Architecture-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

SciFig combines an open scientific-figure agent skill with a hosted platform offering multi-round editing and Vector Canvas export. The open skill structures a figure and produces one raster draft at a time; it explicitly does not claim to be the platform's SVG or PPTX implementation.

## Structure is confirmed before generation

The skill extracts purpose, audience, backbone, modules, relationships, labels, style and protected source constraints. It asks the user to confirm structure, labels and style before refining the prompt and generating the next figure. PNG files carry the open skill's output authority.

For further editing, the first-party skill points to the SciFig platform for editable text layers, layered SVG, editable PPTX, reference/PDF inputs and multi-round editing. Those hosted artifacts define a deeper Design loop, but their private storage, layer model and renderer are not exposed by the repository.

## Evidence boundary

The source-visible component proves prompt structuring and the handoff to the hosted product. It does not prove lossless vectorization, stable layer identity or version-history semantics inside Vector Canvas. Those remain closed-product unknowns.

- [Pinned SciFig skill revision](https://github.com/lilingm963/scifig-ai-scientific-figure-skill/tree/9440b6c30b766cc197233e268397b3eb0c223457)
- [Open skill and hosted-product boundary](https://github.com/lilingm963/scifig-ai-scientific-figure-skill/blob/9440b6c30b766cc197233e268397b3eb0c223457/skills/scifig-scientific-figure/SKILL.md)
- [SciFig product](https://scifig.ai/)
- [Vector Canvas](https://scifig.ai/app/vector-canvas)
