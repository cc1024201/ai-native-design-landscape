# Image to SVG

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

Image to SVG is a cross-agent skill for reconstructing raster icons, logos, glyphs and wordmarks as clean editable vectors. It treats the supplied raster as visual evidence and explicitly rejects wrapping that bitmap inside an SVG container.

## Measurement precedes vector construction

The workflow separates the background, measures silhouette and color structure, constructs a small set of vector paths, then renders the SVG back to pixels. Difference overlays and binary-IoU reports expose where source and reconstruction diverge. The agent iterates on vector geometry rather than painting over the preview.

The SVG is the working authority. Source images, rendered PNGs and overlays remain comparison artifacts. `svg_audit.py` rejects embedded rasters and external references, while browser rendering tests the actual artifact under a real renderer.

## Evidence boundary

The included examples show high measured similarity on specific assets, not a general accuracy guarantee. Textured photography and ambiguous transparency can exceed the compact-vector boundary and require explicit simplification or a different tool.

- [Pinned Image to SVG revision](https://github.com/zyipeng/image-to-svg/tree/a0895312a0f23e97433e90fefee31f7f9dad1d22)
- [Agent workflow](https://github.com/zyipeng/image-to-svg/blob/a0895312a0f23e97433e90fefee31f7f9dad1d22/SKILL.md)
- [SVG structural audit](https://github.com/zyipeng/image-to-svg/blob/a0895312a0f23e97433e90fefee31f7f9dad1d22/scripts/svg_audit.py)
- [QA metrics contract](https://github.com/zyipeng/image-to-svg/blob/a0895312a0f23e97433e90fefee31f7f9dad1d22/references/qa-metrics.md)
