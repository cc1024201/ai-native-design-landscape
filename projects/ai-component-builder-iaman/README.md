# AI Component Builder by Aman Raj

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

Here the provider wrapper and the visual authority are unusually easy to trace. Gemini returns one component string; the browser holds that string and injects it into an isolated document.

[`gemini.ts`](https://github.com/iaman08/AI-component-builder/blob/457dc2287b3a0c060923556891cb7ba3c76f69ee/src/services/gemini.ts) owns the model selection, prompt envelope and empty-response failure path. [`App.tsx`](https://github.com/iaman08/AI-component-builder/blob/457dc2287b3a0c060923556891cb7ba3c76f69ee/src/App.tsx) cleans the output, exposes the source and constructs the iframe preview.

The API-key label still says OpenAI while the implementation calls Gemini; that UI inconsistency does not change the source-traced provider. There is no persistence or versioning beyond browser state.

## Evidence

- [Canonical repository](https://github.com/iaman08/AI-component-builder)
- [Inspected commit](https://github.com/iaman08/AI-component-builder/commit/457dc2287b3a0c060923556891cb7ba3c76f69ee)
- Commit: `457dc2287b3a0c060923556891cb7ba3c76f69ee`
