# AI Website Generator by Praneet Biswal

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

This small local-first generator keeps HTML, CSS and JavaScript separate after model generation and only assembles them at the preview boundary. Its delivery route preserves those three layers as files rather than exporting an iframe snapshot.

## Local inference produces parseable source layers

[`ollama_engine.py`](https://github.com/Praneetb2929/ai-website-generator/blob/48c3fbf0108f04f97449aacfd0a3db65a48c870f/backend/ollama_engine.py) calls a local Qwen model and requests three fenced code blocks. [`main.py`](https://github.com/Praneetb2929/ai-website-generator/blob/48c3fbf0108f04f97449aacfd0a3db65a48c870f/backend/main.py) parses those blocks and returns the three fields without creating a project graph.

## Preview and ZIP share the same current values

[`page.js`](https://github.com/Praneetb2929/ai-website-generator/blob/48c3fbf0108f04f97449aacfd0a3db65a48c870f/frontend/app/page.js) keeps the three fields in React state and interpolates them into one iframe document. It submits those same values to [`export.py`](https://github.com/Praneetb2929/ai-website-generator/blob/48c3fbf0108f04f97449aacfd0a3db65a48c870f/backend/export.py), which writes `index.html`, `style.css` and `script.js` into a ZIP. No correction loop, saved history or recovery path is present.

## Evidence

- [Canonical repository](https://github.com/Praneetb2929/ai-website-generator)
- [Inspected tree](https://github.com/Praneetb2929/ai-website-generator/tree/48c3fbf0108f04f97449aacfd0a3db65a48c870f)
- Commit: `48c3fbf0108f04f97449aacfd0a3db65a48c870f`
