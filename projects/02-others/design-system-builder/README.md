# Design System Builder

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

Design System Builder is an agent skill that turns a style description, screenshot or Figma reference into four coordinated artifacts: machine-readable tokens, a human specification, an HTML preview and an implementation-oriented delivery package.

## Four files form one proposed system

`design-tokens.json` constrains color, typography, spacing and radii for later agents. `design-system.md` explains the system and includes agent instructions. `design-system-preview.html` renders the vocabulary in one review surface. The remaining delivery material connects those decisions to implementation.

The user reviews the visual preview and specification before treating the token set as authority. Example systems demonstrate that the same schema can carry distinct visual identities; they are not global defaults to copy.

## Skill boundary

The public project is a structured authoring workflow, not a native Figma plugin or hosted token registry. Generated components and tokens become local files, and later code agents consume those files rather than querying an invisible model state.

- [Pinned Design System Builder revision](https://github.com/signerlabs/design-system-builder-skills/tree/e2110ee41fb625b859be06d0a563e729cceb953d)
- [Builder skill](https://github.com/signerlabs/design-system-builder-skills/blob/e2110ee41fb625b859be06d0a563e729cceb953d/design-system-builder/SKILL.md)
- [Fintech system preview](https://github.com/signerlabs/design-system-builder-skills/blob/e2110ee41fb625b859be06d0a563e729cceb953d/design-system-builder/examples/fintech-nexus-preview.html)
- [Health system preview](https://github.com/signerlabs/design-system-builder-skills/blob/e2110ee41fb625b859be06d0a563e729cceb953d/design-system-builder/examples/health-calm-preview.html)
