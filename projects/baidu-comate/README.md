# Comate

> Research status: **Seed / v0.1** · Last reviewed: **2026-08-10**

| Field | Value |
|---|---|
| Organization / team | Baidu |
| Category | Coding agent with design workflow |
| Status | Active |
| Source availability | Closed |

## Scope

Baidu's AI coding environment with frontend preview, design input and design/code interoperability workflows.

## Technical direction

- Brings design context into the AI IDE rather than treating it only as an external handoff.
- Uses selected design/UI context as agent input.
- Connects design artifacts and implementation workflows in both directions.
- Keeps coding-agent execution grounded in the project workspace.

## Public technical choices

- Surface: AI IDE with agent workflow and preview.
- Design context: design files/selected elements can be supplied to the agent.
- Output: generated frontend implementation.
- Integration: design/code exchange is exposed as product workflow.

## Evidence boundary

This file records only this project. Undisclosed internal implementation details are left unknown rather than inferred. Cross-project comparison belongs in the repository root.

## Research gaps

- Public documentation gives product behavior but not the internal rendering/source-mapping stack.

## Primary sources

- https://comate.baidu.com/zh/readme
- https://comate.baidu.com/zh/news/news/27
