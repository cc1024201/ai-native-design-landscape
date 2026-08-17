# Artifex UI Generator

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

Artifex is a browser-centered component workshop with four Gemini roles and an explicit mock mode. Its useful distinction is not the number of agents but that validation and fallback provenance remain visible before code enters history.

## Generation retains its provenance

[geminiAgent.js](https://github.com/aadithyaa9/AI-UI-Generator/blob/f3335b48f3d5ca2d186b0fd55742316083fbfa48/src/lib/geminiAgent.js) plans, generates, validates and explains the component. When Gemini is unavailable it emits a declared mock artifact rather than presenting fixed code as a model result. [generate.js](https://github.com/aadithyaa9/AI-UI-Generator/blob/f3335b48f3d5ca2d186b0fd55742316083fbfa48/src/pages/api/generate.js) exposes that distinction to the client.

## Browser history is the recovery surface

The application keeps complete generated code states in browser memory and lets the user load them back into the editor. Manual changes affect current source but there is no account-backed project or server version archive.

## Babel supplies executable evidence

[preview.jsx](https://github.com/aadithyaa9/AI-UI-Generator/blob/f3335b48f3d5ca2d186b0fd55742316083fbfa48/src/pages/preview.jsx) compiles the current component for live display. Copy and download operate on the same source shown in the editor rather than a separate generated package.

## Evidence

- [Canonical repository](https://github.com/aadithyaa9/AI-UI-Generator)
- [Inspected tree](https://github.com/aadithyaa9/AI-UI-Generator/tree/f3335b48f3d5ca2d186b0fd55742316083fbfa48)
- Commit: f3335b48f3d5ca2d186b0fd55742316083fbfa48
