# DCC Texture Pipeline

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

DCC Texture Pipeline is a deterministic preparation layer between generated or downloaded images and native DCC material binding. It packages OpenImageIO and OpenColorIO operations as two installable Skills with one color-and-texture governance boundary.

## Pixel conversion is named and reproducible

The OCIO Skill validates a supplied configuration and converts between explicit named color spaces. [`convert_image.py`](https://github.com/dcc-mcp/dcc-texture-pipeline/blob/744a621bb6aa97754617e94ee215b87496117d23/skill/ocio-color/scripts/convert_image.py) therefore records a semantic transform rather than applying an unnamed visual adjustment.

The OIIO Skill inspects source metadata and builds tiled mipmapped renderer textures. [`make_renderer_texture.py`](https://github.com/dcc-mcp/dcc-texture-pipeline/blob/744a621bb6aa97754617e94ee215b87496117d23/skill/oiio-textures/scripts/make_renderer_texture.py) materializes the optimized output while the source image and configuration remain available for reproduction. Maya, Blender, Houdini, 3ds Max or Unreal still own UVs and material assignment.

## Evidence

- [Pinned package](https://github.com/dcc-mcp/dcc-texture-pipeline/tree/744a621bb6aa97754617e94ee215b87496117d23)
- [OIIO texture Skill](https://github.com/dcc-mcp/dcc-texture-pipeline/blob/744a621bb6aa97754617e94ee215b87496117d23/skill/oiio-textures/SKILL.md)
- [OCIO color Skill](https://github.com/dcc-mcp/dcc-texture-pipeline/blob/744a621bb6aa97754617e94ee215b87496117d23/skill/ocio-color/SKILL.md)
