# Skillstead

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

Skillstead is a portable agent-skill collection. Its Design-specific product surface is `svg-infographic`: prose or technical notes become an editable SVG and an exactly scaled browser-rendered PNG, with source checks that cover layout, connectors and multilingual text.

## The SVG is authored, the PNG is evidence

The workflow computes a layout, writes structured SVG, lints the source before rendering, and exports a 2× PNG through a browser. The SVG remains the editable authority; the PNG is the review projection. This avoids treating a generated screenshot as the only deliverable.

The validation contract includes containment, connector semantics and Korean/CJK text. Recorded fresh-context evaluations exercise both Claude Code and Codex, including fail-closed behavior when browser launch cannot proceed. The product therefore defines Design as a source-controlled visual explanation whose render must survive deterministic checks.

## Collection boundary

Other Skillstead skills edit prose or check documentation claims. They share release and installation infrastructure but do not create separate products. This dossier counts the independently released collection once and treats `svg-infographic` as its qualifying Design surface.

## Evidence boundary

The repository reports verified browser behavior on named environments and does not generalize that evidence to every OS, browser or font set. Semantic correctness of an infographic still requires human or agent review beyond source lint.

- [Pinned Skillstead revision](https://github.com/kyungseo/skillstead/tree/ef5e6c7f2e22ba89df1a3092c903ae525e325ab1)
- [Collection and evaluation boundary](https://github.com/kyungseo/skillstead/blob/ef5e6c7f2e22ba89df1a3092c903ae525e325ab1/README.md)
- [SVG infographic skill](https://github.com/kyungseo/skillstead/blob/ef5e6c7f2e22ba89df1a3092c903ae525e325ab1/skills/svg-infographic/SKILL.md)
- [Infographic renderer](https://github.com/kyungseo/skillstead/blob/ef5e6c7f2e22ba89df1a3092c903ae525e325ab1/skills/svg-infographic/scripts/render.mjs)
