# Quilter

> Research status: **Architecture-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

Quilter defines AI PCB design as physics-constrained candidate exploration. An engineer uploads an Altium, Cadence, Siemens or KiCad project, fixes the board outline, pre-places connectors and establishes a floorplan; Quilter then searches placement and routing possibilities rather than assuming freedom over those constraints.

## Abundant layouts remain review candidates

The [official workflow](https://www.quilter.ai/) says the system can generate hundreds of alternatives in parallel and evaluates each against the supplied physical constraints. It identifies critical nets and considerations it will and will not cover before generation, so automation scope is inspectable. Engineers review candidates, make adjustments and can vary stack-up, manufacturer or form factor without collapsing the alternatives into one opaque answer.

Quilter returns the project in the same native format it received. Final DRC, polishing and fabrication files remain in the user's EDA tool; the hosted result is a candidate, not a replacement source of truth. This creates three distinct authorities: imported electrical intent and floorplan constraints, Quilter's physics-validated candidate set, and the promoted native project that the engineer finishes. Public evidence supports that architecture but not the private reinforcement-learning implementation.

## Evidence

- [Quilter product and workflow](https://www.quilter.ai/)
- [Quilter documentation](https://docs.quilter.ai/)
- [Technology overview](https://www.quilter.ai/technology)
