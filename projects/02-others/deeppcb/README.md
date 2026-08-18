# DeepPCB

> Research status: **Architecture-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

DeepPCB defines AI electronics design as search over manufacturable board revisions, not a single autorouter result. Users import a design from an existing EDA tool, ask the hosted engine to place and route it under board constraints, and retain access to the best solutions while computation continues.

## Optimization produces candidates; the selected revision remains explicit

The [product contract](https://deeppcb.ai/) says generated layouts are DRC-checked and that the browser editor can manually move, delete or protect elements. Its Cooper assistant can flag and fix likely failures, but the user confirms before routing proceeds. The [help center](https://deeppcb.ai/help/) adds the missing lifecycle detail: runs can be stopped and resumed, revisions remain scrollable, and the download action exports the particular revision currently being viewed.

That separation matters. Imported EDA constraints define the problem; hosted placement and routing generate candidate board states; manual protection records intent that later optimization must respect; and the chosen downloaded revision returns to the user's native tool. DeepPCB therefore owns a revisioned engineering decision surface rather than merely exposing a solver endpoint. Public evidence establishes this architecture, but not the internal optimizer or stored graph implementation.

## Evidence

- [DeepPCB product and editor](https://deeppcb.ai/)
- [Revision, run and delivery semantics](https://deeppcb.ai/help/)
- [InstaDeep](https://www.instadeep.com/)
