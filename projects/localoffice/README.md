# LocalOffice

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

LocalOffice is a suite of dependency-free document tools built around one rule: AI may propose content but deterministic code owns calculations validation and rendering. Cards decks documents plans sheets and mind maps share a portable object envelope.

## The suite speaks JSON before pixels

At commit [`1a04396`](https://github.com/zohaibus/localOffice/tree/1a043966925883e4b9f5e4038a556849e593e18f) every editor is a self-contained HTML application. [`src/core.js`](https://github.com/zohaibus/localOffice/blob/1a043966925883e4b9f5e4038a556849e593e18f/src/core.js) defines shared document behavior while [`src/render.js`](https://github.com/zohaibus/localOffice/blob/1a043966925883e4b9f5e4038a556849e593e18f/src/render.js) projects objects into HTML or SVG for embeds and export.

Each tool exposes a copy-ready authoring prompt so any external LLM can return a conforming object. Some tools can call local Ollama directly. The returned object is validated and remains editable; spreadsheet math runs through deterministic engines and embedded objects open in their owning editor.

```text
prompt -> external LLM or Ollama -> JSON envelope -> validator -> editor/render/export
```

This is agent-compatible authoring without a hosted account or hidden document database. The first-party profile lists the San Francisco Bay Area United States.

## Pinned evidence

- [Suite specification](https://github.com/zohaibus/localOffice/blob/1a043966925883e4b9f5e4038a556849e593e18f/SPEC.md)
- [Document validator](https://github.com/zohaibus/localOffice/blob/1a043966925883e4b9f5e4038a556849e593e18f/src/verify.js)
- [Mind-map editor](https://github.com/zohaibus/localOffice/blob/1a043966925883e4b9f5e4038a556849e593e18f/localMindMap/index.html)
