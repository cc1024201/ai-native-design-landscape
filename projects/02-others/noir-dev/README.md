# NOIR.dev

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-13**

NOIR.dev is a Supabase-centered generation workspace that combines a current code artifact with autosaved versions, preview execution, sharing/team data and delivery services. The repository contains ambitious surfaces; this dossier credits only the mechanics connected to source and schema.

## Current code and version rows form the recovery model

Pinned revision: `53d266f3e6a95a9a9c578cec90cb42132731291a`.

`projectService` persists the current project `code`, prompt and generation type. `versionHistoryService` creates numbered code snapshots, compares them and implements revert by creating a new version from the selected old code. Autosave coalesces writes within a five-minute window. This preserves lineage rather than deleting later history when a user goes back.

The WebContainer service projects current code into an executable browser environment. Deployment and export services consume a chosen state but do not redefine the Supabase project as soon as a preview succeeds.

## A revert is not visibly complete until current authority moves

The version service's `revertToVersion` returns a new version; callers still need to apply that code to the current project. The distinction matters: a version row can be created while the editor remains on different code. The dossier therefore records implemented version operations without asserting atomic end-to-end rollback.

## Pinned evidence

- [Repository](https://github.com/radzfoundation-gif/noir.dev)
- [Current project service](https://github.com/radzfoundation-gif/noir.dev/blob/53d266f3e6a95a9a9c578cec90cb42132731291a/src/lib/projectService.ts)
- [Version history service](https://github.com/radzfoundation-gif/noir.dev/blob/53d266f3e6a95a9a9c578cec90cb42132731291a/src/lib/versionHistoryService.ts)
- [WebContainer service](https://github.com/radzfoundation-gif/noir.dev/blob/53d266f3e6a95a9a9c578cec90cb42132731291a/src/lib/webContainerService.ts)
