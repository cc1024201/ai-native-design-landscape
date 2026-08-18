# CX Design Agents

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

CX Design Agents defines customer-experience design as a five-gate multi-agent operating system. Research, journey architecture, visual production and code handoff are coordinated by a central MCP-facing controller and share a persistent “CX Brain.”

## Phase gates preserve decision ownership

A master orchestrator routes work through boundary mapping, research, logical UX, visual design and validation/handoff. Specialized roles create personas, journey maps, service designs, brand and UI artifacts, prototypes, visual QA and design-to-code outputs. Each phase ends at a human approval gateway before downstream roles can treat its artifacts as settled.

The memory layer retains constraints, brand decisions, business rules and history. This makes the product primarily a visual-coordination system: no single canvas owns every design. Instead, filesystem artifacts and MCP operations carry state while Figma, prototypes, Storybook and code become phase-specific authorities.

The repository establishes a runnable server and role definitions, but not independent empirical validation of all 29 role claims.

- [Pinned repository](https://github.com/bruno-eid/cxdesign-agents/tree/3be0f0542dcd717e5428d25e1d0608593bdff79c)
- [MCP server](https://github.com/bruno-eid/cxdesign-agents/blob/3be0f0542dcd717e5428d25e1d0608593bdff79c/src/mcp-server.ts)
- [Agent architecture](https://github.com/bruno-eid/cxdesign-agents/blob/3be0f0542dcd717e5428d25e1d0608593bdff79c/ARQUITETURA-AGENTES.md)
- [Maintainer profile checked; no location published](https://github.com/bruno-eid)
