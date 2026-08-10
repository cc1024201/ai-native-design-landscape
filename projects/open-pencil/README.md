# OpenPencil (open-pencil/open-pencil)

> Research status: **Seed / v0.1** · Last reviewed: **2026-08-10**

| Field | Value |
|---|---|
| Organization / team | OpenPencil |
| Category | Agent-controllable design editor |
| Status | Active |
| Source availability | Open source |

## Scope

An open-source Figma-compatible visual design editor with CLI/MCP interfaces for AI agents.

## Technical direction

- Keeps a full visual-design editor while adding programmatic/headless access for agents.
- Exposes design operations as MCP tools instead of forcing agents to drive only the GUI.
- Supports structured design files and reusable design-system concepts.
- Targets both human interactive editing and agent automation.

## Public technical choices

- Surface: desktop/web visual design editor.
- Agent interface: MCP server plus CLI/programmatic APIs.
- Rendering/editor stack: public repository includes Skia/WebGPU-oriented design-editor components.
- Tools: broad design operation set exposed to agents.

## Evidence boundary

This file records only this project. Undisclosed internal implementation details are left unknown rather than inferred. Cross-project comparison belongs in the repository root.

## Primary sources

- https://github.com/open-pencil/open-pencil
- https://github.com/open-pencil/skills
