# MermaidGenie

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

MermaidGenie is a full-stack Mermaid workspace: prompts become editable source, chart revisions are persisted, and diagrams can be shared rather than disappearing with a chat session.

## Current code matters more than provider copy

The inspected generation route uses Google's Gemini integration even though some descriptive material still mentions OpenAI. This dossier follows executable source at the pinned revision. The model returns Mermaid, which the editor renders and exposes for manual correction.

## Versions are server-side product objects

Accounts, charts, and historical versions are stored through an Express/MongoDB backend. That moves recovery beyond browser-local undo: a user can return to saved chart state and share a managed diagram. Mermaid source remains the cross-tool authority within each version.

## Collaboration has a clear limit

Persistence and sharing prove a multi-session product, not Figma-style operation-level multiplayer. The inspected source does not establish CRDT merging or atomic conflict resolution for simultaneous source writes. A valid render also says nothing about diagram semantics.

## Pinned evidence

- Repository: [hoangsonww/MermaidGenie-UML-Diagram-App](https://github.com/hoangsonww/MermaidGenie-UML-Diagram-App)
- Inspected full-stack tree: [`13970ee3e665b6f27745ab0a80dfce2f76ec4088`](https://github.com/hoangsonww/MermaidGenie-UML-Diagram-App/tree/13970ee3e665b6f27745ab0a80dfce2f76ec4088)
- Immutable revision: [commit `13970ee`](https://github.com/hoangsonww/MermaidGenie-UML-Diagram-App/commit/13970ee3e665b6f27745ab0a80dfce2f76ec4088)
