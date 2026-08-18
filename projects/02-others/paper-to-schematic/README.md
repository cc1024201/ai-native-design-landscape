# Paper to Schematic

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

Paper to Schematic transcribes scanned arcade schematics into a structured board graph, human-verifiable component and net records, KiCad documents and physical probe/discrepancy outputs.

## Human review sits between vision and electrical source

Immutable scan pages are decoded and tiled; agent skills identify components without inventing pinouts; an Explorer UI lets a reviewer move, resize, verify and wire detections. The validated graph is then exported to per-sheet `.kicad_sch`, reparsed and optionally checked with KiCad ERC.

The project is domain-specific but its graph and skills are reusable across boards. Current evidence supports transcription and KiCad export; project-file wiring for some ERC exclusions remains unfinished.

- [Pinned repository](https://github.com/alanswx/paper-to-schematic/tree/8049fe64324922c654263023efde2bdf0356ba4e)
- [Schematic graph skill](https://github.com/alanswx/paper-to-schematic/blob/8049fe64324922c654263023efde2bdf0356ba4e/.agents/skills/schematic-graph/SKILL.md)
- [Explorer review skill](https://github.com/alanswx/paper-to-schematic/blob/8049fe64324922c654263023efde2bdf0356ba4e/.agents/skills/explorer/SKILL.md)
- [Maintainer profile: San Francisco California](https://github.com/alanswx)
