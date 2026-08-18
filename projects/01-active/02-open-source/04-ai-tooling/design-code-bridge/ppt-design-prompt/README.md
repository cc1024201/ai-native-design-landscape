# PPT Design Prompt

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

PPT Design Prompt is a deterministic bridge from web-oriented `DESIGN.md` references to presentation-image-oriented `DESIGN.md` files. It does not generate a deck. Its Design artifact is the translated constraint document an image or slide agent consumes later.

## Translation preserves provenance and changes the target medium

[`converter.py`](https://github.com/Russell-cell/PPT-Design-Prompt/blob/a195f1445d4559516c7d7f66e769a30d6d03ec06/src/awesome_design_md_ppt_images/converter.py) parses numbered source sections, named colors, font roles and visual motifs. It then emits cover, divider, concept, diagram and data-backdrop guidance with title-safe zones and thumbnail constraints. The source path and conversion date remain in each output.

```text
source/<brand>/DESIGN.md -> parsed brand tokens and motifs
-> medium-specific prompt and layout rules
-> ppt-image/<brand>/DESIGN.md + conversion_manifest.json
-> external image/slide agent
```

[`cli.py`](https://github.com/Russell-cell/PPT-Design-Prompt/blob/a195f1445d4559516c7d7f66e769a30d6d03ec06/src/awesome_design_md_ppt_images/cli.py) makes source, output, manifest and expected-brand catalog explicit; missing sources can be represented rather than silently omitted. This is system governance and design-code translation, not native slide authoring: no canvas, render loop or deck persistence exists in the project.

The repository is an independent derivative of VoltAgent's `awesome-design-md`; the upstream corpus remains a separate excluded static input. No reliable maintainer-region evidence was found.

## Evidence

- [Pinned repository](https://github.com/Russell-cell/PPT-Design-Prompt/tree/a195f1445d4559516c7d7f66e769a30d6d03ec06)
- [Converter](https://github.com/Russell-cell/PPT-Design-Prompt/blob/a195f1445d4559516c7d7f66e769a30d6d03ec06/src/awesome_design_md_ppt_images/converter.py)
- [CLI contract](https://github.com/Russell-cell/PPT-Design-Prompt/blob/a195f1445d4559516c7d7f66e769a30d6d03ec06/src/awesome_design_md_ppt_images/cli.py)
- [Generated Figma-oriented output](https://github.com/Russell-cell/PPT-Design-Prompt/blob/a195f1445d4559516c7d7f66e769a30d6d03ec06/ppt-image/figma/DESIGN.md)
- [Conversion manifest](https://github.com/Russell-cell/PPT-Design-Prompt/blob/a195f1445d4559516c7d7f66e769a30d6d03ec06/conversion_manifest.json)
