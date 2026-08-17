# dom-to-pptx

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

dom-to-pptx is both a browser materializer and an agent presentation-engineering skill. It reads computed DOM geometry and style, then reconstructs the page as editable native PowerPoint text, shapes, vectors, images, transitions and animations.

## Browser layout is measured, then rebuilt as a native deck

[`node-exporter.js`](https://github.com/atharva9167j/dom-to-pptx/blob/e103460915f0241f31c65d8e869e778dd38a49f4/src/node-exporter.js) drives the headless export path. The installed [`dom-to-pptx-skill`](https://github.com/atharva9167j/dom-to-pptx/blob/e103460915f0241f31c65d8e869e778dd38a49f4/skills/dom-to-pptx-skill/SKILL.md) constrains source HTML and requires validation; [`pptx-normalizer.js`](https://github.com/atharva9167j/dom-to-pptx/blob/e103460915f0241f31c65d8e869e778dd38a49f4/src/pptx-normalizer.js) regularizes the resulting package.

HTML is the layout-generation authority before export. The `.pptx` becomes a distinct native editing authority after materialization, rather than a screenshot embedded in a slide.

## Evidence

- [Pinned repository](https://github.com/atharva9167j/dom-to-pptx/tree/e103460915f0241f31c65d8e869e778dd38a49f4)
- [Validation contract](https://github.com/atharva9167j/dom-to-pptx/blob/e103460915f0241f31c65d8e869e778dd38a49f4/skills/dom-to-pptx-skill/reference/VALIDATION.md)
- [Maintainer profile: India](https://github.com/atharva9167j)
