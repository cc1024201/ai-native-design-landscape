# Contributing

An open, evidence-bounded research map of how teams define Design and how they implement it.
The global population is unknown; this is not an awesome-list, a finished census or a collection of encyclopedic profiles.

The repository tracks two questions per project — **how it defines "design"** and **how it is implemented** —
and only the records worth analyzing get per-project custom analysis.

## Structure

```
projects/
├── 01-depth-analysis/   121 records worth deep analysis (only active records) — analysis lives here
└── 02-others/           1383 records classified as not worth analysis — registered index only, no analysis
```

`data/quality-tiers.csv` is the authority for the tier split. Do not hand-move a project directory;
regenerate indexes with `scripts/build-indexes.py`.

## One project, one analysis

- A dossier matters when it establishes or challenges a field-level claim about Design definition or implementation.
- Each analysis in `01-depth-analysis/` is **custom**: written for that project, answering how it defines
  design and how it implements it. No template, no shared table of contents, no filler.
- Evidence must be concrete and linked; do not state what you cannot support.
- Lifecycle, activity and quality screening stay in the data layer (`data/`, `projects/*/INDEX.md`).

## Discovery rules

- Add discovery provenance before claiming coverage (see `DISCOVERY.md`).
- Keep candidates open until identity, ordinary-user loop and artifact authority are evidenced.

Dossier length, directory count and candidate count are not completion metrics.
