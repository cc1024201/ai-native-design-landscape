# DCC AI OpenAI Image

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

This package is a DCC-neutral Agent Skill for making and revising texture source images. It is narrower than an image editor: the product boundary is the prompt/reference-to-image step and its explicit handoff into a material pipeline.

## The handoff is the important artifact decision

[`generate_texture_source.py`](https://github.com/dcc-mcp/dcc-ai-openai-image/blob/ce827c3d6c3b190d81357051e3bb3d97276d0e1d/skill/openai-image-textures/scripts/generate_texture_source.py) creates an image from intent; [`edit_texture_source.py`](https://github.com/dcc-mcp/dcc-ai-openai-image/blob/ce827c3d6c3b190d81357051e3bb3d97276d0e1d/skill/openai-image-textures/scripts/edit_texture_source.py) carries a supplied image into a correction turn. Both return an `AssetDescriptor` rather than silently binding pixels to geometry.

The generated image is therefore creative source material, not a physically valid PBR material. UV ownership, baking, normal/roughness/height derivation and material binding stay with Blender, Maya, Houdini, Unreal or a deterministic texture pipeline. That explicit limitation is what makes this a reusable Design workflow rather than an overclaimed one-click material generator.

## Evidence

- [Pinned repository](https://github.com/dcc-mcp/dcc-ai-openai-image/tree/ce827c3d6c3b190d81357051e3bb3d97276d0e1d)
- [Installable Skill contract](https://github.com/dcc-mcp/dcc-ai-openai-image/blob/ce827c3d6c3b190d81357051e3bb3d97276d0e1d/skill/openai-image-textures/SKILL.md)
- [Typed tool manifest](https://github.com/dcc-mcp/dcc-ai-openai-image/blob/ce827c3d6c3b190d81357051e3bb3d97276d0e1d/skill/openai-image-textures/tools.yaml)
