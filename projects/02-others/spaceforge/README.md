# Spaceforge

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

Spaceforge combines browser-local inference with a server-backed site project. The model can run through WebGPU on the user's device while files versions collaboration and publication remain durable application concepts.

## Local model output enters a bounded file loop

[`lib/generate/model.ts`](https://github.com/ronreiter/spaceforge/blob/9714d8c85e7f413cb1fee5280c6b0281626ed476/lib/generate/model.ts) selects and streams the browser-capable model path. [`lib/generate/loop.ts`](https://github.com/ronreiter/spaceforge/blob/9714d8c85e7f413cb1fee5280c6b0281626ed476/lib/generate/loop.ts) interprets generation events against the current site rather than treating the final prose as an artifact. HTML CSS and JavaScript are kept as named site files.

## Durable project state outranks the preview

[`db/schema.ts`](https://github.com/ronreiter/spaceforge/blob/9714d8c85e7f413cb1fee5280c6b0281626ed476/db/schema.ts) defines sites files versions domains collaborators and submissions. [`SiteEditor.tsx`](https://github.com/ronreiter/spaceforge/blob/9714d8c85e7f413cb1fee5280c6b0281626ed476/app/sites/%5BsiteId%5D/SiteEditor.tsx) consumes that project and projects it into an editor and sandboxed runtime. The iframe is evidence of current files; it is not the saved authority.

## Versions are activatable states

[`lib/publish/versions.ts`](https://github.com/ronreiter/spaceforge/blob/9714d8c85e7f413cb1fee5280c6b0281626ed476/lib/publish/versions.ts) creates and restores file snapshots. A version route explicitly activates a chosen revision. [`publish/route.ts`](https://github.com/ronreiter/spaceforge/blob/9714d8c85e7f413cb1fee5280c6b0281626ed476/app/api/sites/%5BsiteId%5D/publish/route.ts) moves an accepted state through the publication pipeline; it is not triggered merely by generating or previewing.

## Evidence and location

- [Canonical repository](https://github.com/ronreiter/spaceforge)
- [Inspected tree](https://github.com/ronreiter/spaceforge/tree/9714d8c85e7f413cb1fee5280c6b0281626ed476)
- [Publish pipeline](https://github.com/ronreiter/spaceforge/blob/9714d8c85e7f413cb1fee5280c6b0281626ed476/lib/publish/pipeline.ts)
- Commit: `9714d8c85e7f413cb1fee5280c6b0281626ed476`

The maintainer's [GitHub profile](https://github.com/ronreiter) states Israel; team region is recorded as Israel.
