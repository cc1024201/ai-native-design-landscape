# Clean Vector Reconstruction

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

Clean Vector Reconstruction targets Illustrator-ready semantic SVG, not automatic vector tracing. It rebuilds flat and semi-flat images as a small set of meaningful objects, then uses the raster only to find where authored geometry still diverges.

## Structure is deliberately ranked above pixel similarity

The workflow locks a geometry skeleton, semantic object structure and local fidelity in that order. It supports geometric-flat and clean-flat routes, then audits SVG integrity, required object families, authored landmarks and relationships. A fixed boundary comparison reports bidirectional distance and tolerance-based precision/recall by region.

Correction is bounded: the agent may repair the largest mismatch regions but cannot add dense trace fragments, remove valid detail or tune thresholds per candidate merely to improve a score. The semantic SVG remains the editable authority; boundary maps are diagnostic projections.

“Illustrator-ready” means no major object needs rebuilding, not that the output is pixel-identical. Local anchor, Bézier, fill or gradient adjustment may still be expected.

- [Pinned repository](https://github.com/lixin-design/clean-vector-reconstruction/tree/f8cb6d694d2cb4db457c7c940526f8383e5f311b)
- [Agent skill](https://github.com/lixin-design/clean-vector-reconstruction/blob/f8cb6d694d2cb4db457c7c940526f8383e5f311b/skill/clean-vector-reconstruction/SKILL.md)
- [Documented limitations](https://github.com/lixin-design/clean-vector-reconstruction/blob/f8cb6d694d2cb4db457c7c940526f8383e5f311b/docs/limitations.md)
- [Maintainer profile checked; no location published](https://github.com/lixin-design)
