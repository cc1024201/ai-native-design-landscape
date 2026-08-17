# design.md Agent Skill

> Research status: **Source-level** · Lifecycle: **active-transition** · Last reviewed: **2026-08-12**

Jeftar Mascarenhas's `design.md` repository is a dependency-free agent skill and Python toolkit for the full lifecycle of a portable `DESIGN.md`. It is counted separately from the Google format specification because it executes creation, validation, preview and export workflows.

## One document serves people and agents

YAML-frontmatter tokens are normative while Markdown prose explains intent. The [`SKILL.md`](https://github.com/jeftarmascarenhas/design.md/blob/a5a829eff607a9b6f41c0a8ed8ca2a1f3cc8c281/SKILL.md) lets an agent create a document from a brief or scan an existing repository, then choose the appropriate bundled script.

The runtime is intentionally small:

| Script | Material effect |
|---|---|
| [`scaffold.py`](https://github.com/jeftarmascarenhas/design.md/blob/a5a829eff607a9b6f41c0a8ed8ca2a1f3cc8c281/scripts/scaffold.py) | creates a design document from intent or project evidence |
| [`dmd.py`](https://github.com/jeftarmascarenhas/design.md/blob/a5a829eff607a9b6f41c0a8ed8ca2a1f3cc8c281/scripts/dmd.py) | lints, diffs and exports token formats |
| [`preview.py`](https://github.com/jeftarmascarenhas/design.md/blob/a5a829eff607a9b6f41c0a8ed8ca2a1f3cc8c281/scripts/preview.py) | renders a self-contained HTML inspection surface |
| [`catalog.py`](https://github.com/jeftarmascarenhas/design.md/blob/a5a829eff607a9b6f41c0a8ed8ca2a1f3cc8c281/scripts/catalog.py) | searches reference systems without changing project authority |

The self-test compares behavior with the official tooling and permits CI gating. Files and Git own recovery; the HTML preview and exported CSS or token JSON are materialized views. There is no hosted editor or automatic write-back.

The repository is Apache-2.0 licensed. The maintainer profile reports Recife in Brazil.

## Pinned record

- [Repository at `a5a829e`](https://github.com/jeftarmascarenhas/design.md/tree/a5a829eff607a9b6f41c0a8ed8ca2a1f3cc8c281)
- [Specification reference](https://github.com/jeftarmascarenhas/design.md/blob/a5a829eff607a9b6f41c0a8ed8ca2a1f3cc8c281/references/spec.md)
- [Apache-2.0 license](https://github.com/jeftarmascarenhas/design.md/blob/a5a829eff607a9b6f41c0a8ed8ca2a1f3cc8c281/LICENSE)
