# AI Frontend Generator by Tamil Selvan

> Research status: **Source-level** · Lifecycle: **historical** · Last reviewed: **2026-08-12**

This compact 2024 project is a three-pane source-authority editor: Gemini supplies HTML, CSS, and JavaScript; the user can edit each file; and the combined result renders continuously.

## Gemini returns a split artifact

[`server.js`](https://github.com/metamil/AI-Frontend-generator/blob/6641a1edcca8bfd931bb5b28593e8c8b30427545/sever/server.js) prompts Gemini for a JSON object with independent `html`, `css`, and `js` fields. Although the pinned source includes unsafe key handling and rough error paths, the model-to-artifact connection is implemented.

## Direct source edits own the preview

[`script.js`](https://github.com/metamil/AI-Frontend-generator/blob/6641a1edcca8bfd931bb5b28593e8c8b30427545/script.js) fills the three textareas and rebuilds `iframe.srcdoc` from their current values on every input event. There is no project database or version history, and the repository has not advanced beyond the 2024 snapshot.

## Pinned evidence

- [Repository](https://github.com/metamil/AI-Frontend-generator)
- [Inspected tree](https://github.com/metamil/AI-Frontend-generator/tree/6641a1edcca8bfd931bb5b28593e8c8b30427545)
- Commit: `6641a1edcca8bfd931bb5b28593e8c8b30427545`
