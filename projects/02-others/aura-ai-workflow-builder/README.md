# Aura AI Workflow Builder

> Research status: **Source-level** · Lifecycle: **active-transition** · Last reviewed: **2026-08-12**

Aura is a compact LiteGraph-based AI workflow canvas. The browser serializes the graph, the FastAPI service saves that artifact to JSON and a websocket executor follows its connections while streaming node state back to the same canvas.

## LiteGraph is both editor and wire format

[app.js](https://github.com/surabhi2408/aura-ai-workflow-builder/blob/6dd934f3eb2b25368be72e763eccf26b3ebac771/frontend/app.js) defines trigger, document, LLM, agent, API and output nodes. Run sends `graph.serialize()` over the websocket; save sends the same representation to the storage route and load restores it with `graph.configure()`.

## The backend executes the drawn dependencies

[engine.py](https://github.com/surabhi2408/aura-ai-workflow-builder/blob/6dd934f3eb2b25368be72e763eccf26b3ebac771/backend/engine.py) reconstructs incoming degree and link-slot inputs, rejects cycles and streams nodes in topological order. LLM and agent nodes call [llm_provider.py](https://github.com/surabhi2408/aura-ai-workflow-builder/blob/6dd934f3eb2b25368be72e763eccf26b3ebac771/backend/llm_provider.py), which uses Gemini when configured and discloses a mock fallback otherwise.

## Transitional boundaries

The API connector is explicitly a timed mock and document content is embedded node text. JSON files provide named persistence but no users, versions or run ledger. A missing model key silently changes execution from Gemini to simulated output, so observed success alone cannot prove a real provider path without checking configuration.

## Pinned evidence

- [Repository](https://github.com/surabhi2408/aura-ai-workflow-builder)
- [Inspected tree](https://github.com/surabhi2408/aura-ai-workflow-builder/tree/6dd934f3eb2b25368be72e763eccf26b3ebac771)
- [Save and websocket routes](https://github.com/surabhi2408/aura-ai-workflow-builder/blob/6dd934f3eb2b25368be72e763eccf26b3ebac771/backend/main.py)
