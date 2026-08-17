# ALLWEONE Presentation AI

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

ALLWEONE Presentation AI is an outline-first slide application. It combines agent generation with a rich structured editor, custom and imported themes, diagrams, presentation recording, sharing and PowerPoint export.

## The editable slide tree—not the model response—is the working artifact

The user can start blank or generate an outline, edit that outline and choose a theme before deck generation. The presentation agent in [`createAgent.ts`](https://github.com/allweonedev/presentation-ai/blob/43fe74abd5676dbbea52b8cd66c43fb3b931b5c1/src/ai/agents/presentation/createAgent.ts) can search, regenerate and edit an existing presentation. Generated XML is parsed into the same Plate-based slide structures used by direct editing.

```text
topic -> editable outline -> theme/style choice -> streamed slide graph
-> direct rich edit / diagram edit / agent revision -> autosave
-> present/share/record -> best-effort native PPTX materialization
```

[`presentation-history-state.ts`](https://github.com/allweonedev/presentation-ai/blob/43fe74abd5676dbbea52b8cd66c43fb3b931b5c1/src/states/presentation-history-state.ts) holds up to fifty snapshots for undo/redo. Prisma-backed presentation state supplies durable app persistence. The PowerPoint exporter scans the rendered DOM and recreates supported text, shapes, images, charts and layout in PPTX; the project's own roadmap warns that some visual elements do not translate one-to-one.

The managed slide graph is therefore the highest-fidelity authoring authority. PPTX is editable delivery but can be lossy; recordings and public views are projections. Full real-time multi-user collaboration is explicitly not shipped and is not inferred from sharing.

The project is MIT-licensed. The maintainer profile reports San Francisco, United States.

## Pinned evidence

- [Repository](https://github.com/allweonedev/presentation-ai/tree/43fe74abd5676dbbea52b8cd66c43fb3b931b5c1)
- [Slide editor](https://github.com/allweonedev/presentation-ai/blob/43fe74abd5676dbbea52b8cd66c43fb3b931b5c1/src/components/presentation/slides/SlideEditor.tsx)
- [DOM-to-PPTX converter](https://github.com/allweonedev/presentation-ai/blob/43fe74abd5676dbbea52b8cd66c43fb3b931b5c1/src/components/presentation/export/domToPptxConverter.ts)
- [Persistence schema](https://github.com/allweonedev/presentation-ai/blob/43fe74abd5676dbbea52b8cd66c43fb3b931b5c1/prisma/schema.prisma)
- [MIT license](https://github.com/allweonedev/presentation-ai/blob/43fe74abd5676dbbea52b8cd66c43fb3b931b5c1/LICENSE)
