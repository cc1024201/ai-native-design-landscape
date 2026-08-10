# Tuna

> Research status: **Seed / v0.1** · Last reviewed: **2026-08-10**

| Field | Value |
|---|---|
| Organization / team | Tuna contributors |
| Category | Visual manipulation layer |
| Status | Active |
| Source availability | Open-source repository |

## Scope

A Retune-derived visual layer that integrates with local coding-agent workflows through MCP/skills and structured design context.

## Technical direction

- Keeps direct visual adjustment separate from source-code generation.
- Uses MCP/agent configuration to connect the visual layer to local coding workflows.
- Extracts reusable design context such as tokens for agent consumption.
- Targets a local developer workflow.

## Public technical choices

- Surface: live visual editing layer.
- Integration: MCP plus agent skill/configuration.
- Context: design-token extraction and structured change data.
- Artifact: existing application source.

## Evidence boundary

This file records only this project. Undisclosed internal implementation details are left unknown rather than inferred. Cross-project comparison belongs in the repository root.

## Primary sources

- https://github.com/suryanewa/Tuna
