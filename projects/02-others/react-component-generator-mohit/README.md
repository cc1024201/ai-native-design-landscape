# React Component Generator by Mohit Kumar

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

Mohit's workspace couples Gemini generation to authenticated Mongo sessions. Its history screen is grounded in saved component records; the evidence does not establish a branchable version chain inside a single component.

## Gemini is the authoring path

[aiService.js](https://github.com/Mohit-kumar123/REACT_COMPONENT_GENERATOR/blob/c71d986fa06d7a6f614d9587ecde619b52fd00ce/backend/src/services/aiService.js) sends the prompt to Gemini and parses the returned component payload. Generation errors remain errors or explicit service fallbacks instead of being evidence of a second agent architecture.

## Persistence separates conversations from saved components

[Session.js](https://github.com/Mohit-kumar123/REACT_COMPONENT_GENERATOR/blob/c71d986fa06d7a6f614d9587ecde619b52fd00ce/backend/src/models/Session.js) retains session messages and generated state. [components.js](https://github.com/Mohit-kumar123/REACT_COMPONENT_GENERATOR/blob/c71d986fa06d7a6f614d9587ecde619b52fd00ce/backend/src/routes/components.js) exposes durable component records used by the history and download surfaces. The repository shows saved artifacts rather than complete per-edit snapshots.

## Preview executes current code

[ComponentViewer.tsx](https://github.com/Mohit-kumar123/REACT_COMPONENT_GENERATOR/blob/c71d986fa06d7a6f614d9587ecde619b52fd00ce/frontend/src/components/preview/ComponentViewer.tsx) renders the current component for visual inspection. The dashboard can revisit saved records and deliver their source; direct runtime proof is therefore attached to the stored component rather than a screenshot-only claim.

## Evidence

- [Canonical repository](https://github.com/Mohit-kumar123/REACT_COMPONENT_GENERATOR)
- [Inspected tree](https://github.com/Mohit-kumar123/REACT_COMPONENT_GENERATOR/tree/c71d986fa06d7a6f614d9587ecde619b52fd00ce)
- Commit: c71d986fa06d7a6f614d9587ecde619b52fd00ce
