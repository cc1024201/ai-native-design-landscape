# KiCad Copilot

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

KiCad Copilot is a file-oriented agent server for creating and changing hierarchical schematics and PCB layouts. It couples natural-language circuit operations with recoverable checkpoints, preview-before-apply placement and KiCad's own validation/export tools.

## Layout proposals cannot silently become boards

The [PCB workflow](https://github.com/biosshot/kicad-copilot/blob/09274069964436536d2195b0d138f124aadc5585/docs/pcb-layout/mcp-workflow.md) creates a mechanical PNG/SVG preview and a `layout_id`; the user reviews it before the stored proposal may be applied. [`store.ts`](https://github.com/biosshot/kicad-copilot/blob/09274069964436536d2195b0d138f124aadc5585/src/checkpoints/store.ts) preserves exact file checkpoints. Native parsing and writing are implemented for both [schematic](https://github.com/biosshot/kicad-copilot/blob/09274069964436536d2195b0d138f124aadc5585/src/kicad/schematic-writer.ts) and [PCB](https://github.com/biosshot/kicad-copilot/blob/09274069964436536d2195b0d138f124aadc5585/src/kicad/pcb-writer.ts) artifacts.

Saved KiCad files are authoritative. Placement, routing and pours stay separate, and final ERC/DRC is delegated to `kicad-cli` rather than inferred from the agent's plan.

## Evidence

- [Pinned repository](https://github.com/biosshot/kicad-copilot/tree/09274069964436536d2195b0d138f124aadc5585)
- [Placement DSL](https://github.com/biosshot/kicad-copilot/blob/09274069964436536d2195b0d138f124aadc5585/docs/pcb-layout/dsl.ts)
- [Complete native examples](https://github.com/biosshot/kicad-copilot/tree/09274069964436536d2195b0d138f124aadc5585/examples)
