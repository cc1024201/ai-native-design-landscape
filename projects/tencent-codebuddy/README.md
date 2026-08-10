# CodeBuddy

> Research status: **Seed / v0.1** · Last reviewed: **2026-08-10**

| Field | Value |
|---|---|
| Organization / team | Tencent |
| Category | Coding agent with design workflow |
| Status | Active |
| Source availability | Closed |

## Scope

Tencent's AI coding environment integrating design, coding, debugging and deployment in a single IDE/agent workflow.

## Technical direction

- Treats design-to-code and frontend iteration as native parts of the coding agent workflow.
- Combines agent mode with IDE context and browser-oriented frontend work.
- Supports project-level agents and extensible agent workflows.
- Keeps generated implementation within the software project.

## Public technical choices

- Surface: AI IDE and CLI.
- Agent mode: autonomous project actions and code generation.
- Design path: design input can be transformed into maintainable implementation code.
- Extensibility: custom agents and tool-oriented workflows.

## Evidence boundary

This file records only this project. Undisclosed internal implementation details are left unknown rather than inferred. Cross-project comparison belongs in the repository root.

## Primary sources

- https://www.codebuddy.ai/docs/ide/User-guide/Agent-Mode/Quickstart
- https://www.codebuddy.cn/docs/ide/User-guide/Overview
