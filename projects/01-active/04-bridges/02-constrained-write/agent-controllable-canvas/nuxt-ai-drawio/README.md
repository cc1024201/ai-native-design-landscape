# Nuxt AI Draw.io

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

Nuxt AI Draw.io wraps a full draw.io editor with a multi-provider natural-language control loop. The agent receives the current diagram and returns changes to an established XML canvas rather than replacing it with an image.

## Draw.io remains the native editor

Generated or modified XML is loaded into the embedded draw.io runtime, where users retain ordinary object-level editing. Unsaved-close protection acknowledges that the browser session carries meaningful design state. PNG, `.drawio` XML, and Mermaid exports serve different delivery needs.

## Provider breadth is not the architecture

OpenAI, Anthropic, Google, Azure, Bedrock, OpenRouter, DeepSeek, and SiliconFlow are supported through AI SDK abstractions. Prompt caching and reasoning-model support affect cost and latency, but the decisive boundary is the relay between model output and current draw.io XML.

## Review remains necessary

Token reporting and visible canvas updates make generation inspectable. They do not validate system semantics or guard every concurrent write. The repository proves an agent-to-canvas path, not autonomous architecture approval.

## Pinned evidence

- Repository: [Ray0907/nuxt-ai-drawio](https://github.com/Ray0907/nuxt-ai-drawio)
- Inspected Nuxt source: [`557a3d6615a6cccd3c2a59e4c7cd321304ef42aa`](https://github.com/Ray0907/nuxt-ai-drawio/tree/557a3d6615a6cccd3c2a59e4c7cd321304ef42aa)
- Immutable revision: [commit `557a3d6`](https://github.com/Ray0907/nuxt-ai-drawio/commit/557a3d6615a6cccd3c2a59e4c7cd321304ef42aa)
