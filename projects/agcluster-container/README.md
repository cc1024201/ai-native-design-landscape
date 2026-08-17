# AgCluster Container

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

AgCluster Container defines agent design as a governed deployable configuration plus an isolated visual work surface for the agent's execution and files.

## YAML is the promoted authority

The web builder edits identity system prompt tools MCP servers sub-agents permission mode and resource limits while rendering a YAML preview. [The configuration API](https://github.com/whiteboardmonk/agcluster-container/blob/3a0315a6b65674005a95124fa1ccbc619f6b064b/src/agcluster/container/api/configs.py) validates the same model and stores custom configurations as YAML.

## Launch binds governance to infrastructure

[SessionManager](https://github.com/whiteboardmonk/agcluster-container/blob/3a0315a6b65674005a95124fa1ccbc619f6b064b/src/agcluster/container/core/session_manager.py) loads a configuration and asks a provider-specific container manager to create an isolated session. Allowed tools system prompts MCP declarations sub-agents and resource limits cross that boundary into the agent container.

## The runtime remains visually inspectable

Claude Agent SDK events stream into chat tool timelines thinking and task state. Workspace files can be uploaded browsed previewed and downloaded as a ZIP. This makes generated files and execution evidence part of the ordinary-user loop rather than an invisible backend side effect.

## Durability and trust limits

Custom configs persist on the host but active session state is memory-resident. Users supply Anthropic keys at launch and MCP credential filtering is a critical trust boundary. Container isolation depends on the selected provider and its configuration rather than the UI alone.

## Pinned evidence

- [Repository](https://github.com/whiteboardmonk/agcluster-container)
- [Inspected tree](https://github.com/whiteboardmonk/agcluster-container/tree/3a0315a6b65674005a95124fa1ccbc619f6b064b)
- [Agent configuration model](https://github.com/whiteboardmonk/agcluster-container/blob/3a0315a6b65674005a95124fa1ccbc619f6b064b/src/agcluster/container/models/agent_config.py)
- [Agent chat stream](https://github.com/whiteboardmonk/agcluster-container/blob/3a0315a6b65674005a95124fa1ccbc619f6b064b/src/agcluster/container/api/agent_chat.py)
