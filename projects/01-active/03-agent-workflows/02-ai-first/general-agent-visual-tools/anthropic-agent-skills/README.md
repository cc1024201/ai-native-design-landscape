# Anthropic Agent Skills

> Research status: **Source-level / source-available mix** · Lifecycle: **active** · Last reviewed: **2026-08-12**

Anthropic Agent Skills is the canonical repository for the skills that power or demonstrate Claude's document, presentation, spreadsheet, PDF, canvas and brand-design capabilities. The third-party `claude-office-skills` search result copies this material and is therefore a duplicate, not another team or product.

## Skills bind generation to inspectable artifact workflows

The document skills contain format-specific instructions, schemas, validators and rendering helpers. The PowerPoint and document paths work with native Office packages; spreadsheet tools recalculate and inspect workbooks; canvas-design and brand-guideline skills encode visual composition and governance. The repository distinguishes Apache-licensed examples from source-available production document skills rather than presenting every folder as one license class.

The product boundary here is the official installable skill collection and its shared specification. Individual skills are capabilities within that package; generated PPTX, DOCX, XLSX, PDF or image artifacts retain their native authorities.

## Evidence

- [Pinned repository](https://github.com/anthropics/skills/tree/f17010c9bb483898c1d9c9f42dde2b3a98889434)
- [Agent Skills specification](https://github.com/anthropics/skills/blob/f17010c9bb483898c1d9c9f42dde2b3a98889434/spec/agent-skills-spec.md)
- [PowerPoint skill](https://github.com/anthropics/skills/blob/f17010c9bb483898c1d9c9f42dde2b3a98889434/skills/pptx/SKILL.md)
- [Canvas design skill](https://github.com/anthropics/skills/blob/f17010c9bb483898c1d9c9f42dde2b3a98889434/skills/canvas-design/SKILL.md)
