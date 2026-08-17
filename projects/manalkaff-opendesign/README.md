# OpenDesign by Manal Kaff

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

Manal Kaff's OpenDesign is a portable skill suite that recreates a Claude Design-like discipline inside local coding agents. It scans the actual codebase and saved design systems, routes the request to wireframe, prototype, deck, frontend or tweakable-artifact specialists, then commissions a separate verifier against the brief.

## Project-local design systems ground generated HTML

Reusable systems live under `opendesign/design-systems/`; the entry skill discovers them before intake and asks when the correct context is ambiguous. HTML is the common editable medium, a local preview server renders it, and an explicit handoff skill translates an accepted artifact into implementation work.

This product is unrelated to nexu-io's desktop application named Open Design. The qualified name and slug preserve two teams, two runtimes and two artifact models instead of merging on punctuation.

- [Pinned repository](https://github.com/manalkaff/opendesign/tree/cecd9bb6b59408cb96a3974449b8e6ef9f5b17bb)
- [Entry skill](https://github.com/manalkaff/opendesign/blob/cecd9bb6b59408cb96a3974449b8e6ef9f5b17bb/skills/opendesign/SKILL.md)
- [Handoff skill](https://github.com/manalkaff/opendesign/blob/cecd9bb6b59408cb96a3974449b8e6ef9f5b17bb/skills/handoff-to-claude-code/SKILL.md)
- [Maintainer profile checked; no location published](https://github.com/manalkaff)
