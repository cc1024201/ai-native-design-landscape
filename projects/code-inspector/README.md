# Code Inspector

> Research status: **Seed / v0.1** · Last reviewed: **2026-08-10**

| Field | Value |
|---|---|
| Organization / team | Code Inspector contributors |
| Category | DOM-to-source primitive |
| Status | Active |
| Source availability | Open source |

## Scope

A frontend inspection tool that maps rendered DOM elements back to source locations and can pass that context into AI coding workflows.

## Technical direction

- Uses source-location mapping to reduce ambiguity between rendered UI and code.
- Turns DOM selection into file/line context.
- Adds AI-assistant integration on top of an existing frontend inspection workflow.
- Stays focused on targeting/navigation rather than becoming a full design editor.

## Public technical choices

- Surface: browser/dev overlay.
- Mapping: DOM element → source file/line.
- Agent integration: selected source context can be sent into AI sessions.
- Implementation: open-source frontend tooling.

## Evidence boundary

This file records only this project. Undisclosed internal implementation details are left unknown rather than inferred. Cross-project comparison belongs in the repository root.

## Primary sources

- https://inspector.fe-dev.cn/en/guide/feature/ai.html
