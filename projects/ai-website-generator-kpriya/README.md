# AI Website Generator by Krishna Priya

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

This implementation keeps one complete HTML document as the common currency of generation, direct editing, visual proof, model improvement and delivery. It has no separate page graph or generated-project schema.

## Gemini authors and reauthors the same document

[`server.js`](https://github.com/kpriya213/AI-Website-Generator/blob/3b53122363a79355a1d493cbb2a7549b7af85ad0/server/server.js) asks Gemini to return a single self-contained HTML file. Its improvement route receives the current code and framework and returns a complete replacement, so refinement is whole-document regeneration rather than a patch protocol.

## One client state crosses every surface

[`Home.jsx`](https://github.com/kpriya213/AI-Website-Generator/blob/3b53122363a79355a1d493cbb2a7549b7af85ad0/src/pages/Home.jsx) extracts the response into one `code` state, exposes it in Monaco, renders it directly through iframe `srcDoc`, and sends that same mutable value back for improvement. Copy, new-tab preview and HTML download also consume the current value. There is no database, project reload path or version graph in the inspected source.

## Evidence

- [Canonical repository](https://github.com/kpriya213/AI-Website-Generator)
- [Inspected tree](https://github.com/kpriya213/AI-Website-Generator/tree/3b53122363a79355a1d493cbb2a7549b7af85ad0)
- Commit: `3b53122363a79355a1d493cbb2a7549b7af85ad0`
