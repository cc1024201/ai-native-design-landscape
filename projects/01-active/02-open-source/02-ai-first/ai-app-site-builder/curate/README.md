# Curate

> Research status: **Source-level** · Lifecycle: **active-transition** · Last reviewed: **2026-08-12**

Curate uses an actual Vite project directory as its working artifact. Model responses are parsed into files, subsequent requests revise that workspace, and history snapshots can be reopened through the builder.

## Build writes a project, not just a response

[`build.controller.js`](https://github.com/ramdhankumar1425/Curate25/blob/faf2e23e0ceadc4769c28e5cd07e43eeb97a3842/server/src/controllers/build.controller.js) connects Anthropic output to project creation utilities. [`createFiles.util.js`](https://github.com/ramdhankumar1425/Curate25/blob/faf2e23e0ceadc4769c28e5cd07e43eeb97a3842/server/src/utils/createFiles.util.js) and the stored project tree make source files authoritative.

## Refinement operates on current files

[`refine.controller.js`](https://github.com/ramdhankumar1425/Curate25/blob/faf2e23e0ceadc4769c28e5cd07e43eeb97a3842/server/src/controllers/refine.controller.js) carries the existing project through the correction path. The builder joins a file explorer, editor, chat, and preview rather than rendering an isolated model answer.

## History is recoverable but local

[`history.controller.js`](https://github.com/ramdhankumar1425/Curate25/blob/faf2e23e0ceadc4769c28e5cd07e43eeb97a3842/server/src/controllers/history.controller.js) exposes saved generations and recovery behavior; [`download.controller.js`](https://github.com/ramdhankumar1425/Curate25/blob/faf2e23e0ceadc4769c28e5cd07e43eeb97a3842/server/src/controllers/download.controller.js) delivers project material. Storage is filesystem-heavy and includes committed example outputs, so the platform remains transitional.

## Pinned evidence

- [Repository](https://github.com/ramdhankumar1425/Curate25)
- [Inspected tree](https://github.com/ramdhankumar1425/Curate25/tree/faf2e23e0ceadc4769c28e5cd07e43eeb97a3842)
- Commit: `faf2e23e0ceadc4769c28e5cd07e43eeb97a3842`
