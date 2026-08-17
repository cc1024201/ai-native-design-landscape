# ZeroNode

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

ZeroNode is an infinite-canvas knowledge workspace where AI expands a concept graph but the user retains direct authority over nodes, links, layout, and recovery.

## Generation and similarity have different jobs

Groq generates or expands concepts and answers graph-grounded chat questions. Gemini embeddings calculate semantic proximity and can introduce links when similarity crosses a configured threshold. Separating those roles makes an edge traceable either to explicit structure or a similarity rule rather than one opaque model step.

## The canvas remains editable after inference

React Flow holds the visible knowledge graph. Users can add, move, connect, delete, and revise material after AI expansion, then undo or redo changes. The model supplies candidate structure; it does not lock the graph into a generated image.

## State travels through browser-sized mechanisms

Local storage restores work on the same browser. A Base64-encoded URL shares graph state and PNG export produces a visual snapshot. These are practical personal-workspace mechanisms, not evidence of access-controlled collaboration or scalable server persistence; large graphs may also outgrow URL sharing.

## Pinned evidence

- Repository: [StreetCoder02/ZeroNode](https://github.com/StreetCoder02/ZeroNode)
- Inspected application source: [`47a55dcaf57fd7d2e7aefc573cb90a15193f5401`](https://github.com/StreetCoder02/ZeroNode/tree/47a55dcaf57fd7d2e7aefc573cb90a15193f5401)
- Immutable revision: [commit `47a55dc`](https://github.com/StreetCoder02/ZeroNode/commit/47a55dcaf57fd7d2e7aefc573cb90a15193f5401)
