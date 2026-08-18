# TextoCAD

> Research status: **Architecture-level** · Last reviewed: **2026-08-12**

| Field | Value |
|---|---|
| Team | TextoCAD by GadiDokan Pvt. Ltd. · team region not established |
| Ordinary job | describe a mechanical part then adjust its parameters and hand it to engineering or printing tools |
| Authority | browser-side parametric CAD package with feature tree |
| Lifecycle | active |

## The generated result exposes dimensions and steps

TextoCAD turns a prompt into a browser model accompanied by parameter sliders and a feature tree. Users can change dimensions live and continue through an AI assistant before exporting. The preview is a projection of that parameterized model rather than the primary deliverable.

STEP transfers solid engineering geometry for continued CAD work; STL transfers a triangulated print representation and loses the feature-tree semantics. These outputs should therefore not be treated as equivalent copies of the hosted project.

`prompt → parametric package → sliders / feature history / chat → preview → STEP or STL`

The site also offers human CAD services but that service is not counted as a second product or as evidence of AI behavior. Public pages do not expose the parametric schema geometry kernel rebuild validation version history or whether STEP preserves named parameters.

## Primary evidence

- [TextoCAD editor and model contract](https://textocad.com/)
- [TextoCAD text-to-CAD workflow](https://textocad.com/text-to-cad)
