# PRISM

> Research status: **Source-level** · Lifecycle: **active-transition** · Last reviewed: **2026-08-12**

PRISM is a cinematic 3D website studio hidden beneath the repository's `prism/` subtree. It translates a brief through specialist agents into a validated Scene IR which can be inspected previewed regenerated at scene granularity and compiled into a self-contained Next.js project.

## The agent pipeline converges on an IR

[`pipeline.ts`](https://github.com/trillion6/Prism-prompt-to-ui/blob/e20613bfaedba49e61cfa69d35e24d992ef4a45d/prism/packages/agents/src/pipeline.ts) runs planner art-director composer choreographer and critic roles. RAG references inform art direction while each later stage emits bounded JSON. The pipeline sanitizes identifiers clamps timeline ranges and validates the assembled result before the UI receives an `ir_complete` event.

## Scene IR owns design intent

[`schema.ts`](https://github.com/trillion6/Prism-prompt-to-ui/blob/e20613bfaedba49e61cfa69d35e24d992ef4a45d/prism/packages/ir/src/schema.ts) constrains palette typography camera lights materials approved scene primitives content motion triggers and performance budgets. The studio exposes this graph beside preview and agent events. It is substantially richer than a generated screenshot or raw code blob.

## Correction targets a scene without discarding the graph

[`regenerate-scene/route.ts`](https://github.com/trillion6/Prism-prompt-to-ui/blob/e20613bfaedba49e61cfa69d35e24d992ef4a45d/prism/apps/studio/src/app/api/regenerate-scene/route.ts) receives the full current IR a stable scene ID and optional direction then replaces only that scene and revalidates the whole document. This provides an identity-preserving correction interface even though the pinned UI does not yet expose arbitrary direct manipulation.

## Compilation is a governed handoff

The [`compiler`](https://github.com/trillion6/Prism-prompt-to-ui/blob/e20613bfaedba49e61cfa69d35e24d992ef4a45d/prism/packages/compiler/src/index.ts) enforces desktop performance budgets derives a degraded mobile variant and generates layout pages scene components timelines and styles. [`export/route.ts`](https://github.com/trillion6/Prism-prompt-to-ui/blob/e20613bfaedba49e61cfa69d35e24d992ef4a45d/prism/apps/studio/src/app/api/export/route.ts) validates the IR again and packages generated files with the full primitive implementation.

## Maturity boundary

The current studio keeps IR in client memory and labels its code tab as a later WebContainers phase even though ZIP export exists. No durable project database or version graph is present. The record therefore captures a working authoring kernel in transition rather than a finished hosted platform.

## Pinned evidence

- [Repository](https://github.com/trillion6/Prism-prompt-to-ui)
- [Inspected tree](https://github.com/trillion6/Prism-prompt-to-ui/tree/e20613bfaedba49e61cfa69d35e24d992ef4a45d)
- [Studio entry point](https://github.com/trillion6/Prism-prompt-to-ui/blob/e20613bfaedba49e61cfa69d35e24d992ef4a45d/prism/apps/studio/src/app/page.tsx)
- Commit: `e20613bfaedba49e61cfa69d35e24d992ef4a45d`
