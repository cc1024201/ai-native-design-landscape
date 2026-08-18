# gstack visual design toolchain

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-13**

gstack is a broad coding-agent skill collection, but its visual-design subsystem forms an independently usable product loop. It moves from a repository-aware design system through generated alternatives and human selection into HTML implementation and screenshot-based correction.

## Design has several explicit authorities

Pinned revision: `94993f74012782fd94416dd44b8314f6363a13a4`.

`design-consultation` writes `DESIGN.md` as the repository's system of record. `design-shotgun` produces image variants plus a local comparison board; ratings, comments and “more like this” choices become structured feedback. Approved results can then feed `design-html`, which writes production HTML/CSS, while review skills modify the actual application source.

## The agent interface is a protocol across skills

Each skill declares when it applies, what context it reads and what durable object it must produce. That is materially different from a monolithic design app: continuity comes from repository files, saved mockups, approval JSON and source control rather than a service-owned project database.

## The comparison board closes a human decision loop

The design runtime builds a locally served HTML board around multiple generated images. Users can select, rate, annotate or request another variant; feedback is posted back to the local daemon and also remains copyable if the connection fails. The ordinary user therefore participates in choosing the artifact rather than merely receiving agent output.

## QA maps rendered evidence back to source

`design-review` uses before/after screenshots while fixing source, and the lower-level design commands can evolve a screenshot or compare a live capture with an approved mockup. The filesystem and commit history remain final authority; screenshots are evidence and decision inputs, not an opaque replacement project.

## Pinned evidence

- [Repository](https://github.com/garrytan/gstack)
- [Design-system source-of-truth skill](https://github.com/garrytan/gstack/blob/94993f74012782fd94416dd44b8314f6363a13a4/design-consultation/SKILL.md)
- [Variant and feedback workflow](https://github.com/garrytan/gstack/blob/94993f74012782fd94416dd44b8314f6363a13a4/design-shotgun/SKILL.md)
- [HTML finalization contract](https://github.com/garrytan/gstack/blob/94993f74012782fd94416dd44b8314f6363a13a4/design-html/SKILL.md)
- [Comparison-board implementation](https://github.com/garrytan/gstack/blob/94993f74012782fd94416dd44b8314f6363a13a4/design/src/compare.ts)
- [Screenshot-to-source review loop](https://github.com/garrytan/gstack/blob/94993f74012782fd94416dd44b8314f6363a13a4/design-review/SKILL.md)
