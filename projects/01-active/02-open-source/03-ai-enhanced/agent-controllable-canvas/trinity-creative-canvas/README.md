# Trinity Creative Canvas

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

Trinity Creative Canvas defines design as a graph of creative intent and generated media jobs. Prompts models assets image and video operations can be arranged together; local project data and provider job records preserve how an output came into being.

## A heterogeneous creative graph

[`schema.ts`](https://github.com/ProfEngel/TrinityCreativeCanvas/blob/91bc8bc27ec8e3c9341ebb3090b389fd0deeb24d/shared/schema.ts) defines projects nodes edges and provider-specific settings for prompt LLM image video asset and agent concepts. Unlike a single-message generator the canvas keeps intermediate creative decisions spatially accessible.

[`store.ts`](https://github.com/ProfEngel/TrinityCreativeCanvas/blob/91bc8bc27ec8e3c9341ebb3090b389fd0deeb24d/server/store.ts) writes local state to `trinity-store.json` and the application uses explicit vault paths for assets. That makes the project recoverable and inspectable without claiming collaborative database semantics.

## Provider execution retains mappings

Text nodes call OpenAI-compatible services. For ComfyUI work Trinity loads workflow JSON applies configured input mappings submits `/prompt` and polls `/history`. The stored relation between canvas node workflow mapping output path and job response is the essential provenance chain; the canvas coordinates an external image pipeline rather than pretending to be its renderer.

## Human-in-the-loop is detected more than automated

[`agents.ts`](https://github.com/ProfEngel/TrinityCreativeCanvas/blob/91bc8bc27ec8e3c9341ebb3090b389fd0deeb24d/server/agents.ts) includes a local agent harness and identifies human-intervention conditions. In the pinned revision much of this harness scans or writes result artifacts. That is evidence of an approval boundary under construction rather than a general autonomous creative executor.

## What survives delivery

Generated media files survive as assets and project records retain the graph that led to them. The system does not establish semantic direct editing of arbitrary raster or video output; revision normally means changing an upstream prompt mapping or node and running again.

## Source evidence

- [Repository](https://github.com/ProfEngel/TrinityCreativeCanvas)
- [Pinned tree](https://github.com/ProfEngel/TrinityCreativeCanvas/tree/91bc8bc27ec8e3c9341ebb3090b389fd0deeb24d)
- [Immutable commit](https://github.com/ProfEngel/TrinityCreativeCanvas/commit/91bc8bc27ec8e3c9341ebb3090b389fd0deeb24d)
