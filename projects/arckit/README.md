# ArcKit

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

ArcKit is an architecture-governance plugin whose artifacts include high- and detailed-level designs, decisions, reviews, Wardley maps and diagrams. The older `arc-kit` repository remains a compatibility entry point; `arckit-claude` is the current source, so both resolve to one product lineage.

## Architecture artifacts form a governed filesystem graph

Commands create numbered Markdown artifacts from versioned templates and connect them with identifiers and review states. Diagram workflows produce Mermaid or PlantUML alongside the written architecture. Hooks inject context and warn when dependent artifacts become stale; conversion scripts can materialize model data into diagrams, while OKF import/export preserves provenance at a controlled boundary.

Git and the artifact tree are authoritative. Rendered diagrams make relationships legible, but updates must return to source documents and pass the review workflow rather than becoming detached pictures.

## Evidence

- [Pinned current repository](https://github.com/tractorjuice/arckit-claude/tree/d4d095e19ded180181c81550fbcc4354356f9afe)
- [Diagram command](https://github.com/tractorjuice/arckit-claude/blob/d4d095e19ded180181c81550fbcc4354356f9afe/commands/diagram.md)
- [Architecture workflow](https://github.com/tractorjuice/arckit-claude/blob/d4d095e19ded180181c81550fbcc4354356f9afe/skills/architecture-workflow/SKILL.md)
- [Stale-artifact hook](https://github.com/tractorjuice/arckit-claude/blob/d4d095e19ded180181c81550fbcc4354356f9afe/hooks/notify-stale-artifacts.mjs)
