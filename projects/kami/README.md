# Kami

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

Kami is an agent-operated typesetting system for documents, slide decks and landing pages. It treats content structure and editorial constraints as first-class inputs, then uses language-specific HTML templates and a verification pipeline to produce HTML, PDF, images and, when required, editable PPTX.

## Content IR protects facts before layout begins

[`SKILL.md`](https://github.com/tw93/kami/blob/8bf6f46f74b5b640fa5612736a5cd24c724b7eca/SKILL.md) requires a brief, material check and distilled `content.json` before a new document is filled. The IR records audience, job, narrative, required facts/assets, formats and acceptance checks. [`content.py`](https://github.com/tw93/kami/blob/8bf6f46f74b5b640fa5612736a5cd24c724b7eca/scripts/content.py) validates the schema and checks that atomic values survive into the filled HTML.

```text
raw material + optional brand profile -> factual/material gap check
-> content.json IR -> language/document template -> filled HTML
-> PDF/PPTX/image render -> font/layout/content/style/visual checks
-> corrected source + final delivery files
```

[`build.py`](https://github.com/tw93/kami/blob/8bf6f46f74b5b640fa5612736a5cd24c724b7eca/scripts/build.py) dispatches render, token-sync, placeholder, orphan, density, rhythm, content-coverage, font and visual checks. HTML and content IR remain recoverable authorities; PDF and page images are delivery and inspection projections. The fixed parchment/ink-blue system deliberately trades broad stylistic variation for cross-session consistency.

The repository is MIT licensed. The maintainer profile does not state a reliable region, so the team region remains unknown.

## Evidence

- [Pinned repository](https://github.com/tw93/kami/tree/8bf6f46f74b5b640fa5612736a5cd24c724b7eca)
- [Artifact workflow](https://github.com/tw93/kami/blob/8bf6f46f74b5b640fa5612736a5cd24c724b7eca/SKILL.md)
- [Build and verification entrypoint](https://github.com/tw93/kami/blob/8bf6f46f74b5b640fa5612736a5cd24c724b7eca/scripts/build.py)
- [Content IR checks](https://github.com/tw93/kami/blob/8bf6f46f74b5b640fa5612736a5cd24c724b7eca/scripts/content.py)
- [Visual verification](https://github.com/tw93/kami/blob/8bf6f46f74b5b640fa5612736a5cd24c724b7eca/scripts/visual.py)
