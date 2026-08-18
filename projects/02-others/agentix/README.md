# Agentix

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

Agentix turns a visual agent graph into a generated runtime configuration. It is not yet a general graph interpreter: Gemini summarizes the graph into tool and agent config and the hosted chat route implements a narrower execution pattern.

## React Flow state is durable product data

The builder at [`page.tsx`](https://github.com/Pruthviraj75/Agentify_AI/blob/92bfa5e64d0ebb848ebf08292d25f6d2ef7b23d9/app/agent-builder/%5BagentId%5D/page.tsx) loads nodes and edges from an agent record and writes edited snapshots back through Convex. [`schema.ts`](https://github.com/Pruthviraj75/Agentify_AI/blob/92bfa5e64d0ebb848ebf08292d25f6d2ef7b23d9/convex/schema.ts) stores the graph alongside generated tool configuration and publication state.

## Reboot is a graph-to-config compilation step

The [`generate-agent-tool-config` route](https://github.com/Pruthviraj75/Agentify_AI/blob/92bfa5e64d0ebb848ebf08292d25f6d2ef7b23d9/app/api/generate-agent-tool-config/route.ts) sends the current graph to Gemini and asks for a structured description of agents and tools. The result is persisted. This makes the graph an input to materialization even though the model-generated config rather than edge traversal becomes the immediate runtime contract.

## Hosted execution is narrower than the palette

The chat and SDK routes load generated config but contain an explicit weather-tool calling path. They do not interpret arbitrary control-flow edges or every displayed node type. Publication exposes a hosted preview and copyable integration code; it does not provision independent infrastructure.

## Product boundary

Agentix is included as a graph-to-configuration prototype. Its distinct technical bet is using a model as the compiler between a visual design and a runnable agent config. Reliability therefore depends on validating that compiled config rather than assuming the diagram itself executes.

## Pinned evidence

- [Repository](https://github.com/Pruthviraj75/Agentify_AI)
- [Inspected tree](https://github.com/Pruthviraj75/Agentify_AI/tree/92bfa5e64d0ebb848ebf08292d25f6d2ef7b23d9)
- [Hosted chat route](https://github.com/Pruthviraj75/Agentify_AI/blob/92bfa5e64d0ebb848ebf08292d25f6d2ef7b23d9/app/api/agent-chat/route.ts)
