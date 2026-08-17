# GitHub Copilot Agent Skills by Thomas Thornton

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

This repository packages architecture and diagramming workflows for GitHub Copilot as installable APM bundles. Its relevant Design product surface combines architecture requirements, Draw.io/Excalidraw canvas tools, icon vocabularies and repeatable artifact handoff.

## Manifests install both reasoning contract and live canvas dependency

The diagramming bundle declares the skills and the exact Draw.io and Excalidraw MCP endpoints together, so a user installs a working tool route rather than prose alone. Draw.io skills include standalone-file requirements, XML authoring rules, cloud icon catalogs and layout antipatterns; the Excalidraw skill uses the live canvas and exports PNG, SVG, `.excalidraw` or a shareable URL.

Architecture documents and editable diagrams are the durable results. The external MCP servers own the live canvas operation, while this product owns the packaged workflow and reproducible dependency wiring; it is therefore distinct from those server implementations.

## Evidence

- [Pinned repository](https://github.com/thomast1906/github-copilot-agent-skills/tree/e9be58d06373fd9e4d6bc2f72d8f9127fea2c6e6)
- [Diagramming bundle](https://github.com/thomast1906/github-copilot-agent-skills/blob/e9be58d06373fd9e4d6bc2f72d8f9127fea2c6e6/packages/diagramming/apm.yml)
- [Draw.io skill](https://github.com/thomast1906/github-copilot-agent-skills/blob/e9be58d06373fd9e4d6bc2f72d8f9127fea2c6e6/.github/skills/drawio-mcp-diagramming/SKILL.md)
- [Excalidraw skill](https://github.com/thomast1906/github-copilot-agent-skills/blob/e9be58d06373fd9e4d6bc2f72d8f9127fea2c6e6/.github/skills/excalidraw-mcp-diagramming/SKILL.md)
