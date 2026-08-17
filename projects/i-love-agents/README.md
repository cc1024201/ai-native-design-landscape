# I Love Agents

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

I Love Agents combines a community catalogue of reusable agents with an ordered workflow builder. Its workflow artifact is deliberately simpler than a freeform node graph: it is a persisted list of agent IDs plus optional conditional steps.

## Workflows reference a living registry

[WorkflowBuilder.jsx](https://github.com/AditthyaSS/iloveAgents/blob/7f6b6fff38b18b97a47c866a328243fd30657f97/src/pages/WorkflowBuilder.jsx) selects registered agents and constructs the ordered definition. [useWorkflows.js](https://github.com/AditthyaSS/iloveAgents/blob/7f6b6fff38b18b97a47c866a328243fd30657f97/src/hooks/useWorkflows.js) saves ownership and public workflow records in Supabase and supports forked definitions.

## Running expands branches at the moment of use

[WorkflowRunner.jsx](https://github.com/AditthyaSS/iloveAgents/blob/7f6b6fff38b18b97a47c866a328243fd30657f97/src/pages/WorkflowRunner.jsx) evaluates a conditional step, splices only the chosen agent IDs into the sequence and passes each provider response to the next agent. API keys stay in the browser session; execution traces are bounded localStorage records rather than shared server history.

## Authority split

Supabase owns reusable workflow identity, the source registry owns agent definitions and the browser owns a particular run trace. The dossier keeps those three layers separate instead of calling the catalogue itself a visual canvas.

## Pinned evidence

- [Repository](https://github.com/AditthyaSS/iloveAgents)
- [Inspected tree](https://github.com/AditthyaSS/iloveAgents/tree/7f6b6fff38b18b97a47c866a328243fd30657f97)
- [Trace persistence](https://github.com/AditthyaSS/iloveAgents/blob/7f6b6fff38b18b97a47c866a328243fd30657f97/src/lib/executionTrace.js)
