# Diagram Design

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

Diagram Design is Cathryn Lavery's agent skill for choosing and composing the right explanatory diagram, not merely emitting generic boxes and arrows. Its reference library gives different semantic and layout contracts to timelines, swimlanes, state diagrams, quadrants, trees, loops and other diagram families.

## Diagram type is a design decision before XML

The skill first classifies the information relationship, then applies the corresponding composition rules. A Draw.io extraction helper lets the agent inspect existing editable content rather than relying only on a screenshot. This makes the workflow suitable for both new diagrams and revision of structured `.drawio` material.

The skill itself is the product boundary: it defines the reasoning and validation contract, while Draw.io remains the native graph editor and `.drawio` remains the handoff artifact.

## Evidence

- [Pinned repository](https://github.com/cathrynlavery/diagram-design/tree/da45d4a79a76dc0742c8554b7eabe551db100701)
- [Diagram Design skill](https://github.com/cathrynlavery/diagram-design/blob/da45d4a79a76dc0742c8554b7eabe551db100701/skills/diagram-design/SKILL.md)
- [Draw.io extraction helper](https://github.com/cathrynlavery/diagram-design/blob/da45d4a79a76dc0742c8554b7eabe551db100701/skills/diagram-design/scripts/drawio_extract.py)
- [Swimlane-specific rules](https://github.com/cathrynlavery/diagram-design/blob/da45d4a79a76dc0742c8554b7eabe551db100701/skills/diagram-design/references/type-swimlane.md)
