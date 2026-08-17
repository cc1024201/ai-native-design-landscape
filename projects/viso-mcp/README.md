# Viso MCP

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

Viso MCP is not one diagram editor. It is a file-backed modeling protocol that gives agents and humans shared access to ERDs, BPMN processes and system landscapes.

## The file is inside the loop

At [`7830f156`](https://github.com/fawisi/viso-mcp/tree/7830f156eaaa866641ad64ea6da19c81e8b06fdd), MCP tools create and mutate typed models while file watchers ingest outside edits. Writes are atomic, and layout positions can live in sidecars instead of contaminating semantic source such as DBML.

## Visual editing is a projection with a return path

The React Flow editor uses ELK for layout, but it is not a disposable viewer. Structural changes return to the store and its persisted model; manual position changes are preserved separately. That is a genuine source-authority/live-projection architecture.

## Boundary and delivery

The product spans several notations but keeps one design claim: agents can work on a durable model that a person can inspect and rearrange. Export is downstream of that shared authority rather than the only artifact.

## Evidence

- [Pinned repository](https://github.com/fawisi/viso-mcp/tree/7830f156eaaa866641ad64ea6da19c81e8b06fdd)
- [MCP tool contract](https://github.com/fawisi/viso-mcp/blob/7830f156eaaa866641ad64ea6da19c81e8b06fdd/src/tools.ts)
- [Store and persistence](https://github.com/fawisi/viso-mcp/blob/7830f156eaaa866641ad64ea6da19c81e8b06fdd/src/store.ts)
- [Visual editor](https://github.com/fawisi/viso-mcp/blob/7830f156eaaa866641ad64ea6da19c81e8b06fdd/src/preview/VisoEditor.tsx)
