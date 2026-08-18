# SimpleCORE SVG Diagrams

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

SimpleCORE SVG Diagrams is an independently routed skill inside the SimpleCORE marketplace. It turns flow, sequence, state, class, ER, architecture, pipeline and network descriptions into editable SVG or ASCII with an explicit render-audit pass.

## A JSON specification separates layout from SVG text

The skill can auto-layout a JSON graph or convert Mermaid, then writes SVG that remains readable by both people and agents. Its audit catches unresolved arrow markers, label overflow and clipping as the file is authored. Those checks defend structural integrity but do not replace visual judgment.

The SVG is the authority and a rasterized view is the QA projection. This is a distinct visual product even though it shares a release repository with Korean writing and backend-development skills; counting the whole marketplace would blur unrelated definitions of work.

- [Pinned skill directory](https://github.com/simplecore-inc/simplecore-skills/tree/0c45b550b4f59620e406f1e8e84ab714f34b3c1c/plugins/simplecore/skills/svg-diagrams)
- [Agent skill](https://github.com/simplecore-inc/simplecore-skills/blob/0c45b550b4f59620e406f1e8e84ab714f34b3c1c/plugins/simplecore/skills/svg-diagrams/SKILL.md)
- [Pinned marketplace source](https://github.com/simplecore-inc/simplecore-skills/tree/0c45b550b4f59620e406f1e8e84ab714f34b3c1c)
- [Organization location evidence](https://github.com/simplecore-inc)
