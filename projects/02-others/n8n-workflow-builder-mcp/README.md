# n8n Workflow Builder MCP Server

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

n8n Workflow Builder is an MCP control bridge that lets an external AI assistant inspect, create, update, activate, and execute workflows in an existing n8n instance.

## n8n remains the artifact authority

The server translates MCP tools into n8n REST operations over workflow JSON. Nodes, connections, activation state, credentials, and execution history belong to n8n; this bridge does not maintain a competing canvas or copy the workflow into chat memory.

## Mutation tools are schema-bounded

Typed SDK schemas validate identifiers, node data, connections, settings, and update operations before requests reach n8n. Read and check tools let the assistant inspect an existing workflow before applying a patch, while activation and execution are separate calls.

## Product identity is the control interface

This project is counted independently from n8n because it publishes and maintains the agent-facing design interface. It is not counted as a second workflow runtime: all durable execution and UI correction remain in the host.

## Pinned evidence

- Repository: [makafeli/n8n-workflow-builder](https://github.com/makafeli/n8n-workflow-builder)
- Inspected MCP schemas, workflow service, create/update tools, activation, execution, and integration tests: [`411c0a75f512898572c3de80f86d5b5c3939f041`](https://github.com/makafeli/n8n-workflow-builder/tree/411c0a75f512898572c3de80f86d5b5c3939f041)
- Immutable revision: [commit `411c0a7`](https://github.com/makafeli/n8n-workflow-builder/commit/411c0a75f512898572c3de80f86d5b5c3939f041)
- Package: [@makafeli/n8n-workflow-builder](https://www.npmjs.com/package/@makafeli/n8n-workflow-builder)
