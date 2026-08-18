# sci-figure

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

`sci-figure` is an agent skill for creating, revising, auditing and exporting publication-ready scientific figures. Its Design definition is constrained figure authoring: source data, journal dimensions, chart semantics, typography and output editability must agree.

## One plotting backend, several delivery formats

The skill chooses Python or R from the task and then keeps that backend authoritative for plotting, previews and exports. This prevents a visually similar fallback renderer from silently becoming a second implementation. The plotting script and source data are the reproducible authority; SVG/PDF preserve editable text, while TIFF/PNG are raster delivery and inspection formats.

The workflow establishes an output contract before drawing, including target size, format and text editability. Multi-panel composition, palettes and visual QA are treated as part of the artifact rather than post-processing decoration.

## Audit boundary

The repository is intentionally compact: the public implementation is the skill contract rather than a hosted editor or bundled rendering engine. It can require the agent to audit layout and trace data, but execution quality depends on the selected plotting libraries, fonts and the actual source dataset.

- [Pinned sci-figure revision](https://github.com/xiao-yuling/sci-figure/tree/a44fbcae2de59cfdefb016a0eab86e66e0ba8555)
- [Figure-authoring skill](https://github.com/xiao-yuling/sci-figure/blob/a44fbcae2de59cfdefb016a0eab86e66e0ba8555/skill.md)
- [Project overview](https://github.com/xiao-yuling/sci-figure/blob/a44fbcae2de59cfdefb016a0eab86e66e0ba8555/README.md)
