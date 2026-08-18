# EasyEDA Copilot

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

EasyEDA Copilot defines AI electronics design as a reversible conversation with the live EasyEDA Pro project. The released extension can assemble and complete schematics, search LCSC parts, reuse subcircuits and run simulations; its companion MCP server adds placement, routing and DRC without replacing the native editor.

## A PCB proposal must survive a visual gate before mutation

The PCB flow first renders a mechanical preview and returns a proposal identifier. The [review-before-apply contract](https://github.com/biosshot/easyeda-copilot/blob/50bd74a97406d2eeb94194225516f32b3ae7893c/mcp/docs/pcb-layout/mcp-workflow.md) keeps that proposal separate until a person accepts it. [Checkpoint tools](https://github.com/biosshot/easyeda-copilot/blob/50bd74a97406d2eeb94194225516f32b3ae7893c/mcp/src/tools/checkpoint.ts) bracket mutations, while the extension's own [checkpointer](https://github.com/biosshot/easyeda-copilot/blob/50bd74a97406d2eeb94194225516f32b3ae7893c/src/eda/checkpointer.ts) gives the in-editor workflow the same recovery boundary.

The EasyEDA document graph remains authoritative. Preview geometry is a candidate, routing is a separate operation, and [DRC](https://github.com/biosshot/easyeda-copilot/blob/50bd74a97406d2eeb94194225516f32b3ae7893c/mcp/src/tools/drc.ts) is an explicit engineering check rather than an LLM assertion. This is counted separately from KiCad Copilot because it ships a different extension and operates a different host-native graph.

## Evidence

- [Pinned repository](https://github.com/biosshot/easyeda-copilot/tree/50bd74a97406d2eeb94194225516f32b3ae7893c)
- [MCP engineering contract](https://github.com/biosshot/easyeda-copilot/blob/50bd74a97406d2eeb94194225516f32b3ae7893c/mcp/docs/SKILL.md)
- [Native schematic operations](https://github.com/biosshot/easyeda-copilot/blob/50bd74a97406d2eeb94194225516f32b3ae7893c/src/eda/schematic.ts)
