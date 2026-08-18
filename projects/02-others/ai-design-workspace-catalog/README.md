# AI Design Workspace

> Research status: **Source-level** · Lifecycle: **active-transition** · Last reviewed: **2026-08-12**

AI Design Workspace is a print-first production repository for catalogs, datasheets and brochures. Its AI is deliberately outside the browser application: a coding agent such as Codex reads the repository contract, edits the React/data source and uses the application for preview, localized adjustment, audit review and PDF delivery.

## Repository source is the print artifact

The agent contract in [`AGENTS.md`](https://github.com/cj1044821606-cell/AI-Design-workspace/blob/0325fc6e303e2cc596b0f75945b9d25154f08811/AGENTS.md) constrains AI to existing millimetre-based templates, real assets, edition ordering and protected image transforms. Legacy spreads still embed content and layout in individual TSX files; the newer `catalog-data`, `catalog-layouts`, `catalog-editions`, `catalog-render` and `catalog-operations` layers separate product content, template rules, edition assembly and operations.

That transition matters: the current source does not establish an embedded model call or autonomous in-app designer. AI participation is a filesystem-agent workflow over inspectable code, and Git remains the broad project history.

## Direct adjustment writes back into source

[`ProductImageEditor.tsx`](https://github.com/cj1044821606-cell/AI-Design-workspace/blob/0325fc6e303e2cc596b0f75945b9d25154f08811/src/components/ProductImageEditor.tsx) lets a designer move and scale a product image in the preview. Saving calls a local endpoint that updates marked `initialX`, `initialY` and `initialScale` values in the owning component. The rendered adjustment and the next agent read therefore converge on the TSX source instead of diverging into browser-only state.

## Audit reports are reviewed patches with checkpoints

An external agent can return a typed `catalog_audit_report_v1`; [`audit-session.ts`](https://github.com/cj1044821606-cell/AI-Design-workspace/blob/0325fc6e303e2cc596b0f75945b9d25154f08811/src/catalog-operations/audit-session.ts) validates the import, and overlay/UI operations let users ignore or apply individual proposed fixes. The local [`server.ts`](https://github.com/cj1044821606-cell/AI-Design-workspace/blob/0325fc6e303e2cc596b0f75945b9d25154f08811/server.ts) snapshots affected file contents before an apply and can restore a checkpoint. This is issue-scoped recovery in addition to Git, not collaborative document merging.

## Delivery and reconstruction are print-specific

The application offers a compressed preview PDF path and a high-quality print path. A separate [`PDF design parser`](https://github.com/cj1044821606-cell/AI-Design-workspace/tree/0325fc6e303e2cc596b0f75945b9d25154f08811/tools/pdf-design-parser) extracts text, images, paint order, crop/clip and grouping evidence to help an agent reconstruct a reference design. Parsed geometry is evidence for recreation; it is not a round-trip identity back to the original authoring file.

## Evidence

- [Pinned repository](https://github.com/cj1044821606-cell/AI-Design-workspace/tree/0325fc6e303e2cc596b0f75945b9d25154f08811)
- [Architecture description](https://github.com/cj1044821606-cell/AI-Design-workspace/blob/0325fc6e303e2cc596b0f75945b9d25154f08811/ARCHITECTURE.md)
