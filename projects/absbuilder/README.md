# ABSBuilder

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

ABSBuilder is a Supabase-backed single-HTML website studio. It is notable for keeping fallback provenance visible and for having a real ZIP delivery path while its apparent “Publish” control is only UI in the inspected snapshot.

## Provider cascade and labeled fallback

[`pages/api/generate.js`](https://github.com/SupRogueSoul/absbuilder/blob/281797d0fc76b0cf30e5ba69ef0e103ee94738b6/pages/api/generate.js) tries named Gemini models then named OpenRouter models for both generation and targeted edits. With no usable provider it returns `fallback: true` and HTML containing a visible Demo Mode banner. The client can therefore distinguish a real model result from a deterministic placeholder.

## Supabase HTML is the durable authority

[`pages/dashboard.js`](https://github.com/SupRogueSoul/absbuilder/blob/281797d0fc76b0cf30e5ba69ef0e103ee94738b6/pages/dashboard.js) creates a `sites` row with prompt slug and `generated_html`. [`pages/builder/[id].js`](https://github.com/SupRogueSoul/absbuilder/blob/281797d0fc76b0cf30e5ba69ef0e103ee94738b6/pages/builder/%5Bid%5D.js) loads that row and sends the current HTML with each edit request. Successful edits replace both local state and `generated_html`; preview uses the same source.

## Delivery and missing release behavior

The builder packages current HTML with a minimal Vite project into a ZIP. That is a real user-obtainable delivery artifact. By contrast `handlePublish` only shows a success toast and does not write a deployment or public-state transition. The snapshot also has no version table so revision recovery is absent.

## Evidence

- [Canonical repository](https://github.com/SupRogueSoul/absbuilder)
- [Inspected tree](https://github.com/SupRogueSoul/absbuilder/tree/281797d0fc76b0cf30e5ba69ef0e103ee94738b6)
- [Builder source](https://github.com/SupRogueSoul/absbuilder/blob/281797d0fc76b0cf30e5ba69ef0e103ee94738b6/pages/builder/%5Bid%5D.js)
- Commit: `281797d0fc76b0cf30e5ba69ef0e103ee94738b6`

The maintainer profile does not provide a geographic location; region remains `unknown`.
