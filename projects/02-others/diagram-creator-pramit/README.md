# Diagram Creator

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

Pramit De's Diagram Creator is a compact agent-to-deliverable pipeline. It begins with textual Eraser notation but deliberately emits more than a rendered image.

## Materialization path

At [`8e7f29e1`](https://github.com/Pramit726/Diagram-creator/tree/8e7f29e1867b0a6b23fb8de3d72f9fde572fcd41), an agent contract guides source creation. Python scripts interpret that source and produce PNG and DOT alongside draw.io output.

The draw.io file is decisive for this census: a recipient can open and revise native shapes without returning to the generating agent.

## Scope and limits

There is no persistent collaborative workspace or bidirectional synchronization among the formats. This is a filesystem delivery tool whose editability comes from the downstream native artifact.

## Evidence

- [Pinned source](https://github.com/Pramit726/Diagram-creator/tree/8e7f29e1867b0a6b23fb8de3d72f9fde572fcd41)
- [Agent instructions](https://github.com/Pramit726/Diagram-creator/blob/8e7f29e1867b0a6b23fb8de3d72f9fde572fcd41/agent.md)
- [Generator implementation](https://github.com/Pramit726/Diagram-creator/blob/8e7f29e1867b0a6b23fb8de3d72f9fde572fcd41/os_hc.py)
- [Native draw.io result](https://github.com/Pramit726/Diagram-creator/blob/8e7f29e1867b0a6b23fb8de3d72f9fde572fcd41/creations/d4.drawio)
