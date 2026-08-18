# SVG Factory

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

SVG Factory is a no-dependency CLI plus agent skill for deterministic vector assets. It supports structured JSON definitions for ordinary assets and direct SVG when gradients, masks, organic paths or dense ornament require richer authoring.

## Definition before render

The agent writes a composition plan, chooses JSON or direct SVG, renders a PNG preview and critiques the result against the brief. For JSON-driven work, ordered elements and document metadata remain the editable source; generated SVG is the compiled artifact and the preview is visual evidence. Iteration returns to the definition rather than patching generated output.

When an original vector source exists, the skill preserves or imports it instead of redrawing hundreds of paths from a raster preview. This distinguishes source-preserving derivation from new deterministic asset generation.

## Tool boundary

The CLI validates document definitions and renders SVG but does not provide a collaborative canvas or model backend. Agent judgment supplies composition and critique; deterministic code owns materialization.

- [Pinned SVG Factory revision](https://github.com/abdygaziev/svg-factory/tree/a4eb63ebac16f0544803cc1ffd283a8279f6b5e7)
- [Agent workflow](https://github.com/abdygaziev/svg-factory/blob/a4eb63ebac16f0544803cc1ffd283a8279f6b5e7/skills/svg-factory/SKILL.md)
- [Document validator](https://github.com/abdygaziev/svg-factory/blob/a4eb63ebac16f0544803cc1ffd283a8279f6b5e7/tools/svg-factory/document-validate.mjs)
- [SVG renderer](https://github.com/abdygaziev/svg-factory/blob/a4eb63ebac16f0544803cc1ffd283a8279f6b5e7/tools/svg-factory/render.mjs)
