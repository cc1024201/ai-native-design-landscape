# Crafter

Crafter's answer to "what is design" is deliberately asymmetric: a scientific figure is designed the moment it stops being a bitmap. Its two systems — a multi-agent figure-generation harness and CraftEditor — share one thesis, that a visually approved raster is evidence to reconstruct, not the final artifact. The editable SVG is the design; the PNG that earned approval is only proof that the reconstruction was worth attempting.

## Editable geometry is the authority, raster is the audit trail

CraftEditor's decisive mechanism is a reconstruction loop that refuses to treat valid XML as success. It segments the input (SAM3 supplies grounded regions), extracts text to restore labels, builds an SVG against a schema that records canvas and element geometry, then an iterative fixer revises the result. A referenced VLM judge scores the SVG against the original raster rather than against its own syntax. The loop only settles when the geometry is both structurally sound and visually faithful.

That boundary is the whole design claim: a visually similar PNG preserves no coordinates, no selectable text, no shapes, while an arbitrary SVG trace can be structurally useless even when it renders identically. The schema pins coordinates so the artifact can actually be edited — the property that makes a generated figure a design at all. [Editable-SVG schema](https://github.com/HaozheZhao/Crafter/blob/6398457f33179a45ff581f7d73efdcf92be2cd82/crafter/editor/raster_to_svg/schema.py)

## Generation and editing never conflate their proof

The harness generates candidates from diverse inputs; CraftEditor mutates either those candidates or an independently supplied image. Keeping the loops separate stops a generation score from being mistaken for editability — a good-looking render does not imply a good-looking reconstruction. Judge and fixer are wired so the editor can be evaluated against human-drawn targets, not only against its own output. [Generation-to-editing pipeline](https://github.com/HaozheZhao/Crafter/blob/6398457f33179a45ff581f7d73efdcf92be2cd82/crafter/editor/pipeline.py) · [Reconstruction judge](https://github.com/HaozheZhao/Crafter/blob/6398457f33179a45ff581f7d73efdcf92be2cd82/crafter/editor/raster_to_svg/agents/judge.py)

The repository exposes orchestration, schemas, prompts and conversion code, so the mutation and judging protocol is pinned. External model endpoints and SAM3 grounding remain runtime dependencies, which means the source proves the loop's shape and gate rather than a fully offline execution guarantee. [Pinned Crafter revision](https://github.com/HaozheZhao/Crafter/tree/6398457f33179a45ff581f7d73efdcf92be2cd82)
