# Visual Agent Builder by Freek van den Bosch

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

This Visual Agent Builder is a browser-native Claude workflow canvas. Users can draw or model-generate an agent graph, execute it without a backend and let an orchestrator choose connected agents and services as tools.

## Browser state is the complete project

[useFlow.js](https://github.com/StudentFrederick/visual-agent-builder/blob/25faaaaea6be98c7c792f0be2e707a14b3e817b7/src/hooks/useFlow.js) persists whitelisted agent, orchestrator and service node data plus edges in local storage. The same React Flow objects drive editing and execution; no second server-side workflow representation intervenes.

## Claude can author and run the graph

[flow-generator.js](https://github.com/StudentFrederick/visual-agent-builder/blob/25faaaaea6be98c7c792f0be2e707a14b3e817b7/src/utils/flow-generator.js) asks Claude for a validated graph schema and lays it out on the canvas. [useRunner.js](https://github.com/StudentFrederick/visual-agent-builder/blob/25faaaaea6be98c7c792f0be2e707a14b3e817b7/src/hooks/useRunner.js) topologically orders manual or generated graphs and streams real Claude results into node state.

## Orchestrator edges become tools

[orchestrator.js](https://github.com/StudentFrederick/visual-agent-builder/blob/25faaaaea6be98c7c792f0be2e707a14b3e817b7/src/utils/orchestrator.js) converts connected agent and service nodes into Anthropic tool definitions. A multi-turn loop executes requested subagents in parallel, activates their edges and returns tool results to the orchestrator before producing a report.

## Local and dataflow ceiling

The API key and graph live in the browser profile, with no shared access, run ledger or revision history. Outside orchestrator subgraphs, topological order feeds one global previous output to the next visited node; parent-specific merge and branch semantics are not modeled. Direct browser provider calls also place credential and CORS responsibility on the user.

## Pinned evidence

- [Repository](https://github.com/StudentFrederick/visual-agent-builder)
- [Inspected tree](https://github.com/StudentFrederick/visual-agent-builder/tree/25faaaaea6be98c7c792f0be2e707a14b3e817b7)
- [Claude client](https://github.com/StudentFrederick/visual-agent-builder/blob/25faaaaea6be98c7c792f0be2e707a14b3e817b7/src/utils/claude.js)
