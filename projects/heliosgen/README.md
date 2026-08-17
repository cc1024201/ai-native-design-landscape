# HeliosGen

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

HeliosGen is a visual image-and-video pipeline workspace. Its canvas is not merely a prompt board: typed edges select prompts, reference media and frame roles that are sent to real generation providers, while spaces preserve the graph and generated assets.

## Spaces preserve the working graph

[store.ts](https://github.com/SegFault42/HeliosGen/blob/fda96d66b0144b46a8b71727d682e9bfc83b8fb4/lib/store.ts) keeps nodes, edges, viewport and multiple spaces in a persisted Zustand store with undo and redo snapshots. [useSpaceSync.ts](https://github.com/SegFault42/HeliosGen/blob/fda96d66b0144b46a8b71727d682e9bfc83b8fb4/lib/useSpaceSync.ts) synchronizes those same spaces to Supabase after local rehydration, rather than replacing them with a separate server representation.

## Edge handles carry media semantics

[executor.ts](https://github.com/SegFault42/HeliosGen/blob/fda96d66b0144b46a8b71727d682e9bfc83b8fb4/lib/executor.ts) resolves prompt sources, image references, start and end frames, motion-control video and audio by source and target handle. It also groups generation nodes into dependency waves so independent generations can run in parallel while downstream generators wait.

## Generation returns to the canvas and gallery

Image and video routes submit concrete provider payloads to Replicate or Kie.ai, track asynchronous jobs and move durable media into local or R2-backed storage. Node state exposes pending, running and completed output, while public-space and gallery routes provide delivery beyond the editing session.

## Authority ceiling

Pipeline scheduling considers dependencies between generation nodes; prompt and reference nodes supply inputs but are not executable stages themselves. Spaces have timestamps, undo and public publication, but no source-level revision history or branch model was found. Successful execution also depends on user or server provider credentials and callback reachability.

## Pinned evidence

- [Repository](https://github.com/SegFault42/HeliosGen)
- [Inspected tree](https://github.com/SegFault42/HeliosGen/tree/fda96d66b0144b46a8b71727d682e9bfc83b8fb4)
- [Video provider route](https://github.com/SegFault42/HeliosGen/blob/fda96d66b0144b46a8b71727d682e9bfc83b8fb4/app/api/generate-video/route.ts)
- [Pipeline runner](https://github.com/SegFault42/HeliosGen/blob/fda96d66b0144b46a8b71727d682e9bfc83b8fb4/lib/usePipelineRunner.ts)
