# Onlook

> Research status: **Seed / v0.1** · Last reviewed: **2026-08-10**

| Field | Value |
|---|---|
| Organization / team | Onlook |
| Category | Code-native visual surface |
| Status | Active |
| Source availability | Open source |

## Scope

An open-source visual-first editor for React applications that edits real application code through a canvas-oriented interface.

## Technical direction

- Treats the codebase as the durable implementation artifact.
- Renders real React applications and allows visual manipulation against the running/generated UI.
- Connects visual operations back to source code rather than maintaining a separate opaque design model.
- Combines AI-assisted creation with direct visual styling.

## Public technical choices

- Target stack: React/Next.js projects; Tailwind-oriented workflows are prominently supported.
- Surface: visual canvas/editor over a running web application.
- Source relationship: visual edits write back to project code.
- Implementation: public GitHub repositories provide the editor/runtime source.

## Evidence boundary

This file records only this project. Undisclosed internal implementation details are left unknown rather than inferred. Cross-project comparison belongs in the repository root.

## Primary sources

- https://github.com/onlook-dev/onlook
- https://github.com/onlook-dev/desktop
