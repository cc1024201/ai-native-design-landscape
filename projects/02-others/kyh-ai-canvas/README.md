# AI Canvas by Kaiyu Hsu

> Research status: **Source-level** · Last reviewed: **2026-08-12**

This AI Canvas is a forkable Next.js implementation rather than Nick Chadwick's similarly named desktop product. It gives an agent typed operations over text, frame and image blocks on an infinite canvas.

## The canvas is structured model context

[`schema.ts`](https://github.com/kyh/ai-canvas/blob/b8742ba87ac7332d04a5acf9863a577b39b28079/src/lib/schema.ts) and [`types.ts`](https://github.com/kyh/ai-canvas/blob/b8742ba87ac7332d04a5acf9863a577b39b28079/src/lib/types.ts) define blocks and project state. [`canvas-context.ts`](https://github.com/kyh/ai-canvas/blob/b8742ba87ac7332d04a5acf9863a577b39b28079/src/lib/canvas-context.ts) serializes the relevant spatial state for the agent; [`assistant-schemas.ts`](https://github.com/kyh/ai-canvas/blob/b8742ba87ac7332d04a5acf9863a577b39b28079/src/lib/assistant-schemas.ts) constrains returned operations.

The editor applies those operations to the same block graph a human selects and moves. A local-storage hook supplies browser recovery, while the implementation can be forked to replace provider or persistence layers.

```text
canvas blocks -> structured context -> Eve agent
             <- typed operations   <- agent
             -> local persistence / export
```

## Infrastructure record

This census entry represents a working AI visual-editor starter, not every downstream deployment. A downstream product needs its own team, user loop and authority before it is counted separately.

Pinned revision: [`b8742ba`](https://github.com/kyh/ai-canvas/commit/b8742ba87ac7332d04a5acf9863a577b39b28079). No license file was present. The deployed demo is public, but the maintainer profile's location “online” is not regional evidence.

## Decisive sources

- [Repository README](https://github.com/kyh/ai-canvas/blob/b8742ba87ac7332d04a5acf9863a577b39b28079/README.md)
- [Canvas editor tree](https://github.com/kyh/ai-canvas/tree/b8742ba87ac7332d04a5acf9863a577b39b28079/src/components/canvas)
- [Live demo](https://canvas.kyh.io)
