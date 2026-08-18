# AI Website Builder by Firefetch

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

Firefetch treats project files as explicit artifacts and snapshots rather than reconstructing versions from chat. Provider tool calls mutate the file graph; SQLite owns current files and serialized snapshots; two preview runtimes and two delivery routes branch from it.

## Provider tools mutate artifacts

[chat/route.ts](https://github.com/Firefetch/ai-website-builder/blob/89e73fab484b0eaeed71ae82684c227ea5b2bcd0/app/api/chat/route.ts) streams Claude or MiniMax work and applies structured artifact operations. [artifacts.ts](https://github.com/Firefetch/ai-website-builder/blob/89e73fab484b0eaeed71ae82684c227ea5b2bcd0/lib/projects/artifacts.ts) is the server boundary for reading and replacing current project files.

## Snapshots are complete recoverable graphs

[snapshots.ts](https://github.com/Firefetch/ai-website-builder/blob/89e73fab484b0eaeed71ae82684c227ea5b2bcd0/lib/projects/snapshots.ts) serializes the artifact graph and restoration writes it back as current state. The snapshot API therefore changes project authority rather than showing a read-only historic preview.

## Runtime selection follows project type

[sandpack-preview.tsx](https://github.com/Firefetch/ai-website-builder/blob/89e73fab484b0eaeed71ae82684c227ea5b2bcd0/components/preview/sandpack-preview.tsx) runs React-like file graphs while [iframe-preview.tsx](https://github.com/Firefetch/ai-website-builder/blob/89e73fab484b0eaeed71ae82684c227ea5b2bcd0/components/preview/iframe-preview.tsx) handles static documents.

## Delivery is external and source-based

[github/push/route.ts](https://github.com/Firefetch/ai-website-builder/blob/89e73fab484b0eaeed71ae82684c227ea5b2bcd0/app/api/github/push/route.ts) writes files to GitHub and the deploy route connects them to Coolify. Neither path invents a separate artifact after preview.

## Evidence

- [Canonical repository](https://github.com/Firefetch/ai-website-builder)
- [Inspected tree](https://github.com/Firefetch/ai-website-builder/tree/89e73fab484b0eaeed71ae82684c227ea5b2bcd0)
- Commit: 89e73fab484b0eaeed71ae82684c227ea5b2bcd0
