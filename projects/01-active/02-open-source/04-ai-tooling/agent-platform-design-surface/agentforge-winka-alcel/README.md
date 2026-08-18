# AgentForge by winka-alcel

> Research status: **Source-level** · Lifecycle: **active-transition** · Last reviewed: **2026-08-12**

This AgentForge is unrelated to the already counted coding-agent canvas of the same name. It is a form-led platform for defining and delivering conversational agents.

## The governed artifact

Agent name system prompt provider model temperature token ceiling and lifecycle status are stored in Prisma records. Create and edit pages operate on that durable specification and conversations retain ordered messages.

## Runtime consumption

[The chat route](https://github.com/winka-alcel/agentforge/blob/f057f8e8431c0313d95df62f17349106cd1f075c/app/api/agents/%5Bid%5D/chat/route.ts) loads the saved agent and dispatches the conversation to OpenAI or Anthropic according to its model mapping. The UI offers direct testing and an embed route so the specification has a delivery surface beyond its editor.

## Where the platform is incomplete

[The schema](https://github.com/winka-alcel/agentforge/blob/f057f8e8431c0313d95df62f17349106cd1f075c/prisma/schema.prisma) declares configurable tools and API keys but the chat route neither loads AgentTool records nor exposes tool calls to either provider. Model identifiers are pinned to older provider names and user-managed API-key endpoints are not used by runtime calls.

## Identity note

GitHub currently resolves both the old amhisarza-dotcom path and the reviewed URL to winka-alcel. This dossier counts that one repository once and keeps it separate from lanekingkong AgentForge.

## Pinned evidence

- [Repository](https://github.com/winka-alcel/agentforge)
- [Inspected tree](https://github.com/winka-alcel/agentforge/tree/f057f8e8431c0313d95df62f17349106cd1f075c)
- [Agent CRUD route](https://github.com/winka-alcel/agentforge/blob/f057f8e8431c0313d95df62f17349106cd1f075c/app/api/agents/route.ts)
