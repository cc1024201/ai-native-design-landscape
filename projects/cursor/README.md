# Cursor

> Research status: **Seed / v0.1** · Last reviewed: **2026-08-10**

| Field | Value |
|---|---|
| Organization / team | Anysphere |
| Category | Coding agent with visual workflow |
| Status | Active |
| Source availability | Closed |

## Scope

An AI coding environment with a browser-based Design Mode for spatially targeting and manipulating running interfaces.

## Technical direction

- Keeps UI work inside the coding environment instead of creating a separate design document.
- Binds selected rendered elements to their code and surrounding layout context.
- Supports direct manipulation for deterministic visual changes and agent-driven changes for semantic edits.
- Uses the live application as the visual surface.

## Public technical choices

- Surface: integrated browser with Design Mode.
- Targeting: element selection, multi-selection, drawing/region prompts and voice.
- Manipulation: drag-and-drop and visual property controls for layout/style.
- Code relationship: changes are applied to the application codebase.

## Evidence boundary

This file records only this project. Undisclosed internal implementation details are left unknown rather than inferred. Cross-project comparison belongs in the repository root.

## Primary sources

- https://cursor.com/blog/design-mode
- https://cursor.com/blog/browser-visual-editor
- https://cursor.com/changelog/design-mode-improvements
