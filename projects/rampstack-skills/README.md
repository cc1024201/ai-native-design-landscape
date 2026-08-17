# RampStack Brand Build Skills

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

RampStack is a composable agent-skill library spanning a brand and website lifecycle. The Design-specific product boundary is not all 103 skills; it is the connected path from creative direction through logo and identity decisions into design-system files, application stress tests and a working site.

## Decision material precedes production files

[`logo-design`](https://github.com/rampstackco/claude-skills/blob/0479242522549dfdb389bb9b7807ad4d6016ffb7/skills/logo-design/SKILL.md) requires several genuinely different mark architectures, tests them at favicon, print, embroidery and signage constraints, then asks the brand owner to select before production refinement. The default authority is a Markdown variant specification plus rendered candidate files; the chosen direction feeds the broader identity tree.

```text
brand discovery -> four-axis creative direction
-> distinct logo/identity candidates -> application stress tests
-> owner selection -> identity/logo + color/type/motion specifications
-> reusable design-system tokens/components -> implemented and audited site
```

[`brand-identity`](https://github.com/rampstackco/claude-skills/blob/0479242522549dfdb389bb9b7807ad4d6016ffb7/skills/brand-identity/SKILL.md) fixes the output directories for logo, color, typography, imagery, iconography, motion and applications. [`design-system`](https://github.com/rampstackco/claude-skills/blob/0479242522549dfdb389bb9b7807ad4d6016ffb7/skills/design-system/SKILL.md) moves the selected system into reusable tokens and components. The host agent still owns file mutation and rendering; RampStack supplies the interoperable workflow and artifact contract rather than a native editor or version engine.

The repository is MIT licensed. The organization profile reports the United States; that is maintainer-umbrella evidence, not an internal team headcount.

## Evidence

- [Pinned repository](https://github.com/rampstackco/claude-skills/tree/0479242522549dfdb389bb9b7807ad4d6016ffb7)
- [Logo decision workflow](https://github.com/rampstackco/claude-skills/blob/0479242522549dfdb389bb9b7807ad4d6016ffb7/skills/logo-design/SKILL.md)
- [Identity artifact contract](https://github.com/rampstackco/claude-skills/blob/0479242522549dfdb389bb9b7807ad4d6016ffb7/skills/brand-identity/SKILL.md)
- [Design-system workflow](https://github.com/rampstackco/claude-skills/blob/0479242522549dfdb389bb9b7807ad4d6016ffb7/skills/design-system/SKILL.md)
- [Organization profile](https://github.com/rampstackco)
