# K2 Vibe

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-13**

K2 Vibe uses K2 Think as a chat-driven file agent inside a browser-hosted Next.js environment. Its product boundary is a managed project conversation whose assistant messages can carry file-map fragments.

## A fragment is the saved runnable state

Pinned revision: `b5af3d00e2cfdd9f51aa8b63d39b567ddb4d2c23`.

Prisma separates `Project`, `Message` and `Fragment`; each fragment stores a JSON path-to-content map. Tool calls write into WebContainer immediately, then the finish route attaches the accumulated files to an assistant message. Reopening a project mounts the active fragment rather than replaying terminal mutations.

## Repair updates a fragment rather than creating a formal version graph

Generation saves an early fragment and can patch it after compile diagnostics. Later user turns create further message fragments, so conversation offers practical checkpoints, but there is no named restore or branching version model.

## Deployment materializes the fragment elsewhere

A user-supplied Vercel token sends the fragment merged with the base template to Vercel. Shared project pages can also mount the last fragment in a read-oriented WebContainer view.

## Pinned evidence

- [Repository](https://github.com/hatif03/k2-vibe)
- [Project message and fragment schema](https://github.com/hatif03/k2-vibe/blob/b5af3d00e2cfdd9f51aa8b63d39b567ddb4d2c23/prisma/schema.prisma)
- [Agent tool execution](https://github.com/hatif03/k2-vibe/blob/b5af3d00e2cfdd9f51aa8b63d39b567ddb4d2c23/src/hooks/use-agent-stream.ts)
- [Generate and repair loop](https://github.com/hatif03/k2-vibe/blob/b5af3d00e2cfdd9f51aa8b63d39b567ddb4d2c23/src/hooks/use-agent-generate.ts)
- [WebContainer runtime](https://github.com/hatif03/k2-vibe/blob/b5af3d00e2cfdd9f51aa8b63d39b567ddb4d2c23/src/lib/webcontainer.ts)
- [Vercel delivery](https://github.com/hatif03/k2-vibe/blob/b5af3d00e2cfdd9f51aa8b63d39b567ddb4d2c23/src/app/api/deploy/vercel/route.ts)
