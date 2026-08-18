# WebCraft

> Research status: **Source-level** · Lifecycle: **active-transition** · Last reviewed: **2026-08-12**

WebCraft joins conversational generation to a version-addressed visual editor. The user can move from a prompt response into GrapesJS, save changes back to that exact version, and then return to chat.

## Two providers feed one artifact contract

[`useAnthropic.js`](https://github.com/p1mple07/ProductDev_Kriti_25/blob/19b2dcab63c8527fda960a6a55eed3039d71b75d/frontend/src/hooks/useAnthropic.js) and [`useGemini.js`](https://github.com/p1mple07/ProductDev_Kriti_25/blob/19b2dcab63c8527fda960a6a55eed3039d71b75d/frontend/src/hooks/useGemini.js) support model generation. The chat model stores prompt/response versions rather than one mutable answer.

## Visual edits return to the selected version

[`EditorCanvas.jsx`](https://github.com/p1mple07/ProductDev_Kriti_25/blob/19b2dcab63c8527fda960a6a55eed3039d71b75d/frontend/src/components/Editor/EditorCanvas.jsx) loads the selected version's HTML and CSS into GrapesJS. Its Save command extracts the edited source and updates that chat/version through the API.

## Delivery is source-first

[`downloadCodeFiles.js`](https://github.com/p1mple07/ProductDev_Kriti_25/blob/19b2dcab63c8527fda960a6a55eed3039d71b75d/frontend/src/utils/downloadCodeFiles.js) downloads current HTML, CSS, and JavaScript. Some model calls occur from browser code and the editor does not handle a full framework graph, so this remains an active transition.

## Pinned evidence

- [Repository](https://github.com/p1mple07/ProductDev_Kriti_25)
- [Inspected tree](https://github.com/p1mple07/ProductDev_Kriti_25/tree/19b2dcab63c8527fda960a6a55eed3039d71b75d)
- Commit: `19b2dcab63c8527fda960a6a55eed3039d71b75d`
