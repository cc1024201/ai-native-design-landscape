# AI Website Builder by Vaibhav Hajare

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

This browser workspace makes a separated virtual file set the current artifact. Google GenAI streams generation and follow-up changes while users can also import or directly rewrite those files.

## Streaming output is normalized into files

[geminiService.ts](https://github.com/lab1207/AI-Website-Builder/blob/d6ceb9bc66f3e6e8ace2aac3817c1b71073db05d/services/geminiService.ts) supplies conversation context and asks Google GenAI for the project's structured file content. The service does not claim a backend persistence layer.

## The workspace owns correction and import

[App.tsx](https://github.com/lab1207/AI-Website-Builder/blob/d6ceb9bc66f3e6e8ace2aac3817c1b71073db05d/App.tsx) holds current files, chat context and direct changes in browser state. Imported files enter the same graph as generated ones; there is no automatic distinction after acceptance.

## Preview and export are projections of current files

[PreviewPane.tsx](https://github.com/lab1207/AI-Website-Builder/blob/d6ceb9bc66f3e6e8ace2aac3817c1b71073db05d/components/PreviewPane.tsx) assembles the current files into an iframe. Copy and export act on that graph while durable versions and hosted deployment remain absent.

## Evidence

- [Canonical repository](https://github.com/lab1207/AI-Website-Builder)
- [Inspected tree](https://github.com/lab1207/AI-Website-Builder/tree/d6ceb9bc66f3e6e8ace2aac3817c1b71073db05d)
- Commit: d6ceb9bc66f3e6e8ace2aac3817c1b71073db05d
