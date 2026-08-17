# Resonance AI

> Research status: **Source-level** · Lifecycle: **active proof of concept** · Last reviewed: **2026-08-12**

Resonance AI joins text-to-CAD with structural simulation. Its narrow but complete proposition is not just “generate a shape”: create a validated engineering model, inspect a 3D projection, mesh it, run modal analysis and compare design alternatives.

## A validated CAD schema crosses the generation–analysis boundary

[`agent_schema.py`](https://github.com/sjchem/resonance-AI/blob/0b59062b3ca02e8b2ccbaaa22ff31ececa910258/text_to_cad/agent_schema.py) constrains agent output before [`cad_executor.py`](https://github.com/sjchem/resonance-AI/blob/0b59062b3ca02e8b2ccbaaa22ff31ececa910258/text_to_cad/cad_executor.py) materializes geometry. The MCP server exposes those operations, and the preview path converts the same model for browser inspection.

The downstream pipeline converts STEP geometry to a mesh, calls CalculiX through a modal solver, and supports design-of-experiments/surrogate exploration. This makes engineering constraints part of the correction loop. The repository calls itself a proof of concept, so production readiness is not inferred.

The maintainer's first-party profile identifies Lisbon, supporting a Portugal assignment.

## Evidence

- [Pinned repository](https://github.com/sjchem/resonance-AI/tree/0b59062b3ca02e8b2ccbaaa22ff31ececa910258)
- [CAD preview](https://github.com/sjchem/resonance-AI/blob/0b59062b3ca02e8b2ccbaaa22ff31ececa910258/backend/app/cad_preview.py)
- [STEP-to-mesh path](https://github.com/sjchem/resonance-AI/blob/0b59062b3ca02e8b2ccbaaa22ff31ececa910258/geometry/step_to_mesh.py)
- [Modal solver](https://github.com/sjchem/resonance-AI/blob/0b59062b3ca02e8b2ccbaaa22ff31ececa910258/simulate/modal_solver.py)
- [Maintainer profile](https://github.com/sjchem)
