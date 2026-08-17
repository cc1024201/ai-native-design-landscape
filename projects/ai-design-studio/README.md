# AI Design Studio

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

AI Design Studio defines interior design as grounded transformation of an uploaded room photograph. Scene understanding, catalog retrieval, conversational advice and generative editing all attach to the same room record, but the visual artifact remains a lineage of raster images rather than a semantic room or 3D scene graph.

## A room profile grounds search and advice

The upload is stored in Supabase and Gemini extracts room type, style, palette and detected objects through the [`analysis route`](https://github.com/abbinavv/ai-design-studio/blob/3115980fdcc4fc5640f545d649cd9c4c3a5bc964/app/api/rooms/%5Bid%5D/analyze/route.ts). Voyage embeddings and pgvector search connect natural-language requests to the product catalog; the assistant adds the room profile and matched products as retrieval context.

This profile is descriptive context. It does not turn objects in the photograph into directly editable scene nodes.

## Spatial intent becomes a raster operation

The canvas supports replacement, whole-room restyling and polygon placement. [`studio-canvas.tsx`](https://github.com/abbinavv/ai-design-studio/blob/3115980fdcc4fc5640f545d649cd9c4c3a5bc964/components/studio/studio-canvas.tsx) normalizes a lasso to image coordinates and submits the requested object. [`inpaint/route.ts`](https://github.com/abbinavv/ai-design-studio/blob/3115980fdcc4fc5640f545d649cd9c4c3a5bc964/app/api/inpaint/route.ts) rasterizes that polygon as a mask before calling Stability AI; the general [`editor route`](https://github.com/abbinavv/ai-design-studio/blob/3115980fdcc4fc5640f545d649cd9c4c3a5bc964/app/api/editor/route.ts) performs search-and-replace or image-to-image restyling.

The result is compressed, stored as a new object and recorded in `room_edits` with its prompt, base URL and result URL. Past thumbnails can be reopened and downloaded.

## History is a sibling gallery, not cumulative source control

Each inspected edit endpoint starts from the room's original `image_url`; selecting an old thumbnail changes what the user views but does not make it the next endpoint's base. History therefore records sibling proposals from one source photograph, not an automatically chained edit graph. There is no layer mask retained as an editable object after generation, merge operation between alternatives or deterministic undo inside a raster result.

The system does provide durable, user-scoped room and edit records through Supabase and keeps provider keys server-side. Its delivery boundary is an edited JPEG download, while purchasing remains a recommendation path rather than an artifact promotion transaction.

## Evidence

- [Pinned repository](https://github.com/abbinavv/ai-design-studio/tree/3115980fdcc4fc5640f545d649cd9c4c3a5bc964)
- [Database schema and row-level policies](https://github.com/abbinavv/ai-design-studio/blob/3115980fdcc4fc5640f545d649cd9c4c3a5bc964/supabase/migrations/0001_init.sql)
