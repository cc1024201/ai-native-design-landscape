# Excalidraw Plugin

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

Excalidraw Plugin packages a diagrammer agent, a reusable skill and an external Excalidraw MCP dependency into one installable workflow for code-informed native diagrams.

## Research and drawing are separate roles

At [`3aa71b41`](https://github.com/aryxenv/excalidraw-plugin/tree/3aa71b41ec3f1ebe78f6935cf3b3b16e8dca5cec), the diagrammer agent inspects the target repository and plans the visual explanation. The skill then drives Excalidraw operations and rendered preview checks.

## Native artifact ownership is external

The plugin does not implement a canvas kernel. An external Excalidraw MCP server owns element mutation and the `.excalidraw` artifact; the plugin contributes orchestration and quality rules. PNG export is delivery evidence rather than the editable authority.

## Lineage decision

`aryxenv/excalidraw-workflow` explicitly extends this plugin with dark-mode export. It is recorded as a derivative encounter and not counted as a second product.

## Evidence

- [Pinned plugin](https://github.com/aryxenv/excalidraw-plugin/tree/3aa71b41ec3f1ebe78f6935cf3b3b16e8dca5cec)
- [Plugin manifest](https://github.com/aryxenv/excalidraw-plugin/blob/3aa71b41ec3f1ebe78f6935cf3b3b16e8dca5cec/plugin.json)
- [Diagrammer agent](https://github.com/aryxenv/excalidraw-plugin/blob/3aa71b41ec3f1ebe78f6935cf3b3b16e8dca5cec/agents/diagrammer.agent.md)
- [Excalidraw skill](https://github.com/aryxenv/excalidraw-plugin/blob/3aa71b41ec3f1ebe78f6935cf3b3b16e8dca5cec/skills/excalidraw-diagrams/SKILL.md)
- [Derivative workflow declaration](https://github.com/aryxenv/excalidraw-workflow/blob/f0f20c1c5746a3d6b8523a78551337807454fad2/README.md)
