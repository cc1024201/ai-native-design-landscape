# Design System Extraction Skill

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

Design System Extraction Skill turns mixed design evidence into implementation-ready documentation and HTML handoff reports. Inputs can include Figma frames, screenshots, component code, CSS variables, token exports, PDFs and partial specifications.

## Source quality changes the claim ceiling

The skill routes Figma, code, token, document and screenshot inputs differently. It extracts visual language, token candidates, page templates, component patterns, inconsistencies and specification gaps, then produces quick-audit, full-spec or frontend-handoff output. Screenshot-only work explicitly cannot recover hidden states, exact token names or component APIs without other evidence.

The generated specification, token JSON and CSS/Tailwind snippets become proposed local governance artifacts. Contextual screenshots and HTML visualizations show their evidence, but recommendations are not silently promoted to official system decisions.

## Evidence boundary

The repository is an instruction and example package rather than an extraction runtime. It establishes the reasoning and output contract; accuracy depends on the agent's access to the cited sources and subsequent human review.

- [Pinned extraction skill revision](https://github.com/Ramones2333/Design-System-Extraction-skill/tree/869103e673fe8cf5241f15f99bf28bb2b4f9e490)
- [Input routing and output contract](https://github.com/Ramones2333/Design-System-Extraction-skill/blob/869103e673fe8cf5241f15f99bf28bb2b4f9e490/design-system-extraction/SKILL.md)
- [Routing modes](https://github.com/Ramones2333/Design-System-Extraction-skill/blob/869103e673fe8cf5241f15f99bf28bb2b4f9e490/design-system-extraction/references/input-routing-modes-html.md)
- [Output examples](https://github.com/Ramones2333/Design-System-Extraction-skill/blob/869103e673fe8cf5241f15f99bf28bb2b4f9e490/design-system-extraction/references/output-examples.md)
