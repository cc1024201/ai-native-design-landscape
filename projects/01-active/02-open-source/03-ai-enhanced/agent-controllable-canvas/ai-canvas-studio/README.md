# AI Canvas Studio

> Research status: **Source-level** · Lifecycle: **active-transition** · Last reviewed: **2026-08-12**

AI Canvas Studio combines direct image composition with Gemini-based generation/editing. Uploaded and generated media become canvas items with position, scale and stacking state; the user can continue arranging the composition instead of accepting one generated frame.

## Browser canvas authority

[`CanvasContext.tsx`](https://github.com/ancs21/ai-canvas-studio/blob/c1a453fff49c35446dc0f89f1948fd8a895ed46e/src/contexts/CanvasContext.tsx) owns selected items and mutations. [`gemini-service.ts`](https://github.com/ancs21/ai-canvas-studio/blob/c1a453fff49c35446dc0f89f1948fd8a895ed46e/src/lib/gemini-service.ts) supplies generation/edit operations; upload and R2 helpers handle external media; download utilities project accepted results.

```text
uploads + prompt -> Gemini result -> canvas item
canvas items -> select / arrange / compose -> download
```

The model does not own a separate project graph. Its outputs enter the same state container as manual uploads.

## Evidence and maturity

Pinned revision: [`c1a453f`](https://github.com/ancs21/ai-canvas-studio/commit/c1a453fff49c35446dc0f89f1948fd8a895ed46e). The repository is MIT-licensed, but development is a short hackathon-era snapshot and no durable server-side project/history model is evidenced, so lifecycle is active-transition. The generated-media API was not exercised and the maintainer profile does not provide usable region evidence.

## Decisive sources

- [Repository README](https://github.com/ancs21/ai-canvas-studio/blob/c1a453fff49c35446dc0f89f1948fd8a895ed46e/README.md)
- [Application source](https://github.com/ancs21/ai-canvas-studio/tree/c1a453fff49c35446dc0f89f1948fd8a895ed46e/src)
- [MIT license](https://github.com/ancs21/ai-canvas-studio/blob/c1a453fff49c35446dc0f89f1948fd8a895ed46e/LICENSE)
