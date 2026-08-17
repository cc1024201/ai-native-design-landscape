# Presentation Builder

> Research status: **Source-level** · Lifecycle: **active-transition** · Last reviewed: **2026-08-12**

Presentation Builder is a small repository-native presentation studio for Claude Code. It is not a slide editor application: its product boundary is a directory convention that turns a written script plus an executable visual reference into a finished single-file HTML deck.

## Style references are working implementations

The user places narrative input under `scripts/`, chooses one of the HTML implementations under `style-references/`, then asks Claude Code to build a deck under `Finished Presentations/`. References include their own layout, typography, transitions and navigation rather than screenshots alone. [Claude.MD](https://github.com/zanecole10/presentation-builder/blob/da05d084ffb6badcefb5668262c7c9cc0d1cee4e/Claude.MD) supplies repository-level behavior.

```text
script + optional assets + executable style reference
-> agent authors self-contained HTML
-> browser navigation/animation review
-> revise source -> finished HTML deck
```

HTML is both authority and delivery artifact. Direct correction happens in source or through a new agent instruction; there is no separate scene graph, autosave service or PPTX roundtrip. The checked-in [finished example](https://github.com/zanecole10/presentation-builder/blob/da05d084ffb6badcefb5668262c7c9cc0d1cee4e/Finished%20Presentations/ai-software-business-retro-game.html) demonstrates that the workflow produces a runnable deck, but one example does not establish broad output quality.

No license file or reliable maintainer-region evidence was found.

## Evidence

- [Pinned repository](https://github.com/zanecole10/presentation-builder/tree/da05d084ffb6badcefb5668262c7c9cc0d1cee4e)
- [Workflow contract](https://github.com/zanecole10/presentation-builder/blob/da05d084ffb6badcefb5668262c7c9cc0d1cee4e/README.md)
- [Swiss style implementation](https://github.com/zanecole10/presentation-builder/blob/da05d084ffb6badcefb5668262c7c9cc0d1cee4e/style-references/swiss-design.html)
