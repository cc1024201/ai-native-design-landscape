# AI Forge MCP

> Research status: **Architecture-level** · Lifecycle: **active early access** · Last reviewed: **2026-08-12**

AI Forge MCP is a commercial, full-pipeline game-asset production layer spanning Blender, Substance, Maya, Houdini and Unreal Engine. A desktop/web command center supervises multiple specialized agents and moves an asset from concept through mesh cleanup, UVs, texture, rig, animation and engine delivery.

## Review gates sit between specialized production stages

The public contract describes sixteen MCP servers and a Forge Daemon that coordinates up to fifty agent sessions. ForgeRoom supplies a PBR 3D viewer with annotations; Rig Inspector scores skeleton and deformation quality; approval, rejection and redo decisions route corrections back to the pipeline before Unreal delivery.

Native DCC assets remain the working authorities by stage, while the command center owns orchestration and review state. The public repository exposes detailed architecture and workflow contracts but not the claimed production code, so implementation claims stop at architecture level.

## Evidence

- [Pinned public contract](https://github.com/HurtzDonutStudios/ai-forge-mcp/tree/10aea2dbd7ad3a636fc52b19b81112980589b12c)
- [Product site](https://hurtzdonut.com/ai-forge-mcp)
- [Maintainer profile: United States](https://github.com/HurtzDonutStudios)
