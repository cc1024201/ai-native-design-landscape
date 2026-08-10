# Replit Design

> Research status: **Seed / v0.1** · Last reviewed: **2026-08-10**

| Field | Value |
|---|---|
| Organization / team | Replit |
| Category | Agent-first design surface |
| Status | Active |
| Source availability | Closed |

## Scope

A visual design workspace inside Replit projects, combining an infinite canvas, Agent-driven exploration and direct visual editing.

## Technical direction

- Makes Design and Build distinct but connected project workflows.
- Uses a canvas for multiple frames/directions while keeping generated assets connected to the project.
- Separates deterministic visual edits from changes that require the Agent.
- Supports applying design decisions back to the running application.

## Public technical choices

- Surface: infinite Design Canvas plus Preview.
- Visual Editor: direct text/color/layout/image edits.
- Deterministic path: simple edits update source directly without an agent loop.
- Agent path: complex edits are delegated to Agent.

## Evidence boundary

This file records only this project. Undisclosed internal implementation details are left unknown rather than inferred. Cross-project comparison belongs in the repository root.

## Primary sources

- https://docs.replit.com/learn/design/canvas
- https://docs.replit.com/learn/design/visual-editor
