# Qwen MM Plugins — Blender

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

Qwen's separately installable Blender capability is a thin MCP client plus an agent skill for modeling, materials, lighting and rendering against a running Blender instance. It can discover installed add-ons, source or generate base assets, execute Python and verify the result with scene state and viewport evidence.

## Acquisition is explicitly not completion

The skill requires a build → refine → verify loop: imported or generated geometry must be rescaled, edited, shaded, composed and rendered until it matches the request. The bundled add-on and 22-tool surface mutate Blender's native scene; the `.blend` graph remains authoritative.

This component has its own plugin manifests, MCP configuration and runtime package, so it is separated from Qwen's FreeCAD and video-edit components rather than counting the umbrella repository as one Design product.

- [Pinned component](https://github.com/QwenLM/Qwen-MM-Plugins/tree/8d6ea5a1f658260743307c52c2024ec87599fa48/src/capabilities/blender)
- [Agent workflow](https://github.com/QwenLM/Qwen-MM-Plugins/blob/8d6ea5a1f658260743307c52c2024ec87599fa48/src/capabilities/blender/skill/SKILL.md)
- [Python execution tool](https://github.com/QwenLM/Qwen-MM-Plugins/blob/8d6ea5a1f658260743307c52c2024ec87599fa48/src/capabilities/blender/qwen_mm_plugins_blender/tools/execute_blender_code.py)
- [Qwen organization profile: China](https://github.com/QwenLM)
