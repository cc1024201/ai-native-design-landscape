# Penpot MCP Server

> Research status: **Source-level** · Lifecycle: **active-transition** · Last reviewed: **2026-08-12**

ZCube's Penpot MCP Server maps agent calls onto Penpot's native HTTP API. It is broader than a screenshot reader: agents can create files and pages, write shapes, manage components and tokens, address comments and collaboration state and export host-rendered artifacts.

## Penpot remains authoritative

[`penpot-client.ts`](https://github.com/zcube/penpot-mcp-server/blob/389545cfacffaca7465eedac90892f0db92e1f16/src/penpot-client.ts) handles authenticated host operations. Tool modules separate file, page, shape, component, library, comment, media, team and snapshot concerns. For example [`shape-tools.ts`](https://github.com/zcube/penpot-mcp-server/blob/389545cfacffaca7465eedac90892f0db92e1f16/src/tools/shape-tools.ts) creates and mutates native objects while [`snapshot-tools.ts`](https://github.com/zcube/penpot-mcp-server/blob/389545cfacffaca7465eedac90892f0db92e1f16/src/tools/snapshot-tools.ts) exposes revision-aware state.

```text
agent -> MCP schemas -> Penpot API/session revision -> native file graph
                                             -> Penpot UI review/edit
                                             -> PNG/SVG/PDF export
```

Batch and session revision parameters are the concurrency boundary; the server does not create an independent canvas authority. Deleting native files, pages or team objects through exposed tools is materially destructive and must be gated by the calling agent. Exported files are delivery views rather than reversible graph snapshots.

The pinned repository has no license file. The maintainer profile reports Seoul in South Korea.

## Commit-level record

- [Source tree](https://github.com/zcube/penpot-mcp-server/tree/389545cfacffaca7465eedac90892f0db92e1f16)
- [Tool registration](https://github.com/zcube/penpot-mcp-server/blob/389545cfacffaca7465eedac90892f0db92e1f16/src/index.ts)
- [Component tools](https://github.com/zcube/penpot-mcp-server/blob/389545cfacffaca7465eedac90892f0db92e1f16/src/tools/component-tools.ts)
- [Examples](https://github.com/zcube/penpot-mcp-server/blob/389545cfacffaca7465eedac90892f0db92e1f16/EXAMPLES.md)
