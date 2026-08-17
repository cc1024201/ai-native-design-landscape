# PPT SaaS

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

PPT SaaS is the application in `shibinsp/pptxfactory`: an AI presentation generator backed by real PPTX templates, generation APIs, a browser slide editor and native deck files.

## Implemented core and claimed surface differ

The backend contains content, template, image, design and document-processing agents and a large native template set. [`SlideEditor.jsx`](https://github.com/shibinsp/pptxfactory/blob/cc837d33715eb130c46297c1ea2d7028c3d1e58c/frontend/src/components/SlideEditor.jsx) implements direct slide operations, and the backend records deck history and writes `.pptx` files.

The global chat component is currently not wired into that editor: `App.jsx` logs proposed actions with a “would integrate” comment. This dossier therefore includes the source-proven generate → edit → save/export loop but does not claim that every README chat command already mutates the open slide. That boundary is consequential evidence, not a reason to discard the implemented product.

No reliable maintainer-region evidence was found.

## Evidence

- [Pinned repository](https://github.com/shibinsp/pptxfactory/tree/cc837d33715eb130c46297c1ea2d7028c3d1e58c)
- [Backend generation application](https://github.com/shibinsp/pptxfactory/blob/cc837d33715eb130c46297c1ea2d7028c3d1e58c/backend/main.py)
- [Direct slide editor](https://github.com/shibinsp/pptxfactory/blob/cc837d33715eb130c46297c1ea2d7028c3d1e58c/frontend/src/components/SlideEditor.jsx)
- [Incomplete chat integration boundary](https://github.com/shibinsp/pptxfactory/blob/cc837d33715eb130c46297c1ea2d7028c3d1e58c/frontend/src/App.jsx)
