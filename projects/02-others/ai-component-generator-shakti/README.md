# AI Component Generator by Shakti Prasad Ram

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

This project treats a React component as two authoritative strings: generated component source and optional CSS. The notable boundary is that the model response is validated and may be replaced by an explicit deterministic fallback; the dossier therefore does not count every visible result as model-authored.

## Provider output enters a constrained component contract

[ai.js](https://github.com/Shaktiprasadram22/-Assignment-Component-Multi-Component-Generator-Platform/blob/1183dcb0724da95a513ed071a631e8f761602320/backend/routes/ai.js) calls OpenAI and requires JSON containing React.createElement source. It strips fences and validates the returned declaration before accepting it. Missing credentials and malformed responses take named fallback paths rather than silently impersonating provider output.

## A session owns the latest accepted source

[Session.js](https://github.com/Shaktiprasadram22/-Assignment-Component-Multi-Component-Generator-Platform/blob/1183dcb0724da95a513ed071a631e8f761602320/backend/models/Session.js) stores chat messages and one current JSX/CSS pair in MongoDB. This is durable current state but not a version graph: old component states are not independently restorable from the schema.

## Runtime proof and delivery share that string authority

[ComponentRenderer.js](https://github.com/Shaktiprasadram22/-Assignment-Component-Multi-Component-Generator-Platform/blob/1183dcb0724da95a513ed071a631e8f761602320/frontend/components/ComponentRenderer.js) normalizes and executes the accepted component in a React context. The adjacent code surface can expose the same source for download, so visual proof and delivery originate from the session artifact.

## Evidence

- [Canonical repository](https://github.com/Shaktiprasadram22/-Assignment-Component-Multi-Component-Generator-Platform)
- [Inspected tree](https://github.com/Shaktiprasadram22/-Assignment-Component-Multi-Component-Generator-Platform/tree/1183dcb0724da95a513ed071a631e8f761602320)
- Commit: 1183dcb0724da95a513ed071a631e8f761602320
