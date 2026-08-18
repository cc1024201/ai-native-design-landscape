# Design-Driven Development

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

Design-Driven Development is a Claude Code plugin that connects product planning, product design, design-system construction and application execution through four role-separated agents. It requires a Figma MCP and is designed to move a brief through discovery, concepts, high-fidelity screens, annotations and implementation rather than jumping directly to code.

## Agent-owned memory meets a native Figma graph

Each agent writes only to its own memory directory and communicates through explicit handoff files. Product design uses Figma as native artifact authority; the design-system agent maintains component, token and theme knowledge; the executor receives enriched feature bundles for architecture, backend and frontend work. Human checkpoints separate design approval from construction.

Configuration records which Figma MCP is actually available and warns that the official write path is not equivalently tested to Figma Console MCP. Updates replace plugin files while preserving the design-system knowledge base and project memories.

- [Pinned repository](https://github.com/MooseDesign1/DDD-DesignDrivenDevelopment/tree/75ca682f2b0677bfd3b678ea1cb0efa73db480f8)
- [Pinned operating source](https://github.com/MooseDesign1/DDD-DesignDrivenDevelopment/blob/75ca682f2b0677bfd3b678ea1cb0efa73db480f8/README.md)
- [Repository tree](https://github.com/MooseDesign1/DDD-DesignDrivenDevelopment/tree/75ca682f2b0677bfd3b678ea1cb0efa73db480f8/.claude)
- [Maintainer location evidence](https://github.com/MooseDesign1)
