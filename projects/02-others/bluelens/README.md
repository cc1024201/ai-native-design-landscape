# BlueLens

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

BlueLens treats architecture diagrams as a navigable, code-linked workspace that must remain synchronized with a changing repository.

## A workspace, not a flat Mermaid file

Diagrams can link from a node to a deeper diagram and preserve breadcrumbs across levels of abstraction. Mermaid source remains editable, while a `.blueprint` workspace binds diagrams, navigation, and code references into a larger authority.

## The agent traverses evidence

Tool-calling lets the assistant list diagrams, follow nodes, and query the CodeGraph before answering. It can therefore explain a flow using both declared architecture and code-derived relationships. This is more constrained than pasting an entire repository into a generic chat.

## Drift becomes a reviewable proposal

BlueLens compares the diagram model with code and can surface synchronization suggestions as diffs. A mismatch is not auto-resolved: it may mean the code is wrong, the diagram is stale, or the mapping is incomplete. The user must decide which authority to promote.

## Pinned evidence

- Repository: [Nathanf22/BlueLens](https://github.com/Nathanf22/BlueLens)
- Inspected workspace source: [`94bc9fe77168addcb18e24b8d544ff4b608e8d2d`](https://github.com/Nathanf22/BlueLens/tree/94bc9fe77168addcb18e24b8d544ff4b608e8d2d)
- Immutable revision: [commit `94bc9fe`](https://github.com/Nathanf22/BlueLens/commit/94bc9fe77168addcb18e24b8d544ff4b608e8d2d)
