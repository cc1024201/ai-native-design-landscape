# PagePilot

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

PagePilot is a deliberately small Indonesian landing-page workshop. Its important choice is that the model creates a typed content graph; a deterministic renderer owns layout and export.

## The model fills a bounded schema

[`generate/route.ts`](https://github.com/galpratama/ai-landing-page-builder/blob/8f83e3556d01ba993e4dac62e551fda6a9a7644b/src/app/api/generate/route.ts) asks OpenRouter for an object containing eyebrow, headline, description, CTA, and three distinct features. Invalid or unavailable model output falls back transparently to a local deterministic draft.

## Projection and export share the graph

[`page.tsx`](https://github.com/galpratama/ai-landing-page-builder/blob/8f83e3556d01ba993e4dac62e551fda6a9a7644b/src/app/page.tsx) renders the current `SiteDraft` as a responsive preview and interpolates the same fields into a standalone HTML document. This makes delivery reproducible, although arbitrary layout editing and durable projects are outside the current product.

## Pinned evidence

- [Repository](https://github.com/galpratama/ai-landing-page-builder)
- [Inspected tree](https://github.com/galpratama/ai-landing-page-builder/tree/8f83e3556d01ba993e4dac62e551fda6a9a7644b)
- Commit: `8f83e3556d01ba993e4dac62e551fda6a9a7644b`
