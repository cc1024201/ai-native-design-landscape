# AI UI Builder by Sharad Patil

> Research status: **Source-level** · Lifecycle: **active-transition** · Last reviewed: **2026-08-12**

This workspace turns a brief into React source through an explicit planning generation explanation pipeline then lets later prompts modify the current source. It couples that loop to a live preview and a small durable rollback history.

## The model edits the current code authority

The pinned [server](https://github.com/sharadpatil1415/ai_ui_builder/blob/95d895361182c0ab311f135e1250cf9c0e0ecf7d/server/server.js) routes the first prompt through planner generator and explainer modules. Later prompts call the modifier with the current code. [`modifier.js`](https://github.com/sharadpatil1415/ai_ui_builder/blob/95d895361182c0ab311f135e1250cf9c0e0ecf7d/server/agents/modifier.js) sends that code and the requested change to Gemini 2.5 Flash; it is not a local canned transform.

## Source preview and direct editing converge in one session

[`App.jsx`](https://github.com/sharadpatil1415/ai_ui_builder/blob/95d895361182c0ab311f135e1250cf9c0e0ecf7d/src/App.jsx) keeps `currentCode` as the shared input to the code editor preview and next modification request. [`PreviewPanel.jsx`](https://github.com/sharadpatil1415/ai_ui_builder/blob/95d895361182c0ab311f135e1250cf9c0e0ecf7d/src/panels/PreviewPanel.jsx) injects the generated React and a fixed component system into a sandboxed iframe.

## Versions survive process restart

[`versionStore.js`](https://github.com/sharadpatil1415/ai_ui_builder/blob/95d895361182c0ab311f135e1250cf9c0e0ecf7d/server/versionStore.js) appends generated modified and rollback states per session. [`storage.js`](https://github.com/sharadpatil1415/ai_ui_builder/blob/95d895361182c0ab311f135e1250cf9c0e0ecf7d/server/storage.js) persists those sessions to `sessions_data.json`. Rollback creates a new version rather than silently rewriting history. Manual editor changes remain local until a later model request or generated version captures them.

## Pinned evidence

- [Repository](https://github.com/sharadpatil1415/ai_ui_builder)
- [Inspected tree](https://github.com/sharadpatil1415/ai_ui_builder/tree/95d895361182c0ab311f135e1250cf9c0e0ecf7d)
- Commit: `95d895361182c0ab311f135e1250cf9c0e0ecf7d`
