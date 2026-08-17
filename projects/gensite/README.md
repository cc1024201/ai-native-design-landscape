# GenSite

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

GenSite defines a website as a durable map of page files plus shared project state. Generation can stream a multi-page result; corrections target one page or element; versions capture the accepted file map before preview download or publication.

## The project can hold a real page set

[`server/prisma/schema.prisma`](https://github.com/Prathamesh51-debug/GenSite/blob/4ad2420b9a3559fd68be97cf87c11277b9a867af/server/prisma/schema.prisma) stores `files` beside current source conversation versions and publication state. [`generation.controller.ts`](https://github.com/Prathamesh51-debug/GenSite/blob/4ad2420b9a3559fd68be97cf87c11277b9a867af/server/modules/project/generation.controller.ts) streams generation events while the server builds the design brief shared layout and individual pages.

## Correction preserves page identity

[`revision.service.ts`](https://github.com/Prathamesh51-debug/GenSite/blob/4ad2420b9a3559fd68be97cf87c11277b9a867af/server/modules/project/revision.service.ts) resolves a target page from the request or current path. Chat revision replaces that complete page; element edit returns a constrained fragment; manual source saving creates a new durable version. Rollback restores both metadata and the selected file map.

[`ProjectPreview.tsx`](https://github.com/Prathamesh51-debug/GenSite/blob/4ad2420b9a3559fd68be97cf87c11277b9a867af/client/src/features/editor/ProjectPreview.tsx) maps internal links across sandboxed `srcDoc` pages and deliberately uses a stricter sandbox for public views. [`EditorPanel.tsx`](https://github.com/Prathamesh51-debug/GenSite/blob/4ad2420b9a3559fd68be97cf87c11277b9a867af/client/src/features/editor/EditorPanel.tsx) exposes source correction before explicit download or publication.

## Evidence

- [Canonical repository](https://github.com/Prathamesh51-debug/GenSite)
- [Inspected tree](https://github.com/Prathamesh51-debug/GenSite/tree/4ad2420b9a3559fd68be97cf87c11277b9a867af)
- Commit: `4ad2420b9a3559fd68be97cf87c11277b9a867af`

No reliable geographic evidence was found; team region remains `unknown`.
