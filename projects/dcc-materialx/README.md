# DCC MaterialX

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

DCC MaterialX is an installable look-development Skill centered on the portable `.mtlx` document rather than one application's shader graph. It creates a minimal Standard Surface material, lists nodes and validates the resulting MaterialX graph before a host translates or assigns it.

## Portability comes from refusing to own host translation

[`create_standard_surface.py`](https://github.com/dcc-mcp/dcc-materialx/blob/34c478987c2887a506f97af4f34b4d502eb04f9b/skill/materialx-lookdev/scripts/create_standard_surface.py) writes the canonical material document through the official Python bindings. [`validate_document.py`](https://github.com/dcc-mcp/dcc-materialx/blob/34c478987c2887a506f97af4f34b4d502eb04f9b/skill/materialx-lookdev/scripts/validate_document.py) checks the saved graph independently of a Maya, Houdini, Blender, USD/Hydra or Unreal interpretation.

The filesystem document is authoritative. Renderer translation, scene assignment and host-specific previews deliberately remain outside this package, so interchange failures can be attributed to either the portable graph or the consuming host instead of being hidden in one opaque operation.

## Evidence

- [Pinned repository](https://github.com/dcc-mcp/dcc-materialx/tree/34c478987c2887a506f97af4f34b4d502eb04f9b)
- [MaterialX Skill contract](https://github.com/dcc-mcp/dcc-materialx/blob/34c478987c2887a506f97af4f34b4d502eb04f9b/skill/materialx-lookdev/SKILL.md)
- [Document inspection implementation](https://github.com/dcc-mcp/dcc-materialx/blob/34c478987c2887a506f97af4f34b4d502eb04f9b/skill/materialx-lookdev/scripts/inspect_document.py)
