# Dyad

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

Dyad is a local AI app builder whose ordinary-user loop joins chat-driven file mutation live application preview direct visual and code correction Git history and deployment integrations. The generated repository remains authoritative; the desktop database coordinates the work around it.

## Local application files own the implementation

[`paths.ts`](https://github.com/dyad-sh/dyad/blob/e70cc9f144794b9f100c4857df379bdb4400b614/src/paths/paths.ts) resolves every managed app to a user-selectable local directory. Agent file tools such as [`write_file.ts`](https://github.com/dyad-sh/dyad/blob/e70cc9f144794b9f100c4857df379bdb4400b614/src/pro/main/ipc/handlers/local_agent/tools/write_file.ts) operate inside that application boundary. The product is therefore not a hosted screenshot generator: normal source files are the working authority.

## Chat streams become bounded file operations

The pinned [`chat_stream_handlers.ts`](https://github.com/dyad-sh/dyad/blob/e70cc9f144794b9f100c4857df379bdb4400b614/src/ipc/handlers/chat_stream_handlers.ts) assembles repository context invokes configured models processes streamed actions and records chat and commit metadata in SQLite. Basic and local-agent paths differ in tool protocol but converge on the same app directory and Git boundary.

## Preview is both evidence and an editing surface

[`PreviewIframe.tsx`](https://github.com/dyad-sh/dyad/blob/e70cc9f144794b9f100c4857df379bdb4400b614/src/components/preview_panel/PreviewIframe.tsx) displays the managed development runtime. The adjacent preview system exposes component selection style changes annotations code files tests logs and publication controls. These surfaces feed changes back into the repository rather than creating a second canonical canvas.

## Versions coordinate Git and data state

[`version_handlers.ts`](https://github.com/dyad-sh/dyad/blob/e70cc9f144794b9f100c4857df379bdb4400b614/src/ipc/handlers/version_handlers.ts) blocks conflicting streams before restore or checkout coordinates commit-addressed code versions and can align Neon preview branches with the selected version. Chats messages versions approvals and commit hashes live in the desktop database while Git keeps durable source history.

## Identity recursion

The discovery result called OpenLaudable retained Will Chen as package author and still referenced Dyad engine conventions while repointing product strings. Source lineage therefore resolves to Dyad; that copied repository is not counted as another independent product.

## Pinned evidence

- [Repository](https://github.com/dyad-sh/dyad)
- [Inspected tree](https://github.com/dyad-sh/dyad/tree/e70cc9f144794b9f100c4857df379bdb4400b614)
- [Official product site](https://dyad.sh/)
- Commit: `e70cc9f144794b9f100c4857df379bdb4400b614`
