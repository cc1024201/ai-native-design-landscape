# Open Claude

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

Open Claude includes a general assistant, but its qualifying design loop is the first-class Build mode: a prompt produces a map of React source files, the browser adopts that map, and an iframe renders the adopted source. This is a lightweight in-browser project rather than a durable hosted build environment.

## Provider output becomes a file map

[`src/components/BuildMode.jsx`](https://github.com/Damienchakma/Open-claude/blob/c19a42c588b942ed3c403036ee96fbb0cadeaf0a/src/components/BuildMode.jsx) asks the selected provider for JSON whose keys are file paths and whose values are source. It parses the response and merges the returned files into the current project. Later prompts receive the existing file list and can replace or add source.

## Preview is an in-browser compilation shortcut

[`src/utils/preview-generator.js`](https://github.com/Damienchakma/Open-claude/blob/c19a42c588b942ed3c403036ee96fbb0cadeaf0a/src/utils/preview-generator.js) strips imports and exports, concatenates component files, and emits an iframe document that loads React, Babel, and Tailwind. It is not a package-aware sandbox and should not be read as proof that an arbitrary generated repository builds outside this preview convention.

[`src/context/BuildContext.jsx`](https://github.com/Damienchakma/Open-claude/blob/c19a42c588b942ed3c403036ee96fbb0cadeaf0a/src/context/BuildContext.jsx) holds messages and files in React `useState`. Build mode's Monaco view is read-only in this snapshot, so correction happens through another prompt rather than direct source editing there. No durable project or version persistence is present in the inspected loop.

## Evidence and location

- [Canonical repository](https://github.com/Damienchakma/Open-claude)
- [Inspected tree](https://github.com/Damienchakma/Open-claude/tree/c19a42c588b942ed3c403036ee96fbb0cadeaf0a)
- Commit: `c19a42c588b942ed3c403036ee96fbb0cadeaf0a`

No reliable public location was found for the maintainer; team region remains unknown.
