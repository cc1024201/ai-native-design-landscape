# GenWebAI by Artibar

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

GenWebAI treats one complete HTML document as the project authority. It adds a distinct Groq-backed implementation and branded product surface to a common chat-to-website pattern rather than claiming a visual canvas or component graph.

## Groq returns one replaceable document

[`ai.js`](https://github.com/Artibar/AI_WEBSITE/blob/1e2d5c73f716c94a4f6981b5991dbb8bd8e3187d/backend/aiServices/ai.js) constrains Llama 3.3 to a JSON object containing a message and full HTML. [`websiteController.js`](https://github.com/Artibar/AI_WEBSITE/blob/1e2d5c73f716c94a4f6981b5991dbb8bd8e3187d/backend/controller/websiteController.js) creates the first document, then includes `latestCode` in a later correction prompt and replaces it after a valid response.

## MongoDB owns the recoverable state

[`Website.js`](https://github.com/Artibar/AI_WEBSITE/blob/1e2d5c73f716c94a4f6981b5991dbb8bd8e3187d/backend/model/Website.js) stores the latest document, conversation and application-publication fields. There are no immutable code snapshots: chat history explains replacement requests but cannot itself reconstruct every prior document.

## Preview and publication project the stored HTML

[`Preview.jsx`](https://github.com/Artibar/AI_WEBSITE/blob/1e2d5c73f716c94a4f6981b5991dbb8bd8e3187d/frontend/src/pages/Preview.jsx) uses a sandboxed `srcDoc` iframe and exposes source as read-only text. The backend deploy action assigns a slug and lets the application serve that same Mongo document publicly. ZIP export and granular section editing remain README roadmap items rather than inspected capabilities.

## Evidence

- [Canonical repository](https://github.com/Artibar/AI_WEBSITE)
- [Inspected tree](https://github.com/Artibar/AI_WEBSITE/tree/1e2d5c73f716c94a4f6981b5991dbb8bd8e3187d)
- Commit: `1e2d5c73f716c94a4f6981b5991dbb8bd8e3187d`
