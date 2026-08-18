# slides-grab

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

slides-grab is a presentation harness built around self-contained HTML slide files. Its editor is not a conventional slide object model: the user drags a bounding box over the rendered deck to supply spatial context to a coding agent, while direct text and transform tools handle smaller manual corrections.

## Selection narrows the agent's source edit

[`editor-bbox.js`](https://github.com/NomaDamas/slides-grab/blob/745c931c8f5556d8b9fdfe6718c8a507f6223935/src/editor/js/editor-bbox.js) records the selected rectangle and intersecting DOM evidence. [`codex-edit.js`](https://github.com/NomaDamas/slides-grab/blob/745c931c8f5556d8b9fdfe6718c8a507f6223935/src/editor/codex-edit.js) turns that context plus the user's instruction into a scoped subprocess edit. Direct text editing writes the same slide source, so manual and agent paths do not create divergent copies.

```text
approved style + outline -> slide-XX.html files -> browser viewer
-> bbox/direct selection -> scoped source revision -> validation/render
-> two-pass design gate -> PDF/PNG or best-effort PPTX/Figma projection
```

The decisive mechanism is the delivery gate. Mechanical validation catches missing assets, overflow and blank canvases. The [design-gate contract](https://github.com/NomaDamas/slides-grab/blob/745c931c8f5556d8b9fdfe6718c8a507f6223935/skills/slides-grab-design/references/design-gate.md) then requires rendered PNG evidence, two distinct review passes and the SHA-256 fingerprint of every current slide source. `pdf`, `convert` and `figma` reject a missing, failing or stale `Proceed` receipt. Export therefore cannot silently bless slides changed after review.

HTML is the edit authority. PDF and raster PPTX maximize fidelity; editable-text PPTX and the Figma-import path are explicitly experimental and can lose structure. The repository is MIT-licensed. The organization profile reports South Korea.

## Decisive evidence

- [Pinned repository](https://github.com/NomaDamas/slides-grab/tree/745c931c8f5556d8b9fdfe6718c8a507f6223935)
- [Direct-edit runtime](https://github.com/NomaDamas/slides-grab/blob/745c931c8f5556d8b9fdfe6718c8a507f6223935/src/editor/js/editor-direct-edit.js)
- [Slide validator](https://github.com/NomaDamas/slides-grab/blob/745c931c8f5556d8b9fdfe6718c8a507f6223935/scripts/validate-slides.js)
- [Gate receipt implementation](https://github.com/NomaDamas/slides-grab/blob/745c931c8f5556d8b9fdfe6718c8a507f6223935/src/design-gate-state.js)
- [MIT license](https://github.com/NomaDamas/slides-grab/blob/745c931c8f5556d8b9fdfe6718c8a507f6223935/LICENSE)
