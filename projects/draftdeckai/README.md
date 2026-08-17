# DraftDeckAI

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

DraftDeckAI is an AI document workspace spanning presentations, resumes and diagrams. For this census the decisive surface is its presentation scene system: generated content enters an explicit scene model and remains available to a layers/properties editor rather than being flattened to images.

## Scene composition is the product's technical center

[`scene/types.ts`](https://github.com/Muneerali199/Draftdeckai/blob/2eac4d0c1698476b3cb1240c17051793918b7687/lib/presentation/scene/types.ts) defines the visual objects, while [`scene/engine.ts`](https://github.com/Muneerali199/Draftdeckai/blob/2eac4d0c1698476b3cb1240c17051793918b7687/lib/presentation/scene/engine.ts) composes and evaluates them. [`editor-store.ts`](https://github.com/Muneerali199/Draftdeckai/blob/2eac4d0c1698476b3cb1240c17051793918b7687/lib/editor-store.ts) carries editor state and [`editable-slides.tsx`](https://github.com/Muneerali199/Draftdeckai/blob/2eac4d0c1698476b3cb1240c17051793918b7687/components/presentation/editable-slides.tsx) exposes direct manipulation.

A Supabase presentation migration makes persisted records explicit, and [`presentation-export.ts`](https://github.com/Muneerali199/Draftdeckai/blob/2eac4d0c1698476b3cb1240c17051793918b7687/lib/presentation-export.ts) provides delivery. The repository contains ambitious and partly overlapping implementations; this dossier claims only the source-connected scene/editor/persistence path, not every README feature.

The maintainer profile reports Delhi, India.

## Evidence

- [Pinned repository](https://github.com/Muneerali199/Draftdeckai/tree/2eac4d0c1698476b3cb1240c17051793918b7687)
- [Scene engine](https://github.com/Muneerali199/Draftdeckai/blob/2eac4d0c1698476b3cb1240c17051793918b7687/lib/presentation/scene/engine.ts)
- [Presentation persistence migration](https://github.com/Muneerali199/Draftdeckai/blob/2eac4d0c1698476b3cb1240c17051793918b7687/supabase/migrations/20250113000001_add_presentations.sql)
- [Maintainer location evidence](https://github.com/Muneerali199)
