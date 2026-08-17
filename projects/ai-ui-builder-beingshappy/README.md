# AI UI Builder by beingshappy

> Research status: **Source-level** · Lifecycle: **active-transition** · Last reviewed: **2026-08-12**

This repository exposes a compact prompt-to-HTML application generator. Its decisive artifact is a three-file bundle that can be previewed copied or downloaded without claiming a deeper project graph than the source implements.

## Generation produces a constrained file bundle

The pinned [generation route](https://github.com/beingshappy/Ai-ui-Builder/blob/5c2394f59e5a4c8c8b1b6090b0cdb504bee4cd84/app/api/generate-code/route.ts) calls GPT-4 through the Vercel AI SDK and requires an object containing HTML CSS and JavaScript. It evaluates task-specific requirements and can ask the model to repair incomplete output. This is a real provider path rather than a delayed canned response.

## The same bundle drives preview and delivery

[`app/generator/page.tsx`](https://github.com/beingshappy/Ai-ui-Builder/blob/5c2394f59e5a4c8c8b1b6090b0cdb504bee4cd84/app/generator/page.tsx) assembles the returned files into a preview document while also exposing each source pane and downloading `index.html`, `styles.css` and `script.js`. [`live-preview.tsx`](https://github.com/beingshappy/Ai-ui-Builder/blob/5c2394f59e5a4c8c8b1b6090b0cdb504bee4cd84/components/live-preview.tsx) mounts that document in a sandboxed iframe. The rendered page is therefore a projection of the delivered file bundle.

## Session-only authority

The bundle lives in component state and every request sends only the current prompt. There is no saved project version or prior-bundle refinement path. The system qualifies through creation preview and file delivery but is classified as an early standalone workspace rather than a managed application project.

## Pinned evidence

- [Repository](https://github.com/beingshappy/Ai-ui-Builder)
- [Inspected tree](https://github.com/beingshappy/Ai-ui-Builder/tree/5c2394f59e5a4c8c8b1b6090b0cdb504bee4cd84)
- Commit: `5c2394f59e5a4c8c8b1b6090b0cdb504bee4cd84`
