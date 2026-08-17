# KiCad Happy

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

KiCad Happy treats AI-native electronics design as review governance rather than prompt-to-board generation. Its installable skills read schematics, PCB layouts and fabrication outputs, connect them to datasheets and sourcing evidence, and decide whether a board is ready to release.

## Findings carry provenance and can become regression gates

The [KiCad skill contract](https://github.com/aklofas/kicad-happy/blob/34d72c7f2a89de53d64fbc9618617fb6877160a1/skills/kicad/SKILL.md) separates deterministic parsing from semantic review. Native S-expressions and Gerbers are the source evidence; normalized findings record the detector, location and confidence instead of collapsing review into prose. [`diff_analysis.py`](https://github.com/aklofas/kicad-happy/blob/34d72c7f2a89de53d64fbc9618617fb6877160a1/skills/kicad/scripts/diff_analysis.py) limits re-review to changed design facts, and [`fab_release_gate.py`](https://github.com/aklofas/kicad-happy/blob/34d72c7f2a89de53d64fbc9618617fb6877160a1/skills/kicad/scripts/fab_release_gate.py) turns those facts into an explicit production decision.

This creates a correction loop without pretending the reviewer owns the board. KiCad files remain authoritative; reports and machine-readable findings are evidence artifacts. Recurring semantic problems can be promoted to deterministic assertions, so review history improves the gate rather than merely accumulating chat.

## Evidence

- [Pinned repository](https://github.com/aklofas/kicad-happy/tree/34d72c7f2a89de53d64fbc9618617fb6877160a1)
- [Design-intent model](https://github.com/aklofas/kicad-happy/blob/34d72c7f2a89de53d64fbc9618617fb6877160a1/skills/kicad/references/design-intent.md)
- [Maintainer profile: Sacramento, California](https://github.com/aklofas)
