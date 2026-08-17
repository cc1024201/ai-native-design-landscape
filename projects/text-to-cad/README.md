# Text to CAD

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

Text to CAD is a library of separately routed CAD, CAE and CAM skills spanning creation, local review, robot descriptions, part sourcing, slicing and cautious printer handoff. The core CAD skill produces STEP from prose or image requests and treats a browser viewer as an inspection surface rather than model authority.

## One artifact chain reaches fabrication

CAD source creates or edits geometry and exports STEP, STL, 3MF or GLB. A viewer displays local CAD and robot files. Other skills add DXF profiles, URDF/SRDF/SDF robot structure, off-the-shelf STEP parts, fabrication checks, real-slicer G-code and a dry-run-first Bambu Labs handoff.

This is not one opaque “make and print” agent: each stage has a distinct contract and safer authority transition. Parametric source and STEP preserve editable geometry; meshes and G-code are derived manufacturing artifacts. Starting a physical print is intentionally separate from generating or validating the file.

The project was discovered recursively because an ordinary CAD workspace referenced its installed plugin. That workspace is excluded as a consumer; the reusable upstream library is the product.

- [Pinned repository](https://github.com/earthtojake/text-to-cad/tree/bdaf8230140b658190d954b1e2d09c60b7c86716)
- [CAD skill](https://github.com/earthtojake/text-to-cad/blob/bdaf8230140b658190d954b1e2d09c60b7c86716/skills/cad/SKILL.md)
- [CAD viewer skill](https://github.com/earthtojake/text-to-cad/blob/bdaf8230140b658190d954b1e2d09c60b7c86716/skills/cad-viewer/SKILL.md)
- [Maintainer profile checked; no location published](https://github.com/earthtojake)
