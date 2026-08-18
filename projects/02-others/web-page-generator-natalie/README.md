# Web Page Generator by Natalie Basille

> Research status: **Source-level** · Lifecycle: **historical** · Last reviewed: **2026-08-12**

This small 2024 project qualifies on a narrow loop: a user enters a brief and receives an actual rendered web page. It does not qualify as a full site workspace.

## Streaming pieces become a visual document

[`llm.ts`](https://github.com/nataliebasille/ai-webpage-generator/blob/33588bd5705ebb1729b88f30c56dbfe2cdbd5e25/src/server/llm.ts) constrains the model to generate safe Tailwind-styled HTML. The dynamic [`generate/[prompt]/page.tsx`](https://github.com/nataliebasille/ai-webpage-generator/blob/33588bd5705ebb1729b88f30c56dbfe2cdbd5e25/src/app/generate/%5Bprompt%5D/page.tsx) streams response pieces into a purpose-built renderer and context so the result becomes the page itself rather than escaped source text.

## Deliberately limited classification

The pinned implementation shows no direct source editor, iterative correction protocol, project persistence or download path. It therefore evidences delegated creation and a transient hosted generated artifact only. The public history has no later maintained product evidence and is recorded as historical.

## Pinned evidence

- [Canonical repository](https://github.com/nataliebasille/ai-webpage-generator)
- [Inspected tree](https://github.com/nataliebasille/ai-webpage-generator/tree/33588bd5705ebb1729b88f30c56dbfe2cdbd5e25)
- [README product claim](https://github.com/nataliebasille/ai-webpage-generator/blob/33588bd5705ebb1729b88f30c56dbfe2cdbd5e25/README.md)
- Commit: `33588bd5705ebb1729b88f30c56dbfe2cdbd5e25`
