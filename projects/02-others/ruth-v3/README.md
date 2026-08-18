# RUTH V3

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

RUTH V3 is a general desktop assistant with a concrete physical-design route: a voice or text request becomes editable build123d code and geometry, appears in a Three.js CAD window, then can be sliced and sent toward a 3D printer.

## Code keeps the model revisable

[`cad_agent.py`](https://github.com/mkk2026/RUTH-V3/blob/17fd3c37650484fd36c50e97783079eb16352b93/backend/cad_agent.py) coordinates generation while the built-in CAD plugin executes model operations. [`CadWindow.jsx`](https://github.com/mkk2026/RUTH-V3/blob/17fd3c37650484fd36c50e97783079eb16352b93/src/components/CadWindow.jsx) provides visual inspection rather than reducing the result to an attachment. STL and slicing are delivery projections; the build123d program/model remains the correction authority.

The README references `nazirlouis/ruth_v3`, but that repository was unavailable at review time. This record counts only the inspectable `mkk2026/RUTH-V3` product and marks the upstream/history claim unresolved. The current maintainer profile identifies Freetown, Sierra Leone.

## Evidence

- [Pinned repository](https://github.com/mkk2026/RUTH-V3/tree/17fd3c37650484fd36c50e97783079eb16352b93)
- [Built-in CAD plugin](https://github.com/mkk2026/RUTH-V3/blob/17fd3c37650484fd36c50e97783079eb16352b93/backend/plugins/builtin/cad_plugin.py)
- [Printer agent](https://github.com/mkk2026/RUTH-V3/blob/17fd3c37650484fd36c50e97783079eb16352b93/backend/printer_agent.py)
- [Maintainer profile](https://github.com/mkk2026)
