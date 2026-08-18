# Kadnya Website Builder

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-13**

Kadnya's website workflow composes an AI template service with Builder.io. The defining product decision is that successful generation does not leave a proprietary page editor behind: it hands the artifact to an external visual-authoring authority.

## A successful page becomes Builder.io content

Pinned revision: `c5e929cba20bb644a9e3325fcb51d644665759ef`.

The generator selects components and creates a page in a configured Builder.io space. The returned page identity drives an embedded Builder.io editor, a full-studio link and a CDN preview. Once that creation succeeds, Builder.io's content graph—not a local HTML string—is the editable, durable artifact.

## AI orchestration and visual editing are separate systems

Kadnya's service performs prompt enhancement, asynchronous template generation and task polling. Builder.io then owns visual correction and continued authoring. That handoff makes this a useful counterexample to builders where model output and editor state share one internal data model.

## Fallback IDs are not persisted pages

Timeout, skipped and error branches synthesize demo content plus locally invented IDs such as `fallback-*` or `kadnya-timeout-*`. They can render a plausible result but do not establish a Builder.io object. The UI's common result shape therefore spans two different realities; only real Builder.io page IDs support the claimed external editing loop.

## Pinned evidence

- [Repository](https://github.com/ctar0403/Saas-Education-Platform)
- [Generation-to-page UI](https://github.com/ctar0403/Saas-Education-Platform/blob/c5e929cba20bb644a9e3325fcb51d644665759ef/src/components/WebsiteGenerator/WebsiteGenerator.tsx)
- [AI workflow and explicit fallback branches](https://github.com/ctar0403/Saas-Education-Platform/blob/c5e929cba20bb644a9e3325fcb51d644665759ef/src/lib/services/kadnya-website-builder.ts)
- [Embedded Builder.io authority](https://github.com/ctar0403/Saas-Education-Platform/blob/c5e929cba20bb644a9e3325fcb51d644665759ef/src/components/WebsiteBuilder/BuilderVisualEditor.tsx)
- [Builder.io page service](https://github.com/ctar0403/Saas-Education-Platform/blob/c5e929cba20bb644a9e3325fcb51d644665759ef/src/lib/services/builder-api-service.ts)
