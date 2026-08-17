# Quill

> Research status: **Source-level** · Lifecycle: **active-transition** · Last reviewed: **2026-08-12**

Quill is an Electron design editor where multi-provider model output streams into the same vector scene that people edit with shape, pen, property, layer and symbol tools. It therefore retains a structural correction path after generation.

## Generation does not end the design session

Provider configuration can target Anthropic, OpenAI or compatible local endpoints. The main process streams model output; [`stream-parser.ts`](https://github.com/mhirst/quill-design/blob/1ec7c3a41300f6262b5e95bdfe833198d51e8966/src/renderer/lib/stream-parser.ts) converts it for the editor. The canvas exposes Bézier point editing, gradients, reusable symbols, alignment, multi-page layers and a full undo/redo path.

[`useProjectStore.ts`](https://github.com/mhirst/quill-design/blob/1ec7c3a41300f6262b5e95bdfe833198d51e8966/src/renderer/hooks/useProjectStore.ts) is the renderer-side project authority while [`project-manager.ts`](https://github.com/mhirst/quill-design/blob/1ec7c3a41300f6262b5e95bdfe833198d51e8966/src/main/project-manager.ts) and file manager bridge persistence into the desktop process.

```text
prompt -> streamed scene mutations -> vector canvas
       -> direct node/property/symbol edits -> history
       -> JSX / SVG / HTML / PNG export
```

JSX, SVG and HTML exports are independent materializations; editing them does not automatically return changes to the Quill project. PNG is flattened. The source contains many experimental panels, so the dossier treats the evidenced core canvas and exporter paths as the product contract rather than equating every component filename with a finished feature.

No license text was present despite a README license heading. The maintainer profile reports New York in the United States.

## Source evidence

- [Pinned repository](https://github.com/mhirst/quill-design/tree/1ec7c3a41300f6262b5e95bdfe833198d51e8966)
- [SVG exporter](https://github.com/mhirst/quill-design/blob/1ec7c3a41300f6262b5e95bdfe833198d51e8966/src/renderer/lib/exportSvg.ts)
- [HTML exporter](https://github.com/mhirst/quill-design/blob/1ec7c3a41300f6262b5e95bdfe833198d51e8966/src/renderer/lib/exportHtml.ts)
