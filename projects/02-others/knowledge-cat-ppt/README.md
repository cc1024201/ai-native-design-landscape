# Knowledge Cat PPT Skill

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

Knowledge Cat is a story-first presentation agent skill that deliberately routes a job among native PPTX, HTML-deck and image-first production. The mechanism worth counting is not the prose guidance but the executable plan and quality contracts shared across those routes.

## A validated plan precedes three different writers

[`deck-plan.schema.json`](https://github.com/gnipbao/knowledge-cat-ppt-skill/blob/889c3dc00b356607fa9af935eb807056c3394886/assets/deck-plan.schema.json) defines the page-level intermediate representation. [`validate_deck_plan.py`](https://github.com/gnipbao/knowledge-cat-ppt-skill/blob/889c3dc00b356607fa9af935eb807056c3394886/scripts/validate_deck_plan.py) rejects structurally incomplete plans before a writer runs. The native route materializes editable PowerPoint objects in [`build_native_pptx.mjs`](https://github.com/gnipbao/knowledge-cat-ppt-skill/blob/889c3dc00b356607fa9af935eb807056c3394886/scripts/build_native_pptx.mjs); the HTML route has its own structural validator.

The acceptance loop is reversible: rendered slides are reviewed visually, while `probe_pptx_editability.py` edits and re-reads native text to establish that a nominal PPTX is actually usable. Committed case-study plans, render evidence, edit probes and QA reports expose the entire chain. No reliable maintainer-region evidence was found.

## Evidence

- [Pinned repository](https://github.com/gnipbao/knowledge-cat-ppt-skill/tree/889c3dc00b356607fa9af935eb807056c3394886)
- [Editability probe](https://github.com/gnipbao/knowledge-cat-ppt-skill/blob/889c3dc00b356607fa9af935eb807056c3394886/scripts/probe_pptx_editability.py)
- [Engine routing contract](https://github.com/gnipbao/knowledge-cat-ppt-skill/blob/889c3dc00b356607fa9af935eb807056c3394886/references/engine-routing.md)
