# Paper

> Research status: **Seed / v0.1** · Last reviewed: **2026-08-10**

| Field | Value |
|---|---|
| Organization / team | Paper |
| Category | Agent-controllable design canvas |
| Status | Active |
| Source availability | Closed |

## Scope

A design canvas whose document model is based on HTML/CSS and can be read and written by AI agents through MCP.

## Technical direction

- Uses web-native HTML/CSS as the design representation.
- Lets agents read computed styles and write HTML directly into the design document.
- Keeps a human-editable visual canvas and an agent-editable structured representation aligned.
- Targets low-loss movement between design and implementation.

## Public technical choices

- Surface: desktop/web design canvas.
- Representation: HTML/CSS-oriented document model.
- Agent interface: read/write MCP server.
- MCP operations include style inspection and HTML insertion/replacement.

## Evidence boundary

This file records only this project. Undisclosed internal implementation details are left unknown rather than inferred. Cross-project comparison belongs in the repository root.

## Primary sources

- https://paper.design/
- https://paper.design/docs/mcp
