# Langflow

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

Langflow is a visual environment for composing agents and AI applications from typed components, then exposing the saved flow through an API, playground, or deployment surface.

## A flow is both graph and runnable specification

The frontend canvas edits vertices, handles, parameters, and edges. Backend flow records and graph services rebuild that structure into executable components. Saved JSON therefore carries more than layout: it identifies component types, configuration, and data dependencies.

## Components isolate integration semantics

Models, prompts, retrievers, tools, MCP servers, agents, and custom Python components enter through a component contract. This makes extension local to a node type while the graph runtime owns ordering, streaming, state, and errors.

## The builder can itself be assisted

The agentic backend includes a flow-builder assistant, validation, code extraction, and workspace services. That assistant is a control path into a durable flow, not a separate product record. API and MCP exposure then let the same saved design run outside the editor.

## Pinned evidence

- Repository: [langflow-ai/langflow](https://github.com/langflow-ai/langflow)
- Inspected canvas, flow persistence, graph runtime, components, and builder-assistant tree: [`66659c4f05ab190c4dcc07ec34125abcb768e1c4`](https://github.com/langflow-ai/langflow/tree/66659c4f05ab190c4dcc07ec34125abcb768e1c4)
- Immutable revision: [commit `66659c4`](https://github.com/langflow-ai/langflow/commit/66659c4f05ab190c4dcc07ec34125abcb768e1c4)
