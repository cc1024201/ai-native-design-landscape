# Layer-First Raster to SVG

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

Layer-First Raster to SVG is an agent skill for reconstructing diagrams, screenshots and scientific figures as editable SVG. Its central technical choice is to separate measured pixel evidence from semantic interpretation and from the eventual SVG primitive selection.

## Three tracks meet in one fusion map

The geometry track extracts color layers, contours and arrow candidates. The semantic track uses OCR and visual reasoning to identify labels and object roles. The construction track decides whether an object should become a rect, path, connector, text node or reusable symbol. A fusion-map schema records how those sources correspond before the final rebuild.

This keeps two common failures visible: one-shot tracing preserves pixels but produces unusable paths, while an unconstrained model redraw invents clean but spatially wrong structure. Extracted contours are measurement evidence, not automatically the final answer.

## Editability and render review

The SVG is the durable authority. Source information, layer extracts, crops and comparison renders form an evidence trail. Element-preview gates let the agent repair arrows, panels and text without regenerating the whole figure. Re-rendering tests the constructed artifact rather than approving its XML by inspection alone.

## Evidence boundary

The skill provides extraction helpers and reconstruction contracts; OCR and semantic correctness depend on available tools and review. Exact pixel identity is not promised when replacing raster content with editable primitives.

- [Pinned Layer-First revision](https://github.com/pipi-22/research_png_to_svg/tree/156b71f67067a66c650104b5192835288c4eb3fd)
- [Layered reconstruction workflow](https://github.com/pipi-22/research_png_to_svg/blob/156b71f67067a66c650104b5192835288c4eb3fd/layer-first-raster-to-svg/SKILL.md)
- [Fusion-map schema](https://github.com/pipi-22/research_png_to_svg/blob/156b71f67067a66c650104b5192835288c4eb3fd/layer-first-raster-to-svg/references/fusion-map-schema.json)
- [SVG render helper](https://github.com/pipi-22/research_png_to_svg/blob/156b71f67067a66c650104b5192835288c4eb3fd/layer-first-raster-to-svg/scripts/render_svg.py)
