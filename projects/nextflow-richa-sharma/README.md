# NextFlow by Richa Sharma

> Research status: **Source-level** · Lifecycle: **active-transition** · Last reviewed: **2026-08-12**

NextFlow is a minimal two-node visual experiment: text nodes provide prompts, LLM nodes call Gemini, and edges select the prompt that each model node receives. It is useful precisely because its implemented semantics are much narrower than a general workflow engine.

## The canvas directly selects model input

[Canvas.tsx](https://github.com/Richasharma03/AI-WORKFLOW-BUILDER/blob/a64dfb366b6b84e4fd91389cd274607d1c188316/components/Canvas.tsx) retains nodes and edges in React state. When the user runs the graph, every LLM node looks up its first incoming edge, reads the connected text node and posts that prompt to the server route; the returned model text is written back into the LLM node.

## The model call is real, the workflow engine is not general

[route.ts](https://github.com/Richasharma03/AI-WORKFLOW-BUILDER/blob/a64dfb366b6b84e4fd91389cd274607d1c188316/app/api/ai/route.ts) invokes Gemini and returns its generated content. However, execution does not topologically traverse chained LLM nodes, propagate prior outputs, persist graphs or retain runs. Multiple LLM nodes execute independently from their first connected text source.

## Why it remains in the map

The ordinary-user loop is still closed: a visible connection determines a real model request and its output returns to the artifact. It is classified as an active transition so the map records this smallest viable graph-to-model pattern without crediting it with n8n-style orchestration.

## Pinned evidence

- [Repository](https://github.com/Richasharma03/AI-WORKFLOW-BUILDER)
- [Inspected tree](https://github.com/Richasharma03/AI-WORKFLOW-BUILDER/tree/a64dfb366b6b84e4fd91389cd274607d1c188316)
- [LLM node](https://github.com/Richasharma03/AI-WORKFLOW-BUILDER/blob/a64dfb366b6b84e4fd91389cd274607d1c188316/components/nodes/LLMNode.tsx)
