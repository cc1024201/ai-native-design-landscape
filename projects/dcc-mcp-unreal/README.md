# DCC-MCP Unreal

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

DCC-MCP Unreal is a plugin, sidecar and Skill platform for Unreal Engine 4.18+ with capability-gated paths across engine generations. It covers actors, assets, Blueprints, levels, materials, cinematics, Niagara, MetaSound, Chaos, gameplay tests and packaging.

## It composes with Epic's server instead of replacing it

On Unreal 5.8+ the adapter can discover and call Epic's experimental native MCP Toolsets through a dedicated bridge while preserving Epic names and schemas. Older or Pythonless engines use DCC-MCP's own embedded or native-sidecar paths. The result is one capability graph with explicit provenance rather than a fork of Epic's NoRedist plugin.

Skills declare game-thread affinity, mutability, destructiveness, idempotency and timeouts. For example the [cinematics Skill](https://github.com/dcc-mcp/dcc-mcp-unreal/blob/2f08c19c9c5d6820f2432bf9585a69d0f6c3abea/src/dcc_mcp_unreal/skills/unreal-cinematics/SKILL.md) separates queued renders from status and cancellation; the [build package](https://github.com/dcc-mcp/dcc-mcp-unreal/blob/2f08c19c9c5d6820f2432bf9585a69d0f6c3abea/src/dcc_mcp_unreal/skills/unreal-build-package/scripts/package_project_executable.py) advances a saved project toward delivery.

## Evidence

- [Pinned Unreal product](https://github.com/dcc-mcp/dcc-mcp-unreal/tree/2f08c19c9c5d6820f2432bf9585a69d0f6c3abea)
- [Actor authoring contract](https://github.com/dcc-mcp/dcc-mcp-unreal/blob/2f08c19c9c5d6820f2432bf9585a69d0f6c3abea/src/dcc_mcp_unreal/skills/unreal-actors/SKILL.md)
- [Blueprint Skill](https://github.com/dcc-mcp/dcc-mcp-unreal/blob/2f08c19c9c5d6820f2432bf9585a69d0f6c3abea/src/dcc_mcp_unreal/skills/unreal-blueprints/SKILL.md)
- [Server and Skill catalog](https://github.com/dcc-mcp/dcc-mcp-unreal/blob/2f08c19c9c5d6820f2432bf9585a69d0f6c3abea/src/dcc_mcp_unreal/server.py)
