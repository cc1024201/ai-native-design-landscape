# Tessra

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

Tessra defines agent design as packaging: persona, model, memory, skills and an ordered runbook are composed visually and exported together as a portable agent directory.

## The canvas edits a typed draft

[App.tsx](https://github.com/ayush-that/openagents-project/blob/8f71343cc35e26b9f2b425fe7554a8be6b892ba0/src/App.tsx) maps base blocks and skill packs into React Flow nodes while maintaining the underlying AgentDraft. Geometry helps composition, but persona and runbook semantics remain typed fields rather than arbitrary node labels.

## Export promotes a draft into authority

[agentPackage.ts](https://github.com/ayush-that/openagents-project/blob/8f71343cc35e26b9f2b425fe7554a8be6b892ba0/src/agentPackage.ts) creates a versioned manifest and emits agent.json, SOUL.md, MEMORY.md, workflow.json and skill Markdown. That downloadable package is the runtime-ready handoff; the browser canvas itself is not persisted as a hosted project.

## Execution boundary

The starter package points at 0G-compatible compute and storage contracts, but this repository primarily authors and exports. It does not prove that every exported skill is deployed or that the canvas observes a live run.

## Pinned evidence

- [Repository](https://github.com/ayush-that/openagents-project)
- [Inspected tree](https://github.com/ayush-that/openagents-project/tree/8f71343cc35e26b9f2b425fe7554a8be6b892ba0)
- [Agent types](https://github.com/ayush-that/openagents-project/blob/8f71343cc35e26b9f2b425fe7554a8be6b892ba0/src/types.ts)
