# QuiverAI

> Research status: **Architecture-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

QuiverAI defines Design as structured vector generation: prompts and raster references become SVG source rather than only flattened pixels. The current product joins an interactive app Gallery a public API and a hosted agent interface around the same Arrow model family and creation records.

## Creation records connect candidates to source delivery

In the [first-party app](https://docs.quiver.ai/app), users generate or vectorize multiple SVG candidates and reopen completed work from Gallery. They can compare outputs share a creation and export SVG or raster derivatives. The SVG remains editable in downstream vector tools; the Quiver app evidence does not establish an in-canvas path editor and this dossier does not invent one.

The [hosted MCP](https://docs.quiver.ai/app/mcp) uses account-scoped OAuth. It can list Gallery creations retrieve exact SVG content and PNG previews start up to sixteen candidates and poll a durable task ID. Animation operates on an existing creation or supplied SVG when enabled. Public Codex and Cursor plugins merely configure this server and therefore remain components of the same product.

## Runtime boundary

The public API documents model selection generation and vectorization but not the proprietary Arrow implementation. Billing and availability are resolved against the same account and model catalog at runtime. QuiverAI is therefore architecture-level: its observable artifact and user lifecycle are strong while the decisive model and hosted persistence source are closed.

## Evidence

- [First-party product](https://quiver.ai/)
- [App and Gallery workflow](https://docs.quiver.ai/app)
- [SVG API contract](https://docs.quiver.ai/api-reference/introduction)
