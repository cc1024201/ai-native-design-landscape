# Codex

Codex answers "what is design" by making it **repository-returning work**. It is not one visual editor with one canonical canvas but a coding-agent harness exposed through several clients — desktop app in Codex mode, CLI, IDE extension, cloud — where rich clients add browser inspection, file previews, annotations, worktrees and review panes, while the open core turns those into constrained tool execution against a real workspace.

The durable result of a frontend or design-artifact task is the file or Git state that can be run and inspected. A browser frame is an observation surface, an annotation is correction context, a thread coordinates the work; none replaces the authored files.

The implementation keeps that boundary honest in the protocol. App Server exposes a three-level model — `Thread`, `Turn`, `ThreadItem` — that orchestrates work but does not own a snapshot of every workspace file. Patches execute through an environment filesystem, not a chat-only shadow document. Visual routes stay content, not canonical identity: images are data URLs or paths, `view_image` reads sandboxed files, and an experimental `additionalContext` is an opaque keyed string the core merges into context — there is no public DOM-to-source contract.

"Completed" is not artifact proof. Turn lifecycle closes the orchestration, while `apply_patch` can apply hunks sequentially and leave a committed prefix, and the turn-diff tracker follows exact patch deltas without rereading arbitrary command side effects. Acceptance is an evidence chain — turn completed → inspect paths → `git diff`/status → run → render → inspect → commit — not the agent's narration.

Authority is a separate plane from vision: sandbox, cwd/workspace roots, approval policy and reviewer compose what may be mutated, and a rendered page can be visible while its source sits outside the writable roots.

Persistence runs on three independent clocks — the JSONL conversation rollout under `$CODEX_HOME/sessions` (SQLite is only a lagging queryable projection), the workspace file tree, and Git (with worktrees isolating parallel chats without merging). Recovering requires reconciling all three: the thread can resume while the worktree changed, or a commit can survive after the thread is deleted.

[Evidence: pinned `d06dc732`](https://github.com/openai/codex/tree/d06dc73290729d2bcb464b955a4cfd9992abc35d) · [app-server README](https://github.com/openai/codex/blob/d06dc73290729d2bcb464b955a4cfd9992abc35d/codex-rs/app-server/README.md) · [rollout recorder](https://github.com/openai/codex/blob/d06dc73290729d2bcb464b955a4cfd9992abc35d/codex-rs/rollout/src/recorder.rs) · [thread store](https://github.com/openai/codex/blob/d06dc73290729d2bcb464b955a4cfd9992abc35d/codex-rs/thread-store/src/local/mod.rs)
