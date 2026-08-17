# AI-Powered Website Builder by Ratna Babu

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

This project is a conversational React-site builder in which Gemini produces a file bundle and the user works against its Sandpack code and preview projection. Convex retains the conversation and generated file object so the workspace can be reopened.

## A generated file map is the artifact

[`AiModel.jsx`](https://github.com/Ratna-Babu/Ai-Website-Builder/blob/503f119364ac78b48d0a36e3c9c12a33a5b9a2b4/configs/AiModel.jsx) asks Gemini for a JSON object containing `projectTitle`, explanation and a path-keyed `files` map. [`gen-ai-code/route.jsx`](https://github.com/Ratna-Babu/Ai-Website-Builder/blob/503f119364ac78b48d0a36e3c9c12a33a5b9a2b4/app/api/gen-ai-code/route.jsx) streams the response but only promotes it after the accumulated text parses as JSON.

## One prompt drives conversation and implementation

[`ChatView.jsx`](https://github.com/Ratna-Babu/Ai-Website-Builder/blob/503f119364ac78b48d0a36e3c9c12a33a5b9a2b4/components/custom/ChatView.jsx) persists human and assistant messages. The adjacent [`CodeView.jsx`](https://github.com/Ratna-Babu/Ai-Website-Builder/blob/503f119364ac78b48d0a36e3c9c12a33a5b9a2b4/components/custom/CodeView.jsx) observes the same message stream and requests a replacement file bundle whenever the newest message is from the user. This is whole-bundle regeneration rather than target-level DOM correction.

## Convex coordinates reopening; Sandpack projects the result

The [`Convex schema`](https://github.com/Ratna-Babu/Ai-Website-Builder/blob/503f119364ac78b48d0a36e3c9c12a33a5b9a2b4/convex/schema.js) stores `messages` and optional `fileData` on each workspace. CodeView merges that record with a default Vite shell and exposes code editing file navigation and a live Sandpack preview. A JSZip export materializes the current file map with a generated package manifest.

## What is not present

There is no commit graph parallel-variant model or element-to-source mapping. Manual edits inside the Sandpack editor are local to that component state unless they originate from a persisted AI bundle.

## Pinned evidence

- [Repository](https://github.com/Ratna-Babu/Ai-Website-Builder)
- [Inspected tree](https://github.com/Ratna-Babu/Ai-Website-Builder/tree/503f119364ac78b48d0a36e3c9c12a33a5b9a2b4)
- [Maintainer profile locating the lineage in India](https://github.com/Ratna-Babu)
- Commit: `503f119364ac78b48d0a36e3c9c12a33a5b9a2b4`
