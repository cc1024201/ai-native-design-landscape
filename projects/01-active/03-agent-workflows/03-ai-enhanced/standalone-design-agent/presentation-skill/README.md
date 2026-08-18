# Presentation Skill

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

Presentation Skill treats an editable deck like compiled software. Structured JSON and a rebuildable workspace are the source; PowerPoint is the distributable artifact; rendered images provide the evidence needed to reject geometrically valid but visually weak output.

## Semantic slots compile into role-layout systems

Quick mode starts from `outline.json`. Workspace mode adds design, content, evidence and asset plans. The compiler normalizes semantic roles, selects one of several full-deck composition grammars, and maps those roles into native PowerPoint text, charts, tables and figures with `pptxgenjs`.

Its QA deliberately has three layers: geometric checks for overflow and density, visual inspection of rendered pages, and placeholder-text detection. The JSON workspace remains the revision authority; manual edits made only in the exported PPTX cannot automatically flow back into it.

The bundled style corpus contains descriptors rather than copied deck assets. It influences grammar selection but is not a template-authority claim over the referenced work.

- [Pinned repository](https://github.com/siril9/presentation-skill/tree/3a22eed290fa2205b6a1e2de5549b4429c5fffd0)
- [Skill and workspace contract](https://github.com/siril9/presentation-skill/blob/3a22eed290fa2205b6a1e2de5549b4429c5fffd0/SKILL.md)
- [PPTX compiler](https://github.com/siril9/presentation-skill/blob/3a22eed290fa2205b6a1e2de5549b4429c5fffd0/scripts/build_deck_pptxgenjs.js)
- [Maintainer profile checked; no location published](https://github.com/siril9)
