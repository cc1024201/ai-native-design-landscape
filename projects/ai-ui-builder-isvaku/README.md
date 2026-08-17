# AI UI Builder by Rigoberto Quezada

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

This take-home implementation makes a typed model envelope and a persisted conversation the boundary between generative dialogue and visual UI authoring.

## The contract is stricter than the prompt

[`ai.service.ts`](https://github.com/isvaku/ai-ui-builder/blob/d4441cffd897dde28b14abcb7f9464f6535084bf/backend/src/ai/ai.service.ts) routes Anthropic, OpenAI or Google models through one streaming interface. Its system contract requires either a chat response or a `GeneratedPage` TSX payload in JSON. [`generate-ui.service.ts`](https://github.com/isvaku/ai-ui-builder/blob/d4441cffd897dde28b14abcb7f9464f6535084bf/backend/src/generate-ui/generate-ui.service.ts) buffers SSE output, parses the completed envelope and records the accepted message plus generated code.

## Persisted messages are revisions; the iframe is projection

[`conversation.repository.ts`](https://github.com/isvaku/ai-ui-builder/blob/d4441cffd897dde28b14abcb7f9464f6535084bf/backend/src/generate-ui/conversation.repository.ts) stores conversations and every generated-code message in PostgreSQL. The full history is then supplied to later corrections. [`PreviewRenderer.tsx`](https://github.com/isvaku/ai-ui-builder/blob/d4441cffd897dde28b14abcb7f9464f6535084bf/frontend/src/components/PreviewRenderer.tsx) compiles the selected TSX with Babel inside a script-only sandbox and communicates render success or failure through `postMessage`; it does not become the durable source itself.

## Evidence

- [Canonical repository](https://github.com/isvaku/ai-ui-builder)
- [Inspected tree](https://github.com/isvaku/ai-ui-builder/tree/d4441cffd897dde28b14abcb7f9464f6535084bf)
- Commit: `d4441cffd897dde28b14abcb7f9464f6535084bf`
