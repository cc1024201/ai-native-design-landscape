# Codex

> Research status: **Seed / v0.1** · Last reviewed: **2026-08-10**

| Field | Value |
|---|---|
| Organization / team | OpenAI |
| Category | Coding agent with visual workflow |
| Status | Active |
| Source availability | Core/CLI/App Server open; primary rich clients closed |

## Scope

A coding-agent system whose desktop/browser workflows increasingly expose visual inspection, targeting, annotation, and UI refinement.

## Technical direction

- Keeps the agent harness separate from client surfaces through App Server.
- Uses a real browser/runtime as an observation and verification surface for frontend work.
- Turns visual targeting and annotations into structured context for the coding agent.
- Preserves source code/workspace as the implementation state rather than introducing a separate design document.

## Public technical choices

- Agent protocol: local App Server with thread/turn/item/approval/event semantics.
- Visual loop: run app → inspect browser → annotate/target → agent edits code → verify.
- Execution: local workspace and managed cloud environments are separate from interaction surfaces.
- Open-source references: Codex CLI, core and App Server.

## Evidence boundary

This file records only this project. Undisclosed internal implementation details are left unknown rather than inferred. Cross-project comparison belongs in the repository root.

## Primary sources

- https://developers.openai.com/codex/app-server
- https://developers.openai.com/codex/browser
- https://openai.com/index/unlocking-the-codex-harness/
- https://github.com/openai/codex
