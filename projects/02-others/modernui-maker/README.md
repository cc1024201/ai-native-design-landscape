# ModernUI Maker

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

ModernUI Maker matters to the census partly as an identity anchor. Four separately surfaced “AI component generator” repositories preserve its same application skeleton; counting them independently would turn source copies into fictitious teams and architectures.

## The canonical scaffold

[`Home.jsx`](https://github.com/Singh-OmDev/ModernUI-Maker/blob/2456290c42e938f66f3162d21c3c61cc2098ab91/src/pages/Home.jsx) contains the complete loop: generation settings and prompt go to Gemini; returned single-page HTML enters Monaco; the same source renders in an iframe and can be copied or downloaded.

The [`README`](https://github.com/Singh-OmDev/ModernUI-Maker/blob/2456290c42e938f66f3162d21c3c61cc2098ab91/README.md) presents that combined generator/editor/preview as ModernUI Maker. Source comparison—not title similarity—resolved CodeWithRhituraj's generator, Craftly AI, Amir Alam's generator and Vignesh Siva's GenUI to this lineage.

## Authority limit

The current HTML string is authoritative inside the client session. There is no multi-file project, persisted revision graph or native component schema, so downstream copies with only styling or SDK substitutions do not create a new architecture.

## Pinned evidence

- [Canonical repository](https://github.com/Singh-OmDev/ModernUI-Maker)
- [Inspected commit](https://github.com/Singh-OmDev/ModernUI-Maker/commit/2456290c42e938f66f3162d21c3c61cc2098ab91)
- Commit: `2456290c42e938f66f3162d21c3c61cc2098ab91`
