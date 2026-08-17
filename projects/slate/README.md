# Slate

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

Slate treats generator prompts as native filmmaking artifacts rather than disposable text. Its project graph connects a film bible, scenes, shots, cast, locations, props, looks, music and voices to structured prompt sections and the constraints of each target model.

## Locked intent survives both human and agent transforms

[`PromptEditor.tsx`](https://github.com/wassermanproductions/slate/blob/3bf1dfe610fe5db93fec6a156ed37483afcd4b14/src/renderer/src/components/PromptEditor.tsx) lets a user lock lines against transformation, mute material without deleting it and reshoot a selected span. Director notes, variants and alt takes append history rather than erasing the previous prompt. Continuity checks compare wardrobe, light, weather and geography across a scene, while target preflight checks duration, aspect, frame rate and character budget before compile.

[`projects.ts`](https://github.com/wassermanproductions/slate/blob/3bf1dfe610fe5db93fec6a156ed37483afcd4b14/src/main/projects.ts) persists plain JSON projects. The [MCP bridge](https://github.com/wassermanproductions/slate/blob/3bf1dfe610fe5db93fec6a156ed37483afcd4b14/mcp/slate-mcp.mjs) reads and writes that same live project and automatically versions prompt changes. A circled take can feed reality back into the project, so the authority is the governed shot history—not whichever generated output happened last.

## Evidence

- [Pinned repository](https://github.com/wassermanproductions/slate/tree/3bf1dfe610fe5db93fec6a156ed37483afcd4b14)
- [Project state store](https://github.com/wassermanproductions/slate/blob/3bf1dfe610fe5db93fec6a156ed37483afcd4b14/src/renderer/src/stores/project.ts)
- [Prompting research](https://github.com/wassermanproductions/slate/blob/3bf1dfe610fe5db93fec6a156ed37483afcd4b14/docs/prompting-research.md)
