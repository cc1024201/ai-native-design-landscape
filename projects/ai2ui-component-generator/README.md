# AI2UI Component Generator

> Research status: **Source-level** · Lifecycle: **historical** · Last reviewed: **2026-08-12**

AI2UI is a small prompt-to-component workspace whose real artifact is generated HTML held in the browser conversation. It is not a native design graph: the rendered component is a projection of that source and export creates a second code representation.

## Streaming is the creation protocol

[`generate.ts`](https://github.com/yuvalsuede/ai-component-generator/blob/a4d29eb5cc28745096aa4ca964f1831bc7fd9bbd/pages/api/generate.ts) asks the model for implementation markup and returns a streamed response. [`useChatGPT.ts`](https://github.com/yuvalsuede/ai-component-generator/blob/a4d29eb5cc28745096aa4ca964f1831bc7fd9bbd/hooks/useChatGPT.ts) accumulates that response into the local conversation instead of writing a repository or provider-hosted project.

## One answer has two projections

[`index.tsx`](https://github.com/yuvalsuede/ai-component-generator/blob/a4d29eb5cc28745096aa4ca964f1831bc7fd9bbd/pages/index.tsx) places the generated result in an inline visual panel while retaining prompt history for another turn. [`export-code.ts`](https://github.com/yuvalsuede/ai-component-generator/blob/a4d29eb5cc28745096aa4ca964f1831bc7fd9bbd/pages/api/export-code.ts) asks the model to translate the accepted HTML into a selected framework. That export is a materialization step rather than continued editing of the same artifact.

No durable project store or version graph is present at the inspected commit. The record is historical because the pinned source has not shown a maintained product transition since 2024.

## Pinned evidence

- [Canonical repository](https://github.com/yuvalsuede/ai-component-generator)
- [Inspected tree](https://github.com/yuvalsuede/ai-component-generator/tree/a4d29eb5cc28745096aa4ca964f1831bc7fd9bbd)
- Commit: `a4d29eb5cc28745096aa4ca964f1831bc7fd9bbd`
