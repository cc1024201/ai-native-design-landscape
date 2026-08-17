# InsightIQ Marketing Studio

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-13**

InsightIQ defines design as a coordinated marketing campaign rather than a single canvas. One business brief expands into a brand system, logo and product visual, poster and social assets, reel storyboard, website, calendar and campaign copy that continue to share one campaign graph.

## “AI” is a deterministic local design engine

Pinned revision: `638f410219351efa72c2ce12e28baa74e679d3d9`.

The source explicitly identifies its AI engine as a mock. It parses instructions and uses seeded pseudo-random selection to produce reproducible campaign structures; it does not call a paid model. The qualifying behavior is still agent-like orchestration and correction, but the dossier does not mislabel deterministic template synthesis as an LLM integration.

## Campaign state coordinates heterogeneous artifacts

Brand palette, copy and business identity feed SVG logo, product render, poster, website sections and reel scenes. Section-level regeneration patches one area while retaining the rest of the campaign. The website assistant can add structured sections, and its version history keeps exact website snapshots with comparison and restore rather than attempting inverse operations.

## Local-first persistence can be promoted to cloud sync

Browser storage remains the primary safety copy. When Supabase is configured, the cloud layer migrates and synchronizes records without disabling local persistence. This makes local state a deliberate authority tier, not merely an offline cache, while the database path supplies cross-session/account continuity.

## Delivery is real; social publishing is partly demonstrative

Exports derive from the campaign graph into JSON, text, standalone HTML, PNG logo/product/poster/social assets, a downloadable website and reel outputs. The repository itself warns that production social publishing requires OAuth and official APIs, so those UI states are not counted as verified external publication.

## Pinned evidence

- [Repository](https://github.com/nandu-priya07/InsightIQ)
- [Deterministic mock-AI campaign engine](https://github.com/nandu-priya07/InsightIQ/blob/638f410219351efa72c2ce12e28baa74e679d3d9/src/utils/aiEngine.js)
- [Website construction graph](https://github.com/nandu-priya07/InsightIQ/blob/638f410219351efa72c2ce12e28baa74e679d3d9/src/utils/websiteEngine.js)
- [Exact website snapshots and restore UI](https://github.com/nandu-priya07/InsightIQ/blob/638f410219351efa72c2ce12e28baa74e679d3d9/src/components/website/WebsiteVersionHistory.jsx)
- [Local-first cloud synchronization](https://github.com/nandu-priya07/InsightIQ/blob/638f410219351efa72c2ce12e28baa74e679d3d9/src/services/cloudSync.js)
- [Cross-media export projections](https://github.com/nandu-priya07/InsightIQ/blob/638f410219351efa72c2ce12e28baa74e679d3d9/src/utils/exporters.js)
