# Polaris by Umang

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-13**

Polaris is a persistent prompt-to-app workspace built around Convex files and Inngest tool execution. It is the earliest public canonical found for the source lineage also published later as `utkarshpawade/CloudAIIDE`; normalized source comparison found the same schema, project and preview implementation across both trees.

## Agent tools mutate a Convex file graph

Pinned revision: `bdcc787d7ba70950c4bf7bde409941d8418a87ef`.

The Convex schema separates projects and files. Inngest conversation tools list, read, create, update, rename and delete those file records. CodeMirror gives the user a direct source surface. WebContainer receives a projection of the current file tree and supplies preview plus terminal evidence.

## GitHub is an explicit synchronization boundary

Import creates project files from a repository; export writes the current Polaris file set outward. Cancellation/reset routes reveal that export has its own job lifecycle. The Convex project remains authoritative until a remote operation succeeds, and future GitHub changes are not automatically the same state.

## No invented version model

The inspected source establishes durable current files but not a snapshot/restore ledger. Git can provide history after export, while the in-product project remains a latest-state authority.

## Pinned evidence

- [Repository](https://github.com/umang-162/polaris)
- [Convex schema](https://github.com/umang-162/polaris/blob/bdcc787d7ba70950c4bf7bde409941d8418a87ef/convex/schema.ts)
- [Agent create-files tool](https://github.com/umang-162/polaris/blob/bdcc787d7ba70950c4bf7bde409941d8418a87ef/src/features/conversations/inngest/tools/create-files.ts)
- [WebContainer projection](https://github.com/umang-162/polaris/blob/bdcc787d7ba70950c4bf7bde409941d8418a87ef/src/features/preview/hooks/use-webcontainer.ts)
- [GitHub import/export routes](https://github.com/umang-162/polaris/tree/bdcc787d7ba70950c4bf7bde409941d8418a87ef/src/app/api/github)
