# Circuit Weaver

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

Circuit Weaver is a programmatic KiCad design system for AI-assisted hardware workflows. Claude Code, Codex, MCP, HTTP and CLI surfaces converge on one contract: describe a circuit, validate it, generate KiCad artifacts and advance only when evidence supports the next manufacturing stage.

## Design IR and KiCad artifacts divide responsibility

Structured design JSON captures components, nets, constraints and provenance before generation. The dispatcher exposes validation, patching, generation, diff, review and project-state operations across public surfaces. Generated KiCad schematics and boards become native editable engineering artifacts; the IR and logs preserve upstream intent and validation evidence.

The capability registry distinguishes static parsing from KiCad-load, ERC and fabrication-ready evidence. A successful command is therefore not automatically a verified circuit. Placement viewers, PCB feedback ingestion, simulation and manufacturing-readiness checks add stage-specific evidence without collapsing them into one “pass.”

## Resume, patch and export

Project state supports status and resume rather than requiring a fresh prompt after interruption. Patch operations revise structured intent; generation re-materializes domain artifacts. Gerber, BOM and placement exports are review-gated downstream deliverables, not the sole source of truth.

## Evidence boundary

The repository labels many capabilities experimental or review-only. Datasheet accuracy, electrical safety, layout integrity and manufacturer acceptance still require qualified review and external tools.

- [Pinned Circuit Weaver revision](https://github.com/mattpainter701/kicad_automations/tree/cc5385b1f6e2cae36a0fff31d0e0223e89d28e0d)
- [Generated capability and verification contract](https://github.com/mattpainter701/kicad_automations/blob/cc5385b1f6e2cae36a0fff31d0e0223e89d28e0d/README.md)
- [Design IR implementation](https://github.com/mattpainter701/kicad_automations/blob/cc5385b1f6e2cae36a0fff31d0e0223e89d28e0d/src/circuit_weaver/design_ir.py)
- [Unified dispatcher](https://github.com/mattpainter701/kicad_automations/blob/cc5385b1f6e2cae36a0fff31d0e0223e89d28e0d/src/circuit_weaver/dispatcher.py)
