# img2pptx

> Research status: **Architecture-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

img2pptx reconstructs AI-generated diagrams, scanned figures and other raster references as a modular SVG embedded in PowerPoint. Its editability claim is intentionally narrower than native DrawingML: users normally convert or ungroup the SVG in a compatible PowerPoint version.

## A semantic vector package, not a bitmap slide

The workflow produces `full.svg`, a component manifest, reusable module SVGs and QA evidence. Text, arrows, containment, ordering and color semantics are represented as structured vector elements; local raster crops are allowed only where vector reconstruction would erase visual identity.

The canonical reconstruction is the SVG graph. `final.pptx` packages it for delivery, but actual convert-to-shape behavior depends on PowerPoint, operating system and fonts. The skill separately reports whether SVG was embedded, whether its structure is conversion-ready and whether conversion was actually tested. That evidence boundary differentiates a prepared vector from a proven native Office graph.

- [Pinned repository](https://github.com/Lancelot-Xie/img2pptx/tree/49b74e86fc8fc10f9c478dedd71be552c1c176ea)
- [Agent skill](https://github.com/Lancelot-Xie/img2pptx/blob/49b74e86fc8fc10f9c478dedd71be552c1c176ea/skills/img2pptx/SKILL.md)
- [Semantic audit guidance](https://github.com/Lancelot-Xie/img2pptx/blob/49b74e86fc8fc10f9c478dedd71be552c1c176ea/skills/img2pptx/references/semantic-constraint-audit.md)
- [Maintainer location evidence](https://github.com/Lancelot-Xie)
