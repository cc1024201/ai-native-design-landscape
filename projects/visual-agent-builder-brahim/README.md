# Visual Agent Builder by Brahim Abdelbeki

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

This Visual Agent Builder uses React Flow as a front end for constructing a LangGraph program. It offers both immediate execution and Python export from the same submitted graph.

## The browser owns the editable graph

[AgentBuilder.js](https://github.com/Brahim-Abdelbeki/Visual-Agent-Builder/blob/d2025c56bc54524f48da39bf398ff9a3f0bcb1c1/frontend/src/components/AgentBuilder.js) manages typed system, router and agent nodes plus edges and node configuration. There is no database or version store in the inspected tree.

## FastAPI materializes behavior

[main.py](https://github.com/Brahim-Abdelbeki/Visual-Agent-Builder/blob/d2025c56bc54524f48da39bf398ff9a3f0bcb1c1/backend/main.py) validates the submitted graph, creates functions for each node, wires LangGraph edges and handles router decisions. A separate export request emits Python source from the graph.

## Authority and loss

During a session the React graph is authoritative; after export, generated Python can become the portable source. Reloadable graph JSON is not implemented, so that promotion is one-way unless the user keeps the browser session.

## Pinned evidence

- [Repository](https://github.com/Brahim-Abdelbeki/Visual-Agent-Builder)
- [Inspected tree](https://github.com/Brahim-Abdelbeki/Visual-Agent-Builder/tree/d2025c56bc54524f48da39bf398ff9a3f0bcb1c1)
- [Run dialog](https://github.com/Brahim-Abdelbeki/Visual-Agent-Builder/blob/d2025c56bc54524f48da39bf398ff9a3f0bcb1c1/frontend/src/components/RunAgentModal.js)
