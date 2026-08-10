# Kombai

> Research status: **Seed / v0.1** · Last reviewed: **2026-08-10**

| Field | Value |
|---|---|
| Organization / team | Kombai |
| Category | Design engineering agent |
| Status | Active |
| Source availability | Closed |

## Scope

An IDE-integrated design-engineering agent covering design generation, production frontend code, visual editing and automated testing.

## Technical direction

- Unifies design, implementation, visual refinement and verification in an IDE workflow.
- Builds codebase-specific context graphs for reusable components, tokens and primitives.
- Uses a browser surface for element selection, live text/style edits and agent-controlled testing.
- Supports dedicated Design and planning modes in addition to code/debug workflows.

## Public technical choices

- Surface: IDE + integrated browser.
- Modes: Plan, Code, Debug, Ask and Design.
- Context: indexed reusable components, tokens, state primitives and code relationships.
- Visual tools: DOM selection, text/style editing and browser automation.

## Evidence boundary

This file records only this project. Undisclosed internal implementation details are left unknown rather than inferred. Cross-project comparison belongs in the repository root.

## Primary sources

- https://docs.kombai.com/get-started/welcome
- https://docs.kombai.com/features/modes
- https://docs.kombai.com/context/context-graphs
- https://docs.kombai.com/browser/overview
