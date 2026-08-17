# Live Diagramming Copilot

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

Live Diagramming Copilot is intentionally small: it makes a coding agent maintain one diagram file continuously while a person describes changes aloud or in text.

## The protocol is repository instruction

At commit [`17dd6ecd`](https://github.com/benfeely/diagram-workspace/tree/17dd6ecd711c83956b14a3e86cd9a9b67bf0d498), `AGENTS.md` tells the agent how to interpret incremental requests and update the current Mermaid document. Templates establish system architecture, data-flow and journey conventions.

## Continuity matters more than generation

The agent revises the existing file rather than producing disconnected images per prompt. Because the user can also edit Markdown directly, spoken intent and manual source correction converge on a Git-compatible authority.

## Narrow but distinct product claim

There is no custom runtime, database or canvas. The independently useful product is the live collaboration protocol plus templates. It demonstrates that an AI-native diagram workspace can be defined at the filesystem and instruction layer.

## Evidence

- [Pinned repository](https://github.com/benfeely/diagram-workspace/tree/17dd6ecd711c83956b14a3e86cd9a9b67bf0d498)
- [Agent protocol](https://github.com/benfeely/diagram-workspace/blob/17dd6ecd711c83956b14a3e86cd9a9b67bf0d498/AGENTS.md)
- [Worked evolving diagram](https://github.com/benfeely/diagram-workspace/blob/17dd6ecd711c83956b14a3e86cd9a9b67bf0d498/example-diagram.md)
- [System architecture template](https://github.com/benfeely/diagram-workspace/blob/17dd6ecd711c83956b14a3e86cd9a9b67bf0d498/templates/system-architecture.md)
