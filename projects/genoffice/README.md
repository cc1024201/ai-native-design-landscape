# GenOffice

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

GenOffice is an open office suite with built-in agents rather than a chat wrapper around external applications. Its presentation application parses, renders, edits and saves real `.pptx` files with masters, layouts, charts, ink, crops, animations and shaped text.

## Agent and human edits share the native deck model

The slide canvas renders the in-house PPTX model through Konva. Direct actions edit shapes, text, charts, tables, images, masters and animations. [`slides-skill.ts`](https://github.com/genspark-ai/genoffice/blob/2c1f0e821a7cf46e5d783fe699fae18bf1fc7c65/apps/slides/src/renderer/ai/slides-skill.ts) exposes bounded deck operations to the shared agent loop.

Generation uses an intermediate HTML layout for a page, converts it into native slide nodes and applies the resulting deck through the same editor state. Follow-up beautification can attach a screenshot of the current slide so the model sees the rendered consequence. [`slide-qc.ts`](https://github.com/genspark-ai/genoffice/blob/2c1f0e821a7cf46e5d783fe699fae18bf1fc7c65/apps/slides/src/renderer/ai/slide-qc.ts) combines visual review with a deterministic layout audit; a change that makes the audit worse is automatically restored.

```text
native PPTX or brief -> parsed deck / style + outline
-> agent native page mutations -> screenshot + layout QC
-> history-batched correction or rollback -> save real PPTX
```

Each agent run opens a visible history batch and records a restorable snapshot. Chat history is bound to the file path so reopening a deck can restore conversation context, but the `.pptx` remains the artifact authority. Save reopens the written file and remaps editor nodes to the new native IDs, proving the package—not an in-memory shadow graph—is the durability boundary.

The core repository is Apache-2.0 licensed. The `ee/` subtree has a separate restricted enterprise license and is not covered by Apache-2.0. No reliable organization-region evidence was found.

## Pinned evidence

- [Repository](https://github.com/genspark-ai/genoffice/tree/2c1f0e821a7cf46e5d783fe699fae18bf1fc7c65)
- [AI panel and rollback batches](https://github.com/genspark-ai/genoffice/blob/2c1f0e821a7cf46e5d783fe699fae18bf1fc7c65/apps/slides/src/renderer/ai/AiPanel.tsx)
- [Native save path](https://github.com/genspark-ai/genoffice/blob/2c1f0e821a7cf46e5d783fe699fae18bf1fc7c65/apps/slides/src/renderer/file-actions.ts)
- [PPTX model and renderer](https://github.com/genspark-ai/genoffice/tree/2c1f0e821a7cf46e5d783fe699fae18bf1fc7c65/packages/pptx-engine)
- [Core Apache-2.0 license](https://github.com/genspark-ai/genoffice/blob/2c1f0e821a7cf46e5d783fe699fae18bf1fc7c65/LICENSE)
- [Enterprise subtree license](https://github.com/genspark-ai/genoffice/blob/2c1f0e821a7cf46e5d783fe699fae18bf1fc7c65/ee/LICENSE)
