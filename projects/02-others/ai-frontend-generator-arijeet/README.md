# AI Frontend Generator by Arijeet Priyadarshi

> Research status: **Source-level** · Lifecycle: **active-transition** · Last reviewed: **2026-08-12**

This generator makes its intermediate reasoning inspectable: intent, component retrieval, blueprint, generated code, validation report, and preview are separate tabs in one pipeline.

## Blueprint is the semantic hinge

[`anthropicClient.ts`](https://github.com/ArijeetPriyadarshi22/ai-frontend-generator/blob/558587d2d6fc3cd00bb7047fe58a21719b45d3c5/src/services/anthropicClient.ts) asks Claude first for structured intent and then for a typed blueprint grounded in the retrieved component names. Only the following call produces React/TypeScript.

## The UI reveals each transformation

[`usePipeline.ts`](https://github.com/ArijeetPriyadarshi22/ai-frontend-generator/blob/558587d2d6fc3cd00bb7047fe58a21719b45d3c5/src/hooks/usePipeline.ts) advances six explicit stages and preserves their outputs. [`ragService.ts`](https://github.com/ArijeetPriyadarshi22/ai-frontend-generator/blob/558587d2d6fc3cd00bb7047fe58a21719b45d3c5/src/services/ragService.ts) grounds the blueprint in the local registry.

## Validation is partly representational

The pipeline displays validation and a live component preview, but the pinned `usePipeline` source simulates some compiler checks with fixed pass messages. There is no durable project store. The working transformation is therefore retained while the maturity claim is bounded.

## Pinned evidence

- [Repository](https://github.com/ArijeetPriyadarshi22/ai-frontend-generator)
- [Inspected tree](https://github.com/ArijeetPriyadarshi22/ai-frontend-generator/tree/558587d2d6fc3cd00bb7047fe58a21719b45d3c5)
- Commit: `558587d2d6fc3cd00bb7047fe58a21719b45d3c5`
