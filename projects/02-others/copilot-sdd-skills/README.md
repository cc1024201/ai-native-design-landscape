# Copilot SDD Skills

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

Copilot SDD Skills defines software design as a chain of versionable requirements, architecture, analysis, refinement and ticket artifacts. Mermaid is embedded in that chain rather than generated as an isolated answer.

## Artifact sequence is explicit

At commit [`d2e03db0`](https://github.com/MaximilianMayr94/skills/tree/d2e03db0cb51632d8575f1004f516998c80ad944), initialization creates requirement context, the architect skill writes an architecture document, analysis critiques it and refinement decomposes components and interfaces.

## Templates stabilize the handoff

Default Markdown files give each stage a durable schema and tell the agent where diagrams belong. Later ticket preparation consumes those records, so architecture output participates in implementation planning.

## Authority and review

Files in the repository are authoritative. The workflow can regenerate or revise them through Copilot skills and review them through Git; there is no separate visual database or bidirectional canvas.

## Evidence

- [Pinned repository](https://github.com/MaximilianMayr94/skills/tree/d2e03db0cb51632d8575f1004f516998c80ad944)
- [Architecture skill](https://github.com/MaximilianMayr94/skills/blob/d2e03db0cb51632d8575f1004f516998c80ad944/.github/skills/architect/SKILL.md)
- [Architecture template](https://github.com/MaximilianMayr94/skills/blob/d2e03db0cb51632d8575f1004f516998c80ad944/.github/skills/architect/architecture.default.md)
- [Analysis stage](https://github.com/MaximilianMayr94/skills/blob/d2e03db0cb51632d8575f1004f516998c80ad944/.github/skills/analyse/SKILL.md)
- [Ticket handoff](https://github.com/MaximilianMayr94/skills/blob/d2e03db0cb51632d8575f1004f516998c80ad944/.github/skills/ticket_prep/SKILL.md)
