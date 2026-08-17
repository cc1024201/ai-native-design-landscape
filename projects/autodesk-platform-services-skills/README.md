# Agent Skills for Autodesk Platform Services

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

This Autodesk-maintained collection turns platform and desktop automation knowledge into installable agent skills. It spans deterministic project scaffolding MCP-server generation AutoCAD plugin development Design Automation deployment and conversational CUIX authoring.

## Skills package execution contracts with their generators

At commit [`56f28c3`](https://github.com/autodesk-platform-services/skills/tree/56f28c32182842de8cccd3b7e33c5e48c63b3771) each skill owns instructions references scripts and templates instead of relying on a single giant prompt. For example [`acad-arx-wizard`](https://github.com/autodesk-platform-services/skills/blob/56f28c32182842de8cccd3b7e33c5e48c63b3771/skills/acad-arx-wizard/SKILL.md) routes a model request into deterministic PowerShell generators for ObjectARX project types.

The CUIX skill is a more directly visual case: the agent describes ribbon tabs panels icons and commands and a separate builder emits an AutoCAD-loadable package. AutoCAD or APS remains the runtime authority and the generated source/package is the deliverable.

The umbrella is counted once here; individual skill folders are product components unless an independently maintained runtime establishes its own user loop. Autodesk's organization profile identifies the United States.

## Pinned evidence

- [Skill catalog](https://github.com/autodesk-platform-services/skills/blob/56f28c32182842de8cccd3b7e33c5e48c63b3771/README.md)
- [MCP server generator](https://github.com/autodesk-platform-services/skills/blob/56f28c32182842de8cccd3b7e33c5e48c63b3771/skills/aps-mcp-server-gen/SKILL.md)
- [Template expansion script](https://github.com/autodesk-platform-services/skills/blob/56f28c32182842de8cccd3b7e33c5e48c63b3771/skills/acad-arx-wizard/scripts/Invoke-TemplateExpansion.ps1)
