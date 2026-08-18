# AI Orchestration UI Generator by Shishir Gupta

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

This implementation treats a constrained JSON component graph as the visual authority. The model may plan within that graph and separately describe or serialize it as JSX, but the preview never executes the generated JSX.

## Intent first becomes a governed plan

[`plannerPrompt.js`](https://github.com/honey610/ai-orchestration/blob/e74ec7f81ca488cee9cf394856bab8ca2c802490/backend/agent/prompts/plannerPrompt.js) requires an existing plan and a new user instruction to resolve into a JSON graph using only eight component types. [`planValidator.js`](https://github.com/honey610/ai-orchestration/blob/e74ec7f81ca488cee9cf394856bab8ca2c802490/backend/validations/planValidator.js) enforces the component whitelist and unique identifiers before any downstream use. This makes the intermediate plan a real governance boundary rather than prompt decoration.

## Preview and generated code have different authority

[`generate.route.js`](https://github.com/honey610/ai-orchestration/blob/e74ec7f81ca488cee9cf394856bab8ca2c802490/backend/routes/generate.route.js) runs planner, JSX generator and explainer as distinct model calls and saves their combined result as a version. [`DynamicRenderer.jsx`](https://github.com/honey610/ai-orchestration/blob/e74ec7f81ca488cee9cf394856bab8ca2c802490/frontend/src/renderer/DynamicRenderer.jsx) maps the validated plan directly to prebuilt React components; the separately generated JSX is display-only. The in-memory [`sessionStore.js`](https://github.com/honey610/ai-orchestration/blob/e74ec7f81ca488cee9cf394856bab8ca2c802490/backend/history/sessionStore.js) supports browsing and rollback but disappears with the server process, so this is version replay without durable persistence.

## Evidence

- [Canonical repository](https://github.com/honey610/ai-orchestration)
- [Inspected tree](https://github.com/honey610/ai-orchestration/tree/e74ec7f81ca488cee9cf394856bab8ca2c802490)
- Commit: `e74ec7f81ca488cee9cf394856bab8ca2c802490`
