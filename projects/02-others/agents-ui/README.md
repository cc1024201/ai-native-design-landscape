# agents-ui

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

agents-ui is a visual control surface over Claude Code's existing `~/.claude` configuration rather than a replacement agent runtime.

## Files remain the authority

Agents, commands, skills, workflows, and plugins are discovered from and written back to the Claude directory. Forms and relationship graphs make those Markdown and configuration files easier to understand, but a user can still inspect or version the underlying material without this UI.

## The graph shows configuration relationships

The dashboard maps which agents reference commands, skills, tools, or one another. Its workflow builder adds an executable ordering over those assets, while terminal emulation and server-sent events expose real runs and metrics.

## Scope follows Claude Code

The product can test and organize what Claude Code can execute; it does not claim an independent provider-neutral agent model. That host boundary is decisive when comparing it with standalone visual agent platforms.

## Pinned evidence

- Repository: [Ngxba/claude-code-cli-ui](https://github.com/Ngxba/claude-code-cli-ui)
- Inspected filesystem adapters, entity editors, relationship graph, workflow runner, terminal, and SSE tree: [`46494279f514d7116b08311c32dd6a1c510a6f7a`](https://github.com/Ngxba/claude-code-cli-ui/tree/46494279f514d7116b08311c32dd6a1c510a6f7a)
- Immutable revision: [commit `4649427`](https://github.com/Ngxba/claude-code-cli-ui/commit/46494279f514d7116b08311c32dd6a1c510a6f7a)
