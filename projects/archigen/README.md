# ArchiGen

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

ArchiGen is not being counted as a generic image generator. Its product claim is narrower and more consequential: turn an architectural brief into a structured system diagram that remains editable as a graph.

## JSON is the interchange, not the screenshot

The inspected application asks a model to produce a constrained JSON description of components and connections. That response is parsed into node and edge objects and projected into the canvas. The editable graph is therefore the working authority; the rendered diagram is a view of that authority. This is why ArchiGen belongs with agent-controllable architecture canvases rather than prompt-to-image tools.

## Generation, layout, and recovery are separate

The generation path first extracts architecture semantics, then applies graph layout and visual styling. Validation and fallback handling sit between model output and the canvas, so a malformed response does not become an unquestioned design. Once materialized, the user can reposition and inspect the result instead of being locked to a single raster output.

## What this implementation proves

The repository proves a real brief-to-graph control path and an editable visual result. It does not establish collaborative versioning, production infrastructure deployment, or a general enterprise-architecture repository. Those remain outside this product boundary.

## Pinned evidence

- Repository: [Adarshpuri1/Archmind](https://github.com/Adarshpuri1/Archmind)
- Inspected source tree: [`a8a7dc835c39fb22fef3094c7f619a7492930f6c`](https://github.com/Adarshpuri1/Archmind/tree/a8a7dc835c39fb22fef3094c7f619a7492930f6c)
- Immutable revision: [commit `a8a7dc8`](https://github.com/Adarshpuri1/Archmind/commit/a8a7dc835c39fb22fef3094c7f619a7492930f6c)
