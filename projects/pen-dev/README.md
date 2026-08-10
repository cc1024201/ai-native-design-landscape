# pen.dev

> Research status: **Seed / v0.1** · Last reviewed: **2026-08-10**

| Field | Value |
|---|---|
| Organization / team | pen.dev |
| Category | Agent-controllable design canvas |
| Status | Active |
| Source availability | Closed product; open design format |

## Scope

An agent-driven design canvas built around MCP and a design format intended to live alongside the codebase.

## Technical direction

- Makes the canvas directly operable by external agents.
- Stores design state in an explicit file format rather than hiding all state in a hosted editor.
- Uses MCP as the primary automation/control boundary.
- Supports human and agent iteration on the same design artifact.

## Public technical choices

- Surface: design canvas.
- Artifact: .pen/open design-format files in the project.
- Agent interface: MCP.
- Workflow: agent creates/edits canvas artifact; humans refine visually.

## Evidence boundary

This file records only this project. Undisclosed internal implementation details are left unknown rather than inferred. Cross-project comparison belongs in the repository root.

## Primary sources

- https://www.pen.dev/
