# Tabularis

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

Tabularis joins text-to-SQL, controlled MCP operations, a schema editor, ERD, notebooks and charts in one database workspace. Its artifact authority is the connected schema and query history rather than a standalone diagram file.

## AI actions expose approval state

At [`e8006188`](https://github.com/TabularisDB/tabularis/tree/e8006188b2165a2f81d3379c7227027074b7f6a6), Tauri commands build schema-aware AI context and route risky operations through approval state. The frontend shows an explicit approval gate rather than hiding execution behind conversational prose.

## Visual schema is a live projection

Schema Diagram pages derive nodes and relationships from connection metadata. Users can reason spatially about the model while SQL and MCP act on the actual database. Notebooks and explain views add further evidence around those changes.

## Product boundary

The ERD is one first-class surface of Tabularis and is counted with the database product once. AI query generation and MCP are not separate products because they share configuration, connection authority and approval policy.

## Evidence

- [Pinned repository](https://github.com/TabularisDB/tabularis/tree/e8006188b2165a2f81d3379c7227027074b7f6a6)
- [Schema-aware AI context](https://github.com/TabularisDB/tabularis/blob/e8006188b2165a2f81d3379c7227027074b7f6a6/src-tauri/src/ai_schema_context.rs)
- [AI approval engine](https://github.com/TabularisDB/tabularis/blob/e8006188b2165a2f81d3379c7227027074b7f6a6/src-tauri/src/ai_approval.rs)
- [Approval gate UI](https://github.com/TabularisDB/tabularis/blob/e8006188b2165a2f81d3379c7227027074b7f6a6/src/components/modals/AiApprovalGate.tsx)
- [Schema diagram surface](https://github.com/TabularisDB/tabularis/blob/e8006188b2165a2f81d3379c7227027074b7f6a6/src/pages/SchemaDiagramPage.tsx)
- [MCP protocol](https://github.com/TabularisDB/tabularis/blob/e8006188b2165a2f81d3379c7227027074b7f6a6/src-tauri/src/mcp/protocol.rs)
