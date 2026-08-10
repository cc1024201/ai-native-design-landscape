# Superdesign

> Research status: **Seed / v0.1** · Last reviewed: **2026-08-10**

| Field | Value |
|---|---|
| Organization / team | Superdesign |
| Category | Design agent / agent-controllable canvas |
| Status | Active |
| Source availability | Open-source components |

## Scope

An AI product-design agent and infinite canvas that can be invoked from coding-agent workflows through a skill/CLI.

## Technical direction

- Separates design exploration from final implementation while keeping both connected through the coding workflow.
- Uses an infinite canvas to branch and inspect multiple visual directions.
- Can read project context to shape generated UI.
- Exposes its design workflow as an installable skill for coding agents.

## Public technical choices

- Surface: infinite design canvas.
- Artifact/output: UI directions plus React/Tailwind-oriented implementation assets.
- Agent integration: skill and CLI.
- Open source: public Superdesign and skill repositories exist.

## Evidence boundary

This file records only this project. Undisclosed internal implementation details are left unknown rather than inferred. Cross-project comparison belongs in the repository root.

## Primary sources

- https://superdesign.dev/
- https://github.com/superdesigndev/superdesign
- https://github.com/superdesigndev/superdesign-skill
