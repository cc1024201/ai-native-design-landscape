# BMAD Slide Maker

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

BMAD Slide Maker is an independently installable skill inside the broader BMAD marketplace. It owns the complete deck loop: brainstorm the argument, generate a reviewable React/HTML deck, capture point comments and export editable PPTX, image PPTX, standalone HTML or PDF.

## Tokens survive across 34 layouts

Layouts consume a theme contract rather than literal colors and fonts. The skill resolves an existing brand system first, then an optional external design-intelligence source, and finally a bundled neutral theme. A working deck is copied out of the skill into the user's project, so generated source can evolve without mutating the installed product.

HTML/React is the review authority. Editable PPTX uses a dedicated conversion workflow and differs from the pixel-perfect image-PPTX route. The explicit choice between those outputs prevents “looks identical” and “is editable” from being treated as the same requirement.

The mixed `bmad-labs/skills` repository itself is not counted as a design product; Slide Maker and Slides Generator have separate triggers, contracts and delivery graphs, so they are catalogued independently under one organization.

- [Pinned Slide Maker skill](https://github.com/bmad-labs/skills/blob/088a427df8b0f7065f5270104933064c2627d63a/skills/slide-maker/SKILL.md)
- [Editable PPTX workflow](https://github.com/bmad-labs/skills/blob/088a427df8b0f7065f5270104933064c2627d63a/skills/slide-maker/references/workflows/export-editable-pptx.md)
- [Pinned repository](https://github.com/bmad-labs/skills/tree/088a427df8b0f7065f5270104933064c2627d63a/skills/slide-maker)
- [Organization profile checked; no location published](https://github.com/bmad-labs)
