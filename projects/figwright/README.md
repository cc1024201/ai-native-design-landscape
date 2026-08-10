# Figwright

> Research status: **Seed / v0.1** · Last reviewed: **2026-08-10**

| Field | Value |
|---|---|
| Organization / team | Figwright contributors |
| Category | Design/agent bridge primitive |
| Status | Active / early |
| Source availability | Open source |

## Scope

An MCP-oriented bridge for bidirectional design/coding-agent workflows around structured design canvases.

## Technical direction

- Uses MCP to expose design operations to coding agents.
- Targets both reading design context and writing generated design changes back.
- Keeps the bridge layer separate from the coding-agent runtime.
- Explores bidirectional design-to-code/code-to-design automation.

## Public technical choices

- Interface: MCP.
- Artifact: structured design canvas/file.
- Host: external AI coding agents.
- Implementation: public GitHub project.

## Evidence boundary

This file records only this project. Undisclosed internal implementation details are left unknown rather than inferred. Cross-project comparison belongs in the repository root.

## Research gaps

- Exact canonical repository should be pinned in the next research pass.

## Primary sources

- https://github.com/topics/figma-mcp
