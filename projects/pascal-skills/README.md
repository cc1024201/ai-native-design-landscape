# Pascal Skills

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

Pascal Skills is one installable visual-analysis distribution whose Design boundary is evidence production: it extracts palettes, compares two images, reads image content and applies those observations during web design.

## Visual evidence is retained outside the model turn

[`image-analysis`](https://github.com/pascalorg/skills/blob/e342b34e360504ae71b01c9d23dc11f1d4447078/image-analysis/SKILL.md) turns a reference image or Figma export into explicit color roles. [`image-compare`](https://github.com/pascalorg/skills/blob/e342b34e360504ae71b01c9d23dc11f1d4447078/image-compare/SKILL.md) invokes a bundled deterministic script to produce a diff rather than relying on an unrecorded visual judgment. [`web-design`](https://github.com/pascalorg/skills/blob/e342b34e360504ae71b01c9d23dc11f1d4447078/web-design/SKILL.md) consumes those findings in an implementation workflow.

The source image and target project remain authoritative. Extracted palettes and diff images are coordination artifacts that make an agent's visual decision reviewable. The repository is counted once, not once per skill, because the skills share one distribution and release boundary.

## Evidence

- [Pinned repository](https://github.com/pascalorg/skills/tree/e342b34e360504ae71b01c9d23dc11f1d4447078)
- [Executable image comparison](https://github.com/pascalorg/skills/blob/e342b34e360504ae71b01c9d23dc11f1d4447078/image-compare/scripts/image-compare.js)
- [Maintainer profile: United States](https://github.com/pascalorg)
