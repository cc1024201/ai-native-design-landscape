# OSW Studio

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

OSW Studio originated from DeepSite but has crossed the threshold from source fork to independently material product. Its own workspace identity now governs a browser database, file tools, checkpoints, archive interchange, synchronization and deployments.

## IndexedDB VFS is the local authority

[`vfs/index.ts`](https://github.com/o-stahl/osw-studio/blob/b87561d5c9d3ad532b2a2da345560da1e163b10a/lib/vfs/index.ts) presents file operations over the selected storage adapter. [`indexeddb-adapter.ts`](https://github.com/o-stahl/osw-studio/blob/b87561d5c9d3ad532b2a2da345560da1e163b10a/lib/vfs/adapters/indexeddb-adapter.ts) makes the browser database—not chat text or preview DOM—the durable local source authority.

## Recovery and portability are separate protocols

[`checkpoint.ts`](https://github.com/o-stahl/osw-studio/blob/b87561d5c9d3ad532b2a2da345560da1e163b10a/lib/vfs/checkpoint.ts) captures restorable workspace states. [`archive/export.ts`](https://github.com/o-stahl/osw-studio/blob/b87561d5c9d3ad532b2a2da345560da1e163b10a/lib/vfs/archive/export.ts) serializes a project for ZIP or OSWS interchange. A checkpoint is an internal recovery point; an archive is a portable artifact.

## Execution and publication extend the product boundary

[`virtual-server.ts`](https://github.com/o-stahl/osw-studio/blob/b87561d5c9d3ad532b2a2da345560da1e163b10a/lib/preview/virtual-server.ts) serves the current VFS to the preview compiler. [`deployments/route.ts`](https://github.com/o-stahl/osw-studio/blob/b87561d5c9d3ad532b2a2da345560da1e163b10a/app/api/w/%5BworkspaceId%5D/deployments/route.ts) adds server-managed deployment state. These mechanisms materially exceed a renamed DeepSite shell and justify a separate canonical record.

## Pinned evidence

- [Canonical repository](https://github.com/o-stahl/osw-studio)
- [Inspected tree](https://github.com/o-stahl/osw-studio/tree/b87561d5c9d3ad532b2a2da345560da1e163b10a)
- [Product workflow](https://github.com/o-stahl/osw-studio/blob/b87561d5c9d3ad532b2a2da345560da1e163b10a/README.md)
- Commit: `b87561d5c9d3ad532b2a2da345560da1e163b10a`
