# Prototype to Figma Skill

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

Prototype to Figma Skill turns an implemented prototype into a native, reviewable Figma flow. Its goal is not a pixel snapshot: it maps the prototype onto the target design system, creates real instances and makes interaction paths and implementation notes visible to collaborators.

## Translation starts with system inventory

The [operational skill](https://github.com/alima-max/prototype-to-figma-skill/blob/6e2e1befaa6f6df34a046956127b1d4f54bcb158/SKILL.md) requires a preflight of pages, components, variables, styles and Code Connect before drawing. It then decomposes the prototype into screens and states, maps each element to a reusable component or justified exception, and writes annotated flows through Figma MCP.

```text
working prototype + Figma system inventory
-> screen/state/flow map -> component and token mapping
-> native frames + instances + connectors + annotations
-> screenshot/metadata QA -> handoff
```

[`figma-patterns.md`](https://github.com/alima-max/prototype-to-figma-skill/blob/6e2e1befaa6f6df34a046956127b1d4f54bcb158/figma-patterns.md) records host-specific construction patterns. Figma owns persistence after materialization. The source prototype and Figma graph remain two authorities, with Code Connect and annotations providing traceability rather than automatic merge.

The project is MIT-licensed. No reliable maintainer-region evidence was found.

## Sources

- [Pinned repository](https://github.com/alima-max/prototype-to-figma-skill/tree/6e2e1befaa6f6df34a046956127b1d4f54bcb158)
- [MIT license](https://github.com/alima-max/prototype-to-figma-skill/blob/6e2e1befaa6f6df34a046956127b1d4f54bcb158/LICENSE)
