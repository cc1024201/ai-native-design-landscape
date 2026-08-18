# Storyboard Reference Studio

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

Storyboard Reference Studio converts existing imagery into an editable reference board. A filmmaker selects exact frames, reorders cards, reframes each source, annotates camera motion, records shot metadata and corrects a generator-specific prompt before reviewing the sequence as an animatic.

## Crop intent is stored separately from source pixels

The [crop editor](https://github.com/wassermanproductions/storyboard-reference-studio/blob/356dbf1bbdeda0c17bddb893a799f04e445d2ff1/src/renderer/panels/CropEditor.tsx) records normalized source-space geometry; it does not destructively rewrite imported media. [`store.ts`](https://github.com/wassermanproductions/storyboard-reference-studio/blob/356dbf1bbdeda0c17bddb893a799f04e445d2ff1/src/renderer/store.ts) holds board order, metadata, prompts and annotations. Projects are reopenable folders with pretty-printed `project.json`, copied media, a still cache and timed autosave.

[`export.ts`](https://github.com/wassermanproductions/storyboard-reference-studio/blob/356dbf1bbdeda0c17bddb893a799f04e445d2ff1/src/main/export.ts) applies crops at full resolution and writes still/prompt pairs, machine-readable JSON, contact sheet and board Markdown; PDF, shot-list CSV and animatic are parallel delivery views. The [MCP bridge](https://github.com/wassermanproductions/storyboard-reference-studio/blob/356dbf1bbdeda0c17bddb893a799f04e445d2ff1/mcp/storyboard-mcp.mjs) drives the same running board and bearer-token control surface.

## Evidence

- [Pinned repository](https://github.com/wassermanproductions/storyboard-reference-studio/tree/356dbf1bbdeda0c17bddb893a799f04e445d2ff1)
- [Board direct-manipulation surface](https://github.com/wassermanproductions/storyboard-reference-studio/blob/356dbf1bbdeda0c17bddb893a799f04e445d2ff1/src/renderer/panels/Board.tsx)
- [Running-app control](https://github.com/wassermanproductions/storyboard-reference-studio/blob/356dbf1bbdeda0c17bddb893a799f04e445d2ff1/src/main/control.ts)
