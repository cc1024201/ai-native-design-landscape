# Vextra MCP

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

Vextra MCP is a read-only design-file bridge for external agents. It opens local Vextra, Figma, Sketch and SVG artifacts, exposes their structured node hierarchy and can render selected nodes or extract embedded assets for visual verification. It qualifies as a design-code grounding interface, not as an autonomous visual editor.

## Existing design files are authoritative

[`DocumentLocal`](https://github.com/zrx-hub/vextra-mcp/blob/7f15f10079a2331af405260bd58f63db5579b47f/src/data/source/document_local.ts) validates a supported file extension, loads the document through `@kcaitech/vextra-core`, lays out pages and resolves node views. The MCP server caches the parsed local document but does not create a competing project database.

The associated [`vextra-core`](https://github.com/zrx-hub/vextra-core/tree/189ba32dc5c345b72e6d1c6f166ecdb22a5d1aa2) supplies the document graph, importers, layout and rendering engine. That library is a dependency of this agent interface and is not separately counted as an AI-native product.

## Progressive structural inspection protects context

[`Get Vextra Data`](https://github.com/zrx-hub/vextra-mcp/blob/7f15f10079a2331af405260bd58f63db5579b47f/src/mcp/get_vextra_data.ts) can return the full document, a page or a specific node with controlled traversal depth. The tool documentation explicitly recommends page inventory and progressive refinement for large files, preserving node identity while avoiding a context-sized dump.

[`Get Vextra Pages Info`](https://github.com/zrx-hub/vextra-mcp/blob/7f15f10079a2331af405260bd58f63db5579b47f/src/mcp/get_vextra_pagesinfo.ts) provides page IDs and node counts so an agent can choose where to inspect next.

## Rendering supplies visual evidence

[`Get Vextra Images`](https://github.com/zrx-hub/vextra-mcp/blob/7f15f10079a2331af405260bd58f63db5579b47f/src/mcp/get_vextra_images.ts) either extracts image fills or asks the Vextra renderer for PNG/SVG output of selected nodes. The service writes those derivatives to an explicit local path. This lets an external coding agent combine hierarchy and rendered evidence when implementing or checking a design.

## Read-only and provenance boundaries

The three registered tools inspect pages, data and images; they do not mutate the source design file. Persistence and versioning therefore remain with the original file and whatever host manages it.

The repository's source headers attribute the code to KCai Technology, while the public repositories are hosted under `zrx-hub`; no reliable team-country evidence was found. A separate `zrx-hub/vextra` repository contains only deployment documentation and points to a public upstream that was not available at review time. That shell is excluded rather than used to inflate this product's capabilities.

## Evidence

- [Pinned MCP repository](https://github.com/zrx-hub/vextra-mcp/tree/7f15f10079a2331af405260bd58f63db5579b47f)
- [Document and rendering service](https://github.com/zrx-hub/vextra-mcp/blob/7f15f10079a2331af405260bd58f63db5579b47f/src/data/vextra.ts)
