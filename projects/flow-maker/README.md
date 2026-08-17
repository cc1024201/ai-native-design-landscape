# Flow Maker

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

Flow Maker is LlamaIndex's visual agent workflow workbench. A browser-local graph has two equal consumers: an interactive step runner for debugging and a TypeScript compiler that materializes a standalone LlamaIndex workflow.

## Local graph state is the source artifact

[AgentFlow.tsx](https://github.com/run-llama/flow-maker/blob/4e68a47bcb03d5e8340a3792c67f2ec8c40512d9/src/components/AgentFlow.tsx) autosaves nodes, edges and provider settings into local storage. The grammar includes start/stop, user input, direct LLM, agent, tool, split, collect and model-evaluated decision nodes; tool configuration is attached to agent nodes during compilation.

## Interactive execution exposes intermediate semantics

[RunView.tsx](https://github.com/run-llama/flow-maker/blob/4e68a47bcb03d5e8340a3792c67f2ec8c40512d9/src/components/RunView.tsx) reloads the saved graph and uses the compiled event contract to step through it. It pauses for human input, calls server routes for real provider and agent operations, follows decision branches, surfaces each output in chat and highlights the current node.

## The compiler makes the visual program portable

[workflow-compiler.ts](https://github.com/run-llama/flow-maker/blob/4e68a47bcb03d5e8340a3792c67f2ec8c40512d9/src/lib/workflow-compiler.ts) turns reachable nodes and edges into named event inputs and outputs. [typescript-compiler.ts](https://github.com/run-llama/flow-maker/blob/4e68a47bcb03d5e8340a3792c67f2ec8c40512d9/src/lib/typescript-compiler.ts) consumes that same representation to generate imports, models, tools, workflow events, handlers and an executable context using `@llamaindex/workflow-core`.

## Authority and governance ceiling

There is no shared server project, version history or persisted run ledger; the browser profile is the workspace. Generated source can include configured provider material, so portability also transfers responsibility for secret handling to the user. The absence of hosted governance does not weaken the central design fact: one visual graph is testable and compilable through two independent projections.

## Pinned evidence

- [Repository](https://github.com/run-llama/flow-maker)
- [Inspected tree](https://github.com/run-llama/flow-maker/tree/4e68a47bcb03d5e8340a3792c67f2ec8c40512d9)
- [Agent execution route](https://github.com/run-llama/flow-maker/blob/4e68a47bcb03d5e8340a3792c67f2ec8c40512d9/app/api/agent/run/route.ts)
- [LLM execution route](https://github.com/run-llama/flow-maker/blob/4e68a47bcb03d5e8340a3792c67f2ec8c40512d9/app/api/llm/call/route.ts)
