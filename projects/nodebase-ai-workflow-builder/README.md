# NodeBase AI Workflow Builder

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

NodeBase is a persisted React Flow automation product whose graph is executed by an Inngest function using real OpenAI, Gemini and Anthropic adapters.

## Persistence preserves graph structure

[the workflow router](https://github.com/Nikhil-VS1811/nodebase-ai-workflow-builder/blob/30c0ef68bf287d4df521954fb287e1f4b7de1b7f/src/features/workflows/server/routers.ts) replaces a workflow's nodes and connections transactionally in Prisma and reconstructs React Flow objects on read. Positions, node data, handles and edge direction survive beyond editor state.

## The runtime consumes that saved authority

[functions.ts](https://github.com/Nikhil-VS1811/nodebase-ai-workflow-builder/blob/30c0ef68bf287d4df521954fb287e1f4b7de1b7f/src/inngest/functions.ts) creates a durable execution, loads the stored graph, topologically sorts it and feeds an accumulating context through the registered executor for every node. Inngest handles retries and publishes live node status before the final context or error is written back to Prisma.

## Model nodes are not simulated

[the OpenAI executor](https://github.com/Nikhil-VS1811/nodebase-ai-workflow-builder/blob/30c0ef68bf287d4df521954fb287e1f4b7de1b7f/src/features/executions/components/openai/executor.ts) resolves a user-owned encrypted credential, compiles Handlebars prompts from upstream context and calls the provider through the AI SDK. Gemini and Anthropic follow the same interface; HTTP, Slack, Discord and trigger nodes share the registry.

## Current limits

Executions preserve final output and terminal error data, but the schema has no workflow-version snapshot, and the engine executes topological order serially with one shared context rather than explicit port-level values. Team collaboration, templates and versioning are correctly listed as future work.

## Pinned evidence

- [Repository](https://github.com/Nikhil-VS1811/nodebase-ai-workflow-builder)
- [Inspected tree](https://github.com/Nikhil-VS1811/nodebase-ai-workflow-builder/tree/30c0ef68bf287d4df521954fb287e1f4b7de1b7f)
- [Prisma artifact model](https://github.com/Nikhil-VS1811/nodebase-ai-workflow-builder/blob/30c0ef68bf287d4df521954fb287e1f4b7de1b7f/prisma/schema.prisma)
- [Topological ordering](https://github.com/Nikhil-VS1811/nodebase-ai-workflow-builder/blob/30c0ef68bf287d4df521954fb287e1f4b7de1b7f/src/inngest/utils.ts)
