# gNucleus

> Research status: **Architecture-level with source-backed validator evidence** · Last reviewed: **2026-08-12**

| Field | Value |
|---|---|
| Team | gNucleus AI · Sunnyvale California United States |
| Domain | industrial CAD generation simulation and optimization |
| Authority | feature-based parametric part or assembly with dimensions constraints history and mating relationships |
| Native delivery | SolidWorks Catia and FreeCAD paths plus STEP IGES STL and related neutral formats |
| Deployment | hosted workspace API dedicated fine-tuned models or private cloud |

## Geometry alone cannot pass

The CAD agent accepts text images DXF PDF or spreadsheet-like structured input and produces editable parts or assemblies. Native outputs preserve modeling history so an engineer can change dimensions features and constraints in the target CAD system. Assembly generation includes component structure and mating constraints rather than only a fused mesh.

The larger agent suite separates specification CAD simulation and optimization roles. A specification agent states parameters and engineering constraints; the CAD agent builds; simulation agents execute through major CAE tools; optimization interprets results and proposes another design decision. Enterprise customers can fine-tune models on proprietary CAD data and serve them through private endpoints.

## Deterministic evaluation closes an important loophole

gNucleus published `freecad-validator` as a programmatic grader. It rebuilds generated FreeCAD parts and scores both geometry similarity and CAD/spec consistency. The final score uses a harmonic mean so visually correct geometry cannot compensate for ignored parametric intent and a syntactically plausible specification cannot compensate for the wrong solid.

```text
design specification -> feature-based CAD -> kernel rebuild
        |                    |                 |
        +---- spec score ----+---- geometry score
                         harmonic verdict
```

The open validator is evidence for evaluation mechanics not the proprietary product implementation. The hosted model training agent orchestration and CAD writers remain closed.

## Primary evidence

- [gNucleus engineering AI platform](https://gnucleus.ai/)
- [gNucleus product documentation](https://gnucleus.ai/docs/overview)
- [Deterministic FreeCAD validator release](https://www.gnucleus-ai.cn/cad-bench/news/freecad-validator)
- [gNucleus team](https://gnucleus.ai/about)
- [Sunnyvale contact address](https://gnucleus.ai/contact)
