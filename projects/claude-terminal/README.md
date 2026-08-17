# Claude Terminal

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

Claude Terminal is a desktop application around Claude Code projects. Its Design surface combines rich artifact rendering, safe HTML preview, file checkpoints, project/worktree state and web-app preview tools rather than introducing a proprietary design canvas.

## Visual artifacts remain attached to source and session state

Chat renders Mermaid, file trees, kanban boards, diffs, math and HTML. Generated HTML is registered under an isolated `ct-preview` protocol with its own CSP and a bounded in-memory preview map; it runs in a sandboxed iframe without weakening the main renderer. Web-app project tools connect the running projection to the selected workspace.

SDK checkpointing supports file rewind, while sessions can fork and subagents can work in named Git worktrees. Git status, commits, branches and PRs expose the durable promotion path. Thus files and Git remain authoritative; previews and rich blocks make them inspectable during agent work.

## Evidence

- [Pinned repository](https://github.com/Sterll/claude-terminal/tree/ad56485f761d1dbf804187b741e10e00a4048130)
- [Isolated HTML preview protocol](https://github.com/Sterll/claude-terminal/blob/ad56485f761d1dbf804187b741e10e00a4048130/src/main/ipc/preview.ipc.js)
- [Web-app MCP tools](https://github.com/Sterll/claude-terminal/blob/ad56485f761d1dbf804187b741e10e00a4048130/resources/mcp-servers/tools/webapp.js)
- [Project renderer](https://github.com/Sterll/claude-terminal/blob/ad56485f761d1dbf804187b741e10e00a4048130/src/project-types/webapp/renderer/WebAppRendererService.js)
