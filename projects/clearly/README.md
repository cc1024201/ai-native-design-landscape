# Clearly

> Research status: **Seed / v0.1** · Last reviewed: **2026-08-10**

| Field | Value |
|---|---|
| Organization / team | Clearly |
| Category | Agent-controllable design canvas |
| Status | Active |
| Source availability | Closed |

## Scope

A real-time AI design canvas for editable vector/raster work that exposes generate, perceive and act capabilities to agents through MCP/API/CLI.

## Technical direction

- Treats agents as first-class canvas operators rather than only prompt sources.
- Exposes a generate → perceive → act loop over the same editable canvas humans use.
- Keeps vector output editable instead of flattening all generated work to images.
- Provides both interactive and headless control paths.

## Public technical choices

- Surface: real-time vector design canvas.
- Artifact: editable vector/raster design.
- Agent interfaces: hosted MCP, REST API and CLI.
- Agent primitives: generate, canvas perception and canvas actions.

## Evidence boundary

This file records only this project. Undisclosed internal implementation details are left unknown rather than inferred. Cross-project comparison belongs in the repository root.

## Primary sources

- https://www.clearly.sh/
- https://agents.clearly.sh/
