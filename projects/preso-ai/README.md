# Preso AI

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

Preso AI is a local-first presentation studio that turns prompts, text and documents into a deck graph, then lets a person change that graph on a fixed 1920×1080 canvas. Direct drag, resize, rotate, crop and text styling coexist with natural-language remix at element or slide scope.

## The browser deck is the authority; export is a materialization

[`EditorCanvas.tsx`](https://github.com/atharva9167j/preso/blob/a56fad2891605b5a07213a97a155a872777f4ffc/components/DeckView/EditorCanvas.tsx) binds direct manipulation to the same element model that generation creates. [`useDeckHistory.ts`](https://github.com/atharva9167j/preso/blob/a56fad2891605b5a07213a97a155a872777f4ffc/hooks/useDeckHistory.ts) supplies undoable state transitions, and [`db.ts`](https://github.com/atharva9167j/preso/blob/a56fad2891605b5a07213a97a155a872777f4ffc/services/db.ts) persists decks in IndexedDB rather than requiring a hosted project service.

HTML, PDF, PNG and [PPTX export](https://github.com/atharva9167j/preso/blob/a56fad2891605b5a07213a97a155a872777f4ffc/services/export/pptx.ts) are downstream representations. The editor's stored deck graph remains the revision authority until an editable PowerPoint copy is deliberately materialized. This project is unrelated to the hosted Preso at `trypreso.com`; the shared name does not establish one team or product lineage.

## Evidence

- [Pinned repository](https://github.com/atharva9167j/preso/tree/a56fad2891605b5a07213a97a155a872777f4ffc)
- [Live product](https://preso-ai.vercel.app/)
- [Maintainer profile: India](https://github.com/atharva9167j)
