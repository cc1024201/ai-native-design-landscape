# StarryKit

> Research status: **Architecture-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

StarryKit is a hosted MCP plus native visual editor for presentations, posters, social graphics, web and UI compositions. The installable repository supplies the skill and connection contract; the visual document runtime itself is hosted.

## References become editable native elements

The first-party workflow accepts an idea, image, website or `design.md`, recreates it as element-level content, lets the agent refine it through MCP and lets a person continue in the editor. Exports include PPTX, PDF, SVG, PNG, JPEG, HTML and Google Slides.

```text
intent or visual reference -> hosted MCP operations -> StarryKit document
-> agent element edits <-> manual editor -> multi-format export
```

[`mcp-workflow.md`](https://github.com/StarryKit/starrykit-plugin/blob/4d4f7768bf1ef24d4ff89de2216cdd6688ccd5e0/skills/starrykit/references/mcp-workflow.md) establishes the control and handoff semantics, but the public repository cannot establish the hosted document schema or persistence implementation. Claims therefore stop at architecture level. The earlier Starry Slides repository state is an archived predecessor, not a second product. Region remains unknown.

## Evidence

- [Pinned plugin and product contract](https://github.com/StarryKit/starrykit-plugin/tree/4d4f7768bf1ef24d4ff89de2216cdd6688ccd5e0)
- [Agent skill](https://github.com/StarryKit/starrykit-plugin/blob/4d4f7768bf1ef24d4ff89de2216cdd6688ccd5e0/skills/starrykit/SKILL.md)
- [Hosted MCP workflow](https://github.com/StarryKit/starrykit-plugin/blob/4d4f7768bf1ef24d4ff89de2216cdd6688ccd5e0/skills/starrykit/references/mcp-workflow.md)
