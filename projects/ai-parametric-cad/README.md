# AI Parametric CAD Generator

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

AI Parametric CAD Generator is a small offline system for translating natural-language component requests into CadQuery/OpenCascade solids. Its scope is narrow and template-oriented, but the complete prompt-to-engineering-artifact path is implemented.

## Validation is bounded but real

[`mcp_orchestrator.py`](https://github.com/ZAKPRO786/Ai_parametric_cad/blob/4dd698049a4c95649a3c7d21936d01154e1c0816/mcp_orchestrator.py) routes a prompt through planning, parsing, parameter validation, CAD building and geometry analysis. Schema and rule files constrain supported components and dimensions; feature builders use CadQuery. The geometry agent currently checks only solid count, so it detects invalid/multiple-body outcomes but not rich manufacturability.

```text
prompt -> structured parameters -> validation -> CadQuery features
-> OpenCascade solid -> solid-count report + Plotly view -> STEP / STL
```

The dossier does not elevate the README's multi-agent naming into stronger assurance than the source provides. It is an early bounded generator, not a general autonomous CAD engineer. Region remains unknown.

## Evidence

- [Pinned repository](https://github.com/ZAKPRO786/Ai_parametric_cad/tree/4dd698049a4c95649a3c7d21936d01154e1c0816)
- [Orchestration path](https://github.com/ZAKPRO786/Ai_parametric_cad/blob/4dd698049a4c95649a3c7d21936d01154e1c0816/mcp_orchestrator.py)
- [CAD generator](https://github.com/ZAKPRO786/Ai_parametric_cad/blob/4dd698049a4c95649a3c7d21936d01154e1c0816/cad/generator.py)
- [Geometry validation boundary](https://github.com/ZAKPRO786/Ai_parametric_cad/blob/4dd698049a4c95649a3c7d21936d01154e1c0816/agents/geometry_agent.py)
