# Penpot AI Kit

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

Penpot AI Kit is Penpot's official installable behavior layer for agent work. It turns the raw Penpot MCP capability into governed workflows for foundations, components, screens, code reconstruction, Figma migration, audits, handoff and portable `DESIGN.md` extraction.

## Mutation is checkpointed by policy

[`AGENTS.md`](https://github.com/penpot/penpot-ai-kit/blob/c63d8e3717323fad859e794848e5a602b155a7ec/AGENTS.md) supplies house rules and routing. Skills distinguish three authority modes: suggest-only audits, review-gated operations and small approved auto-fixes. Meaningful writes require a preview image and summary before continuation.

Shared schemas make outputs testable. [`pipeline.schema.json`](https://github.com/penpot/penpot-ai-kit/blob/c63d8e3717323fad859e794848e5a602b155a7ec/shared/pipeline.schema.json) describes phase state. Report schemas cover accessibility, token governance, drift and design quality. Golden evals exercise design-to-code drift, handoff and `DESIGN.md` extraction.

```text
brief/code/Figma evidence -> routed skill -> proposed native operations
-> preview + user checkpoint -> Penpot graph mutation
-> audit/self-grade -> revise or handoff/DESIGN.md
```

Penpot's file remains authoritative and editable; the installed kit is a read-only seed copied into user scope. The installer records exactly what it wires and keeps MCP keys in client configuration rather than the project. Versioning and undo belong to Penpot; reports and `DESIGN.md` are downstream evidence artifacts.

No license file was present in this repository. The Penpot organization profile reports Madrid in Spain.

## Decisive evidence

- [Pinned repository](https://github.com/penpot/penpot-ai-kit/tree/c63d8e3717323fad859e794848e5a602b155a7ec)
- [Architecture](https://github.com/penpot/penpot-ai-kit/blob/c63d8e3717323fad859e794848e5a602b155a7ec/docs/architecture.md)
- [Screen-building skill](https://github.com/penpot/penpot-ai-kit/blob/c63d8e3717323fad859e794848e5a602b155a7ec/skills/penpot-build-screen/SKILL.md)
- [Evaluation fixtures](https://github.com/penpot/penpot-ai-kit/tree/c63d8e3717323fad859e794848e5a602b155a7ec/evals/golden)
