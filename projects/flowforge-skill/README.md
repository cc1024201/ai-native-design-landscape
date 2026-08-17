# FlowForge Skill

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

FlowForge is a Claude Code skill that compiles natural-language diagram intent into editable `.drawio` files. It supports five themes and explicit layout families for flows, comparisons, trees, loops, hubs and timelines.

## Deterministic layout formulas constrain model freedom

The skill's layout reference defines coordinate formulas instead of asking the model to improvise positions. Theme rules and an XML reference constrain styling and serialization; a validation script checks the file, and a render script produces an inspectable image. The gallery commits both source diagrams and screenshots so appearance can be traced back to editable XML.

There is no separate hosted document store. The generated file in the user's workspace is authoritative and can be opened and refined in any Draw.io editor.

## Evidence

- [Pinned repository](https://github.com/wentong2022-arch/flowforge-skill/tree/7a210ccb6f3724f91e15d614726de0be25f9e1a6)
- [FlowForge skill](https://github.com/wentong2022-arch/flowforge-skill/blob/7a210ccb6f3724f91e15d614726de0be25f9e1a6/skills/FlowForge/SKILL.md)
- [Layout formulas](https://github.com/wentong2022-arch/flowforge-skill/blob/7a210ccb6f3724f91e15d614726de0be25f9e1a6/skills/FlowForge/references/layouts.md)
- [Validator](https://github.com/wentong2022-arch/flowforge-skill/blob/7a210ccb6f3724f91e15d614726de0be25f9e1a6/skills/FlowForge/scripts/validate.py)
