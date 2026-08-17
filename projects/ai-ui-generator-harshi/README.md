# AI UI Generator by Harshi

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

This small generator has one unusually clear authority: a complete HTML document held in the browser. Prompting and sketch upload can replace it; a textarea can correct it; iframe projection and download both consume it.

## Generation terminates at HTML

[`backend/index.js`](https://github.com/Harshi0505/ai-ui-generator/blob/3c86e500b04e3106a448a595065bbdba1084ff7d/backend/index.js) sends the text prompt plus optional sketch data to OpenAI's Responses API and asks for a self-contained page. There is no agent filesystem or hidden project graph. The returned HTML becomes `generatedCode` in the React client.

## Correction is a deliberate copy-back step

[`UIDesignGenerator.jsx`](https://github.com/Harshi0505/ai-ui-generator/blob/3c86e500b04e3106a448a595065bbdba1084ff7d/frontend/src/UIDesignGenerator.jsx) separates `editorCode` from the currently adopted `generatedCode`. Opening the editor creates a working copy; Apply replaces the adopted document; Revert discards the working copy. The iframe uses `srcDoc={generatedCode}` and the download button writes exactly that string to `generated-ui.html`.

This makes the product simpler than a versioned builder but still complete: intent or sketch → model HTML → visual judgment → manual code correction → adopted preview → file delivery.

## Persistence boundary

The inspected source has no project database or saved version history. Refreshing the application can lose the current artifact. “Revert” is an in-session editor affordance rather than durable version recovery.

## Evidence

- [Canonical repository](https://github.com/Harshi0505/ai-ui-generator)
- [Inspected tree](https://github.com/Harshi0505/ai-ui-generator/tree/3c86e500b04e3106a448a595065bbdba1084ff7d)
- [Generation server](https://github.com/Harshi0505/ai-ui-generator/blob/3c86e500b04e3106a448a595065bbdba1084ff7d/backend/index.js)
- [Editor and preview](https://github.com/Harshi0505/ai-ui-generator/blob/3c86e500b04e3106a448a595065bbdba1084ff7d/frontend/src/UIDesignGenerator.jsx)
- Commit: `3c86e500b04e3106a448a595065bbdba1084ff7d`

The maintainer profile publishes no usable geographic location; team region remains `unknown`.
