# Webora

> Research status: **Source-level** · Lifecycle: **active-transition** · Last reviewed: **2026-08-12**

Webora is an HTML-authority AI website builder. OpenRouter creates or revises a complete document; the editor adds history, responsive preview and in-place text changes around that source rather than converting it into a separate block schema.

## Existing HTML returns to the model on revision

[`generateController.js`](https://github.com/keenoy009/Webora/blob/d968c67b75bb97b4d582cb0db4fbdf166e82f46e/server/controllers/generateController.js) supplies the current document alongside a new instruction, so follow-ups are transformations rather than blind restarts. [`EditorPage.jsx`](https://github.com/keenoy009/Webora/blob/d968c67b75bb97b4d582cb0db4fbdf166e82f46e/client/src/pages/EditorPage.jsx) pushes each accepted generation into a local undo/redo history and injects editing behavior into the live preview.

```text
brief -> OpenRouter HTML -> sandboxed responsive preview
-> inline text edit or prompt + existing HTML -> new HTML snapshot
-> MongoDB project save -> community publish or HTML download
```

MongoDB stores projects and publish state through [`projectController.js`](https://github.com/keenoy009/Webora/blob/d968c67b75bb97b4d582cb0db4fbdf166e82f46e/server/controllers/projectController.js). History is client-session state, so a reopened project does not gain a full version timeline. Downloaded HTML is both portable source and delivery.

The README calls the repository educational and provides no explicit license. No reliable maintainer-region evidence was found.

## Evidence

- [Pinned repository](https://github.com/keenoy009/Webora/tree/d968c67b75bb97b4d582cb0db4fbdf166e82f46e)
- [Inline editor script](https://github.com/keenoy009/Webora/blob/d968c67b75bb97b4d582cb0db4fbdf166e82f46e/client/src/editorScript.js)
- [Project model](https://github.com/keenoy009/Webora/blob/d968c67b75bb97b4d582cb0db4fbdf166e82f46e/server/models/Project.js)
