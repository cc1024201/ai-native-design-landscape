# TimeCapsule SLM

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

TimeCapsule combines a browser research workspace with an AI creative-coding canvas rather than collapsing both activities into one artifact.

## Research sessions are portable capsules

Topics, research results, research type, depth, and provider can be exported as a `.timecapsule.json` file and restored through `FileReader`. Local storage and a browser vector store support continuing the research session, while Markdown remains a separate delivery format.

## Creative output is editable p5.js source

OpenAI, Ollama, LM Studio, or an in-browser Qwen model can generate p5.js code. Syntax is checked with `new Function`; accepted code is run through `window.runSketch`, and the editor remains available for direct correction and JavaScript download.

## The two authorities are intentionally separate

The research capsule does not version the creative sketch, and the sketch editor does not become the research database. The product is therefore a paired research-to-creative-coding environment rather than one universal document model.

## Pinned evidence

- Repository: [microcandella/TimeCapsule-SLM](https://github.com/microcandella/TimeCapsule-SLM)
- Inspected capsule export/import, local vector store, provider adapters, code validation, editor, and p5.js runtime: [`61144892b8a2b606c345cc93232ffc850f943177`](https://github.com/microcandella/TimeCapsule-SLM/tree/61144892b8a2b606c345cc93232ffc850f943177)
- Immutable revision: [commit `6114489`](https://github.com/microcandella/TimeCapsule-SLM/commit/61144892b8a2b606c345cc93232ffc850f943177)
