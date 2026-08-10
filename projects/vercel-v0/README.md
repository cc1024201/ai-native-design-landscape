# v0

> Research status: **Seed / v0.1** · Last reviewed: **2026-08-10**

| Field | Value |
|---|---|
| Organization / team | Vercel |
| Category | AI app builder with visual editing |
| Status | Active |
| Source availability | Closed |

## Scope

An agentic application builder that generates working web applications and exposes a visual Design Mode for iterative refinement.

## Technical direction

- Starts from executable application output rather than a static design mock.
- Combines agent generation, live preview and visual refinement in one loop.
- Keeps the result code-oriented and deployable.
- Uses visual editing as an additional control channel over agent-generated software.

## Public technical choices

- Surface: chat/agent + live preview + Design Mode.
- Artifact: runnable web application/code.
- Editing: visual style/content controls plus prompt-based changes.
- Deployment: integrated with Vercel's web application platform.

## Evidence boundary

This file records only this project. Undisclosed internal implementation details are left unknown rather than inferred. Cross-project comparison belongs in the repository root.

## Primary sources

- https://v0.dev/
