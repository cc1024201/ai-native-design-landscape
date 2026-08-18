# AI Website Builder by markec12345678

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

This is a browser-owned complete-HTML workspace. Its compact implementation makes the authority boundary unusually direct: Gemini output enters one string and every editor preview history and download action reads that string.

## Gemini is called from the client

[App.tsx](https://github.com/markec12345678/ai-website-builder/blob/88a0db10419407d7c5ad3906370f0489be6938ee/src/App.tsx) invokes Gemini and streams a complete HTML document. Because credentials and model access live in the browser application the project is BYOK-like rather than a server-managed generation service.

## Ten states provide session undo rather than durable history

The same component retains up to ten generated or edited HTML states in React memory. Selection can return the current editor to an earlier state during that session; no source evidence shows localStorage or database recovery after reload.

## One document drives editing visual proof and export

The code editor changes the HTML string directly and an iframe renders it. Download serializes that same document. This qualifies as a real authoring loop while remaining distinct from multi-file project graphs and native site models.

## Evidence

- [Canonical repository](https://github.com/markec12345678/ai-website-builder)
- [Inspected tree](https://github.com/markec12345678/ai-website-builder/tree/88a0db10419407d7c5ad3906370f0489be6938ee)
- Commit: 88a0db10419407d7c5ad3906370f0489be6938ee
