# Tempo

> Research status: **Seed / v0.1** · Last reviewed: **2026-08-10**

| Field | Value |
|---|---|
| Organization / team | Tempo Labs |
| Category | Code-native visual surface |
| Status | Active |
| Source availability | Closed |

## Scope

A visual development canvas that edits real React code from an existing repository and integrates with coding agents.

## Technical direction

- Uses production React code as the object being visually edited.
- Places visual planning and direct editing in the same workspace as implementation.
- Uses git/worktree mechanics for isolated project changes.
- Connects coding-agent feature work to a canvas-oriented UI workflow.

## Public technical choices

- Surface: visual React canvas.
- Artifact: existing React repository.
- Versioning/isolation: workspace backed by git worktree.
- Agent integration: external coding agents can implement from the same workspace.

## Evidence boundary

This file records only this project. Undisclosed internal implementation details are left unknown rather than inferred. Cross-project comparison belongs in the repository root.

## Primary sources

- https://www.tempo.new/
- https://www.tempo.new/blog/january-recap-closing-the-gap-between-canvas-and-code
