# CreAI

> Research status: **Source-level** · Lifecycle: **active-transition** · Last reviewed: **2026-08-12**

CreAI does not return an undifferentiated chat answer. Its backend asks Qwen for three coupled views of one proposal: a prose visual description, preview HTML and component source.

## Response shape is the contract

[`service.py`](https://github.com/crisaraoz/creai/blob/db543f674265ecd39cd5d695719162aaeb0c31a1/backend/app/api/chat/service.py) constructs the model exchange and parses the formatted component response. This makes the model output schema—not a design canvas—the handoff between generation and the UI.

## Comparison happens in the result surface

[`result-view.tsx`](https://github.com/crisaraoz/creai/blob/db543f674265ecd39cd5d695719162aaeb0c31a1/src/components/result-view.tsx) exposes description, preview and code as related tabs. [`App.tsx`](https://github.com/crisaraoz/creai/blob/db543f674265ecd39cd5d695719162aaeb0c31a1/src/App.tsx) retains the prompt/result interaction in React state. Users can evaluate source and appearance together but the inspected tree does not establish durable projects or a version-selection graph.

This is therefore source-authority live projection with a structured generation envelope. It is marked active-transition because the public implementation is coherent but its last pinned activity predates the current research cycle.

## Evidence lock

- [Canonical repository](https://github.com/crisaraoz/creai)
- [Inspected tree](https://github.com/crisaraoz/creai/tree/db543f674265ecd39cd5d695719162aaeb0c31a1)
- [Maintainer region evidence](https://github.com/crisaraoz)
- Commit: `db543f674265ecd39cd5d695719162aaeb0c31a1`
