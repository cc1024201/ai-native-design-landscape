# circuits by Misko

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

This two-skill system takes code-generated KiCad boards through placement, routing, verification and fabrication/order preparation. It is built from failures that passed a single DRC gate while remaining electrically or physically wrong.

## Code generates both schematic and board

Python emits `.kicad_sch` and drives `pcbnew` for board geometry; KiCadRoutingTools handles routing; KiCad supplies collision geometry, zone fill, ERC/DRC, parity and plots. Design rules are fixed before routing and source is diffable and regenerable.

The JLCPCB skill then checks live stock, part identity, rotation and release files. The workflow shows why DRC and connectivity must remain separate gates and why a fabricated output is not automatically a correct product.

- [Pinned repository](https://github.com/misko/circuits/tree/e822cf5a23d42b66bd41bae380237f1e121e8448)
- [PCB design skill](https://github.com/misko/circuits/blob/e822cf5a23d42b66bd41bae380237f1e121e8448/skills/kicad-pcb/SKILL.md)
- [Fabrication skill](https://github.com/misko/circuits/blob/e822cf5a23d42b66bd41bae380237f1e121e8448/skills/jlcpcb-fab/SKILL.md)
- [Maintainer profile checked; no location published](https://github.com/misko)
