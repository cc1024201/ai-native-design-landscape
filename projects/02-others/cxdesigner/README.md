# cxDesinger

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

cxDesinger is a local Electron studio that treats product planning, page concepts, asset slicing and implementation as stages of one project directory. Codex is an external runtime; the product's distinctive authority is the human-readable project data it gives that runtime and the review surfaces wrapped around image generation.

## Page-level files prevent one giant agent blob

[`project-data-service.ts`](https://github.com/zuoliang0/cxDesinger/blob/41bb1cf87f82bb9ccc32a5560ab03637f12a3048/electron/main/services/project-data-service.ts) maintains a lightweight `pages.json` index and per-page `page.json`, `assets.json` and `slice-selections.json` files. Existing v1 projects migrate on first write and keep `pages.v1.backup.json`, making the schema change recoverable.

Each page can retain multiple concept images and switch its active version. A user annotates a region on an existing image before asking for a revision, reviews AI-proposed slice rectangles, changes the selection and only then batch-generates reusable assets with stable IDs and source coordinates.

## The filesystem is guarded behind the main process

[`project-file-service.ts`](https://github.com/zuoliang0/cxDesinger/blob/41bb1cf87f82bb9ccc32a5560ab03637f12a3048/electron/main/services/project-file-service.ts) centralizes file access and save-conflict checks. The renderer receives a narrow preload IPC surface rather than direct filesystem or process access. Planning Markdown, page artifacts, the embedded code workspace and Codex terminals therefore operate against the same selected directory; ZIP export and local Git preserve a deliverable outside the app.

## Evidence

- [Pinned repository](https://github.com/zuoliang0/cxDesinger/tree/41bb1cf87f82bb9ccc32a5560ab03637f12a3048)
- [Project service](https://github.com/zuoliang0/cxDesinger/blob/41bb1cf87f82bb9ccc32a5560ab03637f12a3048/electron/main/services/project-service.ts)
- [Shared project types](https://github.com/zuoliang0/cxDesinger/blob/41bb1cf87f82bb9ccc32a5560ab03637f12a3048/src/shared/types.ts)
