# Amaroad

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

Amaroad, previously named DexCode, is an AI slide-creation environment for developers. It intentionally makes the browser view-only: the ordinary authoring route is to ask a coding agent to edit MDX source and observe the hot-reloaded deck.

## MDX files own the slide order and composition

Each slide is a separate MDX module using a bounded component vocabulary. [`mdx-slide-source.ts`](https://github.com/co-r-e/amaroad/blob/0ed5c29010f0c9c97e9669e3e88939a773d2f93e/src/lib/mdx-slide-source.ts) resolves editable source, while [`deck-loader.ts`](https://github.com/co-r-e/amaroad/blob/0ed5c29010f0c9c97e9669e3e88939a773d2f93e/src/lib/deck-loader.ts) materializes the ordered deck for the live application.

The bundled deck-designer and spreadsheet-to-slides skills give agents domain rules but do not replace source authority. PDF and PPTX are exports from that source. The lack of direct manipulation is therefore a deliberate technical direction rather than a missing editor feature.

CORe's first-party GitHub organization profile identifies Japan.

## Evidence

- [Pinned repository](https://github.com/co-r-e/amaroad/tree/0ed5c29010f0c9c97e9669e3e88939a773d2f93e)
- [Deck types](https://github.com/co-r-e/amaroad/blob/0ed5c29010f0c9c97e9669e3e88939a773d2f93e/src/types/deck.ts)
- [Export implementation](https://github.com/co-r-e/amaroad/blob/0ed5c29010f0c9c97e9669e3e88939a773d2f93e/src/lib/export.ts)
- [Organization profile](https://github.com/co-r-e)
