# Electronics Agent Kit

> Research status: **Architecture-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

Electronics Agent Kit organizes schematic, PCB, firmware, verification, BOM and manufacturing work into specialized agents and workflows around KiCad and PlatformIO.

## Production strength is uneven across stages

Existing KiCad projects can be read, checked with ERC/DRC and exported into Gerber, BOM and placement files. Direct file manipulation supports simple changes, while the repository explicitly says template-based schematic assembly and safer protobuf operations are still being developed. This dossier therefore does not upgrade the example conversations into proof of general board generation.

Native KiCad files and firmware source remain authoritative; workflow outputs and manufacturing packages are staged deliverables. The source establishes the coordination architecture and current boundaries more strongly than a complete implementation for every claimed agent.

- [Pinned repository](https://github.com/o2scale/electronics-agent-kit/tree/705ba32a6d92c6182e1889d97a818ce73f3ee6f3)
- [Architecture](https://github.com/o2scale/electronics-agent-kit/blob/705ba32a6d92c6182e1889d97a818ce73f3ee6f3/docs/ARCHITECTURE.md)
- [Agent package](https://github.com/o2scale/electronics-agent-kit/tree/705ba32a6d92c6182e1889d97a818ce73f3ee6f3/.agent)
- [Maintainer profile checked; no location published](https://github.com/o2scale)
