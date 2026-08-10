# Devin

> Research status: **Seed / v0.1** · Last reviewed: **2026-08-10**

| Field | Value |
|---|---|
| Organization / team | Cognition |
| Category | Coding agent with visual/runtime workflow |
| Status | Active |
| Source availability | Closed |

## Scope

An autonomous software-engineering agent whose sessions include a full desktop environment for running, testing, interacting with, and visually verifying applications.

## Technical direction

- Gives the agent a graphical Linux desktop in addition to terminal and code access.
- Uses browser/desktop interaction for end-to-end testing and visual verification of changes.
- Lets users inspect and interact with the same session desktop while application state persists.
- Treats visual application interaction primarily as an execution, testing, and verification capability within the coding-agent workflow.

## Public technical choices

- Execution surface: full Linux desktop environment with browser and GUI interaction.
- Interaction: mouse, keyboard, scrolling, dragging, screenshots and recordings.
- Verification: can start an application, exercise user flows, and return recordings/results after code changes.
- Product delivery: web application that can also be installed as a PWA; the session tool formerly named Browser is now presented as Desktop.

## Evidence boundary

This file records only Devin. Undisclosed internal implementation details are left unknown rather than inferred. Cross-project comparison belongs in the repository root.

## Primary sources

- https://docs.devin.ai/work-with-devin/computer-use
- https://docs.devin.ai/work-with-devin/devin-session-tools
- https://docs.devin.ai/release-notes/2026
