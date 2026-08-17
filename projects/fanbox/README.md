# FanBox

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

FanBox defines AI-assisted building as coordination around a real local workspace. It does not replace source with chat output: files remain authoritative while a desktop shell brings previews diffs terminals snapshots and resumable Claude Code or Codex sessions into one visual cockpit.

## Files remain outside the agent session

[`server.js`](https://github.com/alchaincyf/fanbox/blob/ff054e504d87ac4720dcdfcbb8ab7389825fb066/server.js) exposes scoped file reads writes search Git status snapshots and restore operations. A separate loopback preview server serves allowed files. [`public/app.js`](https://github.com/alchaincyf/fanbox/blob/ff054e504d87ac4720dcdfcbb8ab7389825fb066/public/app.js) projects HTML Markdown images media and repository changes while Monaco supplies code and diff inspection.

The preview and diff are evidence surfaces. The underlying workspace files and Git state remain the recoverable artifact.

## Agents are resumable tools around that authority

The server indexes local Claude Code Codex Kimi and OpenCode session stores by working directory and exposes recent sessions beside embedded terminals. A user can resume the agent in the same project instead of turning the conversation transcript into the project.

FanBox also offers AI-assisted organization through an explicit launch operation. Preferences history and an organization log are retained; file moves use preview and rollback paths rather than silently treating the model proposal as accepted.

## Evidence and location

- [Canonical repository](https://github.com/alchaincyf/fanbox)
- [Inspected tree](https://github.com/alchaincyf/fanbox/tree/ff054e504d87ac4720dcdfcbb8ab7389825fb066)
- [Architecture and product boundary](https://github.com/alchaincyf/fanbox/blob/ff054e504d87ac4720dcdfcbb8ab7389825fb066/README.md)
- Commit: `ff054e504d87ac4720dcdfcbb8ab7389825fb066`

The maintainer profile states China; team region is recorded as China.
