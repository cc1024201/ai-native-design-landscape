# NoteGen

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

NoteGen is a local-first knowledge workspace in which diagrams are one durable content type among Markdown notes, charts and several canvas modes. Its design surface is broader than a Mermaid generator.

## Files and canvases coexist

At commit [`9781c16b`](https://github.com/codexu/note-gen/tree/9781c16b2a0103e73ceb3e064e57be2d9c0e0656), article state and canvas state have separate stores and database paths. Flow diagrams, mind maps, timelines and freehand boards can therefore keep their own native structure beside text files.

## AI enters through content-specific tools

The agent handler and prompt assembly layer expose workspace context while chart and canvas helpers convert requested visual content into supported structures. This is more controlled than asking a general chat panel to emit arbitrary HTML.

## Local-first is a lifecycle claim

History, backup and cloud-folder synchronization operate around user-owned local material. The important authority distinction is that the canvas database and Markdown files survive independently of an inference turn; synchronization is transport rather than the sole source of truth.

## Evidence

- [Pinned repository](https://github.com/codexu/note-gen/tree/9781c16b2a0103e73ceb3e064e57be2d9c0e0656)
- [Canvas types](https://github.com/codexu/note-gen/blob/9781c16b2a0103e73ceb3e064e57be2d9c0e0656/src/types/canvas.ts)
- [Canvas store](https://github.com/codexu/note-gen/blob/9781c16b2a0103e73ceb3e064e57be2d9c0e0656/src/stores/canvas.ts)
- [Canvas persistence](https://github.com/codexu/note-gen/blob/9781c16b2a0103e73ceb3e064e57be2d9c0e0656/src/db/canvases.ts)
- [Agent handler](https://github.com/codexu/note-gen/blob/9781c16b2a0103e73ceb3e064e57be2d9c0e0656/src/lib/agent/agent-handler.ts)
