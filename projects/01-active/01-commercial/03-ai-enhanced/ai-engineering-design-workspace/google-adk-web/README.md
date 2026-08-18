# Google ADK Web

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

Google ADK Web is the built-in development and debugging UI for Agent Development Kit. Its builder is not a generic workflow runtime of its own: it visually authors an ADK agent hierarchy and materializes the same definition as YAML into an ADK application directory.

## The visual object is an agent hierarchy

[canvas.component.ts](https://github.com/google/adk-web/blob/8a2d44ce6450750e9b970afdef519828942a39ae/src/app/components/canvas/canvas.component.ts) manages agent nodes, hierarchy groups, tool boards, callbacks, positions and connections with ngx-vflow. [builder-tabs.component.ts](https://github.com/google/adk-web/blob/8a2d44ce6450750e9b970afdef519828942a39ae/src/app/components/builder-tabs/builder-tabs.component.ts) edits concrete LlmAgent, LoopAgent, ParallelAgent and SequentialAgent configuration plus tools and callbacks.

This is a constrained system-authoring surface: node types encode ADK composition semantics rather than arbitrary boxes.

## YAML is the durable handoff to ADK

[yaml-utils.ts](https://github.com/google/adk-web/blob/8a2d44ce6450750e9b970afdef519828942a39ae/src/utils/yaml-utils.ts) converts the in-memory hierarchy to YAML and submits it for saving under the named app. Existing agent data can be loaded back into builder state. The visual graph is therefore a projection over an ADK definition whose execution remains with the ADK API server.

## The assistant mutates through the same materialization path

[builder-assistant.component.ts](https://github.com/google/adk-web/blob/8a2d44ce6450750e9b970afdef519828942a39ae/src/app/components/builder-assistant/builder-assistant.component.ts) saves the current agent before an assistant session and reloads the canvas after assistant changes. Visual and conversational edits converge by regenerating and rereading the ADK definition; the assistant does not maintain a hidden second artifact.

## Product and component boundary

Downstream financial, editorial and demo repositories exercise this official builder but do not create independent authoring products. Google ADK Web is counted once; example agents and the ADK Rust extension remain components or downstream uses.

## Pinned evidence

- [Canonical repository](https://github.com/google/adk-web)
- [Inspected tree](https://github.com/google/adk-web/tree/8a2d44ce6450750e9b970afdef519828942a39ae)
- [Agent builder state service](https://github.com/google/adk-web/blob/8a2d44ce6450750e9b970afdef519828942a39ae/src/app/core/services/agent-builder.service.ts)
