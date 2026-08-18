# Totalum AI App Builder Open

> Research status: **Architecture-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

Totalum's open repository defines the product workspace and its service contract: prompting, live preview, code inspection, database operations, version recovery, GitHub synchronization, and hosting appear as one coherent builder. The source of truth for the actual sandbox and agent, however, lives behind the external Totalum VCaaS API.

## An open client coordinates a closed execution plane

[`src/app/api/vcaas/[...path]/route.ts`](https://github.com/totalumlabs/ai-app-builder-open/blob/0ac2beaec650ab996fad294b321f7cc7717ac523/src/app/api/vcaas/%5B...path%5D/route.ts) is a same-origin credential boundary. [`src/lib/vcaas.ts`](https://github.com/totalumlabs/ai-app-builder-open/blob/0ac2beaec650ab996fad294b321f7cc7717ac523/src/lib/vcaas.ts) exposes typed operations for agent runs, deployments, GitHub, database records, domains, logs, versions, and source download, then forwards them to the hosted service. The repository therefore proves the interface and orchestration surface, not the server-side mutation implementation.

## Versions are recoverable build states

[`src/components/workspace/VersionsPanel.tsx`](https://github.com/totalumlabs/ai-app-builder-open/blob/0ac2beaec650ab996fad294b321f7cc7717ac523/src/components/workspace/VersionsPanel.tsx) lists versions created by AI builds and recovers a selected version only after warning that current changes will be overwritten. Preview, code, database, GitHub, logs, and hosting panels all address the same external project identity.

## Evidence limit

The [repository contract](https://github.com/totalumlabs/ai-app-builder-open/blob/0ac2beaec650ab996fad294b321f7cc7717ac523/README.md) says VCaaS supplies the agents, sandboxes, databases, hosting, domains, and GitHub infrastructure. Because that backend is unavailable here, model orchestration, filesystem authority, snapshot creation, and production isolation remain architecture-level claims.

## Evidence and location

- [Canonical repository](https://github.com/totalumlabs/ai-app-builder-open)
- [Inspected tree](https://github.com/totalumlabs/ai-app-builder-open/tree/0ac2beaec650ab996fad294b321f7cc7717ac523)
- Commit: `0ac2beaec650ab996fad294b321f7cc7717ac523`

The maintainer organization's [GitHub profile](https://github.com/totalumlabs) states Delaware, United States; team region is recorded as USA.
