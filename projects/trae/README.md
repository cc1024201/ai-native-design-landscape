# TRAE / TRAE Work

> Research status: **Seed / v0.1** · Last reviewed: **2026-08-10**

| Field | Value |
|---|---|
| Organization / team | ByteDance |
| Category | Coding agent with visual workflow |
| Status | Active |
| Source availability | Closed |

## Scope

An agentic development/work environment that exposes design as a dedicated work mode alongside code-oriented workflows.

## Technical direction

- Places visual design inside a broader agent workspace.
- Uses browser/runtime context for element-level targeting and feedback.
- Connects visual iteration directly to code-producing agent actions.
- Expands the workbench model beyond coding into domain-specific work modes.

## Public technical choices

- Surface: desktop/IDE workbench with browser preview and design-oriented mode.
- Interaction: select rendered UI elements and send visual context to the agent.
- Artifact: running web UI backed by project files.
- Agent: task execution remains integrated with the broader TRAE agent environment.

## Evidence boundary

This file records only this project. Undisclosed internal implementation details are left unknown rather than inferred. Cross-project comparison belongs in the repository root.

## Research gaps

- Detailed current Design-mode protocol and source-mapping implementation are not publicly documented.

## Primary sources

- https://www.trae.ai/work
- https://www.trae.ai/blog/product_solo
