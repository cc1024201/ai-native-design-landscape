# Image SVG PPTX Pro

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

Image SVG PPTX Pro reconstructs a flat slide screenshot through a semantic SVG before producing editable PowerPoint. Its product boundary is the reconstruction contract: it does not treat embedding the original bitmap in a slide as editability.

## Layout plan before geometry

The agent first normalizes the image and writes `layout_plan.json`. It then separates crop-worthy complex assets from text, cards, rules and tables that can remain editable. A canonical SVG is the visual intermediate, after which the workflow emits PPTX plus a QA report.

This creates three different authorities: the source screenshot is the visual target, `layout_plan.json` records semantic decomposition, and the PPTX is the user-editable delivery. SVG is a materialization bridge rather than the final product. Optional LibreOffice or Inkscape rendering closes a compare-and-correct loop, but the public repository does not establish universal reconstruction accuracy.

- [Pinned repository](https://github.com/kongzhecn/image-svg-pptx-pro-skill/tree/3da4862746b8d3b19ca07d3407b87bf6aec98d3b)
- [Agent-facing workflow](https://github.com/kongzhecn/image-svg-pptx-pro-skill/blob/3da4862746b8d3b19ca07d3407b87bf6aec98d3b/SKILL.md)
- [Pinned artifact route](https://github.com/kongzhecn/image-svg-pptx-pro-skill/blob/3da4862746b8d3b19ca07d3407b87bf6aec98d3b/README.md)
- [Maintainer profile checked; no location published](https://github.com/kongzhecn)
