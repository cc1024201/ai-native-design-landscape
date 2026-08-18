# Diagram Copilot by xidoke

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

Diagram Copilot by xidoke makes an `.arch` language the architecture authority. Parsing, validation and layout are separated so conversational edits do not directly scribble on React Flow state.

## Language first, layout second

At commit [`3e35581d`](https://github.com/xidoke/diagram-copilot/tree/3e35581de0d3907153c71d0af79f1e59cc4616d4), Langium services parse the DSL into typed core models. ELK derives layout and position state can live in companion JSON files.

## Proposed changes remain reversible

The product includes comparison and approval surfaces for edits plus snapshots for undo and redo. WebSocket synchronization updates the rendered graph without transferring semantic authority to the browser canvas.

## Design consequence

This architecture lets the agent reason in domain terms while humans inspect a visual projection. It is a stronger loop than text-to-image generation because accepted changes become readable source and can be versioned with the system specification.

## Evidence

- [Pinned monorepo](https://github.com/xidoke/diagram-copilot/tree/3e35581de0d3907153c71d0af79f1e59cc4616d4)
- [DSL contract](https://github.com/xidoke/diagram-copilot/blob/3e35581de0d3907153c71d0af79f1e59cc4616d4/docs/DSL.md)
- [Core workspace model](https://github.com/xidoke/diagram-copilot/blob/3e35581de0d3907153c71d0af79f1e59cc4616d4/packages/core/src/workspace.ts)
- [ELK layout](https://github.com/xidoke/diagram-copilot/blob/3e35581de0d3907153c71d0af79f1e59cc4616d4/packages/layout/src/layout.ts)
- [Comparison surface](https://github.com/xidoke/diagram-copilot/blob/3e35581de0d3907153c71d0af79f1e59cc4616d4/packages/web/src/components/ComparePane.tsx)
