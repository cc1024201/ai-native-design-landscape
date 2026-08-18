# stitch-kit

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

stitch-kit is an installable orchestration layer over Google Stitch. It teaches coding agents to research visual directions, generate and iterate native Stitch screens, manage design systems and then materialize approved screens into production frameworks.

## The remote screen and delivered code are different authorities

The orchestrator decides whether a request is specific enough to generate directly or should first produce three researched directions. It then creates a project and batch-generates screens through Stitch MCP. The pinned repository records exact MCP schemas because Stitch operations accept several incompatible project and screen identifier forms; wrapper skills normalize those identities before calls.

[`stitch-ideate/SKILL.md`](https://github.com/gabelul/stitch-kit/blob/10e08082881370888bab06d8c9f54621bb81884d/skills/stitch-ideate/SKILL.md) owns research and direction selection. [`stitch-loop/SKILL.md`](https://github.com/gabelul/stitch-kit/blob/10e08082881370888bab06d8c9f54621bb81884d/skills/stitch-loop/SKILL.md) closes iterative visual verification. The design-system skill can upload or create `DESIGN.md` context and framework converters then turn approved HTML into Next.js, React, Svelte, native or other target source.

```text
brief -> directions/PRD -> native Stitch screens -> edit/variants
-> approved screen HTML -> framework conversion -> repository verification
```

Stitch owns the editable remote screen graph; the target repository owns final application code. The toolkit does not evidence a reversible source-to-Stitch identity map. Its session helper can reorient an agent after context compaction but does not replace Stitch persistence.

The project is Apache-2.0 licensed. No reliable team-region evidence was found.

## Source map

- [Pinned repository](https://github.com/gabelul/stitch-kit/tree/10e08082881370888bab06d8c9f54621bb81884d)
- [Architecture](https://github.com/gabelul/stitch-kit/blob/10e08082881370888bab06d8c9f54621bb81884d/docs/architecture.md)
- [MCP schemas](https://github.com/gabelul/stitch-kit/tree/10e08082881370888bab06d8c9f54621bb81884d/docs/mcp-schemas)
- [Apache-2.0 license](https://github.com/gabelul/stitch-kit/blob/10e08082881370888bab06d8c9f54621bb81884d/LICENSE)
