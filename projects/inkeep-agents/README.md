# Inkeep Agents

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

Inkeep Agents joins a no-code visual builder and a TypeScript SDK around one managed agent configuration rather than forcing technical and non-technical authors into separate products.

## Two authoring surfaces share one authority

The management UI writes agents, sub-agents, tools, MCP servers, credentials, projects, prompts, and triggers through `agents-api`. The SDK and CLI push and pull the same resources. Two-way synchronization is therefore the central product mechanism: code can refine a visual definition and the visual builder can revise a code-authored agent.

## Execution and evaluation stay attached

The API runs agents with conversation state, artifact contracts, delegation, scheduled or external triggers, and OpenTelemetry traces. Evaluation datasets, configurations, jobs, and results reference the managed definitions instead of becoming detached benchmark files.

## Merge semantics matter more than export

Branch and merge routes, previews, and improvement records show that collaboration is not a one-way code generator. The risk boundary is configuration reconciliation across authors and surfaces; credentials remain referenced resources rather than being embedded in exported source.

## Pinned evidence

- Repository: [inkeep/agents](https://github.com/inkeep/agents)
- Inspected management API, visual UI, SDK/CLI sync, execution, branch, and evaluation tree: [`1777e6e1ff65c286946216b7acd5a8b4cd15c0a7`](https://github.com/inkeep/agents/tree/1777e6e1ff65c286946216b7acd5a8b4cd15c0a7)
- Immutable revision: [commit `1777e6e`](https://github.com/inkeep/agents/commit/1777e6e1ff65c286946216b7acd5a8b4cd15c0a7)
