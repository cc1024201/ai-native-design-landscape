# AI UI Generator by Mohannad Abdelrazek

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

This is a deliberately small browser-only product. Its distinct technical definition is that the user's browser owns the provider credential, current generated source, executable preview and short local archive; there is no server artifact authority.

## One browser crosses the entire trust boundary

[app.js](https://github.com/Mondo302/AI-UI-Generator/blob/e4bbce6ce04145f0a1c2688925176f52b1350b70/app.js) asks for an OpenAI key and sends the selected framework and style prompt directly to the chat-completions API. Returned source becomes editable application state. This is real model participation but also means the page and OpenAI are the complete credential boundary.

## HTML and React take different projection paths

The same source file writes complete HTML through srcdoc while React-like output is stripped of imports and transpiled with Babel inside a sandboxed iframe. [index.html](https://github.com/Mondo302/AI-UI-Generator/blob/e4bbce6ce04145f0a1c2688925176f52b1350b70/index.html) exposes framework and style controls plus editable code and device-sized preview.

## History is bounded local evidence

Each successful generation is added to localStorage and capped at ten entries. Loading history replaces the current editor and preview; copy and download materialize the same current source. There is no account project graph or server-side recovery.

## Evidence

- [Canonical repository](https://github.com/Mondo302/AI-UI-Generator)
- [Inspected tree](https://github.com/Mondo302/AI-UI-Generator/tree/e4bbce6ce04145f0a1c2688925176f52b1350b70)
- Commit: e4bbce6ce04145f0a1c2688925176f52b1350b70
