# Open Agent Builder by Firecrawl

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

Firecrawl's Open Agent Builder is a visual no-code editor for agent pipelines, distinct from 01.AI's separate product with the same generic name.

## Eight node types define the control language

Start, Agent, MCP Tool, Transform, If/Else, While Loop, User Approval, and End nodes form a React Flow graph. That small vocabulary makes branching, repetition, tools, and explicit human pauses visible instead of burying them in an agent prompt.

## LangGraph executes the saved design

A graph compiler maps the canvas into LangGraph state and conditional transitions. Convex persists workflows, executions, and streamed status; transform work can run in an E2B sandbox. The execution view therefore projects live node state back onto the authored graph.

## Deployment keeps external tools separate

Firecrawl extraction, HTTP calls, and MCP tools enter through node adapters and credentials. The graph coordinates them but does not claim ownership of their external data or side effects. Approval nodes expose the point at which a person can stop a consequential continuation.

## Pinned evidence

- Repository: [firecrawl/open-agent-builder](https://github.com/firecrawl/open-agent-builder)
- Inspected canvas, node catalog, LangGraph compiler, Convex, streaming, MCP, and sandbox tree: [`be856e57f8126e90915c898f473dc94fbaefc945`](https://github.com/firecrawl/open-agent-builder/tree/be856e57f8126e90915c898f473dc94fbaefc945)
- Immutable revision: [commit `be856e5`](https://github.com/firecrawl/open-agent-builder/commit/be856e57f8126e90915c898f473dc94fbaefc945)
