# Djasha System

> Research status: **Source-level** · Lifecycle: **active-transition** · Last reviewed: **2026-08-12**

Djasha System defines an AI-native design system as a component whose source, tokens, accessibility rationale and natural-language reuse prompt can travel together into any coding agent. It is a published system and retrieval surface, not a general-purpose canvas.

## A bundle is the agent handoff unit

Every component has executable source, a rendered preview and content documentation that explains usage and constraints. The build emits a public manifest plus a markdown bundle that inlines enough context for another agent to port the component without guessing at hidden tokens.

The current repository also exposes an MCP endpoint. [`src/lib/mcp/server.ts`](https://github.com/djasha/system/blob/b40fe5d7a67911b4b58a31ce04afae569b556f4a/src/lib/mcp/server.ts) registers retrieval tools; [`originals.ts`](https://github.com/djasha/system/blob/b40fe5d7a67911b4b58a31ce04afae569b556f4a/src/lib/mcp/tools/originals.ts) serves the governed originals rather than allowing an agent to mutate arbitrary hosted components.

```text
component source + tokens + docs -> live preview
                              \-> bundle/manifest/MCP -> downstream agent -> new repo
```

The Git repository is the design-system authority. Previews are live projections and downstream copies immediately become separate source authorities. The README's planned chat-to-canvas studio is explicitly Phase 2 and is not counted as shipped behavior.

No license file was present at the pinned revision and no reliable maintainer-region evidence was found.

## Pinned record

- [Repository at `b40fe5d`](https://github.com/djasha/system/tree/b40fe5d7a67911b4b58a31ce04afae569b556f4a)
- [System design](https://github.com/djasha/system/blob/b40fe5d7a67911b4b58a31ce04afae569b556f4a/docs/superpowers/specs/2026-04-20-djasha-system-design.md)
- [Example component contract](https://github.com/djasha/system/blob/b40fe5d7a67911b4b58a31ce04afae569b556f4a/src/content/patterns/editorial-hero.doc.mdx)
