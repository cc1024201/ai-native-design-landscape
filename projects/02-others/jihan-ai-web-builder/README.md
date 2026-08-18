# Jihan AI Web Builder

> Research status: **Source-level** · Lifecycle: **active-transition** · Last reviewed: **2026-08-12**

Jihan AI Web Builder uses a bounded section JSON format instead of asking a model for arbitrary application code. An explicit preview-and-apply step separates generated candidate content from the MongoDB-backed page consumed by the renderer.

## Generated JSON is not authoritative until Apply

[`ai.service.ts`](https://github.com/JihanGajjar/Ai-web-builder/blob/d29bcd69e89dd3215c1365b2fbb3ece25a6d931a/server/src/ai/ai.service.ts) prompts a local Ollama model for hero, features, testimonials, pricing and CTA blocks. [`PageEditor.tsx`](https://github.com/JihanGajjar/Ai-web-builder/blob/d29bcd69e89dd3215c1365b2fbb3ece25a6d931a/client/src/pages/PageEditor.tsx) parses the result, shows the proposed section set, and only updates the stored page after the user chooses Apply.

```text
brief -> Ollama JSON candidate -> section preview
-> Apply -> MongoDB Page.content -> typed block renderer
-> regenerate/replace -> draft or published page
```

The [page schema](https://github.com/JihanGajjar/Ai-web-builder/blob/d29bcd69e89dd3215c1365b2fbb3ece25a6d931a/server/src/page/schemas/page.schema.ts) stores content, project identity and publish state. The current UI replaces the page's section array rather than offering granular direct manipulation, and the generation call contains rough prototype code. It is evidence of a structured early loop, not polished WordPress-equivalent editing.

No license file or reliable maintainer-region evidence was found.

## Evidence

- [Pinned repository](https://github.com/JihanGajjar/Ai-web-builder/tree/d29bcd69e89dd3215c1365b2fbb3ece25a6d931a)
- [Block renderer](https://github.com/JihanGajjar/Ai-web-builder/blob/d29bcd69e89dd3215c1365b2fbb3ece25a6d931a/client/src/components/blocks/BlockRenderer.tsx)
- [Page service](https://github.com/JihanGajjar/Ai-web-builder/blob/d29bcd69e89dd3215c1365b2fbb3ece25a6d931a/server/src/page/page.service.ts)
