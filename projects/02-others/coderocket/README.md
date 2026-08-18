# CodeRocket

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-13**

CodeRocket defines a generated application as a versioned XML-like artifact whose embedded files can be locked, merged, built, previewed, remixed, synchronized and deployed. The self-hosted repository separates editable source history from compiled build storage and from the version currently promoted to a public domain.

## Messages carry complete versioned artifacts

Pinned revision: `94d826241b9b31de16c41111c0b0ba59b3b7213a`.

The model writes `<coderocketArtifact>` and `<coderocketFile>` records. The completion parser merges new files with the prior artifact, applies patch formats, preserves files marked locked and honors explicit deletion. PostgreSQL stores artifact code on assistant messages with a numeric version; the chat row separately records the latest aggregate and product metadata. Selecting an older version reads that version's artifact rather than reconstructing it from current chat state.

This model makes generation history part of the source protocol. Context compression can omit older conversational turns while retaining the artifact snapshot needed to build a chosen version. Figma text specifications, images and uploaded files enter the prompt as references; they do not replace the CodeRocket file artifact as authority.

## Builds are immutable projections keyed by chat and version

The builder extracts files for a requested version, compiles them and stores the output under a chat/version key. Self-hosting defaults to filesystem storage; Vercel Blob is an optional adapter. Preview checks that keyed build and can capture a screenshot after success. A failed build leaves the saved source version intact and records failure separately.

## Deployment is an explicit promotion pointer

The chat record carries `deployed_version`, subdomain, deployment time and auto-deploy preference. Publishing changes that pointer to a successfully built version; it does not overwrite previous message artifacts. GitHub synchronization records repository and commit metadata as another delivery path. Remix creates a new chat lineage, so a public fork is not silently folded back into its origin.

CodeRocket's baseline migration is candidly marked as needing a real reset verification. That affects operational confidence in a fresh self-host but not the source-visible separation between versioned artifact, compiled build and promoted release.

## Pinned evidence

- [Repository](https://github.com/elreco/coderocket)
- [Versioned chat and message schema](https://github.com/elreco/coderocket/blob/94d826241b9b31de16c41111c0b0ba59b3b7213a/supabase/baseline.schema.sql)
- [Artifact merge lock and deletion protocol](https://github.com/elreco/coderocket/blob/94d826241b9b31de16c41111c0b0ba59b3b7213a/utils/completion-parser.ts)
- [Version-specific artifact retrieval](https://github.com/elreco/coderocket/blob/94d826241b9b31de16c41111c0b0ba59b3b7213a/utils/supabase/artifact-helpers.ts)
- [Build trigger and version boundary](https://github.com/elreco/coderocket/blob/94d826241b9b31de16c41111c0b0ba59b3b7213a/app/api/components/build/route.ts)
- [Filesystem or Blob build storage](https://github.com/elreco/coderocket/blob/94d826241b9b31de16c41111c0b0ba59b3b7213a/builder/storage.js)
- [Deployment promotion logic](https://github.com/elreco/coderocket/blob/94d826241b9b31de16c41111c0b0ba59b3b7213a/app/%28default%29/components/%5Bslug%5D/actions.ts)
