# MerchMate AI

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-13**

MerchMate represents a different definition of Design from app builders: it is a constrained product-mockup and image-editing loop. Users upload a logo or image, choose a garment or write an edit instruction, inspect the generated bitmap and download the result.

## The output image is the only durable artifact

Pinned revision: `6f573c69f7e5f6937c7fcf53fc7d248017c3ed2a`.

The client sends base64 image material and a prompt to a backend proxy. The proxy invokes Gemini image generation and returns a result image. `ResultPreview` displays that returned data and creates a PNG download. Merch Studio can issue multiple product requests, but each response remains an independent raster result.

## Editing means regeneration, not layer mutation

Magic Editor accepts another natural-language transformation, but the source exposes no layer graph, mask history or parameter ledger. There is no saved project, version restore or source-format export. The ordinary loop is therefore deliberately described as candidate image generation and selection, not as a Photoshop-like editor.

## Pinned evidence

- [Repository](https://github.com/syu213/merchmate)
- [Gemini proxy client](https://github.com/syu213/merchmate/blob/6f573c69f7e5f6937c7fcf53fc7d248017c3ed2a/services/geminiService.ts)
- [Result projection and PNG download](https://github.com/syu213/merchmate/blob/6f573c69f7e5f6937c7fcf53fc7d248017c3ed2a/components/ResultPreview.tsx)
- [Product modes](https://github.com/syu213/merchmate/blob/6f573c69f7e5f6937c7fcf53fc7d248017c3ed2a/README.md)
