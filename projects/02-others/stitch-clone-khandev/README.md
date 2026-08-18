# Stitch Clone by Irfan Khan

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

This project is an independent open implementation inspired by Google Stitch. Its implemented product is narrower than its README roadmap: it has a real streaming HTML editor and multi-screen workspace but not the promised durable projects or Figma export.

## Provider output becomes editable HTML

[`backend/routes/generate.ts`](https://github.com/khandev1211-cpu/stitch-clone/blob/cc73300d18a25acd8fb886177441cbbc22e08638/backend/routes/generate.ts) routes a prompt and recent conversation to Claude or Groq and streams the resulting document over SSE. [`CodeEditor.tsx`](https://github.com/khandev1211-cpu/stitch-clone/blob/cc73300d18a25acd8fb886177441cbbc22e08638/frontend/src/components/editor/CodeEditor.tsx) edits the same HTML that [`LivePreview.tsx`](https://github.com/khandev1211-cpu/stitch-clone/blob/cc73300d18a25acd8fb886177441cbbc22e08638/frontend/src/components/editor/LivePreview.tsx) renders in a sandboxed iframe.

## Screens and history exist only in memory

[`canvasStore.ts`](https://github.com/khandev1211-cpu/stitch-clone/blob/cc73300d18a25acd8fb886177441cbbc22e08638/frontend/src/store/canvasStore.ts) stores generated screens in Zustand. [`PrototypePlayer.tsx`](https://github.com/khandev1211-cpu/stitch-clone/blob/cc73300d18a25acd8fb886177441cbbc22e08638/frontend/src/components/prototype/PrototypePlayer.tsx) steps through them; it does not execute a connection graph. [`historyStore.ts`](https://github.com/khandev1211-cpu/stitch-clone/blob/cc73300d18a25acd8fb886177441cbbc22e08638/frontend/src/store/historyStore.ts) keeps ten undoable code snapshots but has no persistence middleware.

The repository contains roadmap text for localStorage autosave and Figma export but no corresponding source path. Those claims are therefore not counted as implemented capabilities.

## Evidence

- [Canonical repository](https://github.com/khandev1211-cpu/stitch-clone)
- [Inspected tree](https://github.com/khandev1211-cpu/stitch-clone/tree/cc73300d18a25acd8fb886177441cbbc22e08638)
- Commit: `cc73300d18a25acd8fb886177441cbbc22e08638`

No reliable geographic evidence was found; team region remains `unknown`.
