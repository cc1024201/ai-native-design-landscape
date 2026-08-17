# Logo Generator

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

Logo Generator is an installable agent skill that makes logo design a visible variant-selection process. Its central artifact is not a hidden generation session: it asks the calling agent to create multiple editable SVG sources, assemble them for comparison, refine a chosen direction and derive delivery assets.

## The workflow preserves alternatives before convergence

The [`SKILL.md`](https://github.com/op7418/logo-generator-skill/blob/bf4e9ac4d4428bda261afcfe981871ceb92d94e6/SKILL.md) requires at least six distinct concepts rather than superficial color swaps. Each direction is written as SVG and placed into a comparison page so the user can evaluate silhouette, typography and composition together. Selection is explicit; refinement proceeds from the chosen source instead of silently replacing all earlier proposals.

That makes the filesystem itself the candidate graph. Separate SVG files preserve discarded possibilities, and the winning SVG remains editable in ordinary vector tools.

## Derived media serve review and delivery

[`svg_to_png.py`](https://github.com/op7418/logo-generator-skill/blob/bf4e9ac4d4428bda261afcfe981871ceb92d94e6/scripts/svg_to_png.py) produces raster deliveries from the selected vector source. [`generate_showcase.py`](https://github.com/op7418/logo-generator-skill/blob/bf4e9ac4d4428bda261afcfe981871ceb92d94e6/scripts/generate_showcase.py) can use Gemini-generated imagery to place the identity into presentation mockups. Those showcases are contextual evidence and presentation material; they do not replace the SVG authority.

## Agent and persistence boundary

The skill contains design patterns, background guidance, workflow rules and conversion helpers but no embedded model runtime or project database. The selected Codex or compatible agent authors files with whatever image/model facilities the host makes available. Files and Git provide persistence and history. This is a portable production protocol rather than a standalone visual editor.

## Evidence

- [Pinned repository](https://github.com/op7418/logo-generator-skill/tree/bf4e9ac4d4428bda261afcfe981871ceb92d94e6)
- [Design-pattern reference](https://github.com/op7418/logo-generator-skill/blob/bf4e9ac4d4428bda261afcfe981871ceb92d94e6/references/design_patterns.md)
- [Showcase template](https://github.com/op7418/logo-generator-skill/blob/bf4e9ac4d4428bda261afcfe981871ceb92d94e6/assets/showcase_template.html)
