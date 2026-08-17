# CICADA

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

CICADA is a collaborative intelligent CAD automation agent built around executable CodeCAD. It joins goal refinement, build123d-oriented code generation, geometry execution, multi-view snapshots and visual feedback in a configurable workflow.

## Code, kernel and snapshots have separate roles

`codecad_agent.py` orchestrates the task. The coding layer generates and executes source; retrieval grounds the agent in build123d documentation. Geometry utilities convert results and produce snapshots from multiple viewpoints. Visual-feedback and QA modules compare those renders with the refined design goal and issue corrections.

Source code preserves editable construction intent, while the CAD kernel decides whether it forms valid geometry. Snapshot sets are observation artifacts keyed to a generated model, not a replacement for that model. This separation lets a failed view trigger source repair without pretending that image similarity establishes precise dimensions or topology.

## Configurable feedback does not imply automatic acceptance

Model, prompt and workflow YAML files make describer, coder, feedback and judge roles replaceable. The feedback judge can stop or continue the loop, but downstream engineering checks remain necessary for manufacturability and fit.

## Evidence boundary

The repository exposes Python modules and sample configurations. Its examples establish an operable research framework, not a PDM system, constraint solver with durable feature identity, or production release workflow.

- [Pinned CICADA revision](https://github.com/Oaklight/cicada/tree/fdb21ecbe91d368caa3ba7dcdf749fa901a1e1e6)
- [CodeCAD workflow agent](https://github.com/Oaklight/cicada/blob/fdb21ecbe91d368caa3ba7dcdf749fa901a1e1e6/src/cicada/workflow/codecad_agent.py)
- [Multi-view snapshot pipeline](https://github.com/Oaklight/cicada/blob/fdb21ecbe91d368caa3ba7dcdf749fa901a1e1e6/src/cicada/geometry_pipeline/snapshots.py)
- [Visual feedback implementation](https://github.com/Oaklight/cicada/blob/fdb21ecbe91d368caa3ba7dcdf749fa901a1e1e6/src/cicada/feedback/visual_feedback.py)
