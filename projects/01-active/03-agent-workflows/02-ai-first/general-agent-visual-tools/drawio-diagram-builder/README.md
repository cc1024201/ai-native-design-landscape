# Draw.io Diagram Builder Skill

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

Draw.io Diagram Builder is a portable agent skill for turning papers, prompts, codebases, screenshots and mixed references into publication-style editable diagrams. Its defining product is a mandatory evidence loop, not a set of canned XML snippets.

## A defect ledger closes the render–review loop

Before drawing, the agent must separate content, structure, style, layout and asset evidence; reference replication adds a visual specification, coordinate grid and asset ledger. It creates `.drawio` XML, serves a local preview through diagrams.net, captures a screenshot, reviews semantic and visible defects, records them and repeats. Final handoff includes both the editable source and the reviewed defect log.

Browser automation is optional for file generation but required for the project's claimed high-fidelity loop. This explicitly distinguishes structurally valid XML from a visually accepted diagram.

## Evidence

- [Pinned repository](https://github.com/Will-hxw/drawio-diagram-builder-skill/tree/a922507ccd51815f4e8764846d640a65b5fb6f7e)
- [Builder skill](https://github.com/Will-hxw/drawio-diagram-builder-skill/blob/a922507ccd51815f4e8764846d640a65b5fb6f7e/skills/drawio-diagram-builder/SKILL.md)
- [Editable example](https://github.com/Will-hxw/drawio-diagram-builder-skill/blob/a922507ccd51815f4e8764846d640a65b5fb6f7e/examples/hierarchical-memory-routing-replica.drawio)
- [Maintainer profile](https://github.com/Will-hxw)
