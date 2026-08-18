# Giselle

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

Giselle is a typed workflow-design platform in which visual workspaces can become runnable applications. Its monorepo connects protocol objects, canvas persistence, generation state and authenticated app delivery instead of treating the editor as a separate mockup.

## Workspace is the shared contract

The protocol's [workspace model](https://github.com/giselles-ai/giselle/blob/56ff5f1c86b42e4ed9250010b9cb9ebc0520c8fd/packages/protocol/src/workspace/index.ts) defines typed nodes, connections, UI state and schema version. The designer edits that structure directly.

## Persistence protects the newest graph

[controller.ts](https://github.com/giselles-ai/giselle/blob/56ff5f1c86b42e4ed9250010b9cb9ebc0520c8fd/internal-packages/workflow-designer-ui/src/app-designer/store/persistence/controller.ts) debounces workspace saves, queues changes made during an in-flight save and supports route-change or before-unload flushes. This makes graph authority explicit and guards against silently clearing newer edits.

## Generation and delivery remain linked to the workspace

The React package's [generation store](https://github.com/giselles-ai/giselle/blob/56ff5f1c86b42e4ed9250010b9cb9ebc0520c8fd/packages/react/src/generations/store.ts) tracks live generations and messages. The authenticated [app run route](https://github.com/giselles-ai/giselle/blob/56ff5f1c86b42e4ed9250010b9cb9ebc0520c8fd/apps/studio.giselles.ai/app/api/apps/%5BappId%5D/run/route.ts) resolves a published app, maps external inputs to its workspace parameters and creates a task through the same Giselle runtime.

## Product shape

The defining loop is compose typed generative nodes → persist a workspace → observe generations → stage and invoke an app. That places Giselle at the intersection of agent-controllable canvas, product delivery and system-governed execution.

## Pinned evidence

- [Repository](https://github.com/giselles-ai/giselle)
- [Inspected tree](https://github.com/giselles-ai/giselle/tree/56ff5f1c86b42e4ed9250010b9cb9ebc0520c8fd)
- [App connection-state synchronization](https://github.com/giselles-ai/giselle/blob/56ff5f1c86b42e4ed9250010b9cb9ebc0520c8fd/internal-packages/workflow-designer-ui/src/app-designer/store/app-connection-state-sync-provider.tsx)
