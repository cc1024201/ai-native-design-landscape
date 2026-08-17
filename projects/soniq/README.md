# Soniq

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

Soniq treats a voice agent as versioned software: the visual conversation graph is drafted, validated, published, exercised through a live call and observed through node and transcript events. Its strongest contribution is the continuity between design-time versions and the exact runtime selected for a call.

## Draft state is server-backed

The React Flow editor distinguishes greetings, collection, slot filling, tools, API calls, conditions, transfers, voicemail, knowledge lookup and termination. [useAutosave.ts](https://github.com/rachitt/voice-ai-agent/blob/95f35112628286dab2b84c12acee06ccc7e7e9ba/apps/web/src/pages/builder/useAutosave.ts) debounces the current nodes, edges and model/voice settings into a mutable draft `AgentVersion` rather than leaving the graph in browser memory.

## Publishing freezes call semantics

[agents.py](https://github.com/rachitt/voice-ai-agent/blob/95f35112628286dab2b84c12acee06ccc7e7e9ba/apps/api/app/routers/agents.py) validates the selected graph, marks its version as published and immediately clones a new draft for later edits. Calls retain the published version ID, so an in-progress or historical conversation is not silently reinterpreted when the builder changes.

## The graph participates in the realtime voice loop

[flow_executor.py](https://github.com/rachitt/voice-ai-agent/blob/95f35112628286dab2b84c12acee06ccc7e7e9ba/apps/api/app/pipeline/flow_executor.py) resolves the current node, condition branches, slot progress and terminal behavior. Browser and Telnyx websocket routes instantiate that executor beside the STT → LLM → TTS orchestrator, while `flow_node` events project active execution back onto the canvas during test calls.

## Operation continues after delivery

The same backend persists calls, transcripts and events and supports tool dispatch, knowledge retrieval, barge-in and post-call analysis plans. Soniq is therefore not counted merely as a voice pipeline: it defines a design, release, test and observation loop around the visual artifact.

## Pinned evidence

- [Repository](https://github.com/rachitt/voice-ai-agent)
- [Inspected tree](https://github.com/rachitt/voice-ai-agent/tree/95f35112628286dab2b84c12acee06ccc7e7e9ba)
- [Web-call runtime](https://github.com/rachitt/voice-ai-agent/blob/95f35112628286dab2b84c12acee06ccc7e7e9ba/apps/api/app/routers/web_call_ws.py)
- [Graph validation contract](https://github.com/rachitt/voice-ai-agent/blob/95f35112628286dab2b84c12acee06ccc7e7e9ba/apps/api/app/schemas/flow_graph_validators.py)
