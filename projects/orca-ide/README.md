# Orca IDE

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

Orca is an agent IDE whose Design Mode converts a user's selection in a live browser into grounded visual evidence for coding agents, then supports parallel candidate comparison and promotion in Git.

## A click creates source-linked context

Design Mode captures the selected DOM element, relevant HTML and CSS, a cropped screenshot, and page context. That bundle enters the agent prompt with a concrete target, reducing the gap between “fix this” and a source location without pretending the browser is the code authority.

## Worktrees make alternatives first-class

One request can run across multiple isolated Git worktrees. Orca snapshots previews, lets a user compare results, annotate diffs, and merge the chosen candidate. Promotion is therefore explicit; parallel agent output does not silently overwrite the main project.

## The interface is also agent-controllable

CLI operations expose worktrees, snapshots, clicks, fills, terminals, and remote sessions. Agents can use Orca's browser and computer surfaces while file edits and Git retain the final authority. Design evidence, implementation, and promotion remain separate stages.

## Pinned evidence

- Repository: [stablyai/orca](https://github.com/stablyai/orca)
- Inspected Design Mode, browser grounding, worktree orchestration, snapshots, diff annotation, CLI, and remote execution tree: [`fd2afc16c8f339a540ff64a5930ead5ab1d207ef`](https://github.com/stablyai/orca/tree/fd2afc16c8f339a540ff64a5930ead5ab1d207ef)
- Immutable revision: [commit `fd2afc1`](https://github.com/stablyai/orca/commit/fd2afc16c8f339a540ff64a5930ead5ab1d207ef)
- [Design Mode documentation](https://www.onorca.dev/docs/browser/design-mode)
