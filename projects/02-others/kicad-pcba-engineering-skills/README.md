# KiCad PCBA Engineering Skills

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

This Codex-oriented suite routes requirements, schematic, PCB, library, high-speed/power, repair and release work through ten focused skills around KiCad 10.

## Release readiness is an evidence state

A PowerShell wrapper runs official ERC/DRC, parity and zone checks, exports manufacturing files, validates Gerber/drill/BOM/CPL content and writes a machine-readable manifest. The final status remains `NOT_READY_FOR_PCBA_UPLOAD` until every required item is verified; a successful export alone cannot produce `PASS`.

The repository uses live installed documentation, libraries and board-house constraints instead of vendoring them. This keeps source provenance clear but means external specifications must be rechecked at execution time.

- [Pinned repository](https://github.com/tsukimori-dev/kicad-pcba-engineering-skills/tree/53d4c42365646e48b96a729562f9aaf83b39c94d)
- [Routing skill](https://github.com/tsukimori-dev/kicad-pcba-engineering-skills/blob/53d4c42365646e48b96a729562f9aaf83b39c94d/kicad-pcba-engineering-suite/SKILL.md)
- [CLI automation](https://github.com/tsukimori-dev/kicad-pcba-engineering-skills/blob/53d4c42365646e48b96a729562f9aaf83b39c94d/kicad-cli-automation/scripts/run-kicad-check.ps1)
- [Maintainer profile checked; no location published](https://github.com/tsukimori-dev)
