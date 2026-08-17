# Archon by Cole Medin

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

Archon is a workflow control plane for AI coding agents where a visual DAG and its YAML representation coordinate isolated work, review gates, artifacts, and repository delivery.

## YAML is the reviewable source

The builder exposes agents, commands, prompts, loops, gates, and dependencies as nodes while a live YAML view shows the persisted definition. Default workflows are explicitly reference patterns that users are expected to copy and diverge from, not immutable hidden recipes.

## Isolation is encoded in the design

Nodes can run in separate Git worktrees and sessions. Child-isolation rules, event records, resume paths, logs, and workflow-node sessions let the control plane reconnect an execution to the specific repository context that produced it.

## Gates and artifacts determine promotion

Human or automated gates can block downstream work, and artifact summaries expose what each node produced before a branch is accepted. The included Remotion workflow demonstrates that the graph can govern a visual deliverable, while the product itself remains domain-general.

## Pinned evidence

- Repository: [coleam00/Archon](https://github.com/coleam00/Archon)
- Inspected YAML defaults, visual builder, worktree isolation, events, gates, artifacts, and resume tree: [`536fbe0c0d7293b10a369b4b18d53888209d9a9f`](https://github.com/coleam00/Archon/tree/536fbe0c0d7293b10a369b4b18d53888209d9a9f)
- Immutable revision: [commit `536fbe0`](https://github.com/coleam00/Archon/commit/536fbe0c0d7293b10a369b4b18d53888209d9a9f)
