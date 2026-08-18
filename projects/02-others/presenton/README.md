# Presenton

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

Presenton is a self-hostable AI presentation workspace. A prompt or uploaded document becomes an outline and slide structure, but the product does not end at rendered images: the user enters a drag editor and can deliver either PDF or a fully editable PowerPoint file.

## Its handoff boundary is an editable deck model

The FastAPI side defines explicit [`presentation_outline_model.py`](https://github.com/presenton/presenton/blob/331b09bc73f0d378154c474f602ee6e1d152e5d5/servers/fastapi/models/presentation_outline_model.py) and [`presentation_structure_model.py`](https://github.com/presenton/presenton/blob/331b09bc73f0d378154c474f602ee6e1d152e5d5/servers/fastapi/models/presentation_structure_model.py) contracts. Generation therefore crosses a typed outline/structure boundary before the Next.js client receives it. The editor's own [`model.ts`](https://github.com/presenton/presenton/blob/331b09bc73f0d378154c474f602ee6e1d152e5d5/servers/nextjs/components/slide-editor/model/model.ts) and [`state.ts`](https://github.com/presenton/presenton/blob/331b09bc73f0d378154c474f602ee6e1d152e5d5/servers/nextjs/components/slide-editor/state/state.ts) then own text, tables, groups, placement and styling.

```text
brief or document -> typed outline -> typed presentation structure
-> editable slide elements -> direct drag and inline edits -> PPTX or PDF
```

This is materially different from a slide-image generator: editing happens on structured elements and PowerPoint delivery preserves editability. The public repository proves the self-hosted workflow; it does not prove the storage or model internals of Presenton's separately operated hosted service.

The GitHub organization reports a United States location. That supports the team-region label but not a claim about its internal squad structure.

## Evidence

- [Pinned repository and product workflow](https://github.com/presenton/presenton/tree/331b09bc73f0d378154c474f602ee6e1d152e5d5)
- [Outline contract](https://github.com/presenton/presenton/blob/331b09bc73f0d378154c474f602ee6e1d152e5d5/servers/fastapi/models/presentation_outline_model.py)
- [Slide surface](https://github.com/presenton/presenton/blob/331b09bc73f0d378154c474f602ee6e1d152e5d5/servers/nextjs/components/slide-editor/surface/TemplateV2KonvaSlide.tsx)
- [Maintainer location evidence](https://github.com/presenton)
