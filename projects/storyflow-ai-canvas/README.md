# StoryFlow AI Canvas

> Research status: **Source-level** · Lifecycle: **active-transition** · Last reviewed: **2026-08-12**

StoryFlow is a client-only creative DAG. Text, image generation, editing, upscaling and background-removal nodes can be connected so output from one step becomes typed input to another.

## Connections encode the workflow

The browser owns node/edge state and all credentials remain in `localStorage`. The Gemini service executes model nodes; deterministic utilities handle compression, upscaling and background removal. Because connections remain editable, the user can branch, replace or rerun part of a story flow without recreating the entire sequence.

```text
text node -> image node -> edit node -> upscale/remove-bg
                  \-> alternate branch
```

Pinned commit [`be2c093`](https://github.com/luanluan-l/StoryFlow-AI-Canvas/commit/be2c0930dae6aeb0ce97845c52f171357628f8be) exposes:

- node/edge contracts in [`types.ts`](https://github.com/luanluan-l/StoryFlow-AI-Canvas/blob/be2c0930dae6aeb0ce97845c52f171357628f8be/types.ts);
- graph orchestration in [`App.tsx`](https://github.com/luanluan-l/StoryFlow-AI-Canvas/blob/be2c0930dae6aeb0ce97845c52f171357628f8be/App.tsx) and [`ConnectionLine.tsx`](https://github.com/luanluan-l/StoryFlow-AI-Canvas/blob/be2c0930dae6aeb0ce97845c52f171357628f8be/components/ConnectionLine.tsx);
- the [Gemini adapter](https://github.com/luanluan-l/StoryFlow-AI-Canvas/blob/be2c0930dae6aeb0ce97845c52f171357628f8be/services/geminiService.ts);
- deterministic media transforms under [`utils/`](https://github.com/luanluan-l/StoryFlow-AI-Canvas/tree/be2c0930dae6aeb0ce97845c52f171357628f8be/utils).

## Boundary

The MIT-licensed project is an early browser-only implementation. It has no evidenced account collaboration or server version history and is marked active-transition. Browser-local key storage is a user-controlled boundary but not a substitute for a secrets vault. Region remains unknown.

## Decisive sources

- [Repository README](https://github.com/luanluan-l/StoryFlow-AI-Canvas/blob/be2c0930dae6aeb0ce97845c52f171357628f8be/README.md)
- [MIT license](https://github.com/luanluan-l/StoryFlow-AI-Canvas/blob/be2c0930dae6aeb0ce97845c52f171357628f8be/LICENSE)
