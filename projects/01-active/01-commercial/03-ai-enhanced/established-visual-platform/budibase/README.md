# Budibase

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

Budibase combines an operations app builder, a visual automation graph, and AI agents that can act through those applications and workflows.

## Applications and automations have different authorities

Screens, components, data sources, forms, roles, and queries define the employee-facing application. A separate flow canvas represents triggers, branches, loops, actions, and logs. The platform connects them without claiming that a workflow graph is also the UI document.

## Agents are configured as operational actors

Agent records include instructions, models, tools, structured outputs, data access, deployment channels, and logs. Agents can invoke application or automation actions and route approvals, while those deterministic resources remain individually editable.

## Runtime feedback returns to the builders

Automation runs project step state and logs onto the flow. Agent sessions expose calls, outputs, and deployment behavior. Docker and Kubernetes packaging make the same workspace self-hostable, including a LiteLLM service for model routing.

## Pinned evidence

- Repository: [Budibase/budibase](https://github.com/Budibase/budibase)
- Inspected app builder, automation canvas, agents, model routing, run logs, and deployment tree: [`db0fe97d022e2b5ce6fea40e4101a4d36e8e4373`](https://github.com/Budibase/budibase/tree/db0fe97d022e2b5ce6fea40e4101a4d36e8e4373)
- Immutable revision: [commit `db0fe97`](https://github.com/Budibase/budibase/commit/db0fe97d022e2b5ce6fea40e4101a4d36e8e4373)
