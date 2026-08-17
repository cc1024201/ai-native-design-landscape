# FluxorAI

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

FluxorAI is a visual automation platform whose graph can combine manual, Google Forms, Stripe, HTTP, OpenAI, Anthropic, Gemini, Slack, and Discord nodes.

## React Flow and PostgreSQL share identifiers

Canvas nodes and edges are transformed into Prisma `Node` and `Connection` records with positions, types, data, and handles. Reloading reverses that mapping, making the database graph—not the component tree or README—the durable design.

## Inngest executes a topological plan

An execution event loads the saved graph, topologically sorts its nodes, and dispatches each type through an executor registry. A shared context carries named values through Handlebars templates; realtime channels project loading, success, or failure back to each canvas node.

## Provider credentials stay referenced

OpenAI, Anthropic, and Gemini executors load an encrypted user credential by ID and write generated text into the execution context. Run records retain start, completion, output, and error state. The source comparison found only 11.4 percent exact file overlap with a separately discovered n8n clone, so common architecture alone is not used to erase this independent implementation.

## Pinned evidence

- Repository: [priyanshu09102003/fluxorAI](https://github.com/priyanshu09102003/fluxorAI)
- Inspected editor, Prisma graph, Inngest runtime, provider executors, credentials, realtime channels, and execution history: [`d6e8cec99ee3e168b8af5455e6a743e413c670d4`](https://github.com/priyanshu09102003/fluxorAI/tree/d6e8cec99ee3e168b8af5455e6a743e413c670d4)
- Immutable revision: [commit `d6e8cec`](https://github.com/priyanshu09102003/fluxorAI/commit/d6e8cec99ee3e168b8af5455e6a743e413c670d4)
