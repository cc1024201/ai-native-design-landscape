# DonkeyWork Agents

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

DonkeyWork Agents is a broad .NET and React platform where the visual graph assembles a model with prompts tools MCP servers sub-agents A2A links and sandboxes. Its graph is primarily a capability-attachment contract rather than a generic edge-by-edge workflow language.

## Visual layout and executable configuration are stored together

[`AgentDefinitionService.cs`](https://github.com/andyjmorgan/DonkeyWork-Agents/blob/4f2d5b93e1ea750de9d594ed30f1d6efeb7f0457/src/agentdefinitions/DonkeyWork.Agents.AgentDefinitions.Core/Services/AgentDefinitionService.cs) persists `ReactFlowData` and `NodeConfigurations` in PostgreSQL-backed entities. The first preserves how users arranged and connected the canvas; the second preserves settings needed to hydrate an execution contract.

Most accessory nodes attach capabilities to a base model node. The presence of an edge therefore often means “this model may use this capability” rather than “execute target immediately after source.”

## Conversation execution hydrates the saved definition

[`ConversationContractHydrator.cs`](https://github.com/andyjmorgan/DonkeyWork-Agents/blob/4f2d5b93e1ea750de9d594ed30f1d6efeb7f0457/src/actors/DonkeyWork.Agents.Actors.Core/Services/ConversationContractHydrator.cs) resolves an agent definition into the contract consumed by Orleans actors. Provider middleware calls OpenAI Anthropic or Google clients; tool middleware and MCP services expose configured capabilities. SignalR streams conversation state back to the interface.

Sandbox and sub-agent support are implemented as platform services rather than simulated canvas labels. Schedules can also resolve the same saved agent definition.

## The graph is not the whole platform state

Credentials OAuth mappings MCP configurations conversation history and sandbox resources live outside `ReactFlowData`. Exporting only the visible graph would not reproduce a working deployment. DonkeyWork therefore defines design as a persisted composition inside a governed service boundary rather than a portable standalone diagram.

## Scope caution

The large source tree demonstrates real integrations and tests but this review did not operate a complete multi-service deployment. Inclusion rests on the connected persistence and execution code paths rather than on a claim of end-to-end production acceptance.

## Source revision

- [Repository](https://github.com/andyjmorgan/DonkeyWork-Agents)
- [Pinned tree](https://github.com/andyjmorgan/DonkeyWork-Agents/tree/4f2d5b93e1ea750de9d594ed30f1d6efeb7f0457)
- [OpenAI provider implementation](https://github.com/andyjmorgan/DonkeyWork-Agents/blob/4f2d5b93e1ea750de9d594ed30f1d6efeb7f0457/src/providers/DonkeyWork.Agents.Providers.Core/Providers/OpenAi/OpenAiResponsesClient.cs)
