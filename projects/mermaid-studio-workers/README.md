# Mermaid Studio on Workers

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

This Mermaid Studio is a Cloudflare-hosted diagram service whose MCP API lets external agents create, retrieve, update, list, delete, and export persistent Mermaid diagrams.

## MCP addresses durable diagram identities

Seven tools operate on stored diagrams rather than an anonymous render request. An agent can create a diagram, later fetch the same record, update its Mermaid source, and see the browser preview refresh. Templates give generation a constrained starting structure.

## The web editor and agent share a backend

Authentication tokens scope MCP access, while the Workers application holds accounts and diagram state. Mermaid source remains the editable authority and supports nine diagram families; exports are derived delivery forms.

## Persistence raises mutation stakes

Because `update_diagram` and `delete_diagram` act on durable objects, authorization and user review matter more than in a local scratchpad. The inspected public interface proves token-protected tool access but should not be read as evidence of operation-level multiplayer or semantic validation.

## Pinned evidence

- Repository: [wangyaominde/mermaid-studio](https://github.com/wangyaominde/mermaid-studio)
- Inspected Workers source: [`47e5e10facb23eb8585ca6b99631bd6de33d01ed`](https://github.com/wangyaominde/mermaid-studio/tree/47e5e10facb23eb8585ca6b99631bd6de33d01ed)
- Immutable revision: [commit `47e5e10`](https://github.com/wangyaominde/mermaid-studio/commit/47e5e10facb23eb8585ca6b99631bd6de33d01ed)
