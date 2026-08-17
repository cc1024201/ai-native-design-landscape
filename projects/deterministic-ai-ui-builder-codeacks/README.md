# Deterministic AI UI Builder by codeacks

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

The model in this project plans a constrained UI graph; it does not get arbitrary DOM or Tailwind authority. A deterministic generator and renderer own how that graph becomes React.

## Incremental intent mutates UIPlan

[`planner.ts`](https://github.com/codeacks/AI-UI-Builder-/blob/938d07c0f78f6f542bb6183e3f0f2206a8037a6b/agent/planner.ts) combines current plan, action mode and user intent while distinguishing modify from regenerate. [`generator.ts`](https://github.com/codeacks/AI-UI-Builder-/blob/938d07c0f78f6f542bb6183e3f0f2206a8037a6b/agent/generator.ts) compiles only whitelisted components and validates the emitted representation.

## Replay reconstructs rather than stores a screenshot

[`PreviewRenderer.tsx`](https://github.com/codeacks/AI-UI-Builder-/blob/938d07c0f78f6f542bb6183e3f0f2206a8037a6b/components/PreviewRenderer.tsx) interprets UIPlan into fixed React components. [`versionStore.ts`](https://github.com/codeacks/AI-UI-Builder-/blob/938d07c0f78f6f542bb6183e3f0f2206a8037a6b/lib/versionStore.ts) retains version snapshots used for selection and replay. The plan remains the recoverable authority.

## Pinned source

- [Canonical repository](https://github.com/codeacks/AI-UI-Builder-)
- [Inspected tree](https://github.com/codeacks/AI-UI-Builder-/tree/938d07c0f78f6f542bb6183e3f0f2206a8037a6b)
- Commit: `938d07c0f78f6f542bb6183e3f0f2206a8037a6b`
