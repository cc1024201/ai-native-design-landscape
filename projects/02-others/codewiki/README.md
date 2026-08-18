# CodeWiki

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

CodeWiki builds a navigable documentation model from a codebase. Architecture, data-flow and sequence diagrams are maintained as generated source artifacts within that model rather than isolated chat answers.

## Recursive analysis owns the evidence base

At commit [`67f27e65`](https://github.com/FSoft-AI4Code/CodeWiki/tree/67f27e65a3b416d57775345ab9101cf8dedb722a), language analyzers and dependency graphs build module context before the documentation agent writes pages. Metadata and analysis JSON let the viewer connect prose back to repository structure.

## Mermaid has repair and editing paths

Prompt contracts request diagram source; the web viewer renders it and editor tools can replace invalid or stale document fragments. The MCP server exposes the same documentation workflow to external agents.

## Refresh is not all-or-nothing

The project supports scoped generation over modules and existing docs. That makes diagrams maintainable codebase evidence instead of a disposable full-repository snapshot.

## Evidence

- [Pinned repository](https://github.com/FSoft-AI4Code/CodeWiki/tree/67f27e65a3b416d57775345ab9101cf8dedb722a)
- [Wiki generator skill](https://github.com/FSoft-AI4Code/CodeWiki/blob/67f27e65a3b416d57775345ab9101cf8dedb722a/skills/codewiki-wiki-generator/SKILL.md)
- [Prompt and diagram contract](https://github.com/FSoft-AI4Code/CodeWiki/blob/67f27e65a3b416d57775345ab9101cf8dedb722a/codewiki/src/be/prompt_template.py)
- [Document editor tool](https://github.com/FSoft-AI4Code/CodeWiki/blob/67f27e65a3b416d57775345ab9101cf8dedb722a/codewiki/src/be/agent_tools/str_replace_editor.py)
- [MCP server](https://github.com/FSoft-AI4Code/CodeWiki/blob/67f27e65a3b416d57775345ab9101cf8dedb722a/codewiki/mcp/server.py)
