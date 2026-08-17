# Qwen MM Plugins — FreeCAD

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

Qwen's FreeCAD component gives agents an object-level and Python path into a running parametric CAD document. It can create and edit document objects, insert library parts, inspect views and properties, run FEM and export neutral or presentation formats.

## The FCStd document remains authoritative

The skill begins by reading current documents and objects, applies named property changes, then re-reads state and visual views after mutation. A bundled FreeCADMCP add-on serves XML-RPC; screenshots are feedback while `.FCStd` retains parametric identity. STEP, STL, OBJ, DXF, PDF and spreadsheet files are outputs under an export boundary.

FEM requires an installed solver and valid analysis setup; returned stress values are not a certification. The separately packaged runtime and artifact graph justify a component record distinct from Qwen Blender.

- [Pinned component](https://github.com/QwenLM/Qwen-MM-Plugins/tree/8d6ea5a1f658260743307c52c2024ec87599fa48/src/capabilities/freecad)
- [Agent workflow](https://github.com/QwenLM/Qwen-MM-Plugins/blob/8d6ea5a1f658260743307c52c2024ec87599fa48/src/capabilities/freecad/skill/SKILL.md)
- [Object editing tool](https://github.com/QwenLM/Qwen-MM-Plugins/blob/8d6ea5a1f658260743307c52c2024ec87599fa48/src/capabilities/freecad/qwen_mm_plugins_freecad/tools/edit_object.py)
- [Qwen organization profile: China](https://github.com/QwenLM)
