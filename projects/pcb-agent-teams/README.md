# PCB-Agent-Teams

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

PCB-Agent-Teams is a ten-skill KiCad workspace that takes a board from topology discussion through part sourcing, schematic and PCB generation, independent checks and a fab-ready release package.

## STATUS.md and project folders carry the handoffs

Each project retains its compass, live status and artifact index, generated KiCad source, datasheets, analysis JSON, sourcing choices and timestamped release outputs. Skills can be run or repeated independently; mid-stage renders, simulation, ERC/DRC and human review can block progression.

Locale-specific sourcing is explicit and incomplete rather than silently substituted. The checked toolchain is tested on macOS/KiCad 10, with Linux partial and Windows board-writing unavailable, so platform reach is not inferred from the open skill format.

- [Pinned repository](https://github.com/Zane456/PCB-Agent-Teams/tree/87e622bc89594234db60cd87fbf9449322342685)
- [Schematic authoring skill](https://github.com/Zane456/PCB-Agent-Teams/blob/87e622bc89594234db60cd87fbf9449322342685/.claude/skills/draw-schematic/SKILL.md)
- [PCB verification skill](https://github.com/Zane456/PCB-Agent-Teams/blob/87e622bc89594234db60cd87fbf9449322342685/.claude/skills/check-pcb/SKILL.md)
- [Maintainer profile checked; no location published](https://github.com/Zane456)
