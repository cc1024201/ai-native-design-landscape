# KiSkill

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

KiSkill combines nine portable skills with a pure-Python `kx` engine for headless KiCad work. It reads, edits, renders, verifies and fabricates schematics and boards through a session state machine rather than allowing untracked raw text mutation.

## Nothing saves before geometric review

The project moves from clean discovery through probed and edited states, using byte-stable source handling, headless ERC/DRC, semantic and pixel diffs and rendered visual checks. Layout can use a DSN/SES autorouting loop; fabrication produces grouped BOM, placement and Gerber outputs only after review.

KiCad files retain authority and the same executable version is pinned for writing and verification. Optional simulation and external part services create explicit dependency boundaries rather than broad correctness guarantees.

- [Pinned repository](https://github.com/AvatarSD/KiSkill/tree/4375392763cbcda59b20dcecd6d43f102a013094)
- [Architecture and state machine](https://github.com/AvatarSD/KiSkill/blob/4375392763cbcda59b20dcecd6d43f102a013094/doc/DESIGN.md)
- [Review skill](https://github.com/AvatarSD/KiSkill/blob/4375392763cbcda59b20dcecd6d43f102a013094/skills/kicad-review/SKILL.md)
- [Maintainer profile: Kyiv Ukraine](https://github.com/AvatarSD)
