# DevPilot

DevPilot treats design as whatever an autonomous agent can write into a project tree — and its own answer to "what is design" is really about where the mutation may happen, not about the look of the result. The named artifact is a serialized tree in MongoDB; everything else, including the browser, is a projection of it.

## The server tree decides, the browser merely executes

Pinned revision: `9fbc23895c3c8e9781107810758196f9bd774d8b`. The orchestrator loads one tree and gives the model tools to list, read, search and write files; every `write_file` immediately upserts that tree and emits a `sync_file` event. Crucially, commands are **not** run against the server tree. They are relayed to the signed-in browser and executed inside its WebContainer under an allowlist, returning build or test evidence back to the model. So reasoning and durable mutation live server-side while the executable runtime is owned by the browser — a split that lets the model edit source it never executes directly.

WebContainer mounts the current tree, boots the framework and hands a `server-ready` URL to a sandboxed iframe. That preview is passive evidence (Monaco, file ops and agent instructions are the only entry points back in), so iteration is source-first rather than DOM-to-source.

## Mutation only runs under a mandatory snapshot contract

Before the first write the agent must checkpoint the whole tree; failure stops the run. A second checkpoint closes the run, even on blocked or capped outcomes. Checkpoints live in MongoDB, are scoped to the project, restore by replacing the tree and expire after 48 hours via a TTL index — with the 15 MB cap reflecting MongoDB's single-document limit. This is expressly **not** an approval gate: accepted calls apply immediately. Safety comes from visibility, stop/cap controls, the allowlisted relay and whole-project rollback, while GitHub is a longer-lived but separate delivery baseline.

## Pinned evidence

- [Repository](https://github.com/princethakarar/DevPilot)
- [Autonomous tool loop and browser command relay](https://github.com/princethakarar/DevPilot/blob/9fbc23895c3c8e9781107810758196f9bd774d8b/lib/ai/agent/orchestrator.ts)
- [Project checkpoint storage and restore](https://github.com/princethakarar/DevPilot/blob/9fbc23895c3c8e9781107810758196f9bd774d8b/lib/checkpoint/store.ts)
- [WebContainer lifecycle and file synchronization](https://github.com/princethakarar/DevPilot/blob/9fbc23895c3c8e9781107810758196f9bd774d8b/modules/webcontainers/hooks/useWebContainer.ts)
- [Live iframe projection](https://github.com/princethakarar/DevPilot/blob/9fbc23895c3c8e9781107810758196f9bd774d8b/modules/webcontainers/components/ide-preview.tsx)
- [GitHub delivery actions](https://github.com/princethakarar/DevPilot/blob/9fbc23895c3c8e9781107810758196f9bd774d8b/modules/playground/actions/commit.ts)
