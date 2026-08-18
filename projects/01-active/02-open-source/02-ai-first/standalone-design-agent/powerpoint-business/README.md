# PowerPoint Business

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

PowerPoint Business is an SVG-native multi-agent presentation workflow. Consultant, Researcher, Planner, Designer and Reviewer roles pass explicit artifacts rather than one shared conversation, ending in one source SVG per slide plus PPTX and HTML projections.

## Semantic SVG is the edit boundary

Every SVG element receives a stable semantic ID. Natural-language edits resolve through a slide manifest, target the relevant SVG content and save the previous source under `slides/history/` before regeneration. `sync_manifest.py` restores agreement after any SVG change. The source SVG and manifest therefore own editability; the PPTX embeds those SVGs for Office 365 and carries PNG fallbacks for older viewers.

## Planning and visual review are routed separately

The Planner writes an outline and page-level planning cards. The Designer first creates neutral draft SVGs, then applies theme polish without changing content structure. The Reviewer scores content and visuals and routes failures back to the responsible role. `check_svg.py` enforces structural rules and contrast; `preview.py` produces a browsable deck review surface.

## Delivery and recovery boundary

PPTX and HTML are exports from the SVG project, not independent authorities. History is per-slide file recovery rather than a collaborative presentation version graph. Office editability depends on SVG support, so older clients see the raster fallback rather than native slide shapes.

- [Pinned PowerPoint Business revision](https://github.com/Noi1r/powerpoint-business/tree/6ab663b12bc11724783135359e407b62bf2e9cba)
- [Five-role workflow and artifact contract](https://github.com/Noi1r/powerpoint-business/blob/6ab663b12bc11724783135359e407b62bf2e9cba/SKILL.md)
- [SVG validator](https://github.com/Noi1r/powerpoint-business/blob/6ab663b12bc11724783135359e407b62bf2e9cba/scripts/check_svg.py)
- [PPTX exporter](https://github.com/Noi1r/powerpoint-business/blob/6ab663b12bc11724783135359e407b62bf2e9cba/scripts/export_pptx.py)
