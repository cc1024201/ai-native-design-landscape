# MimoCanvas

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

MimoCanvas is a browser-based image and video production canvas in which prompts, media, generation settings, and outputs remain connected as an editable Vue Flow graph.

## Media lineage is visible

Text, configuration, image, and video nodes preserve how an output was produced. Connections carry prompts or media into later operations, so alternative models and branches can coexist instead of overwriting the last generation. The useful artifact is the repeatable pipeline as well as each rendered asset.

## Providers sit behind the workflow

Server routes invoke OpenAI-compatible generation services while the canvas orchestrator resolves dependencies and updates node results. Provider settings are locally configurable. Model output enters a user-controlled node rather than replacing the project, which keeps manual rewiring and parameter changes available after generation.

## Recovery is deliberately local

Projects, settings, canvas state, undo, and redo live in the browser-oriented application. This supports private iterative work without a required hosted account, but it is not evidence of server-side collaboration or durable multi-device history. Exported media and locally saved graphs are the demonstrated delivery and recovery surfaces.

## Pinned evidence

- Repository: [manyar-su/MimoCanvas](https://github.com/manyar-su/MimoCanvas)
- Inspected Vue and API source: [`169986acde90ed0c94665451dae15e9477dc7e32`](https://github.com/manyar-su/MimoCanvas/tree/169986acde90ed0c94665451dae15e9477dc7e32)
- Immutable revision: [commit `169986a`](https://github.com/manyar-su/MimoCanvas/commit/169986acde90ed0c94665451dae15e9477dc7e32)
