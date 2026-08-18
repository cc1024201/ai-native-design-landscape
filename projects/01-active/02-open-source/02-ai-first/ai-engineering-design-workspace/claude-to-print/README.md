# Claude-To-Print

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

Claude-To-Print is an independently maintained derivative of Multi-Agent CAD that narrows the job to print-ready parts and adds multi-color manufacturing delivery. Claude follows staged skills, writes build123d source and produces STEP, STL and colored 3MF.

## Parametric source survives the print

Dimensions are named constants in a build123d script. The OpenCascade model resolves geometry; trimesh checks watertightness, body count, dimensions and volume. Multi-color work splits regions, checks overlaps and writes per-region STL plus a pre-colored 3MF. Four-view rendering is an opt-in visual check because it incurs model vision cost.

The script is canonical: a later dimensional change edits a constant and reruns QA. STEP, STL and 3MF are manufacturing deliveries. The project explicitly records that geometric QA missed a kinematic collision caught by a person in the slicer preview, preserving the human acceptance boundary.

## Derivative identity

The project credits Multi-Agent CAD's compact-state and build123d practices, but replaces its LangGraph/Aider pipeline with direct skills and adds color-region and 3MF mechanisms. Those changes create a separately usable product rather than a mirror.

- [Pinned Claude-To-Print revision](https://github.com/OzAILabs/Claude-To-Print/tree/d81f21f71dfd27e9013cfc2585849473a92233f2)
- [Workflow and upstream attribution](https://github.com/OzAILabs/Claude-To-Print/blob/d81f21f71dfd27e9013cfc2585849473a92233f2/README.md)
- [Single-color CAD skill](https://github.com/OzAILabs/Claude-To-Print/blob/d81f21f71dfd27e9013cfc2585849473a92233f2/skills/text-to-cad/SKILL.md)
- [3MF exporter](https://github.com/OzAILabs/Claude-To-Print/blob/d81f21f71dfd27e9013cfc2585849473a92233f2/skills/text-to-cad-color/export_3mf.py)
