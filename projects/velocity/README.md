# Velocity

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

Velocity is a local-first command center that turns repeated Claude Code, Codex CLI, and Gemini CLI work into inspectable agents, workflows, skills, and commands.

## The visual graph is not the deployed artifact

The workflow builder stores an editable node graph and can ask an AI route to propose or repair it. Deployment then materializes provider-native command or skill files. The canvas is therefore a design surface over multiple filesystem authorities, not a new universal runtime that silently replaces each CLI.

## Sessions close the reuse loop

PTY sessions, transcripts, routing context, cost, latency, and tool use can be inspected before a recurring pattern becomes automation. A compare workspace makes candidate sessions reviewable, while SQLite retains the local project state. This joins authoring to evidence about how a workflow actually behaved.

## Provider parity has explicit limits

Adapters normalize common concepts across Claude, Codex, and Gemini, but hooks and plugins are not claimed to exist everywhere. Tests around command deployment and provider resolution make those asymmetries visible instead of hiding them behind one generic agent label.

## Pinned evidence

- Repository: [OptimiLabs/velocity](https://github.com/OptimiLabs/velocity)
- Inspected workflow, deployment, session, and provider tree: [`f8abf094aec056ec5036595b44f90d2d067e9323`](https://github.com/OptimiLabs/velocity/tree/f8abf094aec056ec5036595b44f90d2d067e9323)
- Immutable revision: [commit `f8abf09`](https://github.com/OptimiLabs/velocity/commit/f8abf094aec056ec5036595b44f90d2d067e9323)
