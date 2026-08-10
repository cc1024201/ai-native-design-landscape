# onUI

> Research status: **Seed / v0.1** · Last reviewed: **2026-08-10**

| Field | Value |
|---|---|
| Organization / team | onUI contributors |
| Category | Open-source visual interaction primitive |
| Status | Active |
| Source availability | Open source |

## Scope

A browser extension and local MCP bridge that turns direct interaction with a running web interface into structured visual feedback for external coding agents.

## Technical direction

- Uses the rendered application as the user's targeting surface.
- Captures clicks, drawn regions, and annotations as explicit visual context.
- Sends structured feedback to an external coding agent instead of embedding a second coding-agent runtime.
- Emphasizes a local browser-to-agent bridge for development workflows.

## Public technical choices

- Surface: browser extension over a running web application.
- Agent interface: local MCP bridge.
- Interaction primitives: click/target, draw/region selection, annotation, structured feedback.
- Artifact relationship: operates against the existing application/runtime rather than introducing a replacement application source tree.

## Evidence boundary

This file records only this project. Undisclosed implementation details are left unknown rather than inferred. Cross-project comparison belongs in the repository root.

## Primary sources

- https://github.com/onllm-dev/onUI
