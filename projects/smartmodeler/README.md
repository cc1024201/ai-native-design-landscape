# SmartModeler

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

SmartModeler is a QGIS plugin for planning, editing, executing, and exporting geoprocessing models against QGIS's live Processing registry.

## Ask, Plan, and Act are separate states

AI or offline planning produces a typed Processing graph that must pass schema and local algorithm validation. A proposal remains inert until the user explicitly chooses to apply or run it.

## Runs freeze the model they execute

Execution uses an immutable snapshot, a topological background runner, one execution slot, cancellation, and temporary outputs. A result ledger records the exact algorithm outputs; undo proceeds only when current state still matches the expected post-run state.

## Interchange is deliberately plural

SmartModeler has bounded versioned JSON as its native format and can also export QGIS `.model3` files and runnable Python. Dirty-state tracking, Undo/Redo, and crash recovery protect direct graph editing rather than forcing all correction through a prompt.

## Pinned evidence

- Repository: [YusufEminoglu/planx-smartmodeler](https://github.com/YusufEminoglu/planx-smartmodeler)
- Inspected graph schema, Processing registry adapter, planner, apply gate, execution snapshots, runner, result ledger, undo checks, and exporters: [`3f526f94cdc27345b79e7ca0370fe910cba02d71`](https://github.com/YusufEminoglu/planx-smartmodeler/tree/3f526f94cdc27345b79e7ca0370fe910cba02d71)
- Immutable revision: [commit `3f526f9`](https://github.com/YusufEminoglu/planx-smartmodeler/commit/3f526f94cdc27345b79e7ca0370fe910cba02d71)
