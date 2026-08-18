# Image-PPT-King

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

Image-PPT-King reconstructs flat slide images as layered PowerPoint. It consumes semantic visual layers from Image Split, adds a separately editable text model and chooses between a richer artifact runtime and a public `pptxgenjs` fallback.

## Text and visuals have different owners

`visual-layers/manifest.json` owns extracted art and placement. `text-layer.json` owns semantic text boxes and their typography. The builder combines both into PPTX and records the selected backend in a manifest. When the Codex presentation runtime is available it can also export layout JSON and preview PNGs; otherwise the native PowerPoint file still exists but those projections are reduced.

The separation is deliberate: OCR can inform text, but OCR boxes do not become trusted artwork boundaries. Likewise, complex charts or photos may remain selectable image objects. The promise is recoverable semantic text and regular geometry, not universal vectorization.

Image Split is independently usable and is therefore catalogued separately; Image-PPT-King owns the downstream reconstruction and delivery contract.

- [Pinned repository](https://github.com/TateZhouSiu/image-ppt-king/tree/c319f48ee9f25fee4a7a413476e1c97c34c29acd)
- [PPTX builder](https://github.com/TateZhouSiu/image-ppt-king/blob/c319f48ee9f25fee4a7a413476e1c97c34c29acd/skills/image-ppt-king/scripts/build_ppt_from_layers.mjs)
- [Text-layer schema](https://github.com/TateZhouSiu/image-ppt-king/blob/c319f48ee9f25fee4a7a413476e1c97c34c29acd/skills/image-ppt-king/references/text-layer-schema.md)
- [Maintainer profile checked; no location published](https://github.com/TateZhouSiu)
