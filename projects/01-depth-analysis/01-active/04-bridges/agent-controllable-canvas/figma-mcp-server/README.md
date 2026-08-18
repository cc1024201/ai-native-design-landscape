# Figma MCP Server

> Research status: **Architecture-level / hosted server boundary** · Lifecycle: **active** · Last reviewed: **2026-08-12**

Figma MCP Server is Figma's official interface for external agents. It is intentionally separate from the built-in Figma Design Agent: external clients invoke MCP to read design/code context or create and change Figma Design, FigJam and Slides artifacts under explicit account and plan authority.

## The current contract is bidirectional, not a read-only handoff

The official guide packages skills for reading selected design context, design-to-code, Code Connect, new-file creation, native Design generation, FigJam diagrams, Slides and library creation. `create_new_file` resolves the user's plan before creating a draft. `use_figma` and editor-specific skills execute bounded Figma Plugin API code, including frames, components, variables, auto-layout and canvas updates. Code Connect establishes component identity across the design/code boundary.

The hosted MCP implementation is closed, so internal routing, transaction isolation and persistence mechanics remain unknown. Public skills do establish the external contract: Figma files and their native nodes are authoritative, write operations occur under Figma permissions, and a returned URL/file key addresses subsequent work.

## Evidence

- [Pinned official guide repository](https://github.com/figma/mcp-server-guide/tree/22b2c566d98880ebdb5a8e48eb2c66c596a6d990)
- [Create-new-file contract](https://github.com/figma/mcp-server-guide/blob/22b2c566d98880ebdb5a8e48eb2c66c596a6d990/skills/figma-create-new-file/SKILL.md)
- [Native Figma execution contract](https://github.com/figma/mcp-server-guide/blob/22b2c566d98880ebdb5a8e48eb2c66c596a6d990/skills/figma-use/SKILL.md)
- [Design-system library workflow](https://github.com/figma/mcp-server-guide/blob/22b2c566d98880ebdb5a8e48eb2c66c596a6d990/skills/figma-generate-library/SKILL.md)
