# work-with-design-systems

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

`work-with-design-systems` is a Figma-oriented agent skill with two explicit modes: read-only inspection and native system construction. It requires a user decision between them and keeps optional code synchronization off unless requested.

## Inspection does not silently become mutation

Inspect mode audits variable bindings, component states, accessibility, detached instances, naming and descriptions, then produces scored handoff evidence. Build mode changes foundations and components incrementally through Figma tools and validates each change at a depth appropriate to its risk. Structural changes get screenshots; deterministic metadata changes are read back in the same operation.

Native Figma variables, components and descriptions remain authoritative. Optional Phase 6 materializes selected tokens into `tokens.css`, an audit script and agent rules, creating a downstream code authority only after explicit request.

## Composition remains visible to agents

The skill forbids detaching components and prefers variants, properties, instance swaps and slots. Structured descriptions are part of the handoff because Figma MCP passes them to later agents. This makes maintainable composition an artifact rule rather than a style recommendation.

- [Pinned work-with-design-systems revision](https://github.com/natdexterra/work-with-design-systems/tree/e94da52a21fddef9ffa122d5a64a70f1c84a2123)
- [Inspect/build gate](https://github.com/natdexterra/work-with-design-systems/blob/e94da52a21fddef9ffa122d5a64a70f1c84a2123/SKILL.md)
- [Token audit implementation](https://github.com/natdexterra/work-with-design-systems/blob/e94da52a21fddef9ffa122d5a64a70f1c84a2123/scripts/inspect/audit-tokens.js)
- [Optional code export](https://github.com/natdexterra/work-with-design-systems/blob/e94da52a21fddef9ffa122d5a64a70f1c84a2123/references/build/code-export.md)
