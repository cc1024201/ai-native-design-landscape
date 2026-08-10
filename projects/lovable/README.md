# Lovable

> Research status: **Seed / v0.1** · Last reviewed: **2026-08-10**

| Field | Value |
|---|---|
| Organization / team | Lovable |
| Category | AI app builder with visual editing |
| Status | Active |
| Source availability | Closed |

## Scope

An AI software builder with a live application preview and a toolbar for element selection, annotation and inline visual editing.

## Technical direction

- Uses the running application as the visual feedback surface.
- Converts element/region selection into structured agent context.
- Combines direct lightweight edits with agent-driven implementation changes.
- Maintains a continuous prompt-build-preview-refine loop.

## Public technical choices

- Surface: application Preview Toolbar.
- Targeting: single element, multi-select and drawn annotations.
- Editing: inline text and visual feedback.
- Agent context: selected visual elements can be attached directly to instructions.

## Evidence boundary

This file records only this project. Undisclosed internal implementation details are left unknown rather than inferred. Cross-project comparison belongs in the repository root.

## Primary sources

- https://docs.lovable.dev/features/preview-toolbar
