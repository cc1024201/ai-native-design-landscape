# Ghosted

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

Ghosted makes an agent workflow one native file inside a broader desktop development workspace. The canvas is coupled to workspace files, terminal processes, a knowledge index and the Pi coding-agent runtime rather than hosted as an isolated automation service.

## A `.canvas` file is the durable design object

[CanvasPane.tsx](https://github.com/megasupersoft/Ghosted/blob/62bf58b82ebd6d06fdc182e1852562ab2b11ae39/src/panes/CanvasPane.tsx) serializes nodes and edges to the open workspace, reloads them on file changes, tracks dirty state and undo history, and imports or exports JSON Canvas 1.0. Prompt, context, file, skill, terminal, output and run nodes therefore live beside the source material they coordinate.

## A run compiles the upstream subgraph

Starting at a run node collects its ancestors and topologically sorts them. Context and file nodes resolve workspace knowledge, terminal nodes execute through the real PTY bridge, and the accumulated prompt is written to `.ghosted-workflow-prompt.md` before being piped to `pi --print`. Node status and the run log are projected back onto the graph.

## Agent control is also available directly

[electron/main.ts](https://github.com/megasupersoft/Ghosted/blob/62bf58b82ebd6d06fdc182e1852562ab2b11ae39/electron/main.ts) embeds `@mariozechner/pi-coding-agent`, registers workspace tools and streams session events over typed IPC. This direct session path is separate from the canvas's CLI handoff, an important implementation seam rather than one unified runtime.

## Consequence of the architecture

Workspace files remain the recoverable authority; process state and agent sessions are ephemeral. Ghosted's distinctive definition of design is thus executable coordination embedded in the same local environment where code and evidence live.

## Pinned evidence

- [Repository](https://github.com/megasupersoft/Ghosted)
- [Inspected tree](https://github.com/megasupersoft/Ghosted/tree/62bf58b82ebd6d06fdc182e1852562ab2b11ae39)
- [JSON Canvas conversion](https://github.com/megasupersoft/Ghosted/blob/62bf58b82ebd6d06fdc182e1852562ab2b11ae39/src/lib/jsonCanvas.ts)
