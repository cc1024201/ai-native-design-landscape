# TractStack

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

TractStack is an adaptive web-publishing system. Its Design surface combines prompt-created sections with a direct node compositor, then uses visitor beliefs and context to choose which authored page fragments to present.

## AI creates into the same node tree humans edit

[`AiDesignStep.tsx`](https://github.com/AtRiskMedia/astro-tractstack/blob/85d02f0d26be266cf047a84415b3e766e7071387/templates/src/components/edit/pane/steps/AiDesignStep.tsx) routes standard, creative and refinement paths. The result is not left as an image or chat attachment: it becomes a pane in the compositor's typed node store, with editable text, assets, links, layout and HTML-AST metadata.

[`Compositor.tsx`](https://github.com/AtRiskMedia/astro-tractstack/blob/85d02f0d26be266cf047a84415b3e766e7071387/templates/src/components/compositor/Compositor.tsx) renders and selects that graph. Direct edits become reversible patches in [`nodesHistory.ts`](https://github.com/AtRiskMedia/astro-tractstack/blob/85d02f0d26be266cf047a84415b3e766e7071387/templates/src/stores/nodesHistory.ts); the history buffer coalesces a burst of changes into one thought-sized undo unit. Save is explicit and warns before navigation with unsaved changes.

```text
prompt/library/manual composition -> editable pane/node graph
-> bounded undo/redo -> explicit save -> published Astro surface
-> contextual belief matching chooses presentation at runtime
```

The persisted node graph is the authoring authority. Rendered HTML is the delivery surface; short-lived visitor session continuity is a personalization concern and should not be confused with authoring version history. This architecture defines Design partly as adaptive communication rather than a fixed page alone.

The project is MIT-licensed. The maintainer profile reports Toronto, Canada.

## Pinned evidence

- [Repository](https://github.com/AtRiskMedia/astro-tractstack/tree/85d02f0d26be266cf047a84415b3e766e7071387)
- [Node store](https://github.com/AtRiskMedia/astro-tractstack/blob/85d02f0d26be266cf047a84415b3e766e7071387/templates/src/stores/nodes.ts)
- [Creative refinement step](https://github.com/AtRiskMedia/astro-tractstack/blob/85d02f0d26be266cf047a84415b3e766e7071387/templates/src/components/edit/pane/steps/AiRefineDesignStep.tsx)
- [Save modal](https://github.com/AtRiskMedia/astro-tractstack/blob/85d02f0d26be266cf047a84415b3e766e7071387/templates/src/components/edit/state/SaveModal.tsx)
- [MIT license](https://github.com/AtRiskMedia/astro-tractstack/blob/85d02f0d26be266cf047a84415b3e766e7071387/LICENSE)
