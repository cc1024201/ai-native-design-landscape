# Agent Workflow Canvas

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

Agent Workflow Canvas is an interactive product-design study about visible uncertainty and accountable handoff. It is not an agent runtime or a general graph editor; its artifact is a set of deliberately inspectable operator states for one enterprise invoice workflow.

## Fixed scenarios expose decision states

[workflows.ts](https://github.com/kevinastuhuaman/agent-workflow-canvas/blob/88d31f0017d47e873828e8e3eaa0aa35fa6c4e26/src/data/workflows.ts) defines the node library and three synthetic scenarios: mismatch requiring finance review, clean automatic drafting and revoked permission. The page projects those states onto a canvas, inspector and event trace.

## Approval belongs to a run

[index.astro](https://github.com/kevinastuhuaman/agent-workflow-canvas/blob/88d31f0017d47e873828e8e3eaa0aa35fa6c4e26/src/pages/index.astro) creates bounded synthetic runs, links trace selection back to the responsible node and exposes approve, reject and scoped-retry paths. Payment release is explicitly outside the workflow.

## Evidence ceiling is intentional

All execution events are deterministic browser scenarios; no model or external ERP is called, nodes cannot be reconnected and state is not persisted across reload. It qualifies as a visual decision/verification workspace because users can inspect and exercise an AI-agent control design, not as deployed automation.

## What this record establishes

The project demonstrates a distinct definition of Design: specifying how agent uncertainty, authority, failure and recovery become legible product states. That field claim is different from counting another workflow engine.

## Pinned evidence

- [Repository](https://github.com/kevinastuhuaman/agent-workflow-canvas)
- [Inspected tree](https://github.com/kevinastuhuaman/agent-workflow-canvas/tree/88d31f0017d47e873828e8e3eaa0aa35fa6c4e26)
- [Approval decision record](https://github.com/kevinastuhuaman/agent-workflow-canvas/blob/88d31f0017d47e873828e8e3eaa0aa35fa6c4e26/DECISIONS/001-approval-is-a-state.md)
