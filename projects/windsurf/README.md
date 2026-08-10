# Windsurf

> Research status: **Seed / v0.1** · Last reviewed: **2026-08-10**

| Field | Value |
|---|---|
| Organization / team | Cognition |
| Category | Coding agent with visual workflow |
| Status | Active |
| Source availability | Closed |

## Scope

An agentic coding environment with application previews that can feed selected rendered elements and runtime context back into coding-agent sessions.

## Technical direction

- Uses the running application as an agent-observation surface.
- Lets visual targets become explicit coding context rather than screenshot-only feedback.
- Keeps source editing and runtime verification within the development workflow.
- Treats preview as part of iterative agent execution.

## Public technical choices

- Surface: IDE/Desktop preview.
- Targeting: rendered component/element selection.
- Context: selected visual/runtime state can be sent into agent sessions.
- Artifact: existing application source and runtime.

## Evidence boundary

This file records only this project. Undisclosed internal implementation details are left unknown rather than inferred. Cross-project comparison belongs in the repository root.

## Primary sources

- https://docs.windsurf.com/windsurf/previews
