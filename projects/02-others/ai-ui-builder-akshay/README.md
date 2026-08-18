# AI UI Builder by Akshay Chaulya

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

This project uses three model roles to keep UI generation inside a predefined component vocabulary: planning creates the intermediate authority, generation materializes it and review provides a separate correction pass.

## A plan precedes JSX

[`ai.controllers.js`](https://github.com/akshay-chaulya/AI-powered-React-UI-Builder/blob/15e13ba84ef8156267b70fd2f522100c0a870aeb/backend/controllers/ai.controllers.js) exposes distinct Gemini calls for planner, generator and reviewer. The [prompt contracts](https://github.com/akshay-chaulya/AI-powered-React-UI-Builder/blob/15e13ba84ef8156267b70fd2f522100c0a870aeb/backend/config/prompts.js) require the planner to return structured JSON and constrain generation to the repository's component set. This intermediate graph is the governance layer that distinguishes the product from unconstrained prompt-to-code.

## Review can become repair

[`AIContext.jsx`](https://github.com/akshay-chaulya/AI-powered-React-UI-Builder/blob/15e13ba84ef8156267b70fd2f522100c0a870aeb/frontend/src/context/AIContext.jsx) sequences planning and generation, formats the returned source and can resubmit a render error for a model-authored repair. [`Preview.jsx`](https://github.com/akshay-chaulya/AI-powered-React-UI-Builder/blob/15e13ba84ef8156267b70fd2f522100c0a870aeb/frontend/src/components/Preview.jsx) uses `react-live` as the visual proof surface. The inspected code keeps the current plan and source in client state rather than a persisted project model.

## Evidence

- [Canonical repository](https://github.com/akshay-chaulya/AI-powered-React-UI-Builder)
- [Inspected tree](https://github.com/akshay-chaulya/AI-powered-React-UI-Builder/tree/15e13ba84ef8156267b70fd2f522100c0a870aeb)
- Commit: `15e13ba84ef8156267b70fd2f522100c0a870aeb`
