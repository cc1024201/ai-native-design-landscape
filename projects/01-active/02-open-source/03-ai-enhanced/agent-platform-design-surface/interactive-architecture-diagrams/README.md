# Interactive Architecture Diagrams

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

Interactive Architecture Diagrams asks an agent to deliver a self-contained HTML artifact rather than a screenshot or a dependency-heavy editor project.

## A portable document is the product

At [`486ac078`](https://github.com/konraddzbik/architecture-diagram-skill/tree/486ac078705c873012239124a07e7ef2df8fe783), the skill combines a component vocabulary, flow-design guidance and an HTML template. Output includes the explanatory Markdown and a browser document with the diagram embedded.

## Interaction survives generation

Nodes can be dragged after delivery and positions are stored in browser localStorage. That does not rewrite a semantic architecture specification, but it does preserve the recipient's spatial decisions without requiring the agent to run again.

## Where authority sits

The generated HTML file is authoritative for delivery; localStorage is a per-browser layout overlay. This is a deliberately lightweight source-authority projection and not a collaborative native graph service.

## Evidence

- [Pinned source tree](https://github.com/konraddzbik/architecture-diagram-skill/tree/486ac078705c873012239124a07e7ef2df8fe783)
- [Skill instructions](https://github.com/konraddzbik/architecture-diagram-skill/blob/486ac078705c873012239124a07e7ef2df8fe783/skills/architecture-diagram/SKILL.md)
- [Portable HTML template](https://github.com/konraddzbik/architecture-diagram-skill/blob/486ac078705c873012239124a07e7ef2df8fe783/skills/architecture-diagram/assets/template.html)
- [Flow patterns](https://github.com/konraddzbik/architecture-diagram-skill/blob/486ac078705c873012239124a07e7ef2df8fe783/skills/architecture-diagram/references/flow-design-patterns.md)
