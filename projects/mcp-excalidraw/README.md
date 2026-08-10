# mcp_excalidraw

> Research status: **Seed / v0.1** · Last reviewed: **2026-08-10**

| Field | Value |
|---|---|
| Organization / team | Community contributors |
| Category | Canvas/agent bridge primitive |
| Status | Active / early |
| Source availability | Open source |

## Scope

A family of MCP integrations exposing an Excalidraw-style live canvas to AI agents for diagrammatic/visual work.

## Technical direction

- Makes a spatial canvas available as agent tools.
- Uses MCP as the control and synchronization boundary.
- Targets diagrams/sketches rather than production UI code.
- Demonstrates live agent-to-canvas interaction as a reusable pattern.

## Public technical choices

- Surface: Excalidraw-style canvas.
- Interface: MCP.
- Artifact: diagram/drawing document.
- Implementation: community open-source repositories.

## Evidence boundary

This file records only this project. Undisclosed internal implementation details are left unknown rather than inferred. Cross-project comparison belongs in the repository root.

## Research gaps

- Canonical implementation needs to be selected and pinned in a future pass.

## Primary sources

- https://github.com/topics/excalidraw-mcp
