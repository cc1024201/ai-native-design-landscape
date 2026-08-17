# OpenAgent

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

OpenAgent is a multi-tenant agent operations product, not a node-canvas workflow builder. Its visual authoring surface is a set of forms and management views for an agent, its engine configuration, attached tools, preprocessing rules and delivery channels.

## The governed agent is the artifact

The persisted authority is an agent record whose `engine_config` is JSONB, rather than a graph of visual nodes. [agent.py](https://github.com/DeepFlowAI/OpenAgent/blob/df055c46e23dd8f6772f153a1083db54721235f4/server/app/models/agent.py) scopes that record by tenant; separate tool and preprocessing-rule records extend it without changing the product into a canvas.

## Configuration reaches a substantial runtime

[agent_engine_service.py](https://github.com/DeepFlowAI/OpenAgent/blob/df055c46e23dd8f6772f153a1083db54721235f4/server/app/services/agent_engine_service.py) resolves the configured model, tool limits, runtime variables and tool-call loop for conversations. Conversation steps, inspections and traces make execution inspectable instead of reducing “run” to a preview animation.

## Delivery is part of the same product boundary

[channel_service.py](https://github.com/DeepFlowAI/OpenAgent/blob/df055c46e23dd8f6772f153a1083db54721235f4/server/app/services/channel_service.py) connects governed agents to channels, while the web SDK exposes them outside the admin surface. The defining loop is therefore configure → operate → inspect → publish, not draw → compile.

## Classification boundary

OpenAgent belongs in the landscape because it defines a visually administered, system-governed agent product with real runtime and delivery. It should not be used as evidence that every AI workflow product converges on a node graph.

## Pinned evidence

- [Repository](https://github.com/DeepFlowAI/OpenAgent)
- [Inspected tree](https://github.com/DeepFlowAI/OpenAgent/tree/df055c46e23dd8f6772f153a1083db54721235f4)
- [Conversation model](https://github.com/DeepFlowAI/OpenAgent/blob/df055c46e23dd8f6772f153a1083db54721235f4/server/app/models/conversation.py)
