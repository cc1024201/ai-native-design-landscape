# Agent Canvas

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

Agent Canvas is a compact FastAPI and Fabric.js experiment in which a model creates a plotted visual and exposes its geometry for direct browser editing.

## The model returns executable drawing code

An OpenAI tool call produces Matplotlib-oriented Python. The server executes that code, captures the image and element geometry, and broadcasts the resulting canvas state over WebSockets. This is direct Python execution, not a demonstrated sandbox boundary.

## Fabric.js is the correction authority

The browser renders the returned elements as editable Fabric.js objects. Human movement and resizing update the same in-process canvas record, so the model draft and direct manipulation meet at object geometry rather than at a flat screenshot.

## Persistence stops with the process

Canvas and chat state live in a Python dictionary. Restarting the server clears both; there is no durable version history or publish layer in the inspected source.

## Pinned evidence

- Repository: [randomvibecoder/agent-canvas](https://github.com/randomvibecoder/agent-canvas)
- Inspected FastAPI application, model tool call, Matplotlib execution, Fabric.js client, and WebSocket synchronization: [`b703360a28efcf113cad063b7116e6b7b3b82d04`](https://github.com/randomvibecoder/agent-canvas/tree/b703360a28efcf113cad063b7116e6b7b3b82d04)
- Immutable revision: [commit `b703360`](https://github.com/randomvibecoder/agent-canvas/commit/b703360a28efcf113cad063b7116e6b7b3b82d04)
