# Micracode

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

Micracode's durable artifact is an ordinary directory on disk. Chat, Monaco and preview are views and mutation paths over that directory; they are not a hidden hosted design graph.

## Generation is a typed file-mutation stream

[`orchestrator.py`](https://github.com/Jamessdevops/micracode/blob/d0a289321e738914f29336c2f98781fec30569c8/packages/core/src/micracode_core/orchestrator.py) coordinates model calls and code-generation events. [`storage.py`](https://github.com/Jamessdevops/micracode/blob/d0a289321e738914f29336c2f98781fec30569c8/packages/core/src/micracode_core/storage.py) constrains project reads and writes to the configured project root.

## The workspace closes the loop

[`ChatPanel.tsx`](https://github.com/Jamessdevops/micracode/blob/d0a289321e738914f29336c2f98781fec30569c8/apps/web/src/components/chat/ChatPanel.tsx) applies streamed changes to the file and runtime stores and exposes per-turn restore. [`webContainerStore.ts`](https://github.com/Jamessdevops/micracode/blob/d0a289321e738914f29336c2f98781fec30569c8/apps/web/src/store/webContainerStore.ts) manages the browser runtime used for the running projection.

## Persistence is inspectable outside the product

[`projects.py`](https://github.com/Jamessdevops/micracode/blob/d0a289321e738914f29336c2f98781fec30569c8/micracode/src/micracode/routers/projects.py) exposes project files, prompt history, snapshots and archive delivery. Because the directory remains a normal project, a user can version or run it independently of Micracode.

## Pinned evidence

- [Canonical repository](https://github.com/Jamessdevops/micracode)
- [Inspected tree](https://github.com/Jamessdevops/micracode/tree/d0a289321e738914f29336c2f98781fec30569c8)
- Commit: `d0a289321e738914f29336c2f98781fec30569c8`
