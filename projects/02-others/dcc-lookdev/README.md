# DCC LookDev

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

DCC LookDev is a portable workflow package for producing comparable PBR presentation and review scenes across different DCC hosts. Its first product is `lookdev-turntable`; it relies on host adapters for mutations but owns the calibration and review contract.

## A turntable is treated as a measurement setup

The package fixes a camera-facing reference group, visible HDRI environment, measured ColorChecker and gray/white/chrome spheres. A twelve-second sequence first rotates the subject under fixed light and then rotates light around a fixed subject. Those two phases distinguish geometry/readability problems from lighting dependence.

The [Skill contract](https://github.com/dcc-mcp/dcc-lookdev/blob/3121a34632e79ef130bf30675e092487b9821dc8/skill/lookdev-turntable/SKILL.md) also maps asset intent such as hard-surface, creature or translucent work to typed HDR recommendations while keeping every choice overridable. Native Maya, Blender, Houdini or Unreal scenes remain authoritative; the package supplies a repeatable scene recipe and acceptance evidence rather than another universal scene format.

## Evidence

- [Pinned workflow repository](https://github.com/dcc-mcp/dcc-lookdev/tree/3121a34632e79ef130bf30675e092487b9821dc8)
- [Typed turntable tools](https://github.com/dcc-mcp/dcc-lookdev/blob/3121a34632e79ef130bf30675e092487b9821dc8/skill/lookdev-turntable/tools.yaml)
- [First-party product description](https://github.com/dcc-mcp/dcc-lookdev/blob/3121a34632e79ef130bf30675e092487b9821dc8/README.md)
