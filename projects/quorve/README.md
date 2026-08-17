# Quorve

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

Quorve is a visually complete autonomous-agent builder prototype with a partially connected Rust backend. Its source establishes an editable graph schema and backend persistence contract, but the current UI and execution path stop short of the product claims in the README.

## Canvas authoring is implemented

[AgentBuilder.tsx](https://github.com/Jedidiahdev/Quorve-dev/blob/3509605e66a701f5b658b9a3464376e634e0a177/frontend/src/pages/AgentBuilder.tsx) supports palette drag-and-drop, React Flow node movement and connections. The Rust [agent model](https://github.com/Jedidiahdev/Quorve-dev/blob/3509605e66a701f5b658b9a3464376e634e0a177/backend/src/models/agent.rs) defines the matching nodes, edges, variables and triggers inside `AgentConfig`.

## Integration gap at save

The builder's Save action waits one second and shows a toast; Deploy only shows a success toast. Although backend handlers can insert and update JSONB agent configurations, this page does not call them. Auto-save text in the UI is therefore not persistence evidence.

## Execution records do not execute the graph

[agents.rs](https://github.com/Jedidiahdev/Quorve-dev/blob/3509605e66a701f5b658b9a3464376e634e0a177/backend/src/handlers/agents.rs) creates a `running` execution row and increments the agent count, but does not traverse nodes, invoke a model or complete the row. Real-time execution and 24/7 deployment remain roadmap claims at this commit.

## Why it remains included

The repository exposes an independently usable graph-authoring prototype and a concrete cross-tier artifact contract. It is counted at prototype depth, with simulated persistence and execution recorded as gaps rather than capabilities.

## Pinned evidence

- [Repository](https://github.com/Jedidiahdev/Quorve-dev)
- [Inspected tree](https://github.com/Jedidiahdev/Quorve-dev/tree/3509605e66a701f5b658b9a3464376e634e0a177)
- [Database schema](https://github.com/Jedidiahdev/Quorve-dev/blob/3509605e66a701f5b658b9a3464376e634e0a177/backend/migrations/001_initial.sql)
