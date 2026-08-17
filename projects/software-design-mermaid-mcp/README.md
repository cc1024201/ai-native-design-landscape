# Software Design Mermaid MCP

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

Software Design Mermaid MCP creates a deliberate turn-taking loop between Claude and a visual Mermaid editor: the model proposes structure, the user manipulates it spatially, and the revised source returns to the conversation.

## A browser editor is opened as an MCP interaction

The server launches a drag-and-drop editing surface for the model's Mermaid proposal. Users can move nodes, edit labels, draw connections, and work with subgraphs while seeing a live preview. Submitting returns the corrected Mermaid to the calling agent.

## Human geometry becomes machine-readable again

The key innovation is not just preview. Direct manipulation is translated back into source that can inform the next agent turn. This prevents visual corrections from becoming an invisible side channel and makes the user an active design participant.

## Session boundary and limits

The browser-mediated interaction is a runtime relay, not a durable collaborative diagram repository. Mermaid parsing constrains what can round-trip; valid submitted source still requires architectural and domain review.

## Pinned evidence

- Repository: [wzh4464/software-design-mermaid-mcp](https://github.com/wzh4464/software-design-mermaid-mcp)
- Inspected MCP/editor source: [`498d32fb2dc9364b231f1f58229b22170c3823ae`](https://github.com/wzh4464/software-design-mermaid-mcp/tree/498d32fb2dc9364b231f1f58229b22170c3823ae)
- Immutable revision: [commit `498d32f`](https://github.com/wzh4464/software-design-mermaid-mcp/commit/498d32fb2dc9364b231f1f58229b22170c3823ae)
