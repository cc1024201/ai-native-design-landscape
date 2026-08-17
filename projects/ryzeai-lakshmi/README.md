# RyzeAI by Lakshmiprasanth

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

RyzeAI treats generated React source as a server-held sequence that can be modified by another model call or moved backward by version selection. Its version API is explicit even though the backing store is only process memory.

## Groq agents share a validation boundary

[orchestrator.ts](https://github.com/Lakshmiprasanthg/RyzeAI/blob/350bf47280937a70ee9ff4ff7cf422dff44141d1/lib/agents/orchestrator.ts) sequences planner, generator and explainer work. [generator.ts](https://github.com/Lakshmiprasanthg/RyzeAI/blob/350bf47280937a70ee9ff4ff7cf422dff44141d1/lib/agents/generator.ts) checks the returned component before it becomes current source rather than trusting a prose claim that generation succeeded.

## Modification creates another complete version

[modify/route.ts](https://github.com/Lakshmiprasanthg/RyzeAI/blob/350bf47280937a70ee9ff4ff7cf422dff44141d1/app/api/modify/route.ts) sends the current code and requested change back through the model. [version-store.ts](https://github.com/Lakshmiprasanthg/RyzeAI/blob/350bf47280937a70ee9ff4ff7cf422dff44141d1/lib/version-store.ts) records complete source states and the rollback route changes the active state. Restarting the server erases that archive.

## Preview is intentionally narrower than compilation

[PreviewSandbox.tsx](https://github.com/Lakshmiprasanthg/RyzeAI/blob/350bf47280937a70ee9ff4ff7cf422dff44141d1/components/PreviewSandbox.tsx) evaluates the supported JSX subset for immediate feedback. It proves the selected version visually but is not a deployment pipeline.

## Evidence

- [Canonical repository](https://github.com/Lakshmiprasanthg/RyzeAI)
- [Inspected tree](https://github.com/Lakshmiprasanthg/RyzeAI/tree/350bf47280937a70ee9ff4ff7cf422dff44141d1)
- Commit: 350bf47280937a70ee9ff4ff7cf422dff44141d1
