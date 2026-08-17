# UI Craft

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

UI Craft is an installable design-engineering control plane for coding agents. It spans direction, persistent context, source construction and deterministic review; the mechanism that distinguishes it from a prompt pack is the executable gate and recovery layer.

## Design context can graduate into enforcement

Users may begin with direct craft or critique commands, then persist a brief, tokens and remembered decisions under `.ui-craft/`. A bundled MCP server exposes anti-slop checks, token lint, an acceptance bar and UI scoring. Review agents combine those mechanical results with accessibility and design judgment.

```text
existing project + brief/tokens -> routed craft command -> source change
-> deterministic MCP gates + review agents -> correction/finalize
-> persistent design memory; installer snapshots allow rollback
```

[`score-ui.mjs`](https://github.com/educlopez/ui-craft/blob/2ee6e0889a7a6ceb1542fe9e6793b71c697e1c2a/mcp/src/tools/score-ui.mjs) makes a score reproducible, while [`acceptance-bar.mjs`](https://github.com/educlopez/ui-craft/blob/2ee6e0889a7a6ceb1542fe9e6793b71c697e1c2a/mcp/src/tools/acceptance-bar.mjs) checks declared completion criteria. The Go installer detects agent harnesses, writes atomically, snapshots targets and restores only its own changes on failure. Repository source remains final authority.

The project is MIT-licensed. The maintainer profile reports Madrid, Spain.

## Sources

- [Pinned repository](https://github.com/educlopez/ui-craft/tree/2ee6e0889a7a6ceb1542fe9e6793b71c697e1c2a)
- [Core skill](https://github.com/educlopez/ui-craft/blob/2ee6e0889a7a6ceb1542fe9e6793b71c697e1c2a/skills/ui-craft/SKILL.md)
- [Token lint](https://github.com/educlopez/ui-craft/blob/2ee6e0889a7a6ceb1542fe9e6793b71c697e1c2a/mcp/src/tools/tokens-lint.mjs)
- [Backup store](https://github.com/educlopez/ui-craft/blob/2ee6e0889a7a6ceb1542fe9e6793b71c697e1c2a/cli/backup/store.go)
- [MIT license](https://github.com/educlopez/ui-craft/blob/2ee6e0889a7a6ceb1542fe9e6793b71c697e1c2a/LICENSE)
