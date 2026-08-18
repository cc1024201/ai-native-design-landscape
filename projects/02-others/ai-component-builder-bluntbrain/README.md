# AI Component Builder by bluntbrain

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

This course-backed implementation adds an explicit keep/discard boundary to the usual prompt-and-preview exercise. Generated React source is transient until the user saves it into the gallery.

## Runtime source remains inspectable

[`App.tsx`](https://github.com/bluntbrain/ai-component-builder-react-js/blob/e24fa00bda245da8090e3dae4a5a751deea9b48f/src/App.tsx) calls OpenAI from the client, cleans the response and coordinates generation and saving. [`preview-panel.tsx`](https://github.com/bluntbrain/ai-component-builder-react-js/blob/e24fa00bda245da8090e3dae4a5a751deea9b48f/src/preview-panel.tsx) builds an isolated `srcDoc` with React, Babel and Tailwind so the current JSX has both code and visual projections.

## Firebase is candidate storage

[`firebase.ts`](https://github.com/bluntbrain/ai-component-builder-react-js/blob/e24fa00bda245da8090e3dae4a5a751deea9b48f/src/firebase.ts) persists selected components for later gallery retrieval. That does not create a full project graph; it creates a small promoted-variant collection.

## Pinned evidence

- [Canonical repository](https://github.com/bluntbrain/ai-component-builder-react-js)
- [Inspected tree](https://github.com/bluntbrain/ai-component-builder-react-js/tree/e24fa00bda245da8090e3dae4a5a751deea9b48f)
- [Maintainer region evidence](https://github.com/bluntbrain)
- Commit: `e24fa00bda245da8090e3dae4a5a751deea9b48f`
