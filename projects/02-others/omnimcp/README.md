# OmniMCP

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

OmniMCP is a general multimodal automation workspace whose inclusion rests on concrete Design artifact paths, not on the generic MCP label. Its single custom server implements office, image, vector, media, CAD, 3D and game tools and also coordinates external native-application MCP services.

## Different artifacts retain different authorities

[`omni_mcp.py`](https://github.com/Travor278/OmniMCP/blob/9c8ef287fe96c40b3440ffffec1aa14af8f0d8bf/omni_mcp.py) can create, read and edit PPTX; compose raster images; synthesize SVG and charts; invoke GIMP and Inkscape; run Blender and FreeCAD scripts; and create Godot projects. It does not collapse those formats into a universal scene graph: `.pptx`, layered/native applications, FreeCAD/STEP and Godot projects remain their own authorities.

The committed test report and output directory provide artifact-level evidence for the implemented operations. Third-party MCP services listed in workspace configuration are dependencies, not separately credited OmniMCP mechanisms. No reliable maintainer-region evidence was found.

## Evidence

- [Pinned repository](https://github.com/Travor278/OmniMCP/tree/9c8ef287fe96c40b3440ffffec1aa14af8f0d8bf)
- [Custom tool server](https://github.com/Travor278/OmniMCP/blob/9c8ef287fe96c40b3440ffffec1aa14af8f0d8bf/omni_mcp.py)
- [Execution evidence report](https://github.com/Travor278/OmniMCP/blob/9c8ef287fe96c40b3440ffffec1aa14af8f0d8bf/mcp_test/FINAL_REPORT.md)
