# Comp-gen by Aditya Singh Gautam

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

Comp-gen is not only prompt-to-component generation. It keeps the accepted component in an editable workspace where source editing and property-level controls converge before preview and export.

## OpenRouter owns the primary generation decision

[aiService.js](https://github.com/aditya3singh/Comp-gen/blob/0dca099157d246698f96a31596c7673c72bdb5ad/backend/src/services/aiService.js) calls an OpenRouter-hosted model and parses component source. Its explicit fallback is a degraded path; the dossier distinguishes it from responses actually authored by the provider.

## Session state is the durable boundary

[Session.js](https://github.com/aditya3singh/Comp-gen/blob/0dca099157d246698f96a31596c7673c72bdb5ad/backend/src/models/Session.js) persists conversation and current generated code. This supports reopening work but does not prove an immutable version for every direct edit.

## Correction has source and visual controls

[PropertyEditor.jsx](https://github.com/aditya3singh/Comp-gen/blob/0dca099157d246698f96a31596c7673c72bdb5ad/frontend/components/workspace/PropertyEditor.jsx) turns selected properties into source changes while [ComponentPreview.jsx](https://github.com/aditya3singh/Comp-gen/blob/0dca099157d246698f96a31596c7673c72bdb5ad/frontend/components/workspace/ComponentPreview.jsx) projects the working code. [export.js](https://github.com/aditya3singh/Comp-gen/blob/0dca099157d246698f96a31596c7673c72bdb5ad/backend/src/routes/export.js) packages that authority for delivery.

## Evidence

- [Canonical repository](https://github.com/aditya3singh/Comp-gen)
- [Inspected tree](https://github.com/aditya3singh/Comp-gen/tree/0dca099157d246698f96a31596c7673c72bdb5ad)
- Commit: 0dca099157d246698f96a31596c7673c72bdb5ad
