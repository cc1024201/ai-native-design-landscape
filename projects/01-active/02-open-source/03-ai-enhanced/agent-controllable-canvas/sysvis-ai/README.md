# SysVis.AI

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

SysVis.AI is a system-design canvas that accepts three starting authorities—natural language, an image/sketch, or Mermaid code—and converges them into an editable graph.

## Local models make two paths inspectable

The browser can run Qwen3-0.6B for text generation and ViT-GPT2 for vision-to-layout, with cloud AI as another route. Local execution reduces data movement but does not make the small models infallible. Their output is materialized as nodes and edges rather than accepted as a finished screenshot.

## Canvas and code remain coupled

A Monaco source editor, React-style interactive graph, and Dagre layout provide alternate mutation and projection surfaces. Dragging, layout, zoom, and time-travel undo make generated structure directly correctable.

## Image reconstruction has the weakest lineage

A sketch-to-graph result is an interpretation, while Mermaid begins with explicit relations. Both can arrive at the same editor, but confidence should differ. The product proves editable conversion and recovery, not exact visual or semantic reproduction.

## Pinned evidence

- Repository: [vndangkhoa/Sys-Arc-Visl](https://github.com/vndangkhoa/Sys-Arc-Visl)
- Inspected implementation: [`15230bf45c31fc57a8a13fa74b2007cf715dc797`](https://github.com/vndangkhoa/Sys-Arc-Visl/tree/15230bf45c31fc57a8a13fa74b2007cf715dc797)
- Immutable revision: [commit `15230bf`](https://github.com/vndangkhoa/Sys-Arc-Visl/commit/15230bf45c31fc57a8a13fa74b2007cf715dc797)
