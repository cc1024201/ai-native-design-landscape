# GenU Advanced

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

GenU is not another skin on the ModernUI Maker course scaffold. Its decisive mechanism is a source artifact that can be generated and refined across four runtime targets before being explicitly promoted into a personal library.

## One source surface supports multiple runtimes

[`Home.jsx`](https://github.com/cprince9/AI-Component-Generator---Advanced/blob/52a91832be2a043dcdf9b356b642299d6b22f72c/src/pages/Home.jsx) streams Gemini output for HTML/CSS, Tailwind HTML, React or Vue and resubmits the current source when the user requests a refinement. [`previewBuilder.js`](https://github.com/cprince9/AI-Component-Generator---Advanced/blob/52a91832be2a043dcdf9b356b642299d6b22f72c/src/utils/previewBuilder.js) is the translation boundary: it wraps plain HTML directly and supplies browser-side React/Babel or Vue runtimes when source needs compilation.

## Refinement history is session state; a save is promotion

The generation workspace keeps correction history with the current code, but durable ownership begins only when the user saves. [`componentRoutes.js`](https://github.com/cprince9/AI-Component-Generator---Advanced/blob/52a91832be2a043dcdf9b356b642299d6b22f72c/server/routes/componentRoutes.js) persists prompt, framework, source and refinements under the authenticated user. MongoDB is preferred and the repository's database service can fall back to local JSON, so the library boundary is explicit even when infrastructure changes.

## Evidence

- [Canonical repository](https://github.com/cprince9/AI-Component-Generator---Advanced)
- [Inspected tree](https://github.com/cprince9/AI-Component-Generator---Advanced/tree/52a91832be2a043dcdf9b356b642299d6b22f72c)
- Commit: `52a91832be2a043dcdf9b356b642299d6b22f72c`
