# ChillDeck

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

ChillDeck is a multi-agent presentation application. Planner, research, writing, quality, slide-design and image stages produce structured slides that enter a direct editor and a database-backed project rather than ending as a one-shot render.

## Generated slides enter an ordinary editor store

[`orchestrator.py`](https://github.com/Isha-upadhyay/ChillDeck/blob/63b830c18f1995b229770e43e284c26e693feed7/backend/ai/agents/orchestrator.py) coordinates the generation stages. [`models.py`](https://github.com/Isha-upadhyay/ChillDeck/blob/63b830c18f1995b229770e43e284c26e693feed7/backend/app/db/models.py) persists user, presentation and slide data. On the client, [`editorStore.ts`](https://github.com/Isha-upadhyay/ChillDeck/blob/63b830c18f1995b229770e43e284c26e693feed7/frontend/src/store/editorStore.ts) and `SlideEditor` carry direct changes. The export service produces PPTX, PDF and text-oriented formats.

The repository includes committed example exports, which corroborate the delivery path but are not substitutes for source tracing. The maintainer profile reports Ghaziabad, India.

## Evidence

- [Pinned repository](https://github.com/Isha-upadhyay/ChillDeck/tree/63b830c18f1995b229770e43e284c26e693feed7)
- [Agent orchestrator](https://github.com/Isha-upadhyay/ChillDeck/blob/63b830c18f1995b229770e43e284c26e693feed7/backend/ai/agents/orchestrator.py)
- [Editor store](https://github.com/Isha-upadhyay/ChillDeck/blob/63b830c18f1995b229770e43e284c26e693feed7/frontend/src/store/editorStore.ts)
- [Maintainer location evidence](https://github.com/Isha-upadhyay)
