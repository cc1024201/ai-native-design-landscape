# Reveal Presentations

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

Reveal Presentations is an agent plugin for creating single-file HTML decks in one deliberately constrained visual language. Its system is not a generic slide canvas: slide archetypes and CSS variables give the agent a bounded source vocabulary that remains editable after generation.

## A base deck is the materialization target

The [presentation skill](https://github.com/godagoo/reveal-presentations/blob/0000be5708fc7a9a5f9c553c7f67d46b8c94ca9b/skills/presentations/SKILL.md) plans narrative and selects from title, feature, metric, pricing, timeline and other archetypes. [`base.html`](https://github.com/godagoo/reveal-presentations/blob/0000be5708fc7a9a5f9c553c7f67d46b8c94ca9b/skills/presentations/Templates/base.html) supplies Reveal navigation; [`autonomee.css`](https://github.com/godagoo/reveal-presentations/blob/0000be5708fc7a9a5f9c553c7f67d46b8c94ca9b/skills/presentations/Styles/autonomee.css) fixes the editorial type, sharp geometry and palette.

```text
topic/content -> narrative plan + slide archetypes
-> self-contained Reveal HTML -> browser review
-> edit HTML/CSS variables -> offline deck
```

HTML is authority and delivery. There is no project service, native PPTX output or direct manipulation canvas. The source proves a repeatable constrained deck workflow but does not include a rendered regression suite.

No license file or reliable maintainer-region evidence was found.

## Evidence

- [Pinned repository](https://github.com/godagoo/reveal-presentations/tree/0000be5708fc7a9a5f9c553c7f67d46b8c94ca9b)
- [Invocation command](https://github.com/godagoo/reveal-presentations/blob/0000be5708fc7a9a5f9c553c7f67d46b8c94ca9b/commands/presentation.md)
- [Slide archetypes](https://github.com/godagoo/reveal-presentations/blob/0000be5708fc7a9a5f9c553c7f67d46b8c94ca9b/skills/presentations/Templates/slides.md)
