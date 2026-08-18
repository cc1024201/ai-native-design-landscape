# Design Pro

> Research status: **Source-level** · Last reviewed: **2026-08-12**

Design Pro is a useful size-control case. The entire product fits in one HTML file, but it still has a richer artifact contract than many larger “AI designer” landing pages: the user edits a layer model, can undo and redo changes, and can export the project model for recovery.

## One file contains four distinct layers

Pinned commit [`fbac2f5`](https://github.com/Onimix/designpro/commit/fbac2f5216cabcf4e85403de80c72f7474bbb5cc) implements the product in [`index.html`](https://github.com/Onimix/designpro/blob/fbac2f5216cabcf4e85403de80c72f7474bbb5cc/index.html):

1. the canvas and layer editor support selection, drag, resize, rotate and stacking;
2. a bounded history stack supplies more than fifty undo/redo steps;
3. an AutoGPT-style assistant turns intent into a plan and editor actions through a user-supplied OpenAI-compatible endpoint;
4. PNG/JPG/SVG are delivery projections while JSON is the recoverable project representation.

The ordinary journey is therefore prompt or direct authoring → inspect layers → adjust on canvas → undo/refine → export image or JSON. An exported raster is not treated as the only surviving state.

## Why size does not lower the evidence bar

The source is directly inspectable and the artifact path is explicit, so this record reaches source-level evidence even though it has no framework or server. Conversely, the repository has no license file; “source-level” does not grant downstream reuse rights. There is no server-side account or collaboration path to infer, and the review found no reliable team-region evidence.

## Product boundary

Design Pro is an independent implementation and not a new surface of PosterMyWall or Gemini. Those names describe its comparison target and model provider. The repository owner and deployed product remain the counted lineage.

## Decisive sources

- [Repository](https://github.com/Onimix/designpro)
- [Pinned implementation](https://github.com/Onimix/designpro/blob/fbac2f5216cabcf4e85403de80c72f7474bbb5cc/index.html)
- [Live deployment](https://designpro-nu.vercel.app)
