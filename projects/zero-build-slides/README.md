# Zero-Build Slides

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

Zero-Build Slides minimizes the artifact contract so an agent can safely author it: four plain JavaScript files, no build step and no proprietary service. `data.js` is deck authority, `layouts.js` is the component vocabulary, `themes.js` supplies tokens and `app.js` renders and navigates.

## Agent readability is an architectural constraint

The bundled [`SKILL.md`](https://github.com/decocms/zero-build-slides/blob/e367b9d1905d3f1c4e1699068998dbcfaa2676f0/SKILL.md) tells an agent to edit explicit slide objects and choose registered layouts. Hash routes select deck, slide and theme without server state. Because all authority stays in readable files, ordinary source control provides persistence and versioning.

This product has no embedded freeform editor and should not be described as a Figma substitute. Its Design definition is agent-authored source constrained by a visual schema and deterministic renderer. The deco CMS organization reports Brazil.

## Evidence

- [Pinned repository](https://github.com/decocms/zero-build-slides/tree/e367b9d1905d3f1c4e1699068998dbcfaa2676f0)
- [Canonical deck data](https://github.com/decocms/zero-build-slides/blob/e367b9d1905d3f1c4e1699068998dbcfaa2676f0/data.js)
- [Layout registry](https://github.com/decocms/zero-build-slides/blob/e367b9d1905d3f1c4e1699068998dbcfaa2676f0/layouts.js)
- [Maintainer location evidence](https://github.com/decocms)
