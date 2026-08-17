# KiCad Schematic Design Skill by Seahan

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

This portable skill creates, edits and reviews KiCad schematics from an explicit circuit contract. It requires exact library identities and footprints, preserves checkpoints and refuses guessed substitutes when package or symbol evidence is missing.

## Four checks separate visual and electrical claims

The workflow reopens the file in the installed KiCad version, runs ERC, performs structured analysis, verifies footprint availability and exports a PDF or screenshot for visual inspection. Clean ERC does not imply datasheet correctness, thermal margin or manufacturing readiness.

Native `.kicad_sch` is the working authority; rendered comparisons and reports are evidence. Published before/after screenshots demonstrate the workflow but are not a controlled performance benchmark.

- [Pinned repository](https://github.com/Seahan1/kicad-agent/tree/cbc0aeedcc1a6a7274d8689fa9e4b4305fa5eb9b)
- [Schematic skill](https://github.com/Seahan1/kicad-agent/blob/cbc0aeedcc1a6a7274d8689fa9e4b4305fa5eb9b/.agents/skills/kicad-schematic-design/SKILL.md)
- [Maintainer profile checked; no location published](https://github.com/Seahan1)
