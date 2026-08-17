# Frame Bucket

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

Frame Bucket reverses the usual blank-prompt workflow. A human-authored design taxonomy constrains recommendation; the user assembles a recipe; then Anthropic generates an archived HTML artifact whose design contract and page lineage support later work.

## Recommendation does not own the final decision

[`recommend/route.ts`](https://github.com/mckechniep/frame-bucket/blob/32149cd6966968c297814e74589a5d23953ebc5d/src/app/api/recommend/route.ts) maps a brief to catalog options. The user can alter that recipe before generation, preserving an explicit decision boundary between model advice and artifact creation.

## Generation preserves source and rendered output

[`generate/route.ts`](https://github.com/mckechniep/frame-bucket/blob/32149cd6966968c297814e74589a5d23953ebc5d/src/app/api/generate/route.ts) validates the recipe, streams Anthropic HTML, retains pre-injection `htmlSource`, injects image assets, saves the archive, and creates a site/page row referencing it.

## Iteration creates lineage rather than overwrite

[`iterate/route.ts`](https://github.com/mckechniep/frame-bucket/blob/32149cd6966968c297814e74589a5d23953ebc5d/src/app/api/iterate/route.ts) derives a new artifact from a current one. [`site/[siteId]/page/route.ts`](https://github.com/mckechniep/frame-bucket/blob/32149cd6966968c297814e74589a5d23953ebc5d/src/app/api/site/%5BsiteId%5D/page/route.ts) derives a design contract from the landing artifact before generating coherent subpages and deliberately retains artifacts when page links are removed.

## Pinned evidence

- [Repository](https://github.com/mckechniep/frame-bucket)
- [Inspected tree](https://github.com/mckechniep/frame-bucket/tree/32149cd6966968c297814e74589a5d23953ebc5d)
- Commit: `32149cd6966968c297814e74589a5d23953ebc5d`
