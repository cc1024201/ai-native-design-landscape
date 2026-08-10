# Open Design

> Research status: **Seed / v0.1** · Last reviewed: **2026-08-10**

| Field | Value |
|---|---|
| Organization / team | nexu-io / contributors |
| Category | Design tooling for agents |
| Status | Active / early |
| Source availability | Open source |

## Scope

An open-source design toolkit distributed through skills, CLI and MCP so existing agents can invoke design capabilities.

## Technical direction

- Avoids owning the agent runtime by packaging design behavior as agent-consumable tools.
- Uses skills and MCP as the integration boundary.
- Targets multiple coding-agent hosts.
- Treats design capability as reusable infrastructure rather than one monolithic application.

## Public technical choices

- Interfaces: Skills, CLI and MCP server.
- Host model: external agent runtime.
- Artifact/workflow: design generation and editing exposed as callable tools.
- Implementation: public repository.

## Evidence boundary

This file records only this project. Undisclosed internal implementation details are left unknown rather than inferred. Cross-project comparison belongs in the repository root.

## Primary sources

- https://github.com/nexu-io/open-design
