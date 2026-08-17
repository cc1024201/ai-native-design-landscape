# WZRDFLOW

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

WZRDFLOW combines a generative-media node graph with storyboard and timeline editing, so generation is one stage of a longer project rather than the whole artifact.

## Three creative authorities coexist

A React Flow graph connects text, image, and image-to-video nodes. Storyboard records organize shots and characters. A separate timeline store arranges media for final video editing. The product does not flatten these into one schema; each surface owns a different part of the production process.

## Provider calls cross a protected boundary

Fal.ai and related generation requests are proxied through Supabase Edge Functions, while authenticated PostgreSQL rows persist workflows, nodes, edges, projects, and media. Row-level policies bind those records to a user and keep provider secrets out of the browser.

## Two repositories are one product lineage

The same owner published `wzrdflow` and a later `wzrd-flow-app` snapshot with the same WZRDFLOW identity and a large shared implementation base. They are divergent stages of one product, not evidence of another team or definition; this dossier uses the earlier canonical repository.

## Pinned evidence

- Canonical repository: [gratitude5dee/wzrdflow](https://github.com/gratitude5dee/wzrdflow)
- Inspected graph, storyboard, timeline, Supabase, and generation tree: [`161302c87eb7c6970e48a3a7b890281d6075fa6d`](https://github.com/gratitude5dee/wzrdflow/tree/161302c87eb7c6970e48a3a7b890281d6075fa6d)
- Immutable revision: [commit `161302c`](https://github.com/gratitude5dee/wzrdflow/commit/161302c87eb7c6970e48a3a7b890281d6075fa6d)
- Same-product alternate repository: [gratitude5dee/wzrd-flow-app](https://github.com/gratitude5dee/wzrd-flow-app)
