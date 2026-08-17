# Claude Figma Kit

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

Claude Figma Kit is a Claude Code plugin that turns a product description into a reviewed Figma design system. It combines an external design-reasoning skill with Figma MCP execution and divides the work into brief, tokens, components, pages and review commands.

## The brief gates native construction

`figma-init` writes a design brief covering palette, type, spacing, radii, page patterns and anti-patterns. The user reviews that file before later commands create variables, components and screens. Figma Plugin API execution then materializes those decisions in the active file.

The brief is durable planning authority until approved construction begins; afterward native Figma variables and nodes carry the shared editable artifact. The reviewer agent inspects the system and pages rather than treating command completion as acceptance.

## Dependency and evidence boundary

The plugin installs and calls `ui-ux-pro-max` and the official Figma MCP. This repository exposes orchestration and review roles, not either dependency's full implementation or Figma storage internals. OAuth and file permissions remain host gates.

- [Pinned Claude Figma Kit revision](https://github.com/tuannafed/claude-figma-kit/tree/2ae029b5aed6f6eafa6580f0203224f23707442a)
- [Command sequence and authority boundary](https://github.com/tuannafed/claude-figma-kit/blob/2ae029b5aed6f6eafa6580f0203224f23707442a/README.md)
- [Figma designer agent](https://github.com/tuannafed/claude-figma-kit/blob/2ae029b5aed6f6eafa6580f0203224f23707442a/agents/figma-designer.md)
- [Design reviewer agent](https://github.com/tuannafed/claude-figma-kit/blob/2ae029b5aed6f6eafa6580f0203224f23707442a/agents/figma-design-reviewer.md)
