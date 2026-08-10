# Nimbalyst

> Research status: **Seed / v0.1** · Last reviewed: **2026-08-10**

| Field | Value |
|---|---|
| Organization / team | Nimbalyst |
| Category | Generic visual workspace over agents |
| Status | Active |
| Source availability | Open source |

## Scope

An open-source visual workspace for local coding agents, with visual editors for documents, mockups, diagrams and other project artifacts.

## Technical direction

- Treats visual workspaces as a layer above existing coding-agent sessions.
- Supports multiple visual artifact types instead of hard-coding a single UI-design canvas.
- Uses WYSIWYG diffs/approval to make agent edits reviewable.
- Combines sessions/tasks/worktrees with editable visual project artifacts.

## Public technical choices

- Surface: desktop visual workspace.
- Artifact editors: markdown, mockups, diagrams, CSV/data models and extensions.
- Agent integration: local coding-agent sessions.
- Implementation: open-source desktop application with extension model.

## Evidence boundary

This file records only this project. Undisclosed internal implementation details are left unknown rather than inferred. Cross-project comparison belongs in the repository root.

## Primary sources

- https://github.com/Nimbalyst/nimbalyst
- https://nimbalyst.com/
