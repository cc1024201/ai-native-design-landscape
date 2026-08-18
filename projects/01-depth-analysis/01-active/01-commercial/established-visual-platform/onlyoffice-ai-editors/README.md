# ONLYOFFICE AI Editors

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

ONLYOFFICE AI Editors denotes one product lineage across DocumentServer, DesktopEditors and the first-party AI plugin. The repositories are not counted as separate products because they share editor components, native office-document authority and the same embedded AI control layer.

## AI calls native editor operations

At plugin commit `4dfd1ab0c7c7c623a77b92917fb4ac4a36f98bb1`, [`generate-presentation-with-theme.js`](https://github.com/ONLYOFFICE/onlyoffice.github.io/blob/4dfd1ab0c7c7c623a77b92917fb4ac4a36f98bb1/sdkjs-plugins/content/ai/.dev/helpers/slide/generate-presentation-with-theme.js) registers a presentation-generation function. It streams structured commands, validates layouts and placeholders, creates a theme and slides, and uses `Asc.Editor.callCommand` to mutate the live native presentation. Companion helpers add charts, images and placeholder text through the same editor API.

```text
AI model configuration + user request -> streamed structured slide commands
-> ONLYOFFICE native theme / slide / drawing objects
-> ordinary editor correction -> native office save and export
```

The durable artifact remains the office document handled by the mature editor; the plugin is a control surface, not a parallel deck schema. The pinned DocumentServer revision is `f580eb58439432310943ece02c9730c6a21365e7`; DesktopEditors revision `6a0bea2d0d127c658f57c41c1de4a5ce49e84fb0` is evidence of another distribution of the same lineage. ONLYOFFICE reports Latvia.

## Evidence

- [Pinned DocumentServer](https://github.com/ONLYOFFICE/DocumentServer/tree/f580eb58439432310943ece02c9730c6a21365e7)
- [Pinned AI plugin](https://github.com/ONLYOFFICE/onlyoffice.github.io/tree/4dfd1ab0c7c7c623a77b92917fb4ac4a36f98bb1/sdkjs-plugins/content/ai)
- [Themed presentation mutation](https://github.com/ONLYOFFICE/onlyoffice.github.io/blob/4dfd1ab0c7c7c623a77b92917fb4ac4a36f98bb1/sdkjs-plugins/content/ai/.dev/helpers/slide/generate-presentation-with-theme.js)
- [Maintainer location evidence](https://github.com/ONLYOFFICE)
