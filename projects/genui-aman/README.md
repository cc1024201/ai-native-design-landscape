# GenUI by Aman

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

This GenUI implementation is a deliberately thin single-document studio. It is independent of Dimple's larger demo-user application even though both use Gemini and Monaco.

## A single state variable is the authority

[`Home.jsx`](https://github.com/roniwalAMAN/Ai-com-gen/blob/8afbf5a58126fc906cf6ebb1ef0b87313294143d/src/pages/Home.jsx) calls `gemini-2.5-flash` with a selected HTML-oriented framework mode. It extracts a fenced response when present and stores the result in `code`. Monaco edits `code`; the preview iframe reads `srcDoc={code}`; copy download and fullscreen also use `code`.

There is no hidden adoption step: every editor keystroke immediately changes what will next be previewed or exported. That makes correction direct but provides no protected last-known-good version.

## Persistence is intentionally narrow

[`App.jsx`](https://github.com/roniwalAMAN/Ai-com-gen/blob/8afbf5a58126fc906cf6ebb1ef0b87313294143d/src/App.jsx) persists only the color theme. Prompt and generated artifact are in memory and disappear on reload. Missing credentials surface an error rather than invoking a fake generator.

## Evidence

- [Canonical repository](https://github.com/roniwalAMAN/Ai-com-gen)
- [Inspected tree](https://github.com/roniwalAMAN/Ai-com-gen/tree/8afbf5a58126fc906cf6ebb1ef0b87313294143d)
- [Single-document loop](https://github.com/roniwalAMAN/Ai-com-gen/blob/8afbf5a58126fc906cf6ebb1ef0b87313294143d/src/pages/Home.jsx)
- Commit: `8afbf5a58126fc906cf6ebb1ef0b87313294143d`

The maintainer profile has no geographic statement; region remains `unknown`.
