# FreeCAD Modeling Skill

> Research status: **Architecture-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

FreeCAD Modeling Skill gives an agent a reproducible route from a natural-language part request to FreeCAD Python source, headless execution, native and exchange files, validation and visual inspection. It uses FreeCAD as an engineering runtime rather than treating a generated mesh as the only result.

## Source, native model and exchange file remain distinguishable

The Python script captures construction logic; `FreeCADCmd` materializes an FCStd document and STEP export; validation checks shape and file properties; CAD Explorer supplies the review projection. A failure at any later stage returns to source or export repair without erasing which artifact was authoritative.

The public repository exposes the operating contract and validation guidance but not a comparably deep standalone runtime implementation, so this dossier stops at architecture-level evidence.

- [Pinned repository](https://github.com/ranranjiang666/freecad-modeling/tree/4fb2a03345a0a2723f430b6f74a44786ff152dbe)
- [Agent skill](https://github.com/ranranjiang666/freecad-modeling/blob/4fb2a03345a0a2723f430b6f74a44786ff152dbe/SKILL.md)
- [Export and validation contract](https://github.com/ranranjiang666/freecad-modeling/blob/4fb2a03345a0a2723f430b6f74a44786ff152dbe/references/export-and-validation.md)
- [Maintainer profile checked; no location published](https://github.com/ranranjiang666)
