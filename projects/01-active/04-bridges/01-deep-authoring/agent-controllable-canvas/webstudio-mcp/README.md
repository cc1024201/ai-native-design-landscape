# Webstudio MCP

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

Webstudio MCP is an independent, unofficial control surface for Webstudio Cloud. Its fifteen action-grouped tools let an agent inspect, generate, push, audit and refactor pages, instances, styles, tokens, variables, resources and assets rather than merely emitting HTML beside the real project.

## The Cloud project graph is authoritative

A local project record stores credentials and working context, but the Webstudio instance, style and token graph remains the artifact authority. Mutations follow a two-stage protocol: operations preview with `dryRun`, then require `forceConfirmed` before a push. Read-only snapshots and audits expose overflow, orphaned nodes, token usage and asset problems for another correction pass.

The server drives a captured cookie and CSRF session instead of a supported public Webstudio API. That makes its reach technically significant but operationally fragile and security-sensitive; it must not be presented as an official Webstudio capability.

- [Pinned repository](https://github.com/marksagangms-debug/webstudio-mcp/tree/94b7e76690abbfeff63728592cd10093eedf2b7b)
- [Pinned data model](https://github.com/marksagangms-debug/webstudio-mcp/blob/94b7e76690abbfeff63728592cd10093eedf2b7b/docs/data-model.md)
- [Audit implementation](https://github.com/marksagangms-debug/webstudio-mcp/blob/94b7e76690abbfeff63728592cd10093eedf2b7b/src/tools/audit-mega.ts)
- [Current repository owner checked; no location published](https://github.com/marksagangms-debug)
