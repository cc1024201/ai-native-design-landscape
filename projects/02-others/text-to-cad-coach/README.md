# Text-to-CAD Coach

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

Text-to-CAD Coach is a Codex plugin that separates requirements clarification from geometry construction. A coach asks only the questions needed to resolve dimensions, interfaces, fits and manufacturing constraints; a builder receives an implementation-ready specification and produces parametric CAD.

## Measurement confidence is part of the artifact chain

Requirements distinguish confirmed, nominal and assumed dimensions and can request tolerance coupons before a fit-critical part. The builder writes Python in the consuming CAD environment, treats STEP as the primary deliverable, optionally exports STL or 3MF, and checks execution, solids, bounding dimensions, critical features and printability before viewer handoff.

The plugin orchestrates local build123d or CadQuery and an available viewer rather than embedding a CAD kernel. This gives it an independent coaching and validation product boundary without claiming ownership of those runtimes.

- [Pinned repository](https://github.com/jonawilliams14/Text-to-CAD-Coach/tree/55f433bb5422bae3610a16a1b3d7f448b36d4158)
- [Requirements coach](https://github.com/jonawilliams14/Text-to-CAD-Coach/blob/55f433bb5422bae3610a16a1b3d7f448b36d4158/plugins/text-to-cad-coach/skills/text-to-cad-requirements-coach/SKILL.md)
- [CAD builder](https://github.com/jonawilliams14/Text-to-CAD-Coach/blob/55f433bb5422bae3610a16a1b3d7f448b36d4158/plugins/text-to-cad-coach/skills/text-to-cad-builder/SKILL.md)
- [Maintainer location evidence](https://github.com/jonawilliams14)
