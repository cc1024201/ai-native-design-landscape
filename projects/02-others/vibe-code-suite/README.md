# Vibe Coding Suite (`vibe.code`)

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-13**

Vibe Coding Suite gives Claude Code, Codex and OpenCode one visual app-building shell. Its contribution is a local bridge that converts three agent session models into the same observable file-diff stream for a browser IDE.

## The bridge normalizes agents through a workspace

Pinned revision: `ed7ee6b6766f91faff2d45f6d284453fffef6d51`.

Each run receives an agent name, prompt, browser file map and optional session ID. The bridge creates or reuses a temporary workspace, mirrors the browser files into it, then starts or resumes the selected SDK. Claude Code keeps a session ID, Codex keeps a thread object, and OpenCode keeps a local server/client session.

The product does not pretend their native event models are identical. Text and tool activity are streamed for the chat, while filesystem authority is normalized only after execution by comparing before/after snapshots.

## File diff is the return protocol

Files changed by the agent become NDJSON `file` events; removed paths become `delete` events. The browser reducer applies those events to its file map and mirrors writes into the WebContainer when available. Manual Monaco edits take the reverse path: they update the same browser map and runtime, then the next agent run reseeds the local workspace.

This is whole-file synchronization without revision preconditions. Concurrent browser edits during a run, files over the snapshot size ceiling and ignored directories have no public conflict protocol.

## Two working copies serve different purposes

The local temporary directory is where a full coding agent can use filesystem and command tools. The browser map is what the ordinary user sees and what the WebContainer mounts for live preview. The post-run diff is the handoff between them; neither copy is a Git-backed project in this repository.

## A 24-hour session is continuity, not persistence

Supplying a session ID preserves the temp workspace and agent handle until a 24-hour inactivity TTL. Browser refresh creates a new random session and the React reducer starts again from a bundled Vite project. There is no saved project index, version graph or export path in the inspected source.

The implementation establishes a real multi-agent visual loop, but its durability boundary is explicitly temporary. Users need a separate filesystem or Git handoff before treating an authored app as retained.

## Pinned evidence

- [Repository](https://github.com/dustinwloring1988/vibe-code)
- [Agent sessions, workspace seeding and post-run diff](https://github.com/dustinwloring1988/vibe-code/blob/ed7ee6b6766f91faff2d45f6d284453fffef6d51/bridge/server.mjs)
- [Browser file authority and bridge event application](https://github.com/dustinwloring1988/vibe-code/blob/ed7ee6b6766f91faff2d45f6d284453fffef6d51/src/lib/ide-context.tsx)
- [WebContainer file projection and process stream](https://github.com/dustinwloring1988/vibe-code/blob/ed7ee6b6766f91faff2d45f6d284453fffef6d51/src/lib/webcontainer.ts)
- [Bridge client protocol](https://github.com/dustinwloring1988/vibe-code/blob/ed7ee6b6766f91faff2d45f6d284453fffef6d51/src/lib/bridge-client.ts)
