# EoStudio

> Research status: **Source-level** · Lifecycle: **active-transition** · Last reviewed: **2026-08-12**

EoStudio attempts a single design suite across UI, 3D, CAD, image, game, interior, simulation, database and hardware work. Its unifying artifact is a JSON `.EoStudio` project containing scenes, components, settings and metadata; editors and code/export paths consume that state.

## LLM output is validated into domain schemas

The [AI generator](https://github.com/embeddedos-org/EoStudio/blob/d85155a44c3d1537ccc8c191fc59098ef3492767/eostudio/core/ai/design_generator.py) requests bounded UI component trees, 3D scenes or CAD feature lists, fills required defaults and supports whole-spec refinement. [`project.py`](https://github.com/embeddedos-org/EoStudio/blob/d85155a44c3d1537ccc8c191fc59098ef3492767/eostudio/formats/project.py) serializes scenes and components and dispatches to SVG, OBJ, STL, glTF and DXF exporters.

```text
prompt -> validated UI / 3D / CAD JSON -> EoStudio project
-> domain editor + property changes -> saved project
-> code generator or geometry/file export
```

The UI editor has a component palette, grid canvas, properties and flow/code paths; other domain editors have different internal objects. This is a very broad early implementation, and many advanced README claims are thinner than the shared project and generator core. `active-transition` preserves that maturity distinction.

The search first found `xupeiwust/EoStudio`, whose README points to the actively maintained `embeddedos-org/EoStudio`; this dossier pins the latter once. It is MIT-licensed. The organization profile reports the United States.

## Sources

- [Canonical pinned repository](https://github.com/embeddedos-org/EoStudio/tree/d85155a44c3d1537ccc8c191fc59098ef3492767)
- [UI editor](https://github.com/embeddedos-org/EoStudio/blob/d85155a44c3d1537ccc8c191fc59098ef3492767/eostudio/gui/editors/ui_designer.py)
- [React generator](https://github.com/embeddedos-org/EoStudio/blob/d85155a44c3d1537ccc8c191fc59098ef3492767/eostudio/codegen/react.py)
- [MIT license](https://github.com/embeddedos-org/EoStudio/blob/d85155a44c3d1537ccc8c191fc59098ef3492767/LICENSE)
