# d2c

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

`d2c` is the current continuation of the earlier `codestate-cs/figma-to-design` project. It turns Figma designs into production frontend source across several frameworks and closes the loop with rendered screenshot comparison and design-system audits.

## Initialization creates a repository contract

`d2c-init` scans the codebase and writes `.claude/d2c/design-tokens.json` with styling, components, hooks and API patterns, optionally reconciling Figma variables. `d2c-build` reads a Figma URL, suggests reusable components, generates source within those conventions and renders it through Playwright.

Pixel diff and structural visual judgment guide iteration on repository source. `d2c-audit` later finds hardcoded values, unused tokens and system bypasses. Code and the repository token contract remain authoritative; Figma screenshots and runtime captures are grounding and evidence.

## Lineage boundary

Both repositories are non-forks, but commit authorship, near-identical initial history and the newer organization's continuing feature work establish one product lineage. The old `figma-to-design` repository is retained as a duplicate identity rather than a second team.

- [Pinned current d2c revision](https://github.com/d2c-ai/d2c/tree/43e3f64d10c52459457a15141a83d7cf0da7f28d)
- [Current build and audit workflow](https://github.com/d2c-ai/d2c/blob/43e3f64d10c52459457a15141a83d7cf0da7f28d/README.md)
- [Build-flow skill](https://github.com/d2c-ai/d2c/blob/43e3f64d10c52459457a15141a83d7cf0da7f28d/skills/d2c-build-flow/SKILL.md)
- [Earlier repository revision](https://github.com/codestate-cs/figma-to-design/tree/0915f0b418d05f639a61c71f3b1e90271e684146)
