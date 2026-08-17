# LLM Website Generator by Yuzai Akira

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-13**

This is a client-side, single-document generator. It lets a user choose Google Gemini or OpenRouter, generate complete HTML, edit the result and immediately inspect it without introducing a server-side project model.

## The artifact never leaves the tab by default

Pinned revision: `e356a1a786dd504cdeb4ffbce317cfd6ce0ad14b`.

The agent returns one HTML string. The app hands that string to a text editor and an iframe; edits mutate the same in-memory value. Copy is the implemented escape hatch. There is no virtual filesystem, component graph, deployment object or multi-page authority.

## Persistence stops at configuration

Theme, provider choice and API settings use browser storage, but the generated document does not. Reloading therefore preserves how to call the model while discarding what the model and user made. That distinction rules out treating settings persistence as project persistence.

## Provider abstraction is product-visible

Google and OpenRouter adapters normalize different streaming and response shapes into the same HTML handoff. Provider selection changes generation plumbing, not artifact semantics: both paths still terminate in one editable document.

## Pinned evidence

- [Repository](https://github.com/yuzaiakira/LLM-Website-Generator)
- [Generation agent](https://github.com/yuzaiakira/LLM-Website-Generator/blob/e356a1a786dd504cdeb4ffbce317cfd6ce0ad14b/assets/js/agent.js)
- [Application state and handoff](https://github.com/yuzaiakira/LLM-Website-Generator/blob/e356a1a786dd504cdeb4ffbce317cfd6ce0ad14b/assets/js/app.js)
- [Editor and preview authority](https://github.com/yuzaiakira/LLM-Website-Generator/blob/e356a1a786dd504cdeb4ffbce317cfd6ce0ad14b/assets/js/editor.js)
- [Persisted settings boundary](https://github.com/yuzaiakira/LLM-Website-Generator/blob/e356a1a786dd504cdeb4ffbce317cfd6ce0ad14b/assets/js/settings.js)
