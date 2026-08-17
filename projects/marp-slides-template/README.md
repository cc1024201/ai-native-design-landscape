# Marp Slides Template

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

This repository turns an ordinary Marp deck into a governed Copilot authoring workspace. Markdown owns the slides while a separate native draw.io path handles diagrams that need visual editing.

## Two source formats with explicit roles

At [`09376782`](https://github.com/codebytes/marp-slides-template/tree/09376782bcaca03fe7c071ba124862d225b60914), slide content stays in `Slides.md`. The draw.io skill builds editable `.drawio.svg` assets from a JSON specification so diagrams can be reopened in draw.io without raster reconstruction.

## Visual QA is encoded as a skill

The slide-review skill launches browser checks for overflow. That test cannot judge storytelling or aesthetics but it catches a concrete delivery failure that Markdown compilation alone misses.

## Product boundary

The record covers this reusable agent-ready deck system once. Its theme CSS and sample deck are supporting assets; the distinctive technical scheme is Copilot instructions plus editable diagram materialization plus rendered review.

## Evidence

- [Pinned template](https://github.com/codebytes/marp-slides-template/tree/09376782bcaca03fe7c071ba124862d225b60914)
- [Marp agent](https://github.com/codebytes/marp-slides-template/blob/09376782bcaca03fe7c071ba124862d225b60914/.github/agents/marp.md)
- [Draw.io skill](https://github.com/codebytes/marp-slides-template/blob/09376782bcaca03fe7c071ba124862d225b60914/.github/skills/drawio-diagrams/SKILL.md)
- [Diagram materializer](https://github.com/codebytes/marp-slides-template/blob/09376782bcaca03fe7c071ba124862d225b60914/.github/skills/drawio-diagrams/make-drawio-svg.mjs)
- [Overflow review](https://github.com/codebytes/marp-slides-template/blob/09376782bcaca03fe7c071ba124862d225b60914/.github/skills/marp-slide-review/check-overflow.mjs)
