# Design Farmer

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

Design Farmer is an operational agent skill for building a design system inside an existing repository. Its value lies in a staged evidence and implementation pipeline rather than a fixed visual editor.

## The project repository becomes the design-system workspace

The skill begins with framework and pattern discovery, extracts repeated visual decisions, creates visual previews and then establishes a checked-in `DESIGN.md` as the source of truth. Tokens, themes, components and Storybook stories are downstream implementations of that document rather than unrelated generated outputs.

[`phase-4.5-design-source-of-truth.md`](https://github.com/hakilee/design-farmer/blob/7015e21a86ef8ea0a7b06610a60afe88c2501919/skills/design-farmer/phases/phase-4.5-design-source-of-truth.md) makes the governance handoff explicit. Later phases build tokens and components, while [`phase-8.5-design-review.md`](https://github.com/hakilee/design-farmer/blob/7015e21a86ef8ea0a7b06610a60afe88c2501919/skills/design-farmer/phases/phase-8.5-design-review.md) adds multi-perspective design review rather than relying only on compilation.

```text
repository survey -> pattern evidence -> preview -> DESIGN.md authority
-> tokens/themes/components -> Storybook -> visual + semantic review
-> integration and readiness handoff
```

## Quality gates are part of the artifact loop

The [quality-gate contract](https://github.com/hakilee/design-farmer/blob/7015e21a86ef8ea0a7b06610a60afe88c2501919/skills/design-farmer/docs/QUALITY-GATES.md) and [`phase-11-readiness-handoff.md`](https://github.com/hakilee/design-farmer/blob/7015e21a86ef8ea0a7b06610a60afe88c2501919/skills/design-farmer/phases/phase-11-readiness-handoff.md) require evidence that the governed system is usable in the product. Git and repository files provide persistence and recovery; the skill itself does not own cloud versions.

The pinned tree contains no license file. The maintainer profile identifies Seoul in South Korea.

## Pinned record

- [Repository at `7015e21`](https://github.com/hakilee/design-farmer/tree/7015e21a86ef8ea0a7b06610a60afe88c2501919)
- [Main skill contract](https://github.com/hakilee/design-farmer/blob/7015e21a86ef8ea0a7b06610a60afe88c2501919/skills/design-farmer/SKILL.md)
