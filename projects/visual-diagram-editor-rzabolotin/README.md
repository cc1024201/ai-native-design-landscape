# Visual Diagram Editor by Roman Zabolotin

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

This educational full-stack product combines a native diagram database, WebSocket collaboration, and a chat interface whose AI actions mutate graph objects.

## Chat produces ordinary editor operations

Requests such as adding child nodes are converted into node and connection changes, not returned only as prose. The Vue/TypeScript canvas exposes those results for direct correction. FastAPI and persistent storage give diagrams durable identities.

## Realtime synchronization is explicit

Multiple clients connect through WebSockets so canvas changes can propagate during a shared session. This proves a live collaboration path rather than merely a public share link. The educational scope means conflict behavior and scale should still be evaluated before treating it as production infrastructure.

## Inclusion is based on the product loop

The repository is transparent about being a learning project, but it exposes a working deployed editor, AI graph mutation, persistence, and collaboration. Educational provenance does not erase that independent user loop; it only bounds the maturity claim.

## Pinned evidence

- Repository: [rzabolotin/ai-dev-tools-project](https://github.com/rzabolotin/ai-dev-tools-project)
- Inspected full-stack source: [`3f4ae017f34c24a7faf63c731a64f8a84872b875`](https://github.com/rzabolotin/ai-dev-tools-project/tree/3f4ae017f34c24a7faf63c731a64f8a84872b875)
- Immutable revision: [commit `3f4ae01`](https://github.com/rzabolotin/ai-dev-tools-project/commit/3f4ae017f34c24a7faf63c731a64f8a84872b875)
