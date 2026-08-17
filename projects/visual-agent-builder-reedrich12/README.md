# Visual Agent Builder by Reed Richardson

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

This Visual Agent Builder is both a manual system-architecture canvas and an agent-controlled design environment. Typed relationships, role configuration, framework exporters and a real model runtime all consume the same graph, while a Supervisor–Architect–Builder hierarchy can mutate that graph through an MCP-style command boundary.

## The canvas is bidirectional

A person can drag discovered agents, skills, tools and MCP servers onto React Flow and configure them in schema-driven property panels. In the other direction, the chat session classifies a request, asks an architect for a plan and lets the builder call [canvas-mcp.ts](https://github.com/reedrich12/visual-agent-builder/blob/12e1a1675faf9e389b4738893e8f71dcbfae8c7a/server/mcp/canvas-mcp.ts) to create, update, connect or inspect nodes. Socket events then apply those mutations to the visible Zustand graph.

## Typed edges affect execution, not only styling

[orchestrator-bridge.ts](https://github.com/reedrich12/visual-agent-builder/blob/12e1a1675faf9e389b4738893e8f71dcbfae8c7a/server/services/orchestrator-bridge.ts) converts the synchronized canvas into a parsed workflow. Delegation, data and control edges identify orchestrators, leads, specialists and auditors; the bridge builds phases and runs the configured agents through Anthropic's streaming API while reporting tokens, cost, progress and output to the terminal panel.

## One graph can materialize several deployment forms

Export generators translate the current system into VAB-native files, LangGraph, CrewAI or AutoGen packages, plus agent Markdown and configuration. Import validation and legacy migration preserve the reverse path. This makes source generation another projection of the canvas rather than a disconnected template catalogue.

## The source contains an important historical distinction

An older `runtime.ts` simulates execution, but the current socket `system:start` handler calls the real orchestrator bridge after pre-flight validation. The dossier relies on that later path and does not use simulation output as evidence of model execution.

## Pinned evidence

- [Repository](https://github.com/reedrich12/visual-agent-builder)
- [Inspected tree](https://github.com/reedrich12/visual-agent-builder/tree/12e1a1675faf9e389b4738893e8f71dcbfae8c7a)
- [Supervisor routing](https://github.com/reedrich12/visual-agent-builder/blob/12e1a1675faf9e389b4738893e8f71dcbfae8c7a/server/agents/supervisor.ts)
- [Socket runtime handoff](https://github.com/reedrich12/visual-agent-builder/blob/12e1a1675faf9e389b4738893e8f71dcbfae8c7a/server/socket/handlers.ts)
