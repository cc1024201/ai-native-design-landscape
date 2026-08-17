# Image Split

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

Image Split prepares flat slides or page images for editable reconstruction. It produces named transparent assets, placement metadata, contact sheets, text masks and optional region schemas; downstream renderers no longer have to infer design objects from arbitrary connected pixels.

## OCR is evidence, not geometry authority

The agent authors an element recipe after visually separating semantic regions. `atomic_asset_split.py` turns that recipe into transparent assets and `manifest.json`, then renders a composite-without-text preview and contact sheet. OCR candidates can help identify text masks, but they do not define the final boundaries of icons, diagrams or regular UI geometry.

The original image remains the visual target. The manifest plus assets become the editable-ready intermediate authority. Because Image Split can be used by tools other than Image-PPT-King and ships its own skill, scripts, OCR route and QA artifacts, it is counted as an independent companion product rather than an internal function hidden inside the PPT builder.

- [Pinned repository](https://github.com/TateZhouSiu/image-split/tree/a236a1ec732e12d5e3cc9ce623b5bda8d8178f6b)
- [Atomic splitter](https://github.com/TateZhouSiu/image-split/blob/a236a1ec732e12d5e3cc9ce623b5bda8d8178f6b/skills/image-split/scripts/atomic_asset_split.py)
- [Agent workflow](https://github.com/TateZhouSiu/image-split/blob/a236a1ec732e12d5e3cc9ce623b5bda8d8178f6b/skills/image-split/SKILL.md)
- [Maintainer profile checked; no location published](https://github.com/TateZhouSiu)
