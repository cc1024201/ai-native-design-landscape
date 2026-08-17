# kicad-schematic by Ken Chan

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

This agent skill focuses narrowly on generating and repairing KiCad 8 schematics without guessing symbol pin coordinates. A bundled helper reads `.kicad_sym` libraries and handles the coordinate transform between library and schematic conventions.

## Exact pins are the safety boundary

Agents write Python through `SchematicBuilder`, attach labels at computed pin locations and run KiCad ERC over the resulting `.kicad_sch`. That makes the source library and generated native file inspectable and removes one common geometric failure class.

The skill does not cover PCB layout or prove circuit correctness. ERC confirms a class of structural/electrical-rule issues only.

- [Pinned repository](https://github.com/kenchangh/kicad-schematic/tree/5ebbc911a14d8c6f024ff6b08116bb8ff062d590)
- [Agent skill](https://github.com/kenchangh/kicad-schematic/blob/5ebbc911a14d8c6f024ff6b08116bb8ff062d590/SKILL.md)
- [Schematic helper](https://github.com/kenchangh/kicad-schematic/blob/5ebbc911a14d8c6f024ff6b08116bb8ff062d590/scripts/kicad_sch_helpers.py)
- [Maintainer profile: San Francisco](https://github.com/kenchangh)
