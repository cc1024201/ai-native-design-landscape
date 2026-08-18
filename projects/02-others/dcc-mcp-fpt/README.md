# DCC-MCP Flow Production Tracking

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

DCC-MCP FPT is an agent-facing adapter for Autodesk Flow Production Tracking, formerly ShotGrid. It is included as a Design-coordination product: shots, assets, versions, notes and review state are the shared production artifact even though the adapter is not itself an image editor.

## Production state is a managed graph

The progressively loaded surface separates discovery and schema from entity CRUD, search, notes and batches. The [CRUD Skill](https://github.com/dcc-mcp/dcc-mcp-fpt/blob/c25b666783376a98bfe249c1e617557ca2ac84e1/src/dcc_mcp_fpt/skills/shotgrid-crud/SKILL.md) can create and update the same entities artists and producers see in FPT; the [note Skill](https://github.com/dcc-mcp/dcc-mcp-fpt/blob/c25b666783376a98bfe249c1e617557ca2ac84e1/src/dcc_mcp_fpt/skills/shotgrid-note/SKILL.md) carries review decisions back into that graph.

The adapter uses a pinned `fpt` CLI for transport. That binary is treated as an execution component rather than a second census product because both surfaces operate the same FPT authority and the adapter downloads it as part of its runtime contract.

## Evidence

- [Pinned adapter](https://github.com/dcc-mcp/dcc-mcp-fpt/tree/c25b666783376a98bfe249c1e617557ca2ac84e1)
- [Server composition](https://github.com/dcc-mcp/dcc-mcp-fpt/blob/c25b666783376a98bfe249c1e617557ca2ac84e1/src/dcc_mcp_fpt/server.py)
- [Batch production operations](https://github.com/dcc-mcp/dcc-mcp-fpt/blob/c25b666783376a98bfe249c1e617557ca2ac84e1/src/dcc_mcp_fpt/skills/shotgrid-batch/tools.yaml)
