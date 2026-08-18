# NodeMind

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

NodeMind resembles Agentix at the interface level but crosses a different technical threshold: its chat route compiles saved edges into an explicit flow and traverses that flow. This is why the two repositories remain separate team and product records rather than being collapsed by visual similarity.

## Convex preserves the authored topology

[`agent.ts`](https://github.com/kashyapv45/ai-agent-builder-platform/blob/5527191a551be1150b07c5465f1642b81f51448c/convex/agent.ts) stores nodes and edges for each agent. The React Flow builder restores those records and writes changes back. Start agent API conditional and end nodes have typed settings while publication state controls the preview surface.

## The runtime builds an edge map

[`agent-chat/route.ts`](https://github.com/kashyapv45/ai-agent-builder-platform/blob/5527191a551be1150b07c5465f1642b81f51448c/app/api/agent-chat/route.ts) converts outgoing connections into an edge map and compiles a flow from the Start node. Branch handles on If/Else edges choose subsequent nodes. Agent nodes call Gemini; API nodes invoke configured endpoints; traversal continues until an end condition.

That makes connection direction and branch identity operational data rather than canvas decoration.

## Incomplete node types remain visible

While-loop and user-approval concepts appear in the editor but are not equivalently complete in the runtime. Publication is a flag and hosted interface rather than deployment of a new service. The dossier therefore describes a real but bounded graph interpreter rather than a finished enterprise orchestrator.

## Evidence trail

- [Repository](https://github.com/kashyapv45/ai-agent-builder-platform)
- [Pinned tree](https://github.com/kashyapv45/ai-agent-builder-platform/tree/5527191a551be1150b07c5465f1642b81f51448c)
- [Builder source](https://github.com/kashyapv45/ai-agent-builder-platform/blob/5527191a551be1150b07c5465f1642b81f51448c/app/nodemind-agent/%5BagentId%5D/page.tsx)
