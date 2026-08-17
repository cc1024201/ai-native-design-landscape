# Story Blocks

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

Story Blocks is a Django authoring environment where interactive fiction is a graph of scenes, choices, and game state that can be edited, played, and published.

## Story structure is native data

Stories contain nodes and choices rather than a single generated manuscript. Game-state transitions give edges consequences during play. Because the editor and player consume the same model, changing a branch changes the delivered experience directly.

## Groq copilots stay inside author decisions

AI actions enhance tone, suggest choices, or expand a scene. They propose material at bounded points in the story graph instead of replacing the whole project. Authors can accept, revise, reconnect, or discard those suggestions while preserving surrounding state.

## Delivery validates more than prose quality

The playable runtime reveals broken branches and state mistakes that a static preview cannot. Publishing, community sharing, and password controls expose the authored graph to readers. Immediate server updates are demonstrated; that should not be confused with proven multi-user WebSocket co-editing.

## Pinned evidence

- Repository: [Tarvel/Story-Blocks](https://github.com/Tarvel/Story-Blocks)
- Inspected Django source: [`d8733bf66478fe0ad6be136859a40260311576b6`](https://github.com/Tarvel/Story-Blocks/tree/d8733bf66478fe0ad6be136859a40260311576b6)
- Immutable revision: [commit `d8733bf`](https://github.com/Tarvel/Story-Blocks/commit/d8733bf66478fe0ad6be136859a40260311576b6)
