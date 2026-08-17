# WebApp AI UI Builder

> Research status: **Source-level** · Lifecycle: **active-transition** · Last reviewed: **2026-08-12**

This project does not ask a model to write arbitrary frontend files. It uses AI to reduce an app brief to a small product schema and later to a constrained set of visual tokens.

## The generated artifact is a schema

[`server.js`](https://github.com/K3v123/WebAppAi_uiBuilder/blob/84de9029e9245cf6c7709dcb61004b8f3f9bb48d/backend/server.js) asks Gemini or a local OpenAI-compatible model for `appName`, `entities`, `roles` and `features`. [`App.jsx`](https://github.com/K3v123/WebAppAi_uiBuilder/blob/84de9029e9245cf6c7709dcb61004b8f3f9bb48d/frontend/src/App.jsx) turns those fields into a fixed but data-dependent form mockup. The source code is therefore infrastructure; the saved schema is the user-created app definition.

## Correction is intentionally narrow

A second model call accepts natural-language visual changes but may return only four style keys: background, button color, font size and radius. The server sanitizes everything else. MongoDB retains the product schema, while style overrides remain client session state at the inspected commit. That asymmetry is why this is recorded as a structured mockup builder rather than a general code generator.

## Evidence

- [Canonical repository](https://github.com/K3v123/WebAppAi_uiBuilder)
- [Inspected tree](https://github.com/K3v123/WebAppAi_uiBuilder/tree/84de9029e9245cf6c7709dcb61004b8f3f9bb48d)
- Commit: `84de9029e9245cf6c7709dcb61004b8f3f9bb48d`
