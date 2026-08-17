# Sand

> Research status: **Source-level** · Lifecycle: **active-transition** · Last reviewed: **2026-08-12**

Sand is a component-driven design canvas in which agents and people edit a `.sand` document composed from real React component adapters. The canvas does not generate application code; it externalizes UI structure and visual decisions so a coding agent can implement them with screenshot and comment evidence.

## The `.sand` graph is the shared object

[`schema.ts`](https://github.com/kno-raziel/sand-canvas/blob/f527871333ca779ef51071e61b188d2324e67df9/packages/core/src/document/schema.ts) defines the versioned document. [`io.ts`](https://github.com/kno-raziel/sand-canvas/blob/f527871333ca779ef51071e61b188d2324e67df9/packages/core/src/document/io.ts) provides the file boundary. Adapter metadata determines which component props are legal while the editor renders those components on an infinite screen canvas.

Human changes pass through the editor store and Immer-backed undo history. [`useAutoSave.ts`](https://github.com/kno-raziel/sand-canvas/blob/f527871333ca779ef51071e61b188d2324e67df9/apps/editor/src/hooks/useAutoSave.ts) connects them to the file. On the agent path, [`document-manager.ts`](https://github.com/kno-raziel/sand-canvas/blob/f527871333ca779ef51071e61b188d2324e67df9/packages/mcp-server/src/document-manager.ts) and `batch_design` expose insert, update, delete, copy, replace and move operations against the same graph.

```text
agent batch operations <-> .sand JSON <-> canvas/component renderer
                                  ^       <-> human edits/comments
                                  \-> PNG screenshot -> coding-agent evidence
```

Comments form an explicit human-agent correction channel. Screenshots are delivery evidence, not the editable authority. Since Sand intentionally delegates final code generation, fidelity into a production repository is a separate agent step with no automatic round-trip.

The project is MIT-licensed. No reliable team-region evidence was found.

## Source anchors

- [Pinned repository](https://github.com/kno-raziel/sand-canvas/tree/f527871333ca779ef51071e61b188d2324e67df9)
- [Canvas renderer](https://github.com/kno-raziel/sand-canvas/blob/f527871333ca779ef51071e61b188d2324e67df9/apps/editor/src/canvas/SandCanvas.tsx)
- [MCP batch writer](https://github.com/kno-raziel/sand-canvas/blob/f527871333ca779ef51071e61b188d2324e67df9/packages/mcp-server/src/tools/batch-design.ts)
- [MIT license](https://github.com/kno-raziel/sand-canvas/blob/f527871333ca779ef51071e61b188d2324e67df9/LICENSE)
