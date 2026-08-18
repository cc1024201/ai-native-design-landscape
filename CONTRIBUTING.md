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

## Structure conventions

- The `0x-` prefixes in directory names are **file-system sort prefixes only**; the concept
  is the word after them (`depth-analysis`, `others`, `active`, `commercial`, `open-source`).
- Index files (`INDEX.md`) are generated from the tree by `scripts/build-indexes.py` — do not
  hand-edit them; rebuild instead.

## How to add a record

1. Enter the object in `data/candidates.csv` with status `pending` and a discovery URL.
2. Verify: resolve product & lifecycle, identify aliases, establish the user loop, pin a source
   revision for source-visible claims, then add the `data/census.csv` row
   (slug / product / organization / evidence_depth / lifecycle) and the dossier.
3. Assign the tier in `data/quality-tiers.csv`: `depth` only if active **and** worth a custom
   analysis; otherwise `other`.
4. Run `python3 scripts/verify-census.py`, then `python3 scripts/build-indexes.py`.
5. If `depth`: write the custom analysis (two questions, no template) at `projects/01-depth-analysis/.../<slug>/README.md`.

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
