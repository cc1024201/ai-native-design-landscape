# AI Workflow Studio by Kedar Vartak

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

This AI Workflow Studio is a small compiler-and-runner product in which natural language becomes a validated, versioned automation graph.

## The model is only a compiler

OpenRouter returns workflow JSON that must pass Zod validation. SQLite stores immutable workflow versions, and every run points to the exact version it executed rather than rereading the mutable latest draft.

## Registered handlers execute the graph

The deterministic runner supports input, LLM, condition, template, approval, simulated action, and output nodes and records step traces and branch decisions. React Flow is the visual projection of that schema.

## Current side effects are deliberately incomplete

Action nodes record simulations instead of calling external services. Approval pause state is persisted, but a complete resume path, authentication, and production deployment are not established in the inspected source.

## Pinned evidence

- Repository: [kedarvartak/ai-workflow-studio](https://github.com/kedarvartak/ai-workflow-studio)
- Inspected compiler, Zod schema, SQLite versions, deterministic runner, traces, approvals, and React Flow UI: [`a1cb5a984ef9360993560aa18dd6c2fe4a396b77`](https://github.com/kedarvartak/ai-workflow-studio/tree/a1cb5a984ef9360993560aa18dd6c2fe4a396b77)
- Immutable revision: [commit `a1cb5a9`](https://github.com/kedarvartak/ai-workflow-studio/commit/a1cb5a984ef9360993560aa18dd6c2fe4a396b77)
