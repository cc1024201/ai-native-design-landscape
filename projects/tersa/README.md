# Tersa

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

Tersa is a browser-based visual AI playground in which text, image, video, transformation, and provider nodes can be connected and run through Vercel AI Gateway.

## The graph preserves generative composition

React Flow holds nodes, edges, positions, and settings. Upstream text or media becomes input to downstream model and transform nodes, so outputs can branch and combine rather than being trapped in a single generation panel.

## Provider breadth is normalized at execution

A gateway provider layer exposes models from more than twenty-five providers while node actions distinguish text streaming, image creation and editing, and video generation. The canvas defines composition; the gateway owns model routing and billing semantics.

## Browser storage sets the persistence ceiling

Canvas state persists locally in the browser. The reviewed source does not establish multi-user projects, server-side history, or merge semantics, so Tersa is treated as an executable local playground rather than a collaborative managed design system.

## Pinned evidence

- Repository: [vercel-labs/tersa](https://github.com/vercel-labs/tersa)
- Inspected canvas, node operations, model providers, generation actions, and local storage tree: [`496dd334129a91deae0802ac98094926a97fb538`](https://github.com/vercel-labs/tersa/tree/496dd334129a91deae0802ac98094926a97fb538)
- Immutable revision: [commit `496dd33`](https://github.com/vercel-labs/tersa/commit/496dd334129a91deae0802ac98094926a97fb538)
