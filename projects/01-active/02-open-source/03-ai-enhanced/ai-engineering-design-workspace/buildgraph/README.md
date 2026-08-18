# BuildGraph

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

BuildGraph is a building-services engineering workspace in which the drawing, analytical model, compliance trace and bill of quantities are derived from one event-sourced project. Its AI copilot is deliberately subordinate to deterministic engineering authority: it may explain the current model but may not invent dimensions, loads, sizes or costs.

## One event log drives every view

Human edits on the SVG plan or editable Three.js view append typed layout events. The pure engineering core folds those events into topology and geometry, tracks dependent calculations, applies jurisdiction packs and derives sizing, pressure, compliance and cost. The same state projects into schematic, CAD, pressure and 3D views and into report and CSV delivery.

This means a dragged fixture is not a cosmetic override. Pipe length, velocity, catalog selection, network pressure, critical path, quantities and compliance are recomputed from the changed model. The repository's [`event model`](https://github.com/muhamadbyaba/Graph-Studio/tree/9cb234266ae06927dcdb1b2de3b0a8a65d8d9f9d/packages/engineering-core/src/events) supplies deterministic replay, undo and redo.

## The copilot can only read computed evidence

[`copilot.ts`](https://github.com/muhamadbyaba/Graph-Studio/blob/9cb234266ae06927dcdb1b2de3b0a8a65d8d9f9d/apps/studio/src/copilot/copilot.ts) gives Anthropic tool use access to a model-facts view and an element-specific calculation trace. Tool results come from the current deterministic snapshot. If no API key is configured, a grounded rules-based assistant still answers supported questions from the same engine.

The lower-level [`ToolBus`](https://github.com/muhamadbyaba/Graph-Studio/blob/9cb234266ae06927dcdb1b2de3b0a8a65d8d9f9d/packages/engineering-core/src/ai/toolbus.ts) distinguishes read, propose and apply side effects and records tool results; numeric guardrail code can reject figures absent from those results. The inspected studio copilot exposes read tools only, so it is an explanatory engineering agent rather than an autonomous geometry mutator.

## Persistence and collaboration preserve engineering authority

Workspaces persist accounts, event logs and projects as atomic JSON. Server-Sent Events fan accepted edits to invited collaborators; reloading replays the log through the current engine. Jurisdiction switching recomputes the same events under different constants rather than migrating copied spreadsheets.

IFC import supplies a section-cut floor plan underlay. Delivery includes a design report with calculation and compliance evidence plus a contractor-oriented BOQ CSV. These outputs are projections: the event log and jurisdiction data remain the recoverable source.

BuildGraph does not replace engineer-of-record approval, and the copilot's grounded wording does not validate the underlying jurisdiction pack. Its strong claim is traceable recomputation from one visual engineering model.

## Evidence

- [Pinned repository](https://github.com/muhamadbyaba/Graph-Studio/tree/9cb234266ae06927dcdb1b2de3b0a8a65d8d9f9d)
- [Reactive engineering core](https://github.com/muhamadbyaba/Graph-Studio/tree/9cb234266ae06927dcdb1b2de3b0a8a65d8d9f9d/packages/engineering-core/src/core)
