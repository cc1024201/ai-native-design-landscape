# DBX

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

DBX is a multi-database workspace where AI, MCP and visual schema surfaces meet at the executable database. The ERD is important because it projects the same structure that agent-generated SQL can change.

## Execution is behind policy gates

At commit [`e9e0d04a`](https://github.com/t8y2/dbx/tree/e9e0d04a2cb1be84c39f4035fe97fe080840cb0d), the AI assistant proposes and explains SQL while tests distinguish read behavior from write execution and confirmation. MCP connection scopes limit what external agents can reach.

## Database schema owns the design

Schema browsing and editing operate against live connections. ERD and field-lineage dialogs visualize tables and transformations; they do not maintain a separate decorative graph. Accepted SQL or MCP operations change the authority that those views next render.

## Design interpretation

DBX expands the landscape beyond drawing tools: design is executable data-model translation under safety policy. Visual feedback is a projection and review surface for changes whose final truth is the database.

## Evidence

- [Pinned monorepo](https://github.com/t8y2/dbx/tree/e9e0d04a2cb1be84c39f4035fe97fe080840cb0d)
- [AI assistant UI](https://github.com/t8y2/dbx/blob/e9e0d04a2cb1be84c39f4035fe97fe080840cb0d/apps/desktop/src/components/editor/AiAssistant.vue)
- [AI write-policy tests](https://github.com/t8y2/dbx/blob/e9e0d04a2cb1be84c39f4035fe97fe080840cb0d/packages/app-tests/aiSqlExecutionPolicy.test.ts)
- [MCP server contract](https://github.com/t8y2/dbx/blob/e9e0d04a2cb1be84c39f4035fe97fe080840cb0d/packages/mcp-server/README.md)
- [Field-lineage surface](https://github.com/t8y2/dbx/blob/e9e0d04a2cb1be84c39f4035fe97fe080840cb0d/apps/desktop/src/components/lineage/FieldLineageDialog.vue)
