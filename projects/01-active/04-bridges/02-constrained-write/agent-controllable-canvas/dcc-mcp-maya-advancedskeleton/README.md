# DCC-MCP Maya AdvancedSkeleton

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

This installable Skill package gives DCC-MCP Maya a typed workflow for the third-party AdvancedSkeleton rigging system. It is counted separately from the generic Maya adapter because it owns FitSkeleton semantics, licensed dependency checks and a reproducible build/rebuild loop.

## Fit first, build second, validate in motion

The package can inspect installed presets, import or create a FitSkeleton and configure labels, orientation, twist/bendy, follow and controller attributes. [`build_advancedskeleton.py`](https://github.com/dcc-mcp/dcc-mcp-maya-advancedskeleton/blob/2e6a6dcd350a3e35d89b1a4c7870d2908103ea15/skill/maya-advancedskeleton/scripts/build_advancedskeleton.py) supports both Build and ReBuild so an artist can return to the fit structure and reproduce controls rather than accepting a terminal one-shot rig.

The first-party case aligns a skeleton to Cesium Man, builds controls and then uses ordinary Maya animation and playblast tools for a 300-frame run/jump acceptance. The Skill owns setup and rig construction; downstream animation remains a validation layer.

## Evidence

- [Pinned package](https://github.com/dcc-mcp/dcc-mcp-maya-advancedskeleton/tree/2e6a6dcd350a3e35d89b1a4c7870d2908103ea15)
- [Skill and safety contract](https://github.com/dcc-mcp/dcc-mcp-maya-advancedskeleton/blob/2e6a6dcd350a3e35d89b1a4c7870d2908103ea15/skill/maya-advancedskeleton/SKILL.md)
- [FitSkeleton configuration](https://github.com/dcc-mcp/dcc-mcp-maya-advancedskeleton/blob/2e6a6dcd350a3e35d89b1a4c7870d2908103ea15/skill/maya-advancedskeleton/scripts/configure_fit_joint.py)
