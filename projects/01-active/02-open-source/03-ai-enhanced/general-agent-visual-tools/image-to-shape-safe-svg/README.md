# Image to Shape-Safe SVG

> Research status: **Source-level** · Lifecycle: **active-transition** · Last reviewed: **2026-08-12**

Image to Shape-Safe SVG rebuilds slide-like images and diagrams as SVGs deliberately constrained for later PowerPoint shape conversion. The project now routes native-PPTX requests to a successor skill, but remains the explicit SVG workflow.

## Office conversion changes the SVG contract

The skill authors independent text nodes, paths, lines, polygons and simple shapes. It avoids embedded screenshots, `foreignObject`, transforms, marker arrows and unresolved icon placeholders because those constructs often fail or become hard to edit after Office conversion. A fixed text-box policy keeps semantic paragraphs together rather than fragmenting every visual line.

The standalone SVG is authoritative for this product. A validator checks shape-safe constraints before delivery; ZIP and multi-page packaging require user approval. This is structural reconstruction, not bitmap tracing.

## Transition boundary

The repository is deprecated only for the native-PPTX goal. Its README still directs explicit SVG work here, while `image-to-pptx` builds PowerPoint objects directly. The two outputs cannot be treated as losslessly interchangeable.

- [Pinned shape-safe SVG revision](https://github.com/perpetualhui/image-to-shape-safe-svg/tree/61df8e31a35747cc689ea4cc0349ed4df9c1e3c5)
- [Shape-safe reconstruction contract](https://github.com/perpetualhui/image-to-shape-safe-svg/blob/61df8e31a35747cc689ea4cc0349ed4df9c1e3c5/SKILL.md)
- [SVG validator](https://github.com/perpetualhui/image-to-shape-safe-svg/blob/61df8e31a35747cc689ea4cc0349ed4df9c1e3c5/tools/validate_shape_safe_svg.py)
- [Current transition notice](https://github.com/perpetualhui/image-to-shape-safe-svg/blob/61df8e31a35747cc689ea4cc0349ed4df9c1e3c5/README.md)
