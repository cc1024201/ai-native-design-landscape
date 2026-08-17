# VibeUI by Farazkhan542

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

This VibeUI is a component-generation workspace unrelated to the hand-curated resource API previously reviewed under the same name. Here Gemini authors source and an optional Google Stitch step acts as a visual polish branch before a Sandpack runtime.

## Research and generation share one project request

[gemini.py](https://github.com/Farazkhan542/VibeUI/blob/51413020476d121242da51f95ca1eb272df904ab/backend/gemini.py) handles conversational research and component generation. [stitch.py](https://github.com/Farazkhan542/VibeUI/blob/51413020476d121242da51f95ca1eb272df904ab/backend/stitch.py) can send the result through Stitch for refinement but does not replace the underlying multi-file project identity.

## Session storage owns recovery

[store.ts](https://github.com/Farazkhan542/VibeUI/blob/51413020476d121242da51f95ca1eb272df904ab/frontend/lib/store.ts) holds project files, chat and activity state and hydrates it through sessionStorage. This supports reload in the current browser session but not an independent server-side version archive.

## Runtime and delivery consume the same files

[ComponentPreview.tsx](https://github.com/Farazkhan542/VibeUI/blob/51413020476d121242da51f95ca1eb272df904ab/frontend/components/ComponentPreview.tsx) mounts the current file set in Sandpack. [exportProject.ts](https://github.com/Farazkhan542/VibeUI/blob/51413020476d121242da51f95ca1eb272df904ab/frontend/lib/exportProject.ts) packages that graph as a ZIP so visual proof and delivery do not diverge.

## Evidence

- [Canonical repository](https://github.com/Farazkhan542/VibeUI)
- [Inspected tree](https://github.com/Farazkhan542/VibeUI/tree/51413020476d121242da51f95ca1eb272df904ab)
- Commit: 51413020476d121242da51f95ca1eb272df904ab
