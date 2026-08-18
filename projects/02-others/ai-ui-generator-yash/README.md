# AI UI Generator by yashsaini0759

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

This generator uses a small in-memory backend session as the boundary between Gemini's agent roles and the browser editor. A session contains current source and its rollback sequence but has no durable database identity.

## Schema first then source

[api.js](https://github.com/yashsaini0759/Ai-Ui-generator./blob/4d513172e02b8daa03865a87bc21b220df1b6a37/backend/routes/api.js) runs planner, generator and explainer work and places accepted results into the session. [schema.js](https://github.com/yashsaini0759/Ai-Ui-generator./blob/4d513172e02b8daa03865a87bc21b220df1b6a37/backend/components/schema.js) defines the component constraints used to keep generated React within the previewable surface.

## Rollback is process-scoped

The API appends complete code states to each session and changes the current pointer during rollback. Restarting the server loses that graph; it should not be interpreted as account-level version history.

## The browser edits the selected authority

[CodeEditor.jsx](https://github.com/yashsaini0759/Ai-Ui-generator./blob/4d513172e02b8daa03865a87bc21b220df1b6a37/frontend/src/components/layout/CodeEditor.jsx) changes current source and [LivePreview.jsx](https://github.com/yashsaini0759/Ai-Ui-generator./blob/4d513172e02b8daa03865a87bc21b220df1b6a37/frontend/src/components/layout/LivePreview.jsx) projects it. The UI therefore exposes a complete creation-correction-selection loop despite its ephemeral storage.

## Evidence

- [Canonical repository](https://github.com/yashsaini0759/Ai-Ui-generator.)
- [Inspected tree](https://github.com/yashsaini0759/Ai-Ui-generator./tree/4d513172e02b8daa03865a87bc21b220df1b6a37)
- Commit: 4d513172e02b8daa03865a87bc21b220df1b6a37
