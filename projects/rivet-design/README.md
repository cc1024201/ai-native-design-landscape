# Rivet

> Research status: **Seed / v0.1** · Last reviewed: **2026-08-10**

| Field | Value |
|---|---|
| Organization / team | Rivet Design |
| Category | Visual manipulation layer |
| Status | Active |
| Source availability | Closed |

## Scope

A visual editor for real product interfaces that connects to coding agents through MCP and sends design feedback/changes back for code implementation.

## Technical direction

- Uses the real product interface as the visual editing target.
- Captures both comments and precise visual changes.
- Exposes the visual editor to external coding agents over MCP.
- Keeps code implementation in the coding-agent workflow.

## Public technical choices

- Surface: visual editor over an application.
- Interaction: comments plus direct visual design tools.
- Integration: MCP server.
- Loop: visual change → structured context → agent updates code → repeat.

## Evidence boundary

This file records only this project. Undisclosed internal implementation details are left unknown rather than inferred. Cross-project comparison belongs in the repository root.

## Primary sources

- https://rivet.design/
- https://docs.rivet.design/mcp-guide
