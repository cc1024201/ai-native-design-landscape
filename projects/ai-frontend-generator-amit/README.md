# AI Frontend Generator by Amit Sharma

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

This local Flask application couples an on-device CodeGen model with a split-source editor, combined preview, and filesystem handoff.

## Local inference creates the first artifact

[`app.py`](https://github.com/amit-3245/ai-frontend-generator/blob/1da0ec651865c004d3ea57942262339869ffc457/app.py) loads `Salesforce/codegen-350M-mono`, wraps the brief in a frontend format contract, and returns decoded HTML/CSS/JavaScript output.

## Users can correct all three parts

[`script.js`](https://github.com/amit-3245/ai-frontend-generator/blob/1da0ec651865c004d3ea57942262339869ffc457/static/js/script.js) parses the response into editable panes and writes their current values into the preview document. Its download action sends those current values back to Flask, which materializes `index.html`, `style.css`, and `script.js` under `generated/`.

## Maturity boundary

The parser relies on textual delimiters and the “download” is a server-side directory write rather than a browser archive. There is no version or project database, but the ordinary-user generation, correction, preview, and materialization loop is real.

## Pinned evidence

- [Repository](https://github.com/amit-3245/ai-frontend-generator)
- [Inspected tree](https://github.com/amit-3245/ai-frontend-generator/tree/1da0ec651865c004d3ea57942262339869ffc457)
- Commit: `1da0ec651865c004d3ea57942262339869ffc457`
