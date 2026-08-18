# SVG Creation Skill

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

SVG Creation Skill turns a text prompt into an editable vector illustration through an explicit raster intermediate. It generates an image, removes the background, traces layers to SVG and asks the agent to inspect the rendered result.

## Raster direction becomes vector delivery

`generate-raster.js` calls the configured image model. Background removal isolates the artwork; decomposition and `imagetracer-ts` convert it to paths. `svg-to-png.js` renders the actual SVG for visual verification. The final SVG is the delivered authority, while the generated raster remains the visual direction and tracing input.

This pipeline preserves path editability but not semantic component structure: a traced region may be editable geometry without knowing that it is a wheel, label or reusable icon. The dossier therefore does not equate vector output with a native illustration object model.

## Runtime boundary

Image generation and background removal depend on external models and packages. Verification is agent-judged; the public scripts establish the transformation stages but not a universal fidelity threshold.

- [Pinned SVG Creation Skill revision](https://github.com/itayfi/svg-creation-skill/tree/d79a987d3ae77d349ee04fc50c89603150d71fbc)
- [Skill workflow](https://github.com/itayfi/svg-creation-skill/blob/d79a987d3ae77d349ee04fc50c89603150d71fbc/skills/svg-creation/SKILL.md)
- [Raster tracer](https://github.com/itayfi/svg-creation-skill/blob/d79a987d3ae77d349ee04fc50c89603150d71fbc/skills/svg-creation/scripts/trace-raster.js)
- [SVG preview renderer](https://github.com/itayfi/svg-creation-skill/blob/d79a987d3ae77d349ee04fc50c89603150d71fbc/skills/svg-creation/scripts/svg-to-png.js)
