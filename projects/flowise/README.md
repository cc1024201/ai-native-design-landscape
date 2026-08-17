# Flowise

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

Flowise is an open visual platform for building and serving LLM and agent flows. Its current source makes an important distinction: the editor package defines a reusable agent-flow graph contract, while the server stores and executes concrete ChatFlow and AgentFlow instances.

## Agentflow is now an embeddable editor contract

[Agentflow.tsx](https://github.com/FlowiseAI/Flowise/blob/abe4a8601a058047b350c260676826e21dd14101/packages/agentflow/src/Agentflow.tsx) and its provider own node, edge, validation, configuration and save state as a package rather than hiding all graph semantics inside one product page. The main UI composes that package with marketplace and configuration surfaces.

## Stored flow JSON remains operational authority

[ChatFlow.ts](https://github.com/FlowiseAI/Flowise/blob/abe4a8601a058047b350c260676826e21dd14101/packages/server/src/database/entities/ChatFlow.ts) persists the serialized graph and deployment-facing settings. The server's chatflow service controls create, update, import and access boundaries, so browser state alone is not the saved product.

## Two runtime builders preserve different generations

[buildChatflow.ts](https://github.com/FlowiseAI/Flowise/blob/abe4a8601a058047b350c260676826e21dd14101/packages/server/src/utils/buildChatflow.ts) constructs the earlier component graph. [buildAgentflow.ts](https://github.com/FlowiseAI/Flowise/blob/abe4a8601a058047b350c260676826e21dd14101/packages/server/src/utils/buildAgentflow.ts) handles the newer agent-flow semantics. Prediction routes load the stored definition and stream executions into chat or API consumers.

This coexistence is a product migration boundary, not evidence of two separate products.

## Copy and derivative boundary

The surfaced AgentViz repository retains Flowise's monorepo, assets, node catalogue and hundreds of exact source blobs under a new package label. It is treated as a copied distribution. Pyonair is reviewed separately because it declares its Flowise base while presenting a maintained product fork; that decision cannot be inferred from code overlap alone.

## Pinned evidence

- [Canonical repository](https://github.com/FlowiseAI/Flowise)
- [Inspected tree](https://github.com/FlowiseAI/Flowise/tree/abe4a8601a058047b350c260676826e21dd14101)
- [Prediction service](https://github.com/FlowiseAI/Flowise/blob/abe4a8601a058047b350c260676826e21dd14101/packages/server/src/services/predictions/index.ts)
