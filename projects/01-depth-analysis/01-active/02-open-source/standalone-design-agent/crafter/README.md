# Crafter

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

Crafter combines two related scientific-figure systems: a multi-agent generation harness and CraftEditor, which converts raster candidates into coordinate-faithful editable SVG. Its distinctive Design claim is that a visually approved bitmap is evidence to reconstruct, not the final artifact.

## From candidate image to editable geometry

CraftEditor separates segmentation, text extraction, SVG construction and judging. Its schema records canvas and element geometry; SAM3 supplies grounded regions; text extraction restores labels; an iterative fixer revises the SVG. A referenced VLM judge scores the reconstruction against the input rather than accepting syntactically valid XML as success.

The resulting SVG is the durable editable authority. Raster inputs and renders remain comparison evidence. This boundary matters: a visually similar PNG does not preserve selectable text, shapes or coordinates, while an arbitrary SVG trace can remain structurally useless.

## Generation and editing are separate loops

The generation harness creates scientific-figure candidates from diverse inputs. CraftEditor can operate on those candidates or on an independently supplied image. Keeping the two paths explicit prevents a generation score from being mistaken for editability and lets the editor be evaluated against human-drawn targets.

## Evidence boundary

The repository exposes orchestration, schemas, prompts and conversion code. External model endpoints and SAM3 grounding remain runtime dependencies, so the pinned source proves the mutation and judging protocol rather than a fully offline execution guarantee.

- [Pinned Crafter revision](https://github.com/HaozheZhao/Crafter/tree/6398457f33179a45ff581f7d73efdcf92be2cd82)
- [CraftEditor pipeline](https://github.com/HaozheZhao/Crafter/blob/6398457f33179a45ff581f7d73efdcf92be2cd82/crafter/editor/pipeline.py)
- [Editable-SVG schema](https://github.com/HaozheZhao/Crafter/blob/6398457f33179a45ff581f7d73efdcf92be2cd82/crafter/editor/raster_to_svg/schema.py)
- [Referenced reconstruction judge](https://github.com/HaozheZhao/Crafter/blob/6398457f33179a45ff581f7d73efdcf92be2cd82/crafter/editor/raster_to_svg/agents/judge.py)
