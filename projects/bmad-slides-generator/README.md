# BMAD Slides Generator

> Research status: **Architecture-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

BMAD Slides Generator is the lighter sibling to Slide Maker. It turns agreed content into a React and Tailwind presentation, verifies the browser projection and exports a single-file HTML artifact.

## Source stays in a project workspace

`context.md` retains source knowledge, `slides.md` is the outline, `source/` holds the React implementation, and `verify/` stores browser screenshots. Requirements and outline are approved before parallel slide implementation. Browser verification occurs before bundling to `slide.html`.

The React tree is authoritative and the standalone HTML is its portable materialization. Unlike Slide Maker, this skill does not own the multi-format editable-PPTX contract. It can consume Slide Maker's design layer, but the two tools remain independently usable and produce different artifact graphs.

- [Pinned Slides Generator skill](https://github.com/bmad-labs/skills/blob/088a427df8b0f7065f5270104933064c2627d63a/skills/slides-generator/SKILL.md)
- [Pinned skill directory](https://github.com/bmad-labs/skills/tree/088a427df8b0f7065f5270104933064c2627d63a/skills/slides-generator)
- [Marketplace repository](https://github.com/bmad-labs/skills/tree/088a427df8b0f7065f5270104933064c2627d63a)
- [Organization profile checked; no location published](https://github.com/bmad-labs)
