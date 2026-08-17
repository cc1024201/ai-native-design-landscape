# PPT Master

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

PPT Master is an agent skill for producing editable PowerPoint rather than image-only slides. Its unusual mechanism is a specification lock followed by an SVG intermediate and deterministic conversion into native DrawingML shapes.

## A locked design spec governs a native deck

The main [`SKILL.md`](https://github.com/hugohe3/ppt-master/blob/4e6ecbcb0dc079efebd3c79b775c0f02581509fe/skills/ppt-master/SKILL.md) requires a `design_spec` and `spec_lock` before full production. Slides are composed as SVG, finalized by [`finalize_svg.py`](https://github.com/hugohe3/ppt-master/blob/4e6ecbcb0dc079efebd3c79b775c0f02581509fe/skills/ppt-master/scripts/finalize_svg.py), then translated by `svg_to_pptx` into editable PowerPoint geometry instead of being flattened into page images.

```text
brief -> design_spec -> explicit spec_lock
-> per-slide SVG -> finalize/validate -> DrawingML PPTX
-> delivery checks -> editable deck
```

Native charts, tables, masters, transitions, animation and narration are handled as PowerPoint structures alongside converted shapes. The delivery checker verifies the produced package and catches rendering or packaging failures. This makes the `.pptx` the handoff authority; SVG and reports are reproducible intermediates. The documented quick mode trades away the resumable staged workflow, so it is not equivalent to the full pipeline.

The project is MIT-licensed. No reliable maintainer-region evidence was found.

## Decisive evidence

- [Pinned repository](https://github.com/hugohe3/ppt-master/tree/4e6ecbcb0dc079efebd3c79b775c0f02581509fe)
- [Technical design](https://github.com/hugohe3/ppt-master/blob/4e6ecbcb0dc079efebd3c79b775c0f02581509fe/docs/technical-design.md)
- [SVG finalizer](https://github.com/hugohe3/ppt-master/blob/4e6ecbcb0dc079efebd3c79b775c0f02581509fe/skills/ppt-master/scripts/finalize_svg.py)
- [SVG-to-PPTX converter](https://github.com/hugohe3/ppt-master/tree/4e6ecbcb0dc079efebd3c79b775c0f02581509fe/skills/ppt-master/scripts/svg_to_pptx)
- [Delivery checker](https://github.com/hugohe3/ppt-master/blob/4e6ecbcb0dc079efebd3c79b775c0f02581509fe/skills/ppt-master/scripts/pptx_delivery_check.py)
- [MIT license](https://github.com/hugohe3/ppt-master/blob/4e6ecbcb0dc079efebd3c79b775c0f02581509fe/LICENSE)
