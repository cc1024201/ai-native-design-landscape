# ADK Playground

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

ADK Playground is an independent authoring and debugging environment for Google ADK. It treats a project YAML file as the durable definition, provides structured editors over that model, materializes live ADK agents for execution and projects run events back into an inspectable graph.

## YAML is the recoverable design

[project_manager.py](https://github.com/danroblewis/adk-playground/blob/3cf434c8054e02d76da1e07e08199b56124c4916/backend/project_manager.py) creates and saves project YAML while emitting custom tools and callbacks as Python modules. The UI can also edit the YAML directly, so form changes and textual representation converge on one file-backed object.

## The runtime is built from that configuration

[agent_runner.py](https://github.com/danroblewis/adk-playground/blob/3cf434c8054e02d76da1e07e08199b56124c4916/backend/agent_runner.py) constructs Google ADK agents, runners and session services from project settings. WebSocket runs expose agent starts, tool calls, results, errors and parallel branches; [AgentGraph.tsx](https://github.com/danroblewis/adk-playground/blob/3cf434c8054e02d76da1e07e08199b56124c4916/frontend/src/components/AgentGraph.tsx) visualizes those events rather than pretending layout is the execution engine.

## Authoring extends into generated code and sandbox policy

The backend can generate agent configuration, prompts, tools and callbacks through model calls. Optional Docker sandbox controls add mount modes, network allowlists, approvals and timeouts, giving generated tool code an explicit execution boundary.

## Product boundary

This is not the official Google ADK Web builder and not merely an ADK demo. It maintains its own project model, authoring UI, evaluation tools, memories and sandbox lifecycle while using Google ADK as the runtime substrate.

## Pinned evidence

- [Repository](https://github.com/danroblewis/adk-playground)
- [Inspected tree](https://github.com/danroblewis/adk-playground/tree/3cf434c8054e02d76da1e07e08199b56124c4916)
- [Frontend API surface](https://github.com/danroblewis/adk-playground/blob/3cf434c8054e02d76da1e07e08199b56124c4916/frontend/src/utils/api.ts)
