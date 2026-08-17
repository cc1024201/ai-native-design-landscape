# FigEdit

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

FigEdit reconstructs screenshots, paper figures, diagrams, posters and AI-generated images into an editable visual package. It distinguishes semantic text, formulas, geometric primitives and irreducibly raster assets instead of forcing every pixel through one vectorization method.

## Manifest-centered reconstruction

OCR and geometric detection produce measurements for the agent. The agent classifies regions, rebuilds panels, arrows and grids as SVG primitives, restores text as selectable text, represents formulas as semantic objects and keeps photographs or complex icons as replaceable cropped assets. A manifest joins those parts into final SVG and native PowerPoint delivery.

Each example package preserves the source, manifest, editable SVG, embedded-asset SVG, PPTX, preview, editability report and quality report. The manifest and editable sources carry the reconstruction authority; the preview and diff diagnostics are evidence.

## Honest hybrid boundary

FigEdit does not claim that every region becomes vector geometry. Raster exceptions are explicit so a visually rich image can remain faithful without pretending to be editable. Native PowerPoint math and text provide a different edit boundary from an SVG embedded as one object.

- [Pinned FigEdit revision](https://github.com/giszzt/figedit/tree/0a4289dcb171830dc12456393ff88eb66bc919b5)
- [Reconstruction skill](https://github.com/giszzt/figedit/blob/0a4289dcb171830dc12456393ff88eb66bc919b5/SKILL.md)
- [Example manifest](https://github.com/giszzt/figedit/blob/0a4289dcb171830dc12456393ff88eb66bc919b5/assets/examples/genai-history/manifest.json)
- [Example quality report](https://github.com/giszzt/figedit/blob/0a4289dcb171830dc12456393ff88eb66bc919b5/assets/examples/genai-history/quality_report.md)
