# KiCad Skills by mash

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

This package forces every agent read and write through one `kicad-tool` CLI, then layers a functional-edit workflow and a separate visual schematic-cleanup loop on top.

## Connectivity and appearance have different stages

Stage 1 plans structural symbol, wire, label and footprint changes with dry runs, baseline diffs, ERC, netlist and DRC. Stage 2 improves a rendered sheet score—collisions, bends and clearances—without changing connectivity. Region renders let the agent inspect only the affected area while preserving UUIDs and surrounding formatting.

Native schematic and board files remain authoritative. The tool refuses unsafe raw access and locked-footprint mutation, but its structural gates cannot prove circuit intent or manufacturing suitability.

- [Pinned repository](https://github.com/mash/kicad-skills/tree/a74dbcb96d0fcd98aa597061ef89e4f1b1aec7b4)
- [Unified tool skill](https://github.com/mash/kicad-skills/blob/a74dbcb96d0fcd98aa597061ef89e4f1b1aec7b4/skills/kicad-tool/SKILL.md)
- [Visual cleanup loop](https://github.com/mash/kicad-skills/blob/a74dbcb96d0fcd98aa597061ef89e4f1b1aec7b4/skills/kicad-sch-cleanup-loop/SKILL.md)
- [Maintainer profile checked; no location published](https://github.com/mash)
