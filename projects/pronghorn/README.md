# Pronghorn

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

Pronghorn is a standards-first software-project platform from the Government of Alberta. Design is not a single screen inside it: requirements, multiple architecture canvases, standards, artifacts, repositories and presentations are connected parts of one managed project.

## The architecture graph and presentation graph have different authority

[`Canvas.tsx`](https://github.com/pronghorn-red/pronghorn/blob/7d922ec9ffe537058e8d6c74dd298d371aa27387/src/pages/project/Canvas.tsx) uses React Flow over persisted nodes and edges, with multiple canvases, layers, duplication, merge and split operations. AI architects operate on that structured graph; direct canvas editing and database-backed collaboration continue to mutate the same node/edge authority.

```text
idea -> requirements tree + standards -> AI/human architecture nodes and edges
-> project artifacts/repository/build state
-> presentation agent reads all project surfaces into an append-only blackboard
-> checkpointed slide JSON -> direct slide/notes/layout edits -> PDF/JSON/Markdown delivery
```

[`presentation-agent`](https://github.com/pronghorn-red/pronghorn/blob/7d922ec9ffe537058e8d6c74dd298d371aa27387/supabase/functions/presentation-agent/index.ts) reads requirements, artifacts, canvas, repositories, databases and deployments, appends observations to a blackboard, creates an exact slide skeleton, then checkpoints slide JSON as content and images arrive. The slide graph is a projection of wider project evidence, not a replacement for the architecture graph. [`presentationPdfExport.ts`](https://github.com/pronghorn-red/pronghorn/blob/7d922ec9ffe537058e8d6c74dd298d371aa27387/src/lib/presentationPdfExport.ts) handles one delivery path.

The repository is MIT licensed and identifies its creator as the Government of Alberta, Ministry of Technology and Innovation, which supports a Canada team-region classification. It does not reveal a stable internal squad boundary.

## Evidence

- [Pinned repository](https://github.com/pronghorn-red/pronghorn/tree/7d922ec9ffe537058e8d6c74dd298d371aa27387)
- [Product and creator contract](https://github.com/pronghorn-red/pronghorn/blob/7d922ec9ffe537058e8d6c74dd298d371aa27387/README.md)
- [Native architecture canvas](https://github.com/pronghorn-red/pronghorn/blob/7d922ec9ffe537058e8d6c74dd298d371aa27387/src/pages/project/Canvas.tsx)
- [Presentation blackboard and checkpoints](https://github.com/pronghorn-red/pronghorn/blob/7d922ec9ffe537058e8d6c74dd298d371aa27387/supabase/functions/presentation-agent/index.ts)
- [PDF export](https://github.com/pronghorn-red/pronghorn/blob/7d922ec9ffe537058e8d6c74dd298d371aa27387/src/lib/presentationPdfExport.ts)
