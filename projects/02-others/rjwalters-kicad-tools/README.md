# kicad-tools by Robb Walters

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

kicad-tools is a Python/CLI foundation for agents to parse, analyze and mutate KiCad schematics and boards without driving the GUI. It adds JSON-shaped access, programmatic repair, manufacturer-aware checks, routing support, MCP and fabrication export around native `.kicad_sch` and `.kicad_pcb` files.

## Structured reasoning meets native files

Agents can export board state for layout decisions, apply geometric operations and save a new native file. ERC/DRC, schematic parity, renders and downloadable fabrication packages verify different failure classes; none is accepted as a substitute for the others. The live gallery projects boards into 2D/3D inspection but the KiCad documents remain authoritative.

The package is both infrastructure and an independently usable workflow. Its APIs do not certify electrical or manufacturing correctness beyond the checks actually run.

- [Pinned repository](https://github.com/rjwalters/kicad-tools/tree/c7313b398bc1f28499baa0c23ae88cda85c118e4)
- [Source package](https://github.com/rjwalters/kicad-tools/tree/c7313b398bc1f28499baa0c23ae88cda85c118e4/src/kicad_tools)
- [MCP surface](https://github.com/rjwalters/kicad-tools/tree/c7313b398bc1f28499baa0c23ae88cda85c118e4/src/kicad_tools/mcp)
- [Maintainer profile checked; no location published](https://github.com/rjwalters)
