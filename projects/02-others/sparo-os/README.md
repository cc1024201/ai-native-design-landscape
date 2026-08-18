# Sparo OS

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

Sparo OS is a broader agentic desktop whose Product Apps are durable generated interfaces. It enters this census through first-class Design and PPT Live apps, not because every general agent task is Design.

## Product Apps are versioned runtime packages

The repository packages agent, bridge, runtime and surface components under independently versioned Product Apps. `builtin-design` supplies a named product/UI-design agent. PPT Live goes further: its [`app.json`](https://github.com/GCWing/Sparo-OS/blob/6b416d6177aa820cbf0be11eb689bf006ee1d9fb/bundles/product-apps/builtin-ppt-live/151.0.10/app.json) joins an agent, a runtime bridge and an interactive surface.

The PPT surface's [`ui.js`](https://github.com/GCWing/Sparo-OS/blob/6b416d6177aa820cbf0be11eb689bf006ee1d9fb/bundles/product-apps/builtin-ppt-live/151.0.10/components/surfaces/builtin-ppt-live-surface/source/ui.js) renders a slide tree, selects native nodes and sends edits with expected slide and visual revisions. The runtime owns deck/manuscript/design-package state; visual editing and the agent therefore meet on a revision-checked graph rather than exchanging screenshots.

The bundled Design agent, PPT Live and Remotion Live remain components of one Sparo OS product lineage. BitFun is counted separately because it is also distributed and usable as an independent product. No reliable team-region evidence was found.

## Evidence

- [Pinned repository](https://github.com/GCWing/Sparo-OS/tree/6b416d6177aa820cbf0be11eb689bf006ee1d9fb)
- [PPT runtime bridge](https://github.com/GCWing/Sparo-OS/tree/6b416d6177aa820cbf0be11eb689bf006ee1d9fb/bundles/product-apps/builtin-ppt-live/151.0.10/components/bridges/builtin-ppt-runtime)
- [Built-in Design product app](https://github.com/GCWing/Sparo-OS/tree/6b416d6177aa820cbf0be11eb689bf006ee1d9fb/bundles/product-apps/builtin-design/1.0.0)
