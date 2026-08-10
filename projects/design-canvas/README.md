# Design Canvas

> Research status: **Seed / v0.1** · Last reviewed: **2026-08-10**

| Field | Value |
|---|---|
| Organization / team | Design Canvas |
| Category | Agent-controlled runtime canvas |
| Status | Active |
| Source availability | Closed / source status unconfirmed |

## Scope

A Figma-style infinite canvas for viewing multiple real screens/routes of applications written by external AI coding agents.

## Technical direction

- Does not attempt to replace the coding agent.
- Makes the running application the content of the canvas.
- Uses an infinite spatial board to organize routes, devices and states.
- Exposes canvas control to agents through MCP.

## Public technical choices

- Surface: infinite canvas containing live application frames.
- Artifact: application served by a local dev server.
- Agent interface: MCP.
- Viewport model: multiple routes/device sizes can coexist spatially.

## Evidence boundary

This file records only this project. Undisclosed internal implementation details are left unknown rather than inferred. Cross-project comparison belongs in the repository root.

## Primary sources

- https://www.designcanvas.app/
