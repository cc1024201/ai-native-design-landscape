# PCBA Design Skills

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

PCBA Design Skills is a modular electronics team that can start from an idea, schematic, netlist-like drawing, PCB, BOM or fabrication package and produce reviewable artifacts through order preparation.

## Program state invalidates downstream work

`program-state.json` coordinates briefs, sourcing locks, circuit review, humanized schematics, layout experiments, release manifests and optional order records. A changed netlist, part/package or footprint invalidates dependent gates. Visual QA is mandatory beside ERC/DRC, with connectivity comparison preserving electrical meaning through schematic cleanup.

The workflow stops before consequential ordering unless the user approves. Its published case study demonstrates a real path, while the skills explicitly avoid treating zero opens or a successful upload as proof of correct assembly.

- [Pinned repository](https://github.com/Keitark/pcba-design-skills/tree/d41e9996f052016727403236cf0f7476f8f23a1b)
- [Program manager](https://github.com/Keitark/pcba-design-skills/blob/d41e9996f052016727403236cf0f7476f8f23a1b/.agents/skills/manage-pcba-program/SKILL.md)
- [Artifact contracts](https://github.com/Keitark/pcba-design-skills/blob/d41e9996f052016727403236cf0f7476f8f23a1b/docs/artifact-contracts.md)
- [Maintainer profile checked; no location published](https://github.com/Keitark)
