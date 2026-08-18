# Diagram X

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

Diagram X is a managed node-based workspace supporting several domain graphs—database, data-flow, sequence, UML, ER, state, mind-map, and activity diagrams—with AI generation feeding the same editor.

## Diagram types have typed objects

Database nodes carry fields and keys; sequence diagrams carry participants and messages; state and activity diagrams use their own node roles. React Flow supplies interaction, but domain-specific records give the graph more meaning than freely labeled boxes.

## AI materializes into a workspace

A natural-language request creates nodes and edges that remain draggable, connectable, and editable. Debounced auto-save persists the workspace behind Google or email authentication, while dashboard search and deletion manage diagram identities. A public chatbot answers product questions and should not be confused with the graph-mutating generation route.

## Persistence is the recovery boundary

The saved workspace is the authority; a canvas rendering is its current projection. Source demonstrates ordinary project persistence and generation, but not real-time multi-user merge control or semantic correctness for each supported notation.

## Pinned evidence

- Repository: [NarihitoM/Diagram-X](https://github.com/NarihitoM/Diagram-X)
- Inspected application source: [`2f00df56673de998c2668be839e17ad8e0ea734e`](https://github.com/NarihitoM/Diagram-X/tree/2f00df56673de998c2668be839e17ad8e0ea734e)
- Immutable revision: [commit `2f00df5`](https://github.com/NarihitoM/Diagram-X/commit/2f00df56673de998c2668be839e17ad8e0ea734e)
