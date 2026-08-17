# Image to PPTX

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

Image to PPTX rebuilds slide screenshots, diagrams and scanned pages directly as native editable PowerPoint objects. It exists because importing or converting SVG does not reliably yield semantic PowerPoint text boxes and shapes.

## Native objects are the target authority

The workflow inspects page count, ratio, density, text blocks and raster exceptions, then creates one PPTX using native text boxes, freeforms, lines, connectors, tables, grids and charts where practical. One semantic paragraph maps to one editable text box; titles, labels and KPI values remain separately targetable.

Complex work can lock slide size, palette, typography, icon policy and raster exceptions in `pptx_spec_lock.md`. `validate_native_pptx.py` inspects the OOXML package for valid slides and native text. The `.pptx` is the working artifact; source images and reconstruction notes are evidence.

## Relationship to shape-safe SVG

The same maintainer keeps Image to Shape-Safe SVG for explicit SVG output. This project is not a renamed copy: it forbids SVG delivery and constructs a different native object graph to preserve PowerPoint editing semantics.

- [Pinned Image to PPTX revision](https://github.com/perpetualhui/image-to-pptx/tree/4af43cdadf0bce265f37cf2f344c35787527e14c)
- [Native PPTX workflow](https://github.com/perpetualhui/image-to-pptx/blob/4af43cdadf0bce265f37cf2f344c35787527e14c/SKILL.md)
- [OOXML validation helper](https://github.com/perpetualhui/image-to-pptx/blob/4af43cdadf0bce265f37cf2f344c35787527e14c/tools/validate_native_pptx.py)
- [Detailed reconstruction order](https://github.com/perpetualhui/image-to-pptx/blob/4af43cdadf0bce265f37cf2f344c35787527e14c/references/native-pptx-workflow.md)
