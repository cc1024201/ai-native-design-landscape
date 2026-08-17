# AI-Powered Web App Builder by Shubha

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-13**

This builder uses one generated HTML document per project but adds durable continuation. A user can reopen a Mongo-backed project, prompt against its current code and message history, see the result in an iframe, and retain earlier code snapshots when a refinement succeeds.

## Refinement is version-producing replacement

Pinned revision: `e5b329d4e5650a67ce6ad0b62612c24f28893096`.

The `Project` model stores messages, `generatedCode`, a `versions` array and timestamps. Before replacing non-empty code, the generation service pushes the previous code and prompt into `versions`; it then saves the new response as current authority. The model prompt includes both conversation history and current code, so later turns are edits of an existing artifact rather than unrelated generations.

The client renders current code with `iframe.srcDoc` and exposes a source pane. Dashboard thumbnails are projections of the same stored HTML.

## Recovery caveat

The backend records old versions, but the inspected ordinary-user surface does not establish a tested restore transaction. The dossier therefore credits preserved snapshots, not guaranteed rollback. There is also no remote deployment authority; the durable boundary is the Mongo project.

## Pinned evidence

- [Repository](https://github.com/shubha229/ai-powered-web-app-builder)
- [Project model](https://github.com/shubha229/ai-powered-web-app-builder/blob/e5b329d4e5650a67ce6ad0b62612c24f28893096/server/src/models/Project.model.js)
- [Generation and snapshot transition](https://github.com/shubha229/ai-powered-web-app-builder/blob/e5b329d4e5650a67ce6ad0b62612c24f28893096/server/src/services/generation.service.js)
- [Live preview](https://github.com/shubha229/ai-powered-web-app-builder/blob/e5b329d4e5650a67ce6ad0b62612c24f28893096/client/src/components/LivePreview.jsx)
