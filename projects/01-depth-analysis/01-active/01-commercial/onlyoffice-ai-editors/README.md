# ONLYOFFICE AI Editors

ONLYOFFICE AI Editors refuses to say what design is on its own: the design is whatever a person already has open as a native office document. Its answer to the second question is equally decisive — the AI does not create a design; it only makes the mature editor do the work. The plugin states a desired outcome, streams structured slide commands, and hands those to `Asc.Editor.callCommand` so that themes, slides, charts, images and placeholder text become genuine edits to the live presentation, not a parallel deck the user must reconcile later.

That is the axis the whole product turns on. The durable artifact is the office file handled by DocumentServer / DesktopEditors — a schema with its own authority, save path and export pipeline — and the AI plugin is a control surface layered on top of it. [`generate-presentation-with-theme.js`](https://github.com/ONLYOFFICE/onlyoffice.github.io/blob/4dfd1ab0c7c7c623a77b92917fb4ac4a36f98bb1/sdkjs-plugins/content/ai/.dev/helpers/slide/generate-presentation-with-theme.js) validates layouts and placeholders and creates theme objects before mutating nodes, so the model is constrained to speak the editor's vocabulary rather than inventing its own.

```text
AI model config + user request -> streamed structured slide commands
-> ONLYOFFICE native theme / slide / drawing objects
-> ordinary editor correction -> native office save and export
```

The consequence is that "design" here is inseparable from the document medium: what counts as a result is a corrected, then saved, native office file. The AI has no storage and owns nothing; session state is incidental, and the same lineage ships in DocumentServer, DesktopEditors and the plugin without being counted as separate products because the editor components, office-document authority and embedded AI control layer are shared. ONLYOFFICE reports Latvia.

**Evidence:** [Pinned AI plugin](https://github.com/ONLYOFFICE/onlyoffice.github.io/tree/4dfd1ab0c7c7c623a77b92917fb4ac4a36f98bb1/sdkjs-plugins/content/ai) · [Themed presentation mutation](https://github.com/ONLYOFFICE/onlyoffice.github.io/blob/4dfd1ab0c7c7c623a77b92917fb4ac4a36f98bb1/sdkjs-plugins/content/ai/.dev/helpers/slide/generate-presentation-with-theme.js) · [Pinned DocumentServer](https://github.com/ONLYOFFICE/DocumentServer/tree/f580eb58439432310943ece02c9730c6a21365e7)
