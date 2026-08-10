# Claude Design

> Research status: **Seed / v0.1** · Last reviewed: **2026-08-10**

| Field | Value |
|---|---|
| Organization / team | Anthropic |
| Category | Agent-first design |
| Status | Active / beta |
| Source availability | Closed |

## Scope

A conversational design environment centered on a live canvas and editable design artifacts.

## Technical direction

- Treats the design artifact as the primary object of iteration rather than source code alone.
- Combines conversational generation with targeted visual feedback and direct edits.
- Uses design-system context to constrain generation and preserve product/brand consistency.
- Maintains continuity from design exploration into downstream implementation workflows.

## Public technical choices

- Surface: chat + canvas + live/interactive artifacts.
- Interaction: conversation, targeted comments/selection, direct edits, generated adjustment controls.
- Inputs: text, images, documents, codebase/design-system context.
- Outputs: editable design artifacts and implementation-oriented handoff.

## Evidence boundary

This file records only this project. Undisclosed internal implementation details are left unknown rather than inferred. Cross-project comparison belongs in the repository root.

## Research gaps

- Internal rendering model and editor implementation are not publicly documented.

## Primary sources

- https://www.anthropic.com/news/claude-design-anthropic-labs
- https://support.claude.com/en/articles/14604416-get-started-with-claude-design
- https://support.claude.com/en/articles/14604397-set-up-your-design-system-in-claude-design
