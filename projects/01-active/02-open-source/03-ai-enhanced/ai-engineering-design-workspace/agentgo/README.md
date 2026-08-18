# AgentGo

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

AgentGo is a local-first desktop IDE for designing agent applications whose visual DAG, capabilities, approvals, memory, and generated user interface execute together.

## A DAG is an application definition

Branches, loops, parallel work, fan-in, checkpoints, and human-in-the-loop nodes form an executable graph rather than a presentation diagram. ByteDance Eino ADK supplies the Go agent runtime while Wails packages the local desktop surface. The graph determines control flow and retains enough structure for layout repair and compilation checks.

## CapabilityBus separates orchestration from tools

Tools, apps, workflows, and skills enter through a common capability bus. An agent application can therefore call a capability without baking every integration into the canvas node. “Inner Apps” turn an agent flow into a generated task-specific interface, making the visual graph a source for both behavior and user-facing delivery.

## Governance is part of execution

SQLite-backed memory, a truth queue, approval queue, risk middleware, checkpoints, and context-injection previews make consequential transitions explicit. These controls do not prove every generated flow is safe, but they establish concrete pause, inspect, resume, and recover boundaries around the agent runtime.

## Pinned evidence

- Repository: [wk222/AgentGo](https://github.com/wk222/AgentGo)
- Inspected desktop and runtime tree: [`7f9b60b7f42d6dcbee837e9719aa504f52ebdb41`](https://github.com/wk222/AgentGo/tree/7f9b60b7f42d6dcbee837e9719aa504f52ebdb41)
- Immutable revision: [commit `7f9b60b`](https://github.com/wk222/AgentGo/commit/7f9b60b7f42d6dcbee837e9719aa504f52ebdb41)
