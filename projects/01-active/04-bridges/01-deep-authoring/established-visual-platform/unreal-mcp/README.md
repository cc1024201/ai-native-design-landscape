# Unreal MCP

> Research status: **Architecture-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

Unreal MCP is Epic's experimental, independently surfaced Unreal Editor plugin for agent-driven scene work. It embeds a local HTTP MCP server in the editor and exposes native operations such as spawning actors, configuring lighting, creating material instances, inspecting Slate widgets and running automation tests.

## Tool calls enter the engine's own execution and asset authority

The [official overview](https://dev.epicgames.com/documentation/en-us/unreal-engine/unreal-mcp-in-unreal-editor?application_version=5.8) distinguishes the transport plugin from `AllToolsets`, which supplies the actual tools. Requests are synchronized onto the Unreal game thread and executed serially, so an external agent does not maintain a competing scene graph. Actors, materials and project assets remain Unreal-native authority.

The surface is also a product boundary rather than an undocumented API. It appears under the friendly name Unreal MCP in the Plugin Browser, can generate client configuration for Claude Code, Cursor, VS Code, Gemini and Codex, and supports additional Python or C++ toolsets through the [Toolset Registry contract](https://dev.epicgames.com/documentation/en-us/unreal-engine/unreal-mcp-in-unreal-editor?application_version=5.8#toolsetsandthetoolsetregistry). Its experimental status means APIs and formats may change; architecture evidence does not imply production stability or access to Epic's internal implementation history.

## Evidence

- [Unreal MCP setup and quick start](https://dev.epicgames.com/documentation/en-us/unreal-engine/unreal-mcp-in-unreal-editor?application_version=5.8#setup)
- [Tool authoring model](https://dev.epicgames.com/documentation/en-us/unreal-engine/unreal-mcp-in-unreal-editor?application_version=5.8#authoringmcptools)
