# PPTist

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

PPTist is a browser presentation editor with an implemented AIPPT path. Its key distinction is that generation feeds the same editable slide authority used by the PowerPoint-like editor rather than producing a separate preview artifact.

## Streaming has two human checkpoints

[`AIPPTDialog.vue`](https://github.com/pipipi-pikachu/PPTist/blob/2bfd88fef0d721b24b3a97bd5e3c8a36cabff0c6/src/views/Editor/AIPPTDialog.vue) first streams an outline. The user can edit that outline and select a template before a second stream produces typed [`AIPPTSlide`](https://github.com/pipipi-pikachu/PPTist/blob/2bfd88fef0d721b24b3a97bd5e3c8a36cabff0c6/src/types/AIPPT.ts) objects. `useAIPPT` converts them into the editor's normal slide model.

```text
topic -> streamed outline -> user edits outline -> template decision
-> streamed slide JSON -> normal slide store -> full editor -> PPTX
```

[`snapshot.ts`](https://github.com/pipipi-pikachu/PPTist/blob/2bfd88fef0d721b24b3a97bd5e3c8a36cabff0c6/src/store/snapshot.ts) persists undo/redo snapshots in IndexedDB. [`useExport.ts`](https://github.com/pipipi-pikachu/PPTist/blob/2bfd88fef0d721b24b3a97bd5e3c8a36cabff0c6/src/hooks/useExport.ts) writes native PPTX with PptxGenJS. Those two paths make recoverable editing and editable delivery explicit.

The maintainer's GitHub profile reports China; no stable team boundary beyond that maintainer lineage is public.

## Evidence

- [Pinned repository](https://github.com/pipipi-pikachu/PPTist/tree/2bfd88fef0d721b24b3a97bd5e3c8a36cabff0c6)
- [AIPPT generation dialog](https://github.com/pipipi-pikachu/PPTist/blob/2bfd88fef0d721b24b3a97bd5e3c8a36cabff0c6/src/views/Editor/AIPPTDialog.vue)
- [Snapshot store](https://github.com/pipipi-pikachu/PPTist/blob/2bfd88fef0d721b24b3a97bd5e3c8a36cabff0c6/src/store/snapshot.ts)
- [Maintainer location evidence](https://github.com/pipipi-pikachu)
