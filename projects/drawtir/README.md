# Drawtir

> Research status: **Source-level** · Lifecycle: **active-transition** · Last reviewed: **2026-08-12**

Drawtir combines a multi-frame graphics canvas with an animation timeline. The intended artifact can therefore be a static layout, storyboard, social campaign or time-based composition rather than only an AI-generated image.

## Canvas and timeline remain editable after generation

The pinned source includes resizable frames, rich text, vector and shader elements, frame video controls and presentation export. [`CanvasContainerNew.tsx`](https://github.com/RantirAI/drawtir/blob/eb3dfdbd4ec0d7bb4c21c7d9b07d683c38eec08c/src/components/Canvas/CanvasContainerNew.tsx) is the main spatial surface. Timeline state and the movie renderer convert editable element properties and keyframes into time-based output.

AI is attached at several material points. Storyboard and wall modals generate scenes or variations; Supabase functions such as [`generate-merch-design`](https://github.com/RantirAI/drawtir/tree/eb3dfdbd4ec0d7bb4c21c7d9b07d683c38eec08c/supabase/functions/generate-merch-design) and [`import-figma-design`](https://github.com/RantirAI/drawtir/tree/eb3dfdbd4ec0d7bb4c21c7d9b07d683c38eec08c/supabase/functions/import-figma-design) bring generated or external structure onto the canvas. Human selection and property tools then continue from that state.

```text
brief/script/brand kit -> scenes and variants -> frame graph
-> direct layout + keyframe correction -> preview -> movie/static export
```

The repository does not expose a simple portable file/version contract in its top-level documentation, so hosted Supabase state is the evidenced persistence boundary and recovery semantics remain under-documented. Exported media is not reversible into the graph.

Source is governed by a custom Rantir Fair-Use License with separate enterprise-designated exclusions; it is not a standard open-source license. The organization profile reports the United States.

## Evidence

- [Pinned repository](https://github.com/RantirAI/drawtir/tree/eb3dfdbd4ec0d7bb4c21c7d9b07d683c38eec08c)
- [Movie renderer](https://github.com/RantirAI/drawtir/blob/eb3dfdbd4ec0d7bb4c21c7d9b07d683c38eec08c/src/lib/marketingVideoRenderer.ts)
- [Custom license](https://github.com/RantirAI/drawtir/blob/eb3dfdbd4ec0d7bb4c21c7d9b07d683c38eec08c/license)
