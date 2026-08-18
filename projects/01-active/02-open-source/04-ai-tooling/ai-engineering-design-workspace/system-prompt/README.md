# System Prompt

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

System Prompt is a local browser workflow notebook for prompt, AI, Markdown and annotation nodes. Its distinctive choice is reactive node computation: users run any node and missing or dirty parents are resolved before results propagate downstream.

## A collection of workflows lives in local storage

The Zustand [workflow store](https://github.com/codyadam/system-prompt/blob/44a4a97256365bd58ea924588ea54327b313f400/lib/workflow-store.ts) persists named node/edge graphs under `workflow-storage`, supports JSON import, and strips transient loading and selection fields before saving. This is machine-local authority; there is no account or server record.

## Execution follows data dependency rather than screen order

`runNode` recursively requests dirty parents, orders parent inputs by canvas position, delegates typed work to [compute.ts](https://github.com/codyadam/system-prompt/blob/44a4a97256365bd58ea924588ea54327b313f400/lib/compute.ts), then starts connected children. Abort controllers, dirty flags, edge animation and node-local output make the correction loop visible.

## The local-first tradeoff

The product can preserve multiple workflows and import portable JSON, but it has no durable run log, collaboration, hosted deployment, or source-generation boundary. Its authority is the browser graph itself, and clearing site storage removes it.

## Pinned evidence

- [Repository](https://github.com/codyadam/system-prompt)
- [Inspected tree](https://github.com/codyadam/system-prompt/tree/44a4a97256365bd58ea924588ea54327b313f400)
- [React Flow surface](https://github.com/codyadam/system-prompt/blob/44a4a97256365bd58ea924588ea54327b313f400/components/workflow.tsx)
