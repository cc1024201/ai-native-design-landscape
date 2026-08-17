# extract-design-system

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

`extract-design-system` is an agent skill, CLI and MCP server that reverse-engineers starter design tokens from a public website. It defines Design as evidence-backed system extraction rather than copying a page screenshot or rewriting an application.

## Raw capture becomes reviewable token files

The workflow fetches a public site, derives color, typography, spacing, radius and shadow observations, and normalizes them under `.extract-design-system/normalized.json`. It then writes W3C-oriented `design-system/tokens.json` and CSS custom properties in `tokens.css`. Cached normalized evidence can be re-emitted without fetching the site again.

The normalized capture is intermediate evidence; reviewed token files become the project-local authority. The audit command and token matchers report confidence and ambiguity instead of claiming that every frequent CSS value is an intentional design decision.

## Three interfaces, one product

Agent skill, CLI and MCP tools call the same extraction and initialization workflow. `get_tokens` reads the current local result; it is not another remote token store. The project explicitly limits itself to public websites and starter tokens, not component reconstruction or broad automatic rewrites.

## Evidence boundary

Rendered CSS can reflect responsive state, experiments or incidental implementation values. Generated tokens therefore require review before governance use, and untrusted page content is treated as runtime input rather than instructions.

- [Pinned extract-design-system revision](https://github.com/arvindrk/extract-design-system/tree/1873741ba8dea755e35e6e15134f7918cd58e036)
- [Product and artifact contract](https://github.com/arvindrk/extract-design-system/blob/1873741ba8dea755e35e6e15134f7918cd58e036/README.md)
- [Extraction command](https://github.com/arvindrk/extract-design-system/blob/1873741ba8dea755e35e6e15134f7918cd58e036/src/commands/extract.ts)
- [Token matcher](https://github.com/arvindrk/extract-design-system/blob/1873741ba8dea755e35e6e15134f7918cd58e036/src/matchers/token-matcher.ts)
