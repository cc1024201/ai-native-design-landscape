# Prompt to UI by Sanyam Bassi

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

Prompt to UI is a local multi-model design workspace inspired by Google Stitch. Its canonical artifact is a typed UI tree arranged into screens variants prototype links and a spatial canvas—not generated HTML alone.

## `UISchema` is the native graph

[`types.ts`](https://github.com/sanyambassi/prompt-to-ui/blob/280b33e6b469a70e1ed9e386f75bf11ffdf4714d/src/lib/schema/types.ts) defines the versioned recursive node contract with component type props style layout children and interactions. Provider responses pass through envelope validation migration and schema rendering before they become a screen.

## Generation can preserve or focus existing structure

The [`streaming route`](https://github.com/sanyambassi/prompt-to-ui/blob/280b33e6b469a70e1ed9e386f75bf11ffdf4714d/src/app/api/studio/generation/stream/route.ts) accepts model and image-provider choices attachments multiple-screen dimensions an existing-project context and an optional focus node. This supports both greenfield creation and bounded mutation of an existing design graph.

## Canvas state and design objects persist separately

[`projects.ts`](https://github.com/sanyambassi/prompt-to-ui/blob/280b33e6b469a70e1ed9e386f75bf11ffdf4714d/src/actions/studio/projects.ts) persists project theme viewport and canvas documents then duplicates screens variants prototype links and assets with remapped identities. [`useCanvasPersistence.ts`](https://github.com/sanyambassi/prompt-to-ui/blob/280b33e6b469a70e1ed9e386f75bf11ffdf4714d/src/hooks/useCanvasPersistence.ts) debounces spatial-item state into that project record.

## Variants and snapshots are first-class

The pinned [`database schema`](https://github.com/sanyambassi/prompt-to-ui/blob/280b33e6b469a70e1ed9e386f75bf11ffdf4714d/db/migrations/init.sql) gives projects screens variants chat messages assets prototype links generation jobs and version snapshots distinct tables. This separates candidate exploration from ordinary undo history and allows full project payloads to be restored.

## Delivery materializes the graph

[`export-static-bundle.ts`](https://github.com/sanyambassi/prompt-to-ui/blob/280b33e6b469a70e1ed9e386f75bf11ffdf4714d/src/lib/schema/export-static-bundle.ts) walks the current UI tree and emits self-contained HTML CSS and JavaScript. The design graph remains canonical during authoring while export becomes an explicit downstream code authority.

## Pinned evidence

- [Repository](https://github.com/sanyambassi/prompt-to-ui)
- [Inspected tree](https://github.com/sanyambassi/prompt-to-ui/tree/280b33e6b469a70e1ed9e386f75bf11ffdf4714d)
- [Maintainer profile locating the lineage in the United States](https://github.com/sanyambassi)
- Commit: `280b33e6b469a70e1ed9e386f75bf11ffdf4714d`
