# GenOffice

GenOffice treats design as editing a real office document — the presentation app parses, renders, edits and saves genuine `.pptx` files with masters, layouts, charts, ink, crops and animations — and inserts an agent into that same native model rather than wrapping an external tool in chat. Design is whatever an agent or a human does to the shared slide model.

## Agent and human share one native deck

The slide canvas renders the in-house PPTX engine through Konva, and [`slides-skill.ts`](https://github.com/genspark-ai/genoffice/blob/2c1f0e821a7cf46e5d783fe699fae18bf1fc7c65/apps/slides/src/renderer/ai/slides-skill.ts) exposes the same bounded deck operations to the agent loop — human and model touch the identical node graph. Generation takes the distinctive route of producing an intermediate HTML layout for a page, converting it into native slide nodes, and applying the result through ordinary editor state; a follow-up can attach a screenshot of the current slide so the model sees the rendered consequence.

## The audit is the recovery mechanism

[`slide-qc.ts`](https://github.com/genspark-ai/genoffice/blob/2c1f0e821a7cf46e5d783fe699fae18bf1fc7c65/apps/slides/src/renderer/ai/slide-qc.ts) couples a deterministic layout audit with visual review, and a change that makes the audit worse is automatically restored. Each agent run opens a visible history batch and records a restorable snapshot; chat history is bound to the file path for context, but the `.pptx` stays the artifact authority. Save reopens the written file and remaps editor nodes to the new native IDs — proving the package, not an in-memory shadow graph, is the durability boundary. This is the deciding trait: the file format itself, not a parallel projection, owns persistence and is what the agent's design work lands in.
