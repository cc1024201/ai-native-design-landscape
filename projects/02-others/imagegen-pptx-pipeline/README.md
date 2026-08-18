# ImageGen PPTX Pipeline

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

ImageGen PPTX Pipeline separates visual direction from editable delivery. It can use generated slide comps to explore style, but those images are measurement targets: the final deck must be reconstructed with native PowerPoint objects and audited against the approved visual.

## A stateful approval chain

Content, narrative, page intent, style and conversion choices are retained in artifacts such as `deck_spec.json`, `slide_intent_matrix.md`, `visual_contract.json` and `conversion_manifest.json`. The user can approve directions before page production rather than discovering a single irreversible style at export time.

Generated or supplied comps are upscaled and measured. Text, shapes, connectors, charts and tables are rebuilt natively where possible; complex fused artwork can remain a validated image slice. QA reads the PPTX package, media, render outputs and manifests, so the deck cannot pass merely because a script completed.

This is a candidate-promotion architecture feeding native materialization: selected images guide the source graph but do not become its whole authority.

- [Pinned repository](https://github.com/eddyzzl/imagegen-pptx-pipeline/tree/44ece074674373037f6c697993fd18e1341a279b)
- [Agent skill](https://github.com/eddyzzl/imagegen-pptx-pipeline/blob/44ece074674373037f6c697993fd18e1341a279b/SKILL.md)
- [Pipeline overview](https://github.com/eddyzzl/imagegen-pptx-pipeline/blob/44ece074674373037f6c697993fd18e1341a279b/README.md)
- [Maintainer location evidence](https://github.com/eddyzzl)
