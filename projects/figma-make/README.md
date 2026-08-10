# Figma Make

> Research status: **Seed / v0.1** · Last reviewed: **2026-08-10**

| Field | Value |
|---|---|
| Organization / team | Figma |
| Category | AI design + app builder |
| Status | Active |
| Source availability | Closed |

## Scope

Figma's prompt-to-working-prototype/application environment integrated with design-system context and Figma's broader design platform.

## Technical direction

- Combines natural-language generation with executable prototype/application output.
- Uses design-system and component context as generation constraints.
- Supports visual editing and code-aware iteration.
- Exposes design/application context to agents through MCP.

## Public technical choices

- Surface: prompt-driven builder with preview and visual editing.
- Artifact: working prototype/application with underlying code.
- Integration: Figma MCP for agent access to design/application context.
- Design system: libraries/components can ground generation.

## Evidence boundary

This file records only this project. Undisclosed internal implementation details are left unknown rather than inferred. Cross-project comparison belongs in the repository root.

## Primary sources

- https://www.figma.com/make/
- https://www.figma.com/solutions/ai-coding-agent/
- https://github.com/mcp/com.figma.mcp/mcp
