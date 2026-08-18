# Synthezy

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

Synthezy defines AI generation as one more producer of the whiteboard’s native element array. Generated rectangles, diamonds, text and connectors can be moved and styled with the same custom canvas tools as hand-created objects; no separate “AI image” survives beside them.

## Gemini proposes elements; application code normalizes and lays them out

At commit [`a78df269`](https://github.com/Pritam-72/synthezyy/tree/a78df269cd3c6d0f78fbe250dd2291e7828bcf16), [`aiService.js`](https://github.com/Pritam-72/synthezyy/blob/a78df269cd3c6d0f78fbe250dd2291e7828bcf16/client/src/utils/aiService.js) calls Gemini 1.5 Flash from the browser and requests JSON in Synthezy’s element vocabulary. It rejects unsupported tools or invalid coordinates, normalizes styling, and then applies application-owned flowchart, radial, hierarchical or horizontal layout rules.

[`AIToolPanel.jsx`](https://github.com/Pritam-72/synthezyy/blob/a78df269cd3c6d0f78fbe250dd2291e7828bcf16/client/src/components/AIToolPanel.jsx) positions the result away from existing content and appends it to the current element array. Manual edits continue from there. The API key is a `VITE_` browser value, so both credential and prompt cross the client-to-Gemini boundary directly.

An important evidence caveat is built into the product: missing credentials, provider errors and unparsable responses fall back to deterministic mock diagrams. A visible successful diagram is therefore not by itself proof that Gemini answered.

## One current array crosses several persistence modes

The same element array has three storage paths:

- [`AppStates.jsx`](https://github.com/Pritam-72/synthezyy/blob/a78df269cd3c6d0f78fbe250dd2291e7828bcf16/client/src/provider/AppStates.jsx) writes solo unauthenticated work to browser local storage.
- Authenticated work overwrites a MongoDB [`Drawing`](https://github.com/Pritam-72/synthezyy/blob/a78df269cd3c6d0f78fbe250dd2291e7828bcf16/server/models/Drawing.js) current-data field through a throttled autosave.
- [`saveElements`](https://github.com/Pritam-72/synthezyy/blob/a78df269cd3c6d0f78fbe250dd2291e7828bcf16/client/src/helper/element.js) downloads the array as a portable `.flowstate` file that can be opened again.

The model includes a metadata version number, but saves do not append prior bodies or increment a revision ledger. The number is not durable version history.

## Collaboration broadcasts the board, not operations

[`useHistory.jsx`](https://github.com/Pritam-72/synthezyy/blob/a78df269cd3c6d0f78fbe250dd2291e7828bcf16/client/src/hooks/useHistory.jsx) maintains an in-memory undo/redo stack and emits the complete element array for collaborative sessions. The [Socket.IO server](https://github.com/Pritam-72/synthezyy/blob/a78df269cd3c6d0f78fbe250dd2291e7828bcf16/server/index.js) stores the latest room array, attempts to overwrite an existing Mongo drawing, and broadcasts that array to other clients. Incoming state overwrites the current client entry rather than merging per-object operations.

This makes collaboration real but coarse: concurrent changes are last-arriving whole-board states, socket updates are not authenticated in the pinned server, and the README’s cursor, comments, permissions and replay claims are not supported by equivalent implemented protocols. Undo history is local memory and is not a shared or durable timeline.

## Delivery preserves either pixels or editability

The context menu can rasterize the canvas or serialize selected elements into SVG for copy/export paths, while `.flowstate` retains editable native data. These outputs derive from the current element array, including AI-generated objects after human correction.

Synthezy adds a native-canvas definition to the map, but also exposes why implementation evidence matters: generation, editing, current-state persistence and whole-board collaboration exist; durable versions and several README-level team features do not.

## Evidence

- [Pinned repository](https://github.com/Pritam-72/synthezyy/tree/a78df269cd3c6d0f78fbe250dd2291e7828bcf16)
- [Gemini, validation, fallback and layout](https://github.com/Pritam-72/synthezyy/blob/a78df269cd3c6d0f78fbe250dd2291e7828bcf16/client/src/utils/aiService.js)
- [Generated-element insertion](https://github.com/Pritam-72/synthezyy/blob/a78df269cd3c6d0f78fbe250dd2291e7828bcf16/client/src/components/AIToolPanel.jsx)
- [Realtime current-state server](https://github.com/Pritam-72/synthezyy/blob/a78df269cd3c6d0f78fbe250dd2291e7828bcf16/server/index.js)
