# Penpot Skills

> Research status: **Source-level** · Lifecycle: **active-transition** · Last reviewed: **2026-08-12**

Penpot Skills is an independent workflow library over Penpot MCP. It packages actual multi-step transformations rather than a directory of prompts: code-to-design-system generation, system-bound screen design, Figma migration, token inference, semantic layer naming and accessibility review.

## Scripts make each phase executable

The design-system workflow first inspects both code and the target Penpot file, locks scope, builds primitive and semantic tokens, then creates components in dependency order and audits bindings. [`penpot-generate-library/SKILL.md`](https://github.com/elhombretecla/penpot-skills/blob/9c3d9f3dd12a8248e725b0478c2f02f7b2eb9eed/penpot-generate-library/SKILL.md) governs that path.

The Figma migration skill creates an intermediate representation before native writes so Auto Layout, variables, variants and aliases have explicit Penpot mappings and known gaps. The UI-creation skill proposes a direction card, waits for approval, constructs tokens and components, assembles the screen, exports a screenshot and self-critiques against a score threshold.

```text
code/Figma/brief -> inspected plan or IR -> approval
-> sequential execute_code operations -> native Penpot objects
-> exported visual QA + binding/accessibility audit -> correction
```

Every mutation is executed inside the Penpot plugin API environment; Penpot remains authoritative. Script templates are parameterized operation payloads, not a separate document store. Recovery depends on the host file and its history.

No license file was present. The maintainer profile reports Madrid in Spain.

## Pinned sources

- [Repository](https://github.com/elhombretecla/penpot-skills/tree/9c3d9f3dd12a8248e725b0478c2f02f7b2eb9eed)
- [Screen-generation skill](https://github.com/elhombretecla/penpot-skills/blob/9c3d9f3dd12a8248e725b0478c2f02f7b2eb9eed/penpot-generate-design/SKILL.md)
- [Figma migration skill](https://github.com/elhombretecla/penpot-skills/blob/9c3d9f3dd12a8248e725b0478c2f02f7b2eb9eed/penpot-import-figma/SKILL.md)
- [Quality audit script](https://github.com/elhombretecla/penpot-skills/blob/9c3d9f3dd12a8248e725b0478c2f02f7b2eb9eed/penpot-create-ui/scripts/auditDesignQuality.js)
