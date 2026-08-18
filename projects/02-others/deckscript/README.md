# DeckScript

> Research status: **Architecture-level** · Last reviewed: **2026-08-12**

| Field | Value |
|---|---|
| Team | DeckScript · team region not established |
| Ordinary job | approve narrative and visual rules before composing an editable local-first presentation |
| Authority | on-device deck canvas synchronized to cloud while signed in |
| Delivery | presenter runtime and PDF |
| Lifecycle | active |

## Planning and governance precede slide materialization

DeckScript first proposes an outline that the user can reshape before drawing slides. It next produces a type color and spacing system for approval. Only then does it materialize a 16:9 canvas where elements can be dragged resized aligned and snapped. This makes the design-system decision a first-class project stage rather than a styling afterthought.

The slide graph accepts content blocks with distinct runtimes: executable code Mermaid diagrams ECharts charts KaTeX math Markdown and step lists. What the presenter executes is therefore richer than a collection of static boxes. Speaker notes and presenter mode stay tied to the deck while PDF freezes the visible result.

Persistence is explicitly local-first and offline-capable with cloud sync for signed-in accounts. Public material does not disclose whether the local store uses browser or native files how rich-block source is serialized or whether cloud sync has revision conflict handling.

## Primary evidence

- [DeckScript workflow and local-first contract](https://www.deckscript.com/)
- [DeckScript feature surface](https://www.deckscript.com/#features)
