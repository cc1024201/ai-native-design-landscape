# Synapese 25

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

Synapese treats an ecommerce landing page as a typed layout rather than raw generated markup. Text intent, brand rules and product imagery enter the model path; React and Shopify exports are later materializations of the same section graph.

## AI proposes structure inside a constrained schema

[`layoutService.ts`](https://github.com/biswajit-sarkar-007/Synapese-25/blob/904ef581a04c35dbcb234901b0572179c01867b2/src/services/layoutService.ts) calls a hosted FLAN-T5 endpoint and parses the response into the project's `Layout` types. Its fallback is explicit and deterministic instead of being reported as a successful model result. [`imageService.ts`](https://github.com/biswajit-sarkar-007/Synapese-25/blob/904ef581a04c35dbcb234901b0572179c01867b2/src/services/imageService.ts) separately handles image generation.

## The layout graph is the artifact authority

[`LayoutContext.tsx`](https://github.com/biswajit-sarkar-007/Synapese-25/blob/904ef581a04c35dbcb234901b0572179c01867b2/src/context/LayoutContext.tsx) owns sections and style configuration. [`LayoutRenderer.tsx`](https://github.com/biswajit-sarkar-007/Synapese-25/blob/904ef581a04c35dbcb234901b0572179c01867b2/src/components/Layout/LayoutRenderer.tsx) dispatches that graph to typed Navbar Hero ProductGrid CTA and Footer renderers. Brand changes therefore operate on structured fields rather than rewriting an opaque HTML blob.

## Export is a second authority boundary

[`layoutExporter.ts`](https://github.com/biswajit-sarkar-007/Synapese-25/blob/904ef581a04c35dbcb234901b0572179c01867b2/src/utils/layoutExporter.ts) serializes the accepted graph into React component source or Shopify-compatible output. The editable layout remains authoritative inside Synapese; exported source becomes authoritative only after the user carries it into the destination system.

## Limits and location

The snapshot is browser-state driven and does not expose durable projects or a version graph. The maintainer's [GitHub profile](https://github.com/biswajit-sarkar-007) identifies Krishnanagar in West Bengal; the team region is recorded as India.

## Evidence

- [Canonical repository](https://github.com/biswajit-sarkar-007/Synapese-25)
- [Inspected tree](https://github.com/biswajit-sarkar-007/Synapese-25/tree/904ef581a04c35dbcb234901b0572179c01867b2)
- [Layout types](https://github.com/biswajit-sarkar-007/Synapese-25/blob/904ef581a04c35dbcb234901b0572179c01867b2/src/types/layout.ts)
- Commit: `904ef581a04c35dbcb234901b0572179c01867b2`
