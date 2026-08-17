# Subcortex Visualization Skill

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

Subcortex Visualization Skill packages a reproducible agent workflow for two-dimensional subcortical, thalamic, brainstem and cerebellar ROI figures. Its Design problem is not generic chart styling: atlas identity, region labels, neuroimaging space and color semantics must remain traceable through the vector output.

## Backend and atlas are explicit gates

Before plotting, the user chooses Python or R and the skill checks that environment. A visualization contract records purpose, input, atlas, statistic, style, views and QC risks. Exact region names are validated before empirical data is mapped. The agent cannot silently switch backend when dependencies fail.

Plot code, ROI values, atlas selection and provenance form the reproducible authority. Editable SVG/PDF are final visual artifacts; PNG is an optional preview. For NIfTI input, extraction also records atlas space and resampling assumptions so the image is not separated from its scientific transformation.

## Upstream boundary

The skill is a layer over Annie Bryant's `subcortex_visualization` package rather than a fork. It supplies agent routing, diagnostics and provenance, while upstream code determines the atlas rendering primitives.

- [Pinned skill revision](https://github.com/mqqq333/subcortex-visualization-skill/tree/f04c9df0d60f1690e3c16a8d56fc530ecb48e521)
- [Visualization workflow](https://github.com/mqqq333/subcortex-visualization-skill/blob/f04c9df0d60f1690e3c16a8d56fc530ecb48e521/subcortex-visualization/SKILL.md)
- [Environment diagnostic](https://github.com/mqqq333/subcortex-visualization-skill/blob/f04c9df0d60f1690e3c16a8d56fc530ecb48e521/subcortex-visualization/scripts/check_subcortex_environment.py)
- [Source-scope declaration](https://github.com/mqqq333/subcortex-visualization-skill/blob/f04c9df0d60f1690e3c16a8d56fc530ecb48e521/subcortex-visualization/references/source_scope.md)
