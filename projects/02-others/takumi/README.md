# Takumi

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

Takumi defines a generated component as a small structured bundle rather than a pasted snippet. Prompting produces JSX plus supporting schema and hook material; the browser mounts the accepted bundle into Sandpack.

## Structured response becomes a virtual project

[`app/api/generate/route.js`](https://github.com/sejal-godbole/takumi/blob/1588dabe2a874bd4d4f6123b3f7f38795b7a71f6/app/api/generate/route.js) calls Gemini with an explicit JSON contract. It separates the provider boundary from the browser and returns generation errors rather than directly exposing the key. [`app/dashboard/page.jsx`](https://github.com/sejal-godbole/takumi/blob/1588dabe2a874bd4d4f6123b3f7f38795b7a71f6/app/dashboard/page.jsx) owns the current bundle and prompt flow.

## Editor and runtime consume adopted source

[`CodeEditor.jsx`](https://github.com/sejal-godbole/takumi/blob/1588dabe2a874bd4d4f6123b3f7f38795b7a71f6/components/dashboard/CodeEditor.jsx) exposes the source in Monaco. [`Preview.jsx`](https://github.com/sejal-godbole/takumi/blob/1588dabe2a874bd4d4f6123b3f7f38795b7a71f6/components/dashboard/Preview.jsx) maps it into Sandpack's virtual files for an isolated React runtime. Theme controls alter generation and preview inputs rather than a separate native design graph.

## Persistence claim and inspected boundary

The repository includes Prisma and Clerk dependencies and describes user-linked generation history. The inspected snapshot does not expose a rich immutable version graph: it stores generations for later retrieval and exports the current project as code or ZIP. Sequential saved generations should not be read as parallel design candidates.

## Evidence and location

- [Canonical repository](https://github.com/sejal-godbole/takumi)
- [Inspected tree](https://github.com/sejal-godbole/takumi/tree/1588dabe2a874bd4d4f6123b3f7f38795b7a71f6)
- [Generation route](https://github.com/sejal-godbole/takumi/blob/1588dabe2a874bd4d4f6123b3f7f38795b7a71f6/app/api/generate/route.js)
- Commit: `1588dabe2a874bd4d4f6123b3f7f38795b7a71f6`

The maintainer's [GitHub profile](https://github.com/sejal-godbole) states Pune; team region is recorded as India.
