# SeaSlides

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

SeaSlides is an agent toolchain for authoring presentation-oriented Typst and Touying projects. It treats readable `.typ` source and a project-owned theme as authority, then makes visual review and compilation receipts part of delivery.

## Quality gates are first-class artifacts

The skill routes quick and full workflows, selects among more than 180 catalogued themes and writes `main.typ` plus `template.typ`. Compilation produces PDF, per-page PNGs, a contact sheet and `compile-manifest.json`; optional `typ2pptx` delivery is downstream of the source deck. [`visual-review.md`](https://github.com/touying-typ/seaslides/blob/dcde5bf6c6875b300e2999fc7766f369a13a67ac/skills/seaslides-typst-slides-skill/workflows/visual-review.md) specifies repeated inspection rather than assuming a successful compile looks usable.

```text
source material -> narrative and theme decision -> Typst/Touying source
-> compile receipt + page renders + overview -> review/repair -> PDF/PNG/PPTX
```

SeaSlides authors and validates the project; the separately surfaced Tylina application owns WYSIWYG editing and is counted independently. Maintainer region remains unknown.

## Evidence

- [Pinned repository and output contract](https://github.com/touying-typ/seaslides/tree/dcde5bf6c6875b300e2999fc7766f369a13a67ac)
- [Create-presentation workflow](https://github.com/touying-typ/seaslides/blob/dcde5bf6c6875b300e2999fc7766f369a13a67ac/skills/seaslides-typst-slides-skill/workflows/create-presentation.md)
- [Visual review workflow](https://github.com/touying-typ/seaslides/blob/dcde5bf6c6875b300e2999fc7766f369a13a67ac/skills/seaslides-typst-slides-skill/workflows/visual-review.md)
