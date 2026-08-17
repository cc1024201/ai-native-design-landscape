# Hangover

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

Hangover turns electronic-component datasheets and design requests into an editable circuit canvas. Its architecture is valuable because probabilistic reasoning does not directly become the stored engineering artifact: generated nodes and edges pass through deterministic pin and schema repair before joining the project graph.

## Three authorities divide the work

- Cognee holds ingested datasheet knowledge and retrieval context.
- OpenAI-compatible reasoning proposes circuit changes from the request and retrieved evidence.
- MongoDB's project document stores the canvas nodes, edges, viewport and chat-visible project state.

[`AIController.ts`](https://github.com/Halleys123/Hangover-Combined/blob/6d24c5bf9a5de3f1bbc591a612b51a6e40c45de2/server/src/controllers/AIController.ts) orchestrates the request rather than making model text the source of truth. [`Project.ts`](https://github.com/Halleys123/Hangover-Combined/blob/6d24c5bf9a5de3f1bbc591a612b51a6e40c45de2/server/src/models/Project.ts) defines the persisted canvas authority.

## Model output is normalized into graph operations

The service layer asks for structured nodes and edges, then [`derivePins.ts`](https://github.com/Halleys123/Hangover-Combined/blob/6d24c5bf9a5de3f1bbc591a612b51a6e40c45de2/server/src/utils/derivePins.ts) reconstructs predictable pin handles from component metadata. This healing step protects the XYFlow canvas from malformed or incomplete model responses and makes connectivity inspectable in ordinary graph terms.

The user can subsequently move and edit the returned graph directly. [`CanvasInner.svelte`](https://github.com/Halleys123/Hangover-Combined/blob/6d24c5bf9a5de3f1bbc591a612b51a6e40c45de2/client/src/lib/components/CanvasInner.svelte) renders that graph; autosave writes changes back instead of leaving direct edits in transient UI state.

## Evidence and engineering limits

The chat panel exposes a visible request-and-response loop and the source contains real Cognee and OpenAI integration rather than a keyword simulation. It remains a hackathon-stage engineering workspace: the repository demonstrates structured generation, repair, direct editing and persistence but does not establish full electrical-rule correctness, manufacturing readiness or a branchable version history. Those claims are deliberately outside this record.

## Evidence

- [Pinned repository](https://github.com/Halleys123/Hangover-Combined/tree/6d24c5bf9a5de3f1bbc591a612b51a6e40c45de2)
- [Cognee integration](https://github.com/Halleys123/Hangover-Combined/blob/6d24c5bf9a5de3f1bbc591a612b51a6e40c45de2/server/src/services/cognee.ts)
- [Autosave path](https://github.com/Halleys123/Hangover-Combined/blob/6d24c5bf9a5de3f1bbc591a612b51a6e40c45de2/client/src/lib/composables/useAutoSave.svelte.ts)
