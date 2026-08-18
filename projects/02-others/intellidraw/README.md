# IntelliDraw

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

IntelliDraw extends draw.io into a managed team workspace with multimodal generation and CRDT-backed collaboration.

## Several inputs converge on draw.io

Natural-language prompts, uploaded diagrams/images, PDFs, and text documents can become editable draw.io content. More than a dozen provider integrations vary the model, but the meaningful product boundary is the conversion into a normal canvas that users can inspect and change.

## Collaboration is a separate subsystem

Yjs-backed shared state, team spaces, and the embedded draw.io editor distinguish concurrent work from AI generation. Model reasoning display can explain a request path, while CRDT mechanics handle edits to shared document state; neither substitutes for the other.

## Recognition and generation carry provenance risk

An image or PDF is interpreted before it becomes XML, so a visually similar result may omit relationships or text. Team history and collaboration make correction possible but do not certify the conversion. Exported draw.io documents remain the portable recovery boundary.

## Pinned evidence

- Repository: [wangfenghuan/ai-draw-io-fronted](https://github.com/wangfenghuan/ai-draw-io-fronted)
- Inspected platform source: [`03fbb52c51cdbec652651fb372d0a9ec18306c48`](https://github.com/wangfenghuan/ai-draw-io-fronted/tree/03fbb52c51cdbec652651fb372d0a9ec18306c48)
- Immutable revision: [commit `03fbb52`](https://github.com/wangfenghuan/ai-draw-io-fronted/commit/03fbb52c51cdbec652651fb372d0a9ec18306c48)
