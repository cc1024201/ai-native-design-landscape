# DevPilot

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-13**

DevPilot is a browser-native development environment in which an autonomous agent, a persistent project tree and a live WebContainer projection form one visual application-authoring loop. Unlike a chat assistant beside an IDE, its agent has source-writing tools and a recovery contract around every run.

## The database tree is the handoff between server agent and browser runtime

Pinned revision: `9fbc23895c3c8e9781107810758196f9bd774d8b`.

The orchestrator loads one serialized project tree from MongoDB. Model tool calls can list, read, search and write files; every successful `write_file` immediately upserts that tree and emits a `sync_file` event. Commands are not executed on the server tree. They are relayed to the signed-in browser and run inside its WebContainer under an allowlist, returning build or test evidence to the model. This split lets server-side reasoning mutate durable source while the browser owns the executable runtime.

WebContainer mounts the current tree, boots the selected framework and sends a `server-ready` URL to a sandboxed iframe. The preview is passive evidence rather than a DOM-to-source editor: later changes still enter through Monaco, file operations or agent instructions.

## Automatic mutation is guarded by mandatory short-lived snapshots

Before the first write, the agent must create a full-tree checkpoint. Failure stops the run before mutation. A second checkpoint is written when the run ends, including blocked or capped outcomes. Checkpoints live in MongoDB, are scoped to their project, replace the whole tree on restore and expire after 48 hours through a TTL index. The 15 MB application guard reflects MongoDB's single-document limit.

This is deliberately not an approval gate: accepted tool calls apply immediately. Safety comes from visibility, stop/cap controls, an allowlisted command relay and whole-project rollback. GitHub source control adds a longer-lived delivery baseline, but it is separate from the expiring agent checkpoint history.

## Pinned evidence

- [Repository](https://github.com/princethakarar/DevPilot)
- [Autonomous tool loop and browser command relay](https://github.com/princethakarar/DevPilot/blob/9fbc23895c3c8e9781107810758196f9bd774d8b/lib/ai/agent/orchestrator.ts)
- [Project checkpoint storage and restore](https://github.com/princethakarar/DevPilot/blob/9fbc23895c3c8e9781107810758196f9bd774d8b/lib/checkpoint/store.ts)
- [Checkpoint and agent-run data model](https://github.com/princethakarar/DevPilot/blob/9fbc23895c3c8e9781107810758196f9bd774d8b/lib/db/schemas.ts)
- [WebContainer lifecycle and file synchronization](https://github.com/princethakarar/DevPilot/blob/9fbc23895c3c8e9781107810758196f9bd774d8b/modules/webcontainers/hooks/useWebContainer.ts)
- [Live iframe projection](https://github.com/princethakarar/DevPilot/blob/9fbc23895c3c8e9781107810758196f9bd774d8b/modules/webcontainers/components/ide-preview.tsx)
- [GitHub delivery actions](https://github.com/princethakarar/DevPilot/blob/9fbc23895c3c8e9781107810758196f9bd774d8b/modules/playground/actions/commit.ts)
