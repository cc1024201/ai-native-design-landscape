# Codoptic

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

Codoptic joins a diagram DSL, repository-derived knowledge, and an editing agent. The product's central object is a textual system model with a graph projection, not an illustration inferred once from a prompt.

## DSL and graph share one design

Users can author the system in a DSL and inspect the corresponding editable graph. Because relationships survive as structured source, the design can be diffed, regenerated, and related back to code. The visual surface is useful precisely because it does not sever that source lineage.

## Repository context changes the agent's role

Codoptic builds context from a codebase and knowledge graph before proposing architecture or documentation changes. The agent can ask clarifying questions and prepare edits against known entities instead of inventing an isolated diagram. This makes it a code-aware design workspace rather than a generic Mermaid chatbot.

## Approval before mutation

The inspected flows expose diffs and approval boundaries for agent changes. That is essential because repo context can be stale or incomplete. Approval confirms a proposed model edit, not the correctness of the underlying software or an automatic code migration.

## Pinned evidence

- Repository: [Codoptic/Codoptic](https://github.com/Codoptic/Codoptic)
- Inspected source: [`6c3fd0a78954710458d93d7b03525cc52a5593fb`](https://github.com/Codoptic/Codoptic/tree/6c3fd0a78954710458d93d7b03525cc52a5593fb)
- Immutable revision: [commit `6c3fd0a`](https://github.com/Codoptic/Codoptic/commit/6c3fd0a78954710458d93d7b03525cc52a5593fb)
