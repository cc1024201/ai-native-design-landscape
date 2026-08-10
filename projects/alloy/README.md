# Alloy

> Research status: **Seed / v0.1** · Last reviewed: **2026-08-10**

| Field | Value |
|---|---|
| Organization / team | Alloy |
| Category | AI prototyping + code context |
| Status | Active |
| Source availability | Closed |

## Scope

An AI prototyping workspace designed to preserve product, component-library and code context and to produce implementation-oriented outputs.

## Technical direction

- Captures real product/design-system context before generating prototype changes.
- Keeps design, chat and code context together in a session.
- Exposes session context through MCP to coding agents.
- Supports repository-oriented output such as code/PR workflows.

## Public technical choices

- Surface: browser prototyping workspace.
- Context: product capture, component/design-system and source context.
- Integration: MCP exposes session files and diffs.
- Output: prototype and production-oriented code changes.

## Evidence boundary

This file records only this project. Undisclosed internal implementation details are left unknown rather than inferred. Cross-project comparison belongs in the repository root.

## Primary sources

- https://alloy.app/
- https://alloy.app/launches
- https://alloy.app/guide/integrations/codex-mcp
