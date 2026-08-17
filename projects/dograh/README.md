# Dograh

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

Dograh defines a voice agent as a visual conversation and action workflow that can be tested turn by turn before it is attached to telephony or another deployment channel.

## Voice behavior is a graph, not one system prompt

Start, agent, tool, transition, QA, handoff, and end-call nodes organize instructions and outcomes. Provider settings for language models, speech recognition, speech synthesis, telephony, knowledge, webhooks, and storage remain explicit resources referenced by the graph.

## Testing preserves conversational evidence

Audio and chat test sessions expose individual turns. A user can edit a prior turn, replay from that point, and compare the downstream path rather than repeatedly calling a deployed phone number with no retained explanation.

## MCP reaches drafts, not silent production

Dograh's MCP surface lets coding agents inspect workspaces and schemas, create workflows, and save draft edits from natural language. Deployment and provider credentials remain separate boundaries, so an external agent's design mutation is not automatically a live call campaign.

## Pinned evidence

- Repository: [dograh-hq/dograh](https://github.com/dograh-hq/dograh)
- Inspected workflow, turn replay, provider, MCP, testing, and deployment tree: [`48aa0f600b21bbdaf89ac59c704dd77b0bb22202`](https://github.com/dograh-hq/dograh/tree/48aa0f600b21bbdaf89ac59c704dd77b0bb22202)
- Immutable revision: [commit `48aa0f6`](https://github.com/dograh-hq/dograh/commit/48aa0f600b21bbdaf89ac59c704dd77b0bb22202)
- [MCP integration guide](https://docs.dograh.com/integrations/mcp)
