# AI-Powered UI Component Generator by Ryan

> Research status: **Source-level** · Lifecycle: **active-transition** · Last reviewed: **2026-08-12**

This builder couples a multimodal chat with an editable source canvas. Its important technical choice is to bundle arbitrary generated React locally before placing it in an iframe instead of relying on a fixed component renderer.

## Image understanding is upstream context

[`page.tsx`](https://github.com/sfyr111/AIComponentBuilder/blob/41a00627142dffc3f36b2d9afe9f4b3243396b6b/app/page.tsx) can send a text brief directly or first ask an ARK vision model to describe an uploaded design. The resulting description becomes context for the same streamed code request. [`chat/route.ts`](https://github.com/sfyr111/AIComponentBuilder/blob/41a00627142dffc3f36b2d9afe9f4b3243396b6b/app/api/chat/route.ts) exposes an OpenAI-compatible DeepSeek stream and the client promotes complete fenced React code into editable canvas state.

## The preview consumes the edited source

[`sandbox-iframe.tsx`](https://github.com/sfyr111/AIComponentBuilder/blob/41a00627142dffc3f36b2d9afe9f4b3243396b6b/components/canvas/sandbox-iframe.tsx) debounces the current source, bundles it with browser-side esbuild and writes a self-contained document to the iframe. Edits in the code panel therefore immediately replace the projected artifact. Chat and source are session state at the pinned commit; no durable project or version store is claimed.

## Evidence

- [Canonical repository](https://github.com/sfyr111/AIComponentBuilder)
- [Inspected tree](https://github.com/sfyr111/AIComponentBuilder/tree/41a00627142dffc3f36b2d9afe9f4b3243396b6b)
- [Live product](https://ai-component-builder-xi.vercel.app/)
- Commit: `41a00627142dffc3f36b2d9afe9f4b3243396b6b`
