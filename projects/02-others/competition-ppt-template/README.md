# Competition PPT Template-First Skill

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

Competition PPT Template-First is an agent workflow for evidence-heavy competition and defense decks. Its key design decision is a controlled hybrid: generated whole-slide underlays carry atmosphere and composition, while claims, screenshots, charts and updateable text remain native PowerPoint objects.

## Traceability precedes the visual template

The workspace initializer in [`init-report-grounded-deck.py`](https://github.com/che626/competition-ppt-template-first-skill/blob/653646d72e9ddbe84dc6acd81b1aadbd706bc8d8/skills/competition-ppt-template-first/scripts/init-report-grounded-deck.py) creates separate intake, plan, template, build, render, approved and retired areas. Source manifests and fact registries feed a slide-source map, speaker map and per-page blueprint before an underlay is generated.

[`quality-gates.md`](https://github.com/che626/competition-ppt-template-first-skill/blob/653646d72e9ddbe84dc6acd81b1aadbd706bc8d8/skills/competition-ppt-template-first/references/quality-gates.md) requires rendered critique and fix verification. Approval promotes pages into `04_approved`; rejected variants remain in `99_retired`, preserving why the result changed instead of overwriting the evidence chain.

No reliable maintainer-region evidence was found.

## Evidence

- [Pinned repository](https://github.com/che626/competition-ppt-template-first-skill/tree/653646d72e9ddbe84dc6acd81b1aadbd706bc8d8)
- [Execution contract](https://github.com/che626/competition-ppt-template-first-skill/blob/653646d72e9ddbe84dc6acd81b1aadbd706bc8d8/skills/competition-ppt-template-first/SKILL.md)
- [Slide-source map template](https://github.com/che626/competition-ppt-template-first-skill/blob/653646d72e9ddbe84dc6acd81b1aadbd706bc8d8/skills/competition-ppt-template-first/templates/slide-source-map.md)
