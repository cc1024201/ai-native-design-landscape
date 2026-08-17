# project_threejs_ai

> Research status: **Source-level** · Lifecycle: **historical** · Last reviewed: **2026-08-12**

This JavaScript Mastery tutorial is the canonical source lineage behind two additional search results. Its Design artifact is not generated 3D geometry: AI creates a raster decal and the user applies that image to a fixed shirt scene.

## Generation changes texture input

[`dalle.routes.js`](https://github.com/adrianhajdin/project_threejs_ai/blob/bbe1d55b16267a9d115555be8ed2e2a2e2bb957b/server/routes/dalle.routes.js) turns a text prompt into a DALL-E image. [`Customizer.jsx`](https://github.com/adrianhajdin/project_threejs_ai/blob/bbe1d55b16267a9d115555be8ed2e2a2e2bb957b/client/src/pages/Customizer.jsx) lets the user combine that result with local uploads, color and logo/full-texture choices.

## Runtime state controls the scene

[`store/index.js`](https://github.com/adrianhajdin/project_threejs_ai/blob/bbe1d55b16267a9d115555be8ed2e2a2e2bb957b/client/src/store/index.js) keeps the Valtio customization state. [`Shirt.jsx`](https://github.com/adrianhajdin/project_threejs_ai/blob/bbe1d55b16267a9d115555be8ed2e2a2e2bb957b/client/src/canvas/Shirt.jsx) maps that state to decals on the fixed Three.js model. The final canvas can be downloaded but the scene state is not persisted as an editable project.

It is historical because the canonical source stopped evolving in 2023. AIShop Core and LXAEZ's 3D generator are duplicates by shared implementation rather than separate product teams.

## Source record

- [Canonical repository](https://github.com/adrianhajdin/project_threejs_ai)
- [Inspected tree](https://github.com/adrianhajdin/project_threejs_ai/tree/bbe1d55b16267a9d115555be8ed2e2a2e2bb957b)
- [Maintainer region evidence](https://github.com/adrianhajdin)
- Commit: `bbe1d55b16267a9d115555be8ed2e2a2e2bb957b`
