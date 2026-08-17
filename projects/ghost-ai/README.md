# Ghost AI

> Research status: **Source-level** · Lifecycle: **active-transition** · Last reviewed: **2026-08-12**

Ghost AI is a collaborative system-architecture builder. The working artifact is a typed node/edge graph; the AI agent reads that graph, proposes structural changes and can generate a separate technical specification.

## Collaborative topology first

React Flow renders the architecture; Liveblocks supplies room presence and cursors; autosave writes canvas JSON to project storage. The agent runs as a durable task and returns graph mutations rather than a diagram screenshot. Project sharing and role checks surround the canvas.

[`types/canvas.ts`](https://github.com/adrianhajdin/ghost-ai/blob/ad365e1c6649699b343e292b8d265a291ae0ce3c/types/canvas.ts) defines the graph contract. [`trigger/design-agent.ts`](https://github.com/adrianhajdin/ghost-ai/blob/ad365e1c6649699b343e292b8d265a291ae0ce3c/trigger/design-agent.ts) consumes it; [`use-canvas-autosave.ts`](https://github.com/adrianhajdin/ghost-ai/blob/ad365e1c6649699b343e292b8d265a291ae0ce3c/hooks/use-canvas-autosave.ts) and the [canvas API route](https://github.com/adrianhajdin/ghost-ai/blob/ad365e1c6649699b343e292b8d265a291ae0ce3c/app/api/projects/%5BprojectId%5D/canvas/route.ts) preserve it.

## Graph and specification are different clocks

```text
editable graph -> agent graph mutations -> autosaved graph
              -> specification job    -> delivered document
```

The specification can lag behind later graph edits and should be regenerated; it is not silently treated as another synchronized authority.

## Evidence boundary

Pinned revision: [`ad365e1`](https://github.com/adrianhajdin/ghost-ai/commit/ad365e1c6649699b343e292b8d265a291ae0ce3c). The source derives from a public JavaScript Mastery build and has no license file. It is marked active-transition because the repository is a tutorial-associated release with limited independent history. The maintainer profile identifies Croatia.

## Decisive sources

- [Repository](https://github.com/adrianhajdin/ghost-ai)
- [Project model](https://github.com/adrianhajdin/ghost-ai/blob/ad365e1c6649699b343e292b8d265a291ae0ce3c/prisma/models/project.prisma)
- [Maintainer profile](https://github.com/adrianhajdin)
