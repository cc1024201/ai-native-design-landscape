# D2 Canvas

> Research status: **Source-level** · Lifecycle: **active-transition** · Last reviewed: **2026-08-12**

D2 Canvas is a local diagram editor whose human canvas and agent API meet at D2 source. It is not a generic agent-workflow canvas: the durable thing being designed is a diagram that can be imported and exported as `.d2`.

## D2 text is the interchange authority

The editor keeps a draggable node-and-edge state for direct manipulation. [`main.ts`](https://github.com/ArisMontclair/d2-canvas/blob/8e1113e03a8eccea4dcddb5b33c30f8a20686239/src/main.ts) parses edited D2 text into that graph and regenerates D2 after canvas changes. [`d2-engine.ts`](https://github.com/ArisMontclair/d2-canvas/blob/8e1113e03a8eccea4dcddb5b33c30f8a20686239/src/d2-engine.ts) renders a live SVG preview through the D2 WebAssembly engine.

```text
import or type D2 -> parse -> draggable graph -> regenerate D2
                         \-> WASM SVG preview
external agent -> HTTP/WebSocket D2 write -> same editor path
```

The agent bridge in [`server/index.ts`](https://github.com/ArisMontclair/d2-canvas/blob/8e1113e03a8eccea4dcddb5b33c30f8a20686239/server/index.ts) exposes current code over `GET /api/code`, accepts replacement code over `POST /api/code`, broadcasts it to connected canvases and can render D2 to SVG. That makes the API a real mutation surface rather than a screenshot attachment.

## Persistence boundary

The bridge's `currentCode` is process memory. Durable recovery depends on importing or exporting the `.d2` file; there is no evidenced version graph or database. A valid acceptance check therefore has to round-trip canvas edits through exported D2 and reopen it rather than treating the live preview as persistence.

The pinned repository has one small source snapshot and no license file. No reliable maintainer-region evidence was found.

## Decisive evidence

- [Pinned repository](https://github.com/ArisMontclair/d2-canvas/tree/8e1113e03a8eccea4dcddb5b33c30f8a20686239)
- [Parser](https://github.com/ArisMontclair/d2-canvas/blob/8e1113e03a8eccea4dcddb5b33c30f8a20686239/src/d2-parser.ts) and [code generator](https://github.com/ArisMontclair/d2-canvas/blob/8e1113e03a8eccea4dcddb5b33c30f8a20686239/src/d2-codegen.ts)
- [Canvas state](https://github.com/ArisMontclair/d2-canvas/blob/8e1113e03a8eccea4dcddb5b33c30f8a20686239/src/canvas.ts)
