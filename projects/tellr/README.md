# tellr

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

tellr is a Databricks application for generating data-grounded presentations through conversation. Profiles bind governed Genie data, deck prompts and visual style; sessions preserve the resulting decks for direct editing, reordering and export.

## Session HTML is revised under save-point control

The LangChain agent streams HTML slides with Chart.js visualizations. Conversation and deck state persist in Lakebase/PostgreSQL rather than in a throwaway response. [`slide-parser-and-script-management.md`](https://github.com/robertwhiffin/ai-slide-generator/blob/54c9ea6ea7a55783f3d41bba962100addbb45fcc/docs/technical/slide-parser-and-script-management.md) documents how revised fragments are parsed and merged without losing deck-wide CSS and scripts.

[`save-points-versioning.md`](https://github.com/robertwhiffin/ai-slide-generator/blob/54c9ea6ea7a55783f3d41bba962100addbb45fcc/docs/technical/save-points-versioning.md) adds snapshots, preview and restore around edits. The same stored deck can be exported through the bundled PPTX emitter or through a Google Slides integration. An MCP server attributes programmatic decks to the end user and returns them to the same workspace, so MCP is another entry to the product graph rather than a separate product.

The source repository retains its older `ai-slide-generator` name; tellr is the current product identity. Public evidence did not establish the product team's region precisely enough to assign one.

## Evidence

- [Pinned repository](https://github.com/robertwhiffin/ai-slide-generator/tree/54c9ea6ea7a55783f3d41bba962100addbb45fcc)
- [MCP integration](https://github.com/robertwhiffin/ai-slide-generator/blob/54c9ea6ea7a55783f3d41bba962100addbb45fcc/docs/technical/mcp-integration-guide.md)
- [PPTX emitter](https://github.com/robertwhiffin/ai-slide-generator/blob/54c9ea6ea7a55783f3d41bba962100addbb45fcc/services/pptx-emit/emit.mjs)
