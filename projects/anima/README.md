# Anima

> Research status: **Seed / v0.1** · Last reviewed: **2026-08-10**

| Field | Value |
|---|---|
| Organization / team | Anima |
| Category | Design-to-code / agent integration |
| Status | Active |
| Source availability | Closed |

## Scope

A design-to-code platform that exposes design and component context to coding agents and generates implementation-ready frontend code.

## Technical direction

- Interprets structured design artifacts rather than relying only on screenshots.
- Connects design sources and coding agents through MCP.
- Targets reusable frontend implementation rather than flat export.
- Uses design-system and component mapping to improve output fidelity.

## Public technical choices

- Input: structured design files, prompts and visual references.
- Integration: MCP for external agents.
- Output: frontend code/components.
- Workflow: design context remains accessible during implementation.

## Evidence boundary

This file records only this project. Undisclosed internal implementation details are left unknown rather than inferred. Cross-project comparison belongs in the repository root.

## Primary sources

- https://www.animaapp.com/
- https://www.animaapp.com/blog/code/connect-your-ai-coding-agent-to-anima-playground-and-figma-with-mcp/
