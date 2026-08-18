# LandingForge

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

LandingForge is an HTML-authority website workspace: model providers generate or patch one complete document, and the product layers target selection, history, direct styling, preview, and portable delivery around it.

## Generation and correction share the current HTML

[`useEditor.ts`](https://github.com/AmarHouse/landingforge/blob/c95797dd355bb63641fa205d73c5175a1ed4ad9a/hooks/useEditor.ts) holds the current document and update history. The AI surface in [`ask-ai/index.tsx`](https://github.com/AmarHouse/landingforge/blob/c95797dd355bb63641fa205d73c5175a1ed4ad9a/components/editor/ask-ai/index.tsx) streams provider output, while [`client-processing.ts`](https://github.com/AmarHouse/landingforge/blob/c95797dd355bb63641fa205d73c5175a1ed4ad9a/lib/client-processing.ts) applies bounded SEARCH/REPLACE operations instead of losing the whole artifact on every turn.

## The visual surface can identify a local target

[`selected-html-element.tsx`](https://github.com/AmarHouse/landingforge/blob/c95797dd355bb63641fa205d73c5175a1ed4ad9a/components/editor/ask-ai/selected-html-element.tsx) carries an element's HTML into a focused edit. Style and inline edit surfaces operate on the same document; [`site-history`](https://github.com/AmarHouse/landingforge/blob/c95797dd355bb63641fa205d73c5175a1ed4ad9a/components/editor/ask-ai/site-history.tsx) exposes prior states.

## Delivery preserves the authored page

[`download-generated-content.ts`](https://github.com/AmarHouse/landingforge/blob/c95797dd355bb63641fa205d73c5175a1ed4ad9a/lib/download-generated-content.ts) serializes standalone HTML or packages it with local image assets in a ZIP. The preview and download therefore derive from the same source authority.

## Pinned evidence

- [Repository](https://github.com/AmarHouse/landingforge)
- [Inspected tree](https://github.com/AmarHouse/landingforge/tree/c95797dd355bb63641fa205d73c5175a1ed4ad9a)
- Commit: `c95797dd355bb63641fa205d73c5175a1ed4ad9a`
