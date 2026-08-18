# Figma Design System Skills

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

Edenspiekermann's Figma Design System Skills package three bounded maintenance jobs: apply a system to existing work, audit integration drift, and fix one chosen finding. The narrow split is the product design—inspection and mutation are not collapsed into an uncontrolled “clean everything” command.

## Findings mediate between audit and write

[`apply-design-system`](https://github.com/edenspiekermann/Skills/blob/a49e859329aa99e81e8725bc66767d16e8fc9539/skills/apply-design-system/SKILL.md) searches shared components and variables before replacing local construction. [`audit-design-system`](https://github.com/edenspiekermann/Skills/blob/a49e859329aa99e81e8725bc66767d16e8fc9539/skills/audit-design-system/SKILL.md) reports missing shared components, local overrides and unbound tokens. [`fix-design-system-finding`](https://github.com/edenspiekermann/Skills/blob/a49e859329aa99e81e8725bc66767d16e8fc9539/skills/fix-design-system-finding/SKILL.md) accepts one finding and performs a bounded repair.

```text
native Figma screen + shared system -> inspect/search
-> apply or emit finding -> user selects finding
-> native repair -> screenshot/metadata verification
```

The package assumes host-provided Figma MCP reads and `use_figma` writes. Figma owns the document, collaboration and versions; the skills own the review protocol. No root license file was present. The organization profile reports Berlin, Germany.

## Source boundary

- [Pinned repository](https://github.com/edenspiekermann/Skills/tree/a49e859329aa99e81e8725bc66767d16e8fc9539)
- [Repository contract](https://github.com/edenspiekermann/Skills/blob/a49e859329aa99e81e8725bc66767d16e8fc9539/README.md)
