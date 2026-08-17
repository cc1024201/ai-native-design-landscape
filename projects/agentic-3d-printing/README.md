# Agentic 3D Printing

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

Agentic 3D Printing packages requirements, parametric construction, printability review and visual self-inspection into one Claude Code skill. The ordinary interaction is prose iteration, but the durable artifact is a parameterized Python CAD program.

## Manufacturing constraints enter before code

The workflow asks for purpose, critical dimensions, tolerances, mounting, material, printer and orientation. It then states the selected CAD kernel and construction strategy before writing code. A generator exports STL and reports its bounding box and volume; review checks wall thickness, feature size, overhang, bridge and clearance guidance.

A Three.js STL viewer lets the agent inspect several angles and revise source parameters. Python is the design authority; the CAD kernel resolves watertight geometry; STL/3MF are fabrication deliveries; the viewer is evidence. Worked examples preserve scripts, exports, images and handoff notes together.

The rules are practical heuristics, not certification. A passing watertightness or feature-size check cannot prove real load, material behavior or printer calibration.

- [Pinned repository](https://github.com/efdavis/agentic-3d-printing/tree/ced7fa1d006c3f3cd19bbbeaf4b258c64f3507cd)
- [Five-phase skill](https://github.com/efdavis/agentic-3d-printing/blob/ced7fa1d006c3f3cd19bbbeaf4b258c64f3507cd/SKILL.md)
- [CAD pattern library](https://github.com/efdavis/agentic-3d-printing/blob/ced7fa1d006c3f3cd19bbbeaf4b258c64f3507cd/references/cad-patterns.md)
- [Maintainer location evidence](https://github.com/efdavis)
