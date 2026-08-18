# OpenCAD

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

OpenCAD is a modular CAD-as-code stack with a core geometry kernel, constraint and feature-tree model, LLM agent service, backend API and separately published React/Three viewport. Its package boundaries let headless scripts and agents use the model without importing the Web service or UI.

## A recoverable feature DAG is the design authority

Fluent Python calls append feature nodes, named parameters and profile ordering to an in-memory graph. The OCCT backend materializes STEP or STL and turntable renders; the analytic backend can validate tree logic but cannot create deliverable geometry. The agent service generates and executes OpenCAD Python and returns both code and the updated tree.

A versioned CAID JSON artifact exposes named parameters and simulation tags. SimCorrect can return a structured patch against those names, which OpenCAD applies to the model instead of accepting an opaque corrected mesh. That cross-product contract is independently documented and tested.

- [Pinned repository](https://github.com/caid-technologies/OpenCAD/tree/9ad7a3e5952007049200de0f88b11a266c8630dc)
- [Design-artifact implementation](https://github.com/caid-technologies/OpenCAD/blob/9ad7a3e5952007049200de0f88b11a266c8630dc/packages/opencad/src/opencad/design_artifact.py)
- [Agent runtime bridge](https://github.com/caid-technologies/OpenCAD/blob/9ad7a3e5952007049200de0f88b11a266c8630dc/packages/opencad-agent/src/opencad_agent/runtime_bridge.py)
- [Organization profile checked; no location published](https://github.com/caid-technologies)
