# CAD Coworker

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

CAD Coworker turns a CadQuery model into a browser-based parametric working session. An agent can expose chosen function parameters as sliders or numeric controls, while the user changes dimensions and immediately sees the resulting mesh before exporting a manufacturing artifact.

## The function remains authoritative over the live mesh

Annotated Python parameters define the editable model. A WebSocket loop re-executes the function and projects geometry into the viewer; the preview is evidence, not a replacement for parametric source. Export routes produce STEP for retained engineering structure and STL for downstream mesh workflows.

The shipped agent skill explains how to select parameters and operate the workbench, so the repository is more than a generic CAD viewer. Its distinct contribution is the human-agent refinement surface between generated code and final export.

- [Pinned repository](https://github.com/karaage0703/cad-coworker/tree/3c48185da45d566e356942b125ad0cd99fdf20d3)
- [Agent skill](https://github.com/karaage0703/cad-coworker/blob/3c48185da45d566e356942b125ad0cd99fdf20d3/SKILL.md)
- [Exporter implementation](https://github.com/karaage0703/cad-coworker/blob/3c48185da45d566e356942b125ad0cd99fdf20d3/src/cad_coworker/exporter.py)
- [Maintainer profile checked; no location published](https://github.com/karaage0703)
