# Contributing

This is an evidence-bounded census of how teams define Design, turn those definitions into products and implement them technically. It is not an awesome-list link dump and it is not a collection of independent encyclopedic profiles.

The repository has two coupled outputs:

1. project dossiers establish product-specific facts and implementation evidence;
2. the root synthesis and `data/` ledger turn that evidence into countable global findings.

A dossier that does not change or support the census is still evidence, but dossier length and coverage are not the project's completion metric.

## One project, one directory

Every tracked project lives at `projects/<project-slug>/README.md`.

The directory unit is an independently identifiable product, open-source project, or independently surfaced design workspace.

- A product feature or mode stays inside the owning product directory unless it has a distinct product/workspace identity.
- A direct rename or rebrand stays in one canonical directory; record previous names as aliases/metadata.
- Do not create duplicate directories for historical names of the same product.
- Keep acquired or discontinued products as historical entries instead of deleting them.

A project directory discusses only that project. Its table of contents should be derived from the product's own decisive user journey, technical mechanism and failure boundaries—not copied from another dossier. Product facts, artifact/source-of-truth, agent/runtime, mapping and versioning are investigation lenses, not mandatory peer sections.

Cross-project definitions, product forms, architecture families, comparisons, global findings, coverage decisions and alias mapping belong in the root `README.md` and `data/`, never inside a project dossier.

## Census workflow

Every canonical record has one row in `data/census.csv`. Its identifiers are defined in `data/taxonomy.json`; organization labels are resolved by `data/organizations.csv`.

When adding or revising a record:

1. test the candidate against `data/taxonomy.json`'s census boundary, then establish the independently identifiable product/project unit and its team lineage;
2. resolve the canonical organizational home used for counting, plus aliases, acquisition history and lifecycle;
3. research the project's ordinary journey, working artifact authority, agent boundary, visual projection, mutation path and persistence boundary;
4. assign one primary Design definition, one primary product form and one primary architecture family;
5. add secondary definitions or architectures only when the dossier establishes a separate operational loop or decisive mechanism;
6. explain a proposed new family by showing why every existing inclusion test would erase a consequential difference;
7. add any alias, renamed surface or successor cutoff needed to prevent double counting to `data/identity-map.csv`;
8. run `./scripts/verify-census.ps1 -Json` and update the root findings when derived counts change.

The classification is repository analysis, not a vendor quote. Keep it revisable and traceable to the dossier. A marketing phrase, framework choice or visible canvas is not enough to create a new family.

## Evidence standard

Use sources in this order:

1. official documentation;
2. official product/changelog/engineering posts;
3. official source repositories;
4. primary technical talks;
5. secondary reporting only when no primary source exists.

Do not guess a closed product's internal framework, renderer, data model, source mapping, persistence layer or agent orchestration.

Judge dossier depth against the project's available evidence ceiling. Source-visible projects require pinned implementation tracing. A closed product may reach an evidence-bounded Architecture-level only after its ordinary journey, working artifact authority, public architecture/protocol edges, delivery and persistence semantics, documented failures, bounded observable behavior and consequential unknowns have been established. Calling the internal stack unknown is correct; stopping at a feature list is not. Reaching that ceiling completes the current dossier pass, not the evolving global census.

For open-source projects, pin a commit SHA before making source-derived implementation claims.

Every dossier must preserve a small common evidence floor: canonical identity/lifecycle, primary sources, an explicit fact/inference/unknown boundary, research gaps, and immutable source revisions when implementation claims depend on code. Beyond that floor, combine, omit, reorder or add sections so the document explains this project rather than satisfying a universal outline.

## Lifecycle

Do not delete discontinued or acquired products. Mark their lifecycle status and preserve them as history.

Use the lifecycle vocabulary defined in `data/taxonomy.json`. A transition that changes the product's surface or authority without ending the product is `active-transition`; a documented shutdown path is `sunsetting`; an ended or bounded prior lineage is `historical`.

## Naming

Use stable lowercase ASCII slugs. Prefer the current canonical product name for direct rebrands. Do not place project directories under category folders because categories can change.

## Required verification

Before submitting a census change:

```powershell
./scripts/verify-census.ps1 -Json
```

The command must confirm that every project directory has exactly one census record, every taxonomy identifier is valid, organization labels resolve, and census evidence depth agrees with the dossier header.
