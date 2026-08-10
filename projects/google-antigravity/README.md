# Google Antigravity

> Research status: **Seed / v0.1** · Last reviewed: **2026-08-10**

| Field | Value |
|---|---|
| Organization / team | Google |
| Category | Coding agent with visual workflow |
| Status | Active |
| Source availability | Closed client; agent API available |

## Scope

Google's agent-first development platform combining coding, terminal/browser execution and artifact-based agent workflows.

## Technical direction

- Separates agent management from the traditional editor interaction model.
- Gives agents browser control for end-to-end frontend implementation and verification.
- Uses artifacts and asynchronous agent work as first-class interaction objects.
- Shares agent context across development surfaces and export flows.

## Public technical choices

- Surface: agent-first development application plus IDE-oriented experience.
- Tools: code execution, filesystem, terminal and browser control.
- Agent runtime: available through Google-hosted Antigravity agent APIs.
- Frontend loop: agent can launch localhost, actuate browser and verify changes.

## Evidence boundary

This file records only this project. Undisclosed internal implementation details are left unknown rather than inferred. Cross-project comparison belongs in the repository root.

## Primary sources

- https://antigravity.google/blog/introducing-google-antigravity
- https://developers.googleblog.com/en/build-with-google-antigravity-our-new-agentic-development-platform/
- https://ai.google.dev/gemini-api/docs/antigravity-agent
