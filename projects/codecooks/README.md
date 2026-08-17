# CodeCooks

> Research status: **Source-level** · Lifecycle: **historical** · Last reviewed: **2026-08-12**

CodeCooks contains two site-authoring ideas under one product: an AI prompt-to-HTML stream and a conventional drag-and-drop designer. The source does not show a reliable handoff between them, which is the key limitation of its architecture.

## The AI path streams a whole document

[`server.js`](https://github.com/ayushmaninbox/codecooks/blob/1ab5c2693c7695eb789680e470257c505280c368/ai-builder/server/server.js) asks Gemini for a complete inline HTML document and streams model chunks over an event response. [`script.js`](https://github.com/ayushmaninbox/codecooks/blob/1ab5c2693c7695eb789680e470257c505280c368/ai-builder/script.js) accumulates that source, displays it as code and sanitizes it into iframe `srcdoc` as it arrives.

## The manual designer owns a different graph

[`designer.js`](https://github.com/ayushmaninbox/codecooks/blob/1ab5c2693c7695eb789680e470257c505280c368/designer-cum-builder/designer.js) manages pages and DOM elements with add, move, resize, edit and undo records. No source path connects the AI-generated HTML into this graph, so the dossier does not claim convergent manual and AI correction. They are two adjacent product surfaces.

## Historical cutoff

The public implementation history ends in 2024 and no maintained live service was established. The independent product and working model projection justify a historical record without implying current availability.

## Pinned evidence

- [Canonical repository](https://github.com/ayushmaninbox/codecooks)
- [Inspected tree](https://github.com/ayushmaninbox/codecooks/tree/1ab5c2693c7695eb789680e470257c505280c368)
- Commit: `1ab5c2693c7695eb789680e470257c505280c368`
