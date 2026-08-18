# Webstew AI

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

Webstew is not adequately described as one prompt-to-HTML route. Its source defines a production-scale workspace spanning static websites, React, Next.js, Astro, Expo apps, agentic edits, direct visual correction, media, CMS and external delivery. The authority model changes by target and must be read as a layered workspace.

## Generation routes are target-specific

[generate/route.ts](https://github.com/SGK112/ai-website-builder/blob/48572d97d509dda5327e3674f3f2e9913d871e31/apps/web/src/app/api/builder/generate/route.ts) streams complete website output through provider selection, truncation checks and repair passes. Separate React, Next.js, Astro and app routes return multi-file target projects. Provider choice is an execution policy rather than the product identity.

## Agent correction mutates current project material

[agent/route.ts](https://github.com/SGK112/ai-website-builder/blob/48572d97d509dda5327e3674f3f2e9913d871e31/apps/web/src/app/api/builder/agent/route.ts) exposes tools for source and asset correction against current work. [workspace/page.tsx](https://github.com/SGK112/ai-website-builder/blob/48572d97d509dda5327e3674f3f2e9913d871e31/apps/web/src/app/workspace/page.tsx) combines prompt generation, code and preview modes, selection tools, undo and redo, project saving and export.

## Durability has three different meanings

[Project.ts](https://github.com/SGK112/ai-website-builder/blob/48572d97d509dda5327e3674f3f2e9913d871e31/packages/database/src/models/Project.ts) persists current files, generation metadata and project configuration in MongoDB. The workspace also maintains a bounded in-memory undo history and localStorage caches. Those local entries aid recovery but are not equivalent to a server-side complete-version archive.

## Delivery is connected infrastructure

[GitHub deployment route](https://github.com/SGK112/ai-website-builder/blob/48572d97d509dda5327e3674f3f2e9913d871e31/apps/web/src/app/api/deploy/github/route.ts) writes project material to an external repository and the general deploy route handles hosted targets. Export and deployment therefore branch from accepted project source rather than only displaying a success simulation.

## Evidence

- [Canonical repository](https://github.com/SGK112/ai-website-builder)
- [Inspected tree](https://github.com/SGK112/ai-website-builder/tree/48572d97d509dda5327e3674f3f2e9913d871e31)
- Commit: 48572d97d509dda5327e3674f3f2e9913d871e31
