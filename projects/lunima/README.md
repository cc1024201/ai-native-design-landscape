# Lunima

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

Lunima is a photonic-circuit design workspace in which an Anthropic tool loop operates the same process-aware grid as manual editing. It defines Design through component placement, optical connectivity, simulation and foundry-oriented delivery rather than visual plausibility alone.

## The photonic model is authoritative

Lunima opens and saves `.lun` projects backed by its structured photonic intermediate representation. Components, ports, connections, parameters, groups and process-design-kit constraints remain editable domain objects. The rendered grid is a view of that model, not a flattened drawing.

## AI has parity with domain operations

[`AiService.cs`](https://github.com/aignermax/Lunima/blob/7d9377c0ae53345a45839199210a1269ef9da8a7/CAP.Avalonia/Services/AiService.cs) implements the Anthropic request-and-tool loop. [`AiGridService.cs`](https://github.com/aignermax/Lunima/blob/7d9377c0ae53345a45839199210a1269ef9da8a7/CAP.Avalonia/Services/AiGridService.cs) maps requests onto the application's grid services rather than letting a model invent serialized project state.

Typed tools can inspect state and available component types, place devices, connect ports, change values, run simulations, clear or copy regions, fit the view, group and ungroup objects and save prefabs. For example, [`PlaceComponentTool`](https://github.com/aignermax/Lunima/blob/7d9377c0ae53345a45839199210a1269ef9da8a7/CAP.Avalonia/Services/AiTools/GridTools/PlaceComponentTool.cs) passes through the same placement constraints used by the editor. Invalid domain operations therefore fail at the application boundary instead of becoming plausible-looking geometry.

## Simulation and fabrication constrain the result

The AI can invoke simulation and inspect light values, but analysis remains downstream of the canonical circuit. Export paths include netlists, Nazca, gdsfactory and GDS-oriented workflows. [`GdsFactoryExporter.cs`](https://github.com/aignermax/Lunima/blob/7d9377c0ae53345a45839199210a1269ef9da8a7/CAP.Avalonia/Services/GdsFactoryExport/GdsFactoryExporter.cs) shows that delivery is a process-aware transformation, not a screenshot export.

## History and openness

Manual and agent mutations participate in the application's undo/redo command model, and the open `.lun` representation keeps ownership outside a hosted AI provider. The pinned code is still an evolving engineering tool: a successful grid edit does not by itself prove foundry readiness, and each downstream export or simulation path retains its own validation requirements.

## Evidence

- [Pinned repository](https://github.com/aignermax/Lunima/tree/7d9377c0ae53345a45839199210a1269ef9da8a7)
- [AI grid tools](https://github.com/aignermax/Lunima/tree/7d9377c0ae53345a45839199210a1269ef9da8a7/CAP.Avalonia/Services/AiTools/GridTools)
