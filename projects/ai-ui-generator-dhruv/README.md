# AI UI Generator by Dhruv Jain

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

Dhruv's generator divides design work into planning, source generation and explanation. Its strongest boundary is a small component vocabulary checked before the artifact can become a version.

## Gemini roles share one acceptance gate

[The orchestrator](https://github.com/dHrUV0121/AI-UI-Generator/blob/0705370711620e889f52a7bbf760980cfa088a41/src/lib/agents/orchestrator.ts) sequences planner, generator and explainer calls. Generated code is inspected against the registry and retried when unsupported components appear. The explanation describes the accepted artifact rather than acting as its authority.

## Browser state is the version graph

[useGeneratorStore](https://github.com/dHrUV0121/AI-UI-Generator/blob/0705370711620e889f52a7bbf760980cfa088a41/src/hooks/useGeneratorStore.ts) owns current code, direct edits and complete versions. Selecting a version replaces current source; persistence ends with the browser session because no durable project store is connected.

## Projection is assembled rather than deployed

[preview-builder.ts](https://github.com/dHrUV0121/AI-UI-Generator/blob/0705370711620e889f52a7bbf760980cfa088a41/src/lib/preview-builder.ts) wraps accepted source into a Blob iframe with the required runtime dependencies. That gives immediate visual evidence while export and hosted delivery remain outside this repository.

## Evidence

- [Canonical repository](https://github.com/dHrUV0121/AI-UI-Generator)
- [Inspected tree](https://github.com/dHrUV0121/AI-UI-Generator/tree/0705370711620e889f52a7bbf760980cfa088a41)
- Commit: 0705370711620e889f52a7bbf760980cfa088a41
