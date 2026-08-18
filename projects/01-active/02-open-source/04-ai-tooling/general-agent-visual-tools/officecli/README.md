# OfficeCLI

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

OfficeCLI is a single-binary Office manipulation engine built for agents. For Design, its decisive surface is PowerPoint: it can inspect, add and update real presentation parts rather than generating a screenshot and wrapping it in a `.pptx` container.

## Commands address native package structure

The [`McpServer`](https://github.com/iOfficeAI/OfficeCLI/blob/459b1a473faf33f2f52e697ac6d265a3f67b176a/src/officecli/McpServer.cs) exposes the same command system to MCP hosts. PowerPoint handlers resolve selectors into slides and shapes, then manipulate text, fills, media, tables, charts, diagrams, comments, notes, hyperlinks, transitions, animations, masters and layouts.

```text
brief or existing Office file -> CLI/MCP queries -> native object mutations
-> atomic package write -> HTML/SVG inspection preview
-> reopen in PowerPoint or any compatible editor
```

[`AtomicPackageWriter.cs`](https://github.com/iOfficeAI/OfficeCLI/blob/459b1a473faf33f2f52e697ac6d265a3f67b176a/src/officecli/Core/AtomicPackageWriter.cs) protects the final package replacement. The Morph PPT skill adds a design method and style library over those primitives, including template selection and coherent cross-slide transitions. That skill is policy; the Open XML handlers are the artifact mechanism.

The `.pptx` remains the authority and can continue in ordinary Office software. HTML/SVG previews and example renders are evidence. OfficeCLI does not itself provide a collaborative version-history service; recovery depends on file copies, the surrounding host or external storage. The project is Apache-2.0 licensed. No reliable organization-region evidence was found.

## Decisive evidence

- [Pinned repository](https://github.com/iOfficeAI/OfficeCLI/tree/459b1a473faf33f2f52e697ac6d265a3f67b176a)
- [PowerPoint mutation core](https://github.com/iOfficeAI/OfficeCLI/blob/459b1a473faf33f2f52e697ac6d265a3f67b176a/src/officecli/Handlers/Pptx/PowerPointHandler.Mutations.cs)
- [Native animation handler](https://github.com/iOfficeAI/OfficeCLI/blob/459b1a473faf33f2f52e697ac6d265a3f67b176a/src/officecli/Handlers/Pptx/PowerPointHandler.Animations.cs)
- [Morph PPT workflow](https://github.com/iOfficeAI/OfficeCLI/blob/459b1a473faf33f2f52e697ac6d265a3f67b176a/skills/morph-ppt/SKILL.md)
- [Apache-2.0 license](https://github.com/iOfficeAI/OfficeCLI/blob/459b1a473faf33f2f52e697ac6d265a3f67b176a/LICENSE)
