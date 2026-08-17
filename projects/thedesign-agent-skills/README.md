# The Design Project Agent Skills

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

The Design Project Agent Skills is a broad distribution, but this record covers the coherent Design-producing subset rather than counting every utility as a product. That subset turns sites, component libraries, application source and briefs into explicit design-system metadata, Figma layouts, audited interfaces and runnable HTML presentations.

## Different skills preserve different authorities

[`ai-component-metadata`](https://github.com/thedesignproject/agent-skills/blob/5ff8eb121f56d6d1cbf39626dfd82cac50f11efc/skills/ai-component-metadata/SKILL.md) generates machine-readable usage and variant contracts with a supporting Python script. [`extract-design-system`](https://github.com/thedesignproject/agent-skills/blob/5ff8eb121f56d6d1cbf39626dfd82cac50f11efc/skills/extract-design-system/SKILL.md) materializes observed site primitives. [`figma-generate-design`](https://github.com/thedesignproject/agent-skills/blob/5ff8eb121f56d6d1cbf39626dfd82cac50f11efc/skills/figma-generate-design/SKILL.md) writes application views into native Figma, while the presentation skill owns a self-contained HTML deck.

```text
site/source/brief -> selected skill contract
-> metadata or tokens / native Figma graph / HTML deck
-> skill-specific audit or visual check -> revise artifact
```

There is no single universal model: files remain authority for metadata, tokens and decks; Figma remains authority for native layouts. The common product is an installable operational layer with explicit outputs and checks. The collection also contains unrelated skills; they are not evidence for the Design census.

The repository is MIT-licensed. The organization profile reports the United States.

## Evidence

- [Pinned repository](https://github.com/thedesignproject/agent-skills/tree/5ff8eb121f56d6d1cbf39626dfd82cac50f11efc)
- [Metadata generator](https://github.com/thedesignproject/agent-skills/blob/5ff8eb121f56d6d1cbf39626dfd82cac50f11efc/skills/ai-component-metadata/scripts/generate_metadata.py)
- [Presentation skill](https://github.com/thedesignproject/agent-skills/blob/5ff8eb121f56d6d1cbf39626dfd82cac50f11efc/skills/presentation/SKILL.md)
- [MIT license](https://github.com/thedesignproject/agent-skills/blob/5ff8eb121f56d6d1cbf39626dfd82cac50f11efc/LICENSE)
