# Open Gumloop

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

Open Gumloop is a small open visual workflow product inspired by Gumloop, with its own graph schema and LangGraph execution path rather than a claimed copy of the closed service.

## The JSON graph is deliberately compact

Input, output, language-model, tool, and agent nodes are connected on React Flow and serialized as a workflow definition. Node configuration and edge routing remain directly editable and can be loaded back into the canvas.

## One API route compiles the workflow

The server maps the graph into LangGraph state and executes nodes in dependency order. Tools enter through Composio integrations; model or agent output flows through named graph values rather than hidden conversational memory.

## Inspiration is not identity

The README names Gumloop as inspiration, but the repository has a distinct owner, source tree, product name, and implementation. It is counted independently while its limited node catalog and single execution service are kept visible rather than inflated into feature parity.

## Pinned evidence

- Repository: [composio-community/open-gumloop](https://github.com/composio-community/open-gumloop)
- Inspected React Flow schema, persistence, LangGraph compiler, tool, and execution tree: [`1aaa56bf28fddfe2573e5b8e4028a1de16fb121d`](https://github.com/composio-community/open-gumloop/tree/1aaa56bf28fddfe2573e5b8e4028a1de16fb121d)
- Immutable revision: [commit `1aaa56b`](https://github.com/composio-community/open-gumloop/commit/1aaa56bf28fddfe2573e5b8e4028a1de16fb121d)
