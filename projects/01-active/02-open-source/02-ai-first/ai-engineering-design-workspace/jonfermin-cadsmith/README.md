# cadsmith

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

Jon Fermin's cadsmith turns a natural-language description of a physical object into parametric build123d or CadQuery source, manufacturable exports and an interactive Three.js preview. Its defining choice is to keep executable Python—not the preview mesh—as the model of record.

## Preview and CAD authority are deliberately unequal

The make-model skill asks at most one clarification round, writes a parameterized Python generator, exports STEP/STL and creates a scene manifest for browser inspection. Review and fix agents can iterate on existing models, while a separate export path reaches STL, OBJ, glTF or GLB through Blender.

The Three.js view is only an approximation; unsupported booleans are shown as wireframes rather than presented as final geometry. Python plus the CAD kernel owns constructive intent, STEP captures exchange geometry, STL is a manufacturing derivative and the browser supplies review evidence.

Successful export does not establish fit, load capacity or print process suitability. Those remain domain judgments beyond the public review loop. This record is qualified by maintainer because a separate project named CADSmith already exists in the census.

- [Pinned repository](https://github.com/JonFermin/cadsmith/tree/0d64f9a4344066b91f6d972d5404d14fa08428a5)
- [Model-generation skill](https://github.com/JonFermin/cadsmith/tree/0d64f9a4344066b91f6d972d5404d14fa08428a5/.claude/skills/make-model)
- [Three.js previewer](https://github.com/JonFermin/cadsmith/tree/0d64f9a4344066b91f6d972d5404d14fa08428a5/previewer)
- [Maintainer location evidence](https://github.com/JonFermin)
