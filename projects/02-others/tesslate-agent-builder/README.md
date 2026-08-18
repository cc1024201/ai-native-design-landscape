# Tesslate Agent Builder

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

Tesslate Agent Builder is a visual authoring layer over the TFrameX multi-agent framework, exposing agents, tools, patterns, triggers, and ordinary data operations in one graph.

## TFrameX concepts remain typed

Agent, tool, pattern, MCP server, input, and trigger nodes map to backend models rather than generic prompt boxes. A flow translator converts the graph into TFrameX orchestration structures and preserves configuration needed for execution.

## Persistence and portability are separate

PostgreSQL and Alembic migrations retain flows and runs for the application. JSON import and export provide a portable representation for a design independent of that managed database. Those paths are not described as lossless code round-tripping.

## Triggers turn a draft into automation

Manual, schedule, email, file, and webhook triggers reference saved flows. Built-in tools and model providers execute through backend registries, so changing a node changes a durable runtime definition rather than only its appearance.

## Pinned evidence

- Repository: [TesslateAI/Agent-Builder](https://github.com/TesslateAI/Agent-Builder)
- Inspected React Flow nodes, translator, agents, tools, triggers, persistence, execution, and import/export tree: [`76655ca84cac8c6e63230b7526eb7e24bec29a0a`](https://github.com/TesslateAI/Agent-Builder/tree/76655ca84cac8c6e63230b7526eb7e24bec29a0a)
- Immutable revision: [commit `76655ca`](https://github.com/TesslateAI/Agent-Builder/commit/76655ca84cac8c6e63230b7526eb7e24bec29a0a)
