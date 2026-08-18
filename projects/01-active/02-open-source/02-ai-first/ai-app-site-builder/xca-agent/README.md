# XCA Agent

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-13**

XCA Agent is a prompt-to-application workspace whose implemented center is a persisted specification-and-source pipeline, not the live sandbox promised by many app builders. It qualifies through delegated interactive-product creation and source delivery, while its missing runtime makes the boundary unusually visible.

## The pipeline materializes a managed application project

Pinned revision: `c7a4d55d7e933bd9673f56830e1b8766a9b6e073`.

A planner turns the request into pages, data models, authentication and integrations. A deterministic scaffolder creates the file graph, then the coder asks routed models to rewrite files one at a time. The pipeline persists the current spec and per-file rows after every stage, so a failed request can resume from durable server state. Follow-up prompts receive the full current spec and source rather than an isolated visual selection.

The fixer interface looks like a build loop, but the pinned sandbox is explicitly a static-analysis stub. Its Preview tab displays a notice and a source excerpt instead of running the generated app. The implemented delivery path is a ZIP of the database-authoritative files; GitHub and Railway publication return a documented `501` stub.

## Manual editing and agent editing do not share authority

Monaco changes only `localFiles` in the React workspace. They are not sent to the project-file API, and the next agent turn reloads its starting state from PostgreSQL. A refresh or later streamed file can therefore discard manual work. The visible editor is a temporary inspection/correction surface, not yet a reliable authoring authority.

Successful fixer runs save full file-tree and spec checkpoints in PostgreSQL, and an API can list or restore them. The workspace does not call that API or expose checkpoint controls. Recovery exists at the service boundary but is not an ordinary-user feature in this revision.

## One product, two near-identical repositories

`QBot2` and `cxsagent` are same-maintainer uploads with all 51 paths in common and 48 identical blobs. Their only current differences are package metadata, the lockfile and an analytics addition in the app layout. They are one XCA Agent lineage; `cxsagent` is used as the earlier canonical source snapshot.

## Pinned evidence

- [Canonical repository](https://github.com/quotexlasthope3-commits/cxsagent)
- [Planner, scaffolder, coder and checkpoint pipeline](https://github.com/quotexlasthope3-commits/cxsagent/blob/c7a4d55d7e933bd9673f56830e1b8766a9b6e073/src/lib/pipeline/index.ts)
- [PostgreSQL project and checkpoint model](https://github.com/quotexlasthope3-commits/cxsagent/blob/c7a4d55d7e933bd9673f56830e1b8766a9b6e073/prisma/schema.prisma)
- [Stage persistence and rollback](https://github.com/quotexlasthope3-commits/cxsagent/blob/c7a4d55d7e933bd9673f56830e1b8766a9b6e073/src/lib/pipeline/persist.ts)
- [Ephemeral Monaco edit handoff](https://github.com/quotexlasthope3-commits/cxsagent/blob/c7a4d55d7e933bd9673f56830e1b8766a9b6e073/src/components/workspace/Workspace.tsx)
- [Stubbed preview](https://github.com/quotexlasthope3-commits/cxsagent/blob/c7a4d55d7e933bd9673f56830e1b8766a9b6e073/src/components/workspace/PreviewTab.tsx)
- [Working ZIP delivery](https://github.com/quotexlasthope3-commits/cxsagent/blob/c7a4d55d7e933bd9673f56830e1b8766a9b6e073/src/app/api/projects/%5Bid%5D/download/route.ts)
- [Near-duplicate QBot2 publication](https://github.com/quotexlasthope3-commits/QBot2)
