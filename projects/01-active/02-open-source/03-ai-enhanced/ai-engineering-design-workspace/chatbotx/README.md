# ChatbotX

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

ChatbotX is an open omnichannel chatbot and agent platform where conversation logic is assembled as a visual flow and delivered to messaging channels.

## Conversation structure stays visible

More than fifteen node types represent messages, inputs, conditions, models, agents, tools, data operations, and channel actions. Edges make transitions inspectable, while workspace-scoped records persist bot and flow configuration.

## Agent nodes enter a channel runtime

Multiple model providers, MCP tools, and reusable agent settings can be inserted into the conversational graph. Channel adapters then translate inbound events and outbound responses without making WhatsApp, web chat, or another transport the canonical design surface.

## Delivery is an operational boundary

CLI and MCP access allow external agents or automation to manage the platform, while deployment, credentials, user data, and channel policies remain explicit. A saved flow is therefore the product definition; a live conversation is one execution of it.

## Pinned evidence

- Repository: [ChatbotXIO/ChatbotX](https://github.com/ChatbotXIO/ChatbotX)
- Inspected flow builder, node schema, agent/model integrations, MCP/CLI, channel, and persistence tree: [`932eae567885cce5875b861f5c13e4c15896354e`](https://github.com/ChatbotXIO/ChatbotX/tree/932eae567885cce5875b861f5c13e4c15896354e)
- Immutable revision: [commit `932eae5`](https://github.com/ChatbotXIO/ChatbotX/commit/932eae567885cce5875b861f5c13e4c15896354e)
