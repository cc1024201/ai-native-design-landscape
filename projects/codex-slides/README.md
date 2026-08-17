# Codex Slides

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

Codex Slides is an image-native presentation studio inside a coding-agent workflow. The ordinary user does not receive one opaque deck file: clarification, research, outline, visual direction, page rendering, mark-based correction, presenting and export remain stages of one durable local project.

## A project record coordinates several authorities

[`types.ts`](https://github.com/nexu-io/codex-slides/blob/dbc2a5992e937760e9ce8e587e11729f970881cb/src/lib/types.ts) defines the project configuration, design system, workflow stage, outline and per-slide render state. [`store.ts`](https://github.com/nexu-io/codex-slides/blob/dbc2a5992e937760e9ce8e587e11729f970881cb/src/lib/store.ts) persists `project.json`, Design Files and numbered page images on disk. The image is the final visual authority for each slide; title, notes, transition and workflow metadata remain structured project state. PPTX export therefore materializes full-slide images rather than editable PowerPoint shapes.

```text
brief + files -> clarification/research -> editable outline
-> selected visual system -> parallel or progressive page renders
-> chat/mark/direct deck operations -> immutable local versions
-> presenter view -> PDF or image-backed PPTX
```

[`pipeline.ts`](https://github.com/nexu-io/codex-slides/blob/dbc2a5992e937760e9ce8e587e11729f970881cb/src/lib/pipeline.ts) separates outline planning from rendering, retries failed pages and runs verification sweeps. [`deckVersions.ts`](https://github.com/nexu-io/codex-slides/blob/dbc2a5992e937760e9ce8e587e11729f970881cb/src/lib/deckVersions.ts) stores immutable project-local snapshots and supports restore. Browser routes and the MCP server expose the same project rather than maintaining another hidden deck.

The repository is MIT licensed. Public project evidence does not establish a reliable team region. Visual-quality and speed claims in the README are product claims; the dossier uses the checked-in state and mutation path, not those claims, as evidence.

## Evidence

- [Pinned repository](https://github.com/nexu-io/codex-slides/tree/dbc2a5992e937760e9ce8e587e11729f970881cb)
- [Project and artifact types](https://github.com/nexu-io/codex-slides/blob/dbc2a5992e937760e9ce8e587e11729f970881cb/src/lib/types.ts)
- [On-disk store](https://github.com/nexu-io/codex-slides/blob/dbc2a5992e937760e9ce8e587e11729f970881cb/src/lib/store.ts)
- [Generation and correction pipeline](https://github.com/nexu-io/codex-slides/blob/dbc2a5992e937760e9ce8e587e11729f970881cb/src/lib/pipeline.ts)
- [Export route](https://github.com/nexu-io/codex-slides/blob/dbc2a5992e937760e9ce8e587e11729f970881cb/src/app/api/projects/%5Bid%5D/export/route.ts)
