# Figma to design.md

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

Figma to design.md converts implementation-side token sources—and optionally live Figma context—into a structured document that coding agents can consume. Its starting assumption is important: current source tokens are evidence, while intent and judgment still require human completion.

## Detection precedes classification

The [skill contract](https://github.com/albertzhangz10/figma-design-system-to-design-md/blob/610316591cb24f8de24812b9a3d5ddbb5f517ff1/skills/figma-design-system-to-design-md/SKILL.md) searches CSS variables, JSON/TypeScript tokens, Tailwind configuration and global styles. It classifies colors, typography, spacing, radius, borders, elevation and responsive rules, then can query Figma MCP for component and effect evidence.

```text
repository token/config sources + optional Figma context
-> detect and classify -> structured design.md draft
-> human fills intent and do/don't judgment -> confirm -> write file
```

The explicit confirmation before saving prevents discovery from silently replacing an existing design contract. `design.md` is a portable snapshot; there is no automatic watcher or reverse write to source tokens or Figma, so later drift requires rerunning the workflow and reviewing the diff.

The repository also links a web surface for nontechnical users; it represents the same conversion workflow rather than a separate product. The project is MIT-licensed. No reliable maintainer-region evidence was found.

## Evidence

- [Pinned repository](https://github.com/albertzhangz10/figma-design-system-to-design-md/tree/610316591cb24f8de24812b9a3d5ddbb5f517ff1)
- [English product contract](https://github.com/albertzhangz10/figma-design-system-to-design-md/blob/610316591cb24f8de24812b9a3d5ddbb5f517ff1/README.md)
- [Chinese product contract](https://github.com/albertzhangz10/figma-design-system-to-design-md/blob/610316591cb24f8de24812b9a3d5ddbb5f517ff1/README.zh-CN.md)
- [MIT license](https://github.com/albertzhangz10/figma-design-system-to-design-md/blob/610316591cb24f8de24812b9a3d5ddbb5f517ff1/LICENSE)
