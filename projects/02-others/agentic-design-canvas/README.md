# Agentic Design Canvas

> Research status: **Source-level** · Lifecycle: **active-transition** · Last reviewed: **2026-08-12**

Agentic Design Canvas is a working human-agent vector editor. Its defining choice is that both parties mutate one scene graph: the agent does not return an image or parallel code artifact for a human to reconstruct.

## Perception combines structure and pixels

The agent receives serialized scene structure plus a raster thumbnail for spatial context. [`loop.ts`](https://github.com/moonslicer/coframe/blob/accba8083baf0f69f5dfe97e88c2ff8275c49207/app/src/agent/loop.ts) runs perceive, plan, act and verify; [`tools.ts`](https://github.com/moonslicer/coframe/blob/accba8083baf0f69f5dfe97e88c2ff8275c49207/app/src/shared/tools.ts) exposes semantic operations instead of arbitrary document replacement.

```text
scene graph + thumbnail -> plan -> semantic mutations
-> revisioned shared store -> structural verification -> canvas
       ^ human edits use the same graph and revision stream
```

[`store.ts`](https://github.com/moonslicer/coframe/blob/accba8083baf0f69f5dfe97e88c2ff8275c49207/app/src/shared/store.ts) owns nodes and revisions; SVG construction and rasterization keep the agent's visual evidence derived from that state. The [concurrency specification](https://github.com/moonslicer/coframe/blob/accba8083baf0f69f5dfe97e88c2ff8275c49207/docs/concurrency-spec.md) explicitly considers conflicting human and agent edits. The project calls itself a rough personal demo, so production collaboration and durable account persistence remain unproven.

The project is MIT-licensed. No reliable maintainer-region evidence was found.

## Sources

- [Pinned repository](https://github.com/moonslicer/coframe/tree/accba8083baf0f69f5dfe97e88c2ff8275c49207)
- [Verifier](https://github.com/moonslicer/coframe/blob/accba8083baf0f69f5dfe97e88c2ff8275c49207/app/src/agent/verify.ts)
- [Canvas](https://github.com/moonslicer/coframe/blob/accba8083baf0f69f5dfe97e88c2ff8275c49207/app/src/client/Canvas.tsx)
- [MIT license](https://github.com/moonslicer/coframe/blob/accba8083baf0f69f5dfe97e88c2ff8275c49207/LICENSE)
