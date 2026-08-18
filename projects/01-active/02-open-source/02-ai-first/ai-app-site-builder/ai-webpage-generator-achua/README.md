# AI Webpage Generator by Achuajays

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

This generator keeps a complete HTML document as one in-memory working artifact. That same value travels through model generation, visual projection, hand editing, model-assisted correction and export.

## Generation includes chosen visual constraints

[`htmlGeneratorService.ts`](https://github.com/achuajays/AI-WebPage-Generator/blob/dfb89f6bbf3ff54d60c5eb67230714caab1f00f2/services/htmlGeneratorService.ts) sends the brief plus an optional pattern and palette to the external model. Its second operation accepts the current HTML and a refinement instruction and requires a complete updated document, so correction is anchored to the existing artifact.

## Preview and source are two views of the same value

[`PreviewModal.tsx`](https://github.com/achuajays/AI-WebPage-Generator/blob/dfb89f6bbf3ff54d60c5eb67230714caab1f00f2/components/PreviewModal.tsx) projects the HTML through `srcDoc` at desktop, tablet and mobile sizes. Switching to code exposes a textarea that mutates the same value directly; a refinement prompt can replace it again. Copy and `index.html` download provide delivery but there is no durable project store in the pinned source.

## Boundary finding

The model API is outside this repository and the HTML is transient until downloaded. This is therefore a source-authority live projection at session scope—not evidence of a managed application graph or version system.

## Pinned evidence

- [Canonical repository](https://github.com/achuajays/AI-WebPage-Generator)
- [Generation page](https://github.com/achuajays/AI-WebPage-Generator/blob/dfb89f6bbf3ff54d60c5eb67230714caab1f00f2/pages/GeneratorPage.tsx)
- [Inspected tree](https://github.com/achuajays/AI-WebPage-Generator/tree/dfb89f6bbf3ff54d60c5eb67230714caab1f00f2)
- Commit: `dfb89f6bbf3ff54d60c5eb67230714caab1f00f2`
