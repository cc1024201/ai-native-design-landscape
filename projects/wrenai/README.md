# WrenAI

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

WrenAI defines generative business intelligence as a governed path from database meaning to validated SQL, charts, and deployable dashboards rather than a chat window that happens to query data.

## Meaning is kept in reviewable files

Models and relationships live in MDL, organization-specific definitions live in `instructions.md`, and proven examples enter memory. Agents retrieve this context to plan SQL, while the semantic engine validates queries against the modeled data source.

## Generation has a dry-plan boundary

Text-to-SQL output passes schema-aware retrieval, planning, dry validation, and structured error handling before results become charts. This separates model proposal from database execution and leaves evidence for why a field or relationship was available.

## A result can become a delivered artifact

Charts can be assembled into a dashboard and deployed through Vercel or Cloudflare using the browser-side Wren core. MCP, skills, CLI, and SDK surfaces let external agents operate the governed model without moving the semantic authority into their private prompts.

## Pinned evidence

- Repository: [Canner/WrenAI](https://github.com/Canner/WrenAI)
- Inspected MDL schema, planner, validation, memory, GenBI, dashboard deployment, MCP, and skills tree: [`7f7370e4e9b05a51dbde918cd5c9ecbedafe3d20`](https://github.com/Canner/WrenAI/tree/7f7370e4e9b05a51dbde918cd5c9ecbedafe3d20)
- Immutable revision: [commit `7f7370e`](https://github.com/Canner/WrenAI/commit/7f7370e4e9b05a51dbde918cd5c9ecbedafe3d20)
