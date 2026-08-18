# spark-to-paper-skills

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

`spark-to-paper-skills` is a Claude Code plugin that turns an idea, proposal or dataset into a compiled paper with traceable citations, experiments and editable figures. Its qualifying Design mechanism is a figure pipeline that makes visual candidates subordinate to the paper's facts and a measured vector artifact.

## Candidate style is not figure authority

The current `ts-figure-svg` path asks PaperBanana to generate visual candidates, selects for scientific correctness, learns a style vocabulary, and redraws the content natively from the paper. Live SVG text and primitives become authoritative. A standard-library audit checks geometry, overflow, connector docking, type size, embedded rasters and other structural failures over repeated repair rounds.

If native redraw cannot meet the task, `ts-figure-optimize` can preserve approved graphics as raster while replacing labels with editable text; the project explicitly calls this a hybrid, not a fully vector-editable figure. If that runtime is unavailable, the honest fallback is the original PNG.

## Paper-level integrity crosses the visual loop

The orchestrator preserves LaTeX sections, BibTeX, experiment outputs, figures and logs. Proposal and data-aware modes apply different truth contracts so a polished figure cannot invent completed results. SVG, PDF and PPTX exports remain connected to their source paper and audit artifacts.

## Evidence boundary

Reported similarity scores and provider behavior are project measurements. Fonts, renderers, OCR and external generation models can change the result; human scientific review remains necessary.

- [Pinned spark-to-paper-skills revision](https://github.com/Spark-To-Paper-Skills/spark-to-paper-skills/tree/84673b288a5d5d2b43ce97cdc8fa963a6f12c0db)
- [Figure SVG workflow](https://github.com/Spark-To-Paper-Skills/spark-to-paper-skills/blob/84673b288a5d5d2b43ce97cdc8fa963a6f12c0db/skills/ts-figure-svg/SKILL.md)
- [Deterministic SVG audit](https://github.com/Spark-To-Paper-Skills/spark-to-paper-skills/blob/84673b288a5d5d2b43ce97cdc8fa963a6f12c0db/skills/ts-figure-svg/scripts/audit_svg.py)
- [Paper orchestrator](https://github.com/Spark-To-Paper-Skills/spark-to-paper-skills/blob/84673b288a5d5d2b43ce97cdc8fa963a6f12c0db/skills/ts-paper/SKILL.md)
