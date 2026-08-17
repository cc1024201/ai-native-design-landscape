# AI UI Style Director

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

AI UI Style Director makes visual direction selection a bounded product decision before an agent builds a site. It combines a curated deterministic catalog with optional provider reasoning; model output cannot silently invent the catalog identities that later become project authority.

## Direction and theme are separate choices

[`catalog-v2.mjs`](https://github.com/coconilu/ai-ui-style-director/blob/8571ac3e36ee53862f59479d306693bdb06cc235/src/catalog-v2.mjs) exposes stable direction and theme identifiers. [`core.mjs`](https://github.com/coconilu/ai-ui-style-director/blob/8571ac3e36ee53862f59479d306693bdb06cc235/src/core.mjs) ranks candidates from the brief, while provider adapters may explain or refine recommendations without replacing those identifiers.

The user can inspect generated visual previews from [`preview.mjs`](https://github.com/coconilu/ai-ui-style-director/blob/8571ac3e36ee53862f59479d306693bdb06cc235/src/preview.mjs). After selection, the [design-document contract](https://github.com/coconilu/ai-ui-style-director/blob/8571ac3e36ee53862f59479d306693bdb06cc235/skills/web-style-director/references/design-md-contract.md) locks the chosen direction and theme into the project `DESIGN.md`, and the workflow produces a first-viewport implementation for visual confirmation.

```text
brief/context -> deterministic candidates + explanations
-> visual previews -> user selection
-> project DESIGN.md -> first viewport -> inspect and revise
```

## Evidence and persistence

The catalog includes source-state and curation records so recommendation inputs can be audited. Tests cover catalog migration, provider adapters, preview generation and the end-to-end workflow. The selected `DESIGN.md` and application source persist in the repository; previews are candidates rather than versions.

The project is MIT-licensed. The maintainer profile reports Shenzhen in China.

## Primary sources

- [Pinned repository](https://github.com/coconilu/ai-ui-style-director/tree/8571ac3e36ee53862f59479d306693bdb06cc235)
- [Agent skill](https://github.com/coconilu/ai-ui-style-director/blob/8571ac3e36ee53862f59479d306693bdb06cc235/skills/web-style-director/SKILL.md)
- [Workflow tests](https://github.com/coconilu/ai-ui-style-director/blob/8571ac3e36ee53862f59479d306693bdb06cc235/test/workflow.test.mjs)
- [MIT license](https://github.com/coconilu/ai-ui-style-director/blob/8571ac3e36ee53862f59479d306693bdb06cc235/LICENSE)
