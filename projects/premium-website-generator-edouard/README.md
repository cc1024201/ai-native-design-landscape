# Premium Website Generator by Edouard Kerwing

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

This builder defines design quality as context supplied to a tool-calling code agent. Its authoritative artifact is a mutable virtual file graph; the large bundled design libraries influence generation but are not themselves counted as separate products.

## Design intelligence becomes agent context

[`chat/route.ts`](https://github.com/weedappcreator/Premium-website-generator-/blob/8969ad09c6be534c0adaeea20fa5a07d2f86b9e5/src/app/api/chat/route.ts) combines a core generation contract with anti-slop, motion, smooth-scroll, component and knowledge-base context selected from the brief. [`provider.ts`](https://github.com/weedappcreator/Premium-website-generator-/blob/8969ad09c6be534c0adaeea20fa5a07d2f86b9e5/src/lib/provider.ts) resolves multiple hosted or local models and includes a clearly identifiable mock provider for development.

## Tool calls mutate the source authority

The chat route reconstructs [`VirtualFileSystem`](https://github.com/weedappcreator/Premium-website-generator-/blob/8969ad09c6be534c0adaeea20fa5a07d2f86b9e5/src/lib/file-system.ts) from the incoming project graph. File creation, string replacement, rename, delete and Figma tools operate on that graph during the streamed response. The design corpus guides decisions; successful tool mutations determine the artifact.

## Projection and persistence have separate boundaries

[`PreviewFrame.tsx`](https://github.com/weedappcreator/Premium-website-generator-/blob/8969ad09c6be534c0adaeea20fa5a07d2f86b9e5/src/components/preview/PreviewFrame.tsx) locates a React entry, transforms imports and JSX and projects it in a sandboxed iframe. On chat completion, authenticated projects persist messages and the serialized file graph. [`schema.prisma`](https://github.com/weedappcreator/Premium-website-generator-/blob/8969ad09c6be534c0adaeea20fa5a07d2f86b9e5/prisma/schema.prisma) currently declares PostgreSQL, despite README text that still says SQLite; direct edits are not shown crossing the server boundary until a save-producing workflow runs.

## Evidence

- [Canonical repository](https://github.com/weedappcreator/Premium-website-generator-)
- [Inspected tree](https://github.com/weedappcreator/Premium-website-generator-/tree/8969ad09c6be534c0adaeea20fa5a07d2f86b9e5)
- [Maintainer region evidence](https://github.com/weedappcreator)
- Commit: `8969ad09c6be534c0adaeea20fa5a07d2f86b9e5`
