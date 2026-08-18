# Plannotator

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

Plannotator is a local browser review surface that intercepts agent plans, documents, rendered HTML and code diffs so a human can annotate, approve or reject them. Its output is structured feedback returned to the originating coding agent, closing a correction loop instead of leaving comments in an unrelated screenshot tool.

## Review decisions persist outside the chat turn

The original plan, artifact or diff remains source authority. Plannotator renders it, attaches precise annotations and keeps review sessions and approved-plan history locally. Host hooks translate approval or denial back into the agent workflow; diff review can also stage or unstage files. Sharing is optional and has explicitly documented local, encrypted-link and hosted boundaries.

Effective HTML recommends Plannotator as a companion, but the two products have different authorities: Effective HTML authors artifacts, while Plannotator governs human review and correction across many agents and artifact types.

- [Pinned repository](https://github.com/backnotprop/plannotator/tree/3245310aa8f6af981dab31e4c7bb4a3a3f0ee808)
- [Hook integration](https://github.com/backnotprop/plannotator/blob/3245310aa8f6af981dab31e4c7bb4a3a3f0ee808/apps/hook/README.md)
- [Codex integration](https://github.com/backnotprop/plannotator/blob/3245310aa8f6af981dab31e4c7bb4a3a3f0ee808/apps/codex/README.md)
- [Maintainer location evidence](https://github.com/backnotprop)
