# Vibe Coding Platform by lwshakib

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-13**

This full-stack builder uses Gemini function calls to mutate a persistent application project, then projects that project into WebContainer and optional GitHub delivery. Unlike many browser-only clones, the model tools write the database authority directly.

## One JSON file map is the durable source

Pinned revision: `95d9d5529a57044781f19dc1ce7fe6c27b1dbce7`.

PostgreSQL stores each project with a JSON `files` object, detected paths, optional GitHub repository and ordered messages. `createFile`, `updateFile` and `deleteFile` load that object, mutate one path and write the complete object back. `loadStarter`, `readFile` and `listFiles` complete the model's project interface.

The object is the canonical authored source. The WebContainer context transforms it into an executable filesystem and iframe; runtime files are not a second durable ledger.

## Tool calls are typed, but a generation is not atomic

Gemini receives declared functions and can perform multiple read/write steps. A single tool validates whether a path exists and can patch a bounded line range, but each call commits independently to PostgreSQL. There is no encompassing transaction, revision compare-and-swap or rollback across an entire assistant turn.

The chat route persists user and assistant message parts separately from project files. Conversation recovery can explain how a change arose, but it is not a file snapshot history.

## Preview and correction consume the same project

The client mounts the saved files into a WebContainer, starts the selected starter and surfaces terminal errors beside the prompt interface. Quick-edit and ordinary chat ultimately return to the stored file map. Attachments can use object storage, but they remain context rather than the source graph of the application.

## Delivery promotes source into a different authority

The current project can be downloaded as a ZIP. A linked GitHub repository uses the Git data APIs to build blobs/trees and advance the default branch; an empty repository has a separate bootstrap path. That commit is a durable external receipt, but later database edits and Git state are not automatically one transaction.

No native project-version table exists in this revision. Duplicate, ZIP and Git commit are forks or exports, not named restoration points inside the builder.

## Pinned evidence

- [Repository](https://github.com/lwshakib/vibe-coding-platform)
- [Persistent project and message schema](https://github.com/lwshakib/vibe-coding-platform/blob/95d9d5529a57044781f19dc1ce7fe6c27b1dbce7/prisma/schema.prisma)
- [Typed project tool registry](https://github.com/lwshakib/vibe-coding-platform/blob/95d9d5529a57044781f19dc1ce7fe6c27b1dbce7/llm/tools/registry.ts)
- [Line-aware durable file mutation](https://github.com/lwshakib/vibe-coding-platform/blob/95d9d5529a57044781f19dc1ce7fe6c27b1dbce7/llm/tools/updateFile.ts)
- [GitHub tree and commit promotion](https://github.com/lwshakib/vibe-coding-platform/blob/95d9d5529a57044781f19dc1ce7fe6c27b1dbce7/app/api/projects/%5BprojectId%5D/github/commit/route.ts)
- [ZIP delivery](https://github.com/lwshakib/vibe-coding-platform/blob/95d9d5529a57044781f19dc1ce7fe6c27b1dbce7/lib/download.ts)
