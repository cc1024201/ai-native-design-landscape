# BurnGuard Design

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

BurnGuard Design is a local-first prototype and slide workspace that wraps installed Claude Code and Codex CLIs. Its product boundary is the harness around those general agents: project files, design-system context, rendered canvas, pinned comments, checkpoints and exports form a repeatable Design loop.

## HTML files are the working artifact

A prototype owns `index.html`; a deck owns `deck.html`. The preview evaluates that file while the agent edits the same project directory. The shared [`project contract`](https://github.com/ashmoonori-afk/Design-Claude-Burnguard/blob/dff27cdd41e3e9ba1bc2717b3ae17d321363735f/packages/shared/src/project.ts) records the project type, entry point and selected backend. SQLite stores metadata, sessions, events and comments, but it does not replace the HTML source as visual authority.

## The harness turns design state into agent context

[`prompt-builder.ts`](https://github.com/ashmoonori-afk/Design-Claude-Burnguard/blob/dff27cdd41e3e9ba1bc2717b3ae17d321363735f/packages/backend/src/harness/prompt-builder.ts) combines the user request with the current project structure, canonical design-system files, open canvas comments and artifact-specific rules. Compact mode extracts a structural map so a large deck can be edited through targeted reads instead of repeatedly reinjecting the whole file.

Backend adapters run the installed [`Claude Code`](https://github.com/ashmoonori-afk/Design-Claude-Burnguard/blob/dff27cdd41e3e9ba1bc2717b3ae17d321363735f/packages/backend/src/adapters/claude-code/index.ts) or [`Codex`](https://github.com/ashmoonori-afk/Design-Claude-Burnguard/blob/dff27cdd41e3e9ba1bc2717b3ae17d321363735f/packages/backend/src/adapters/codex/index.ts) process inside the project directory and normalize its streamed file events. BurnGuard supplies the Design contract and review surface; the selected CLI supplies the coding-agent runtime.

## Canvas review has a recoverable file boundary

Rendered nodes carry stable BurnGuard IDs so comments can target a slide or element and return to the next prompt. Before each user turn, [`checkpoints.ts`](https://github.com/ashmoonori-afk/Design-Claude-Burnguard/blob/dff27cdd41e3e9ba1bc2717b3ae17d321363735f/packages/backend/src/services/checkpoints.ts) snapshots the project tree. Revert restores that pre-turn state rather than merely hiding a chat message.

## Delivery is downstream of source

The backend has separate PDF, PPTX and handoff exporters. These consume the current HTML and associated assets; they do not become a second editable authority. A design system can be imported from a repository, live site, PPTX or PDF into an explicit local folder and remains inspectable.

BurnGuard is not a multi-user merge system, and CLI permission behavior depends on the installed agent. Its strong guarantee is narrower: all durable design material stays under the local application data root and each agent turn can be rolled back as files.

## Evidence

- [Pinned repository](https://github.com/ashmoonori-afk/Design-Claude-Burnguard/tree/dff27cdd41e3e9ba1bc2717b3ae17d321363735f)
- [Export services](https://github.com/ashmoonori-afk/Design-Claude-Burnguard/tree/dff27cdd41e3e9ba1bc2717b3ae17d321363735f/packages/backend/src/services)
