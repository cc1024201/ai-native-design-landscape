# Contributing

This is an open, evidence-bounded research map of how teams define Design, turn those definitions into products and implement them technically. The global population is unknown. It is not an awesome-list link dump, a finished census or a collection of independent encyclopedic profiles.

The repository has four coupled outputs:

1. discovery batches and the candidate register make the observable search universe reproducible;
2. project dossiers establish product-specific facts and implementation evidence;
3. the verified analytical sample and taxonomy turn accepted evidence into countable sample findings;
4. the root report separates those findings from discovery coverage and the unknown global population.

A dossier matters when it supports or challenges a field-level claim. Dossier length, directory count and candidate count are not the project's completion metric.

## One project, one directory

Every tracked project lives at `projects/<project-slug>/README.md`.

The directory unit is an independently identifiable product, open-source project, or independently surfaced design workspace.

- A product feature or mode stays inside the owning product directory unless it has a distinct product/workspace identity.
- A direct rename or rebrand stays in one canonical directory; record previous names as aliases/metadata.
- Do not create duplicate directories for historical names of the same product.
- Keep acquired or discontinued products as historical entries instead of deleting them.

A project directory discusses only that project. Its table of contents should be derived from the product's own decisive user journey, technical mechanism and failure boundaries—not copied from another dossier. Product facts, artifact/source-of-truth, agent/runtime, mapping and versioning are investigation lenses, not mandatory peer sections.

Cross-project definitions, product forms, architecture families, comparisons, verified-sample findings, discovery coverage, candidate decisions and alias mapping belong in the root `README.md` and `data/`, never inside a project dossier.

## Discovery and verification workflow

Do not add a newly encountered name straight to `data/census.csv`. First preserve how it was found and what decision was made. [DISCOVERY.md](DISCOVERY.md) defines the protocol and the meaning of every yield and saturation signal.

For a new discovery or verification cycle:

1. record the reproducible query, channel, language/region targeting, result-card denominator and first-seen/repeat references in `data/discovery-batches.csv`;
2. give every retained object one row in `data/candidates.csv`, including its first-seen batch, evidence pointer, current status and decision reason;
3. test identity, duplicate boundaries and the inclusion boundary before selecting candidates for deep review;
4. record each deep-review selection, reason and outcome in `data/verification-waves.csv`;
5. for an included candidate, create a project-specific dossier and one row in `data/census.csv`; its identifiers are declared in `data/taxonomy.json`;
6. resolve the public product/team lineage, canonical organization umbrella, aliases, acquisition history and lifecycle in `data/organizations.csv` and `data/identity-map.csv`;
7. assign one primary Design definition, one primary product form and one primary architecture family, adding secondary labels only when the dossier establishes a separate operational loop or decisive mechanism;
8. explain a proposed new family by showing why every existing inclusion test would erase a consequential difference;
9. run `./scripts/verify-census.ps1 -Json`, then update the root report when derived sample or discovery counts change.

`pending` is a valid outcome when public evidence cannot yet carry the inclusion boundary. `duplicate` and `excluded` decisions must retain their evidence and reason. Do not erase negative results or turn an unresolved candidate into an included record merely to increase coverage.

The classification is repository analysis, not a vendor quote. Keep it revisable and traceable to the dossier. A marketing phrase, framework choice or visible canvas is not enough to create a new family.

## Evidence standard

Use sources in this order:

1. official documentation;
2. official product/changelog/engineering posts;
3. official source repositories;
4. primary technical talks;
5. secondary reporting only when no primary source exists.

Do not guess a closed product's internal framework, renderer, data model, source mapping, persistence layer or agent orchestration.

Judge dossier depth against the project's available evidence ceiling. Source-visible projects require pinned implementation tracing. A closed product may reach an evidence-bounded Architecture-level only after its ordinary journey, working artifact authority, public architecture/protocol edges, delivery and persistence semantics, documented failures, bounded observable behavior and consequential unknowns have been established. Calling the internal stack unknown is correct; stopping at a feature list is not. Reaching that ceiling completes the current dossier pass, not discovery of the field.

For open-source projects, pin a commit SHA before making source-derived implementation claims.

Every dossier must preserve a small common evidence floor: canonical identity/lifecycle, primary sources, an explicit fact/inference/unknown boundary, research gaps, and immutable source revisions when implementation claims depend on code. Beyond that floor, combine, omit, reorder or add sections so the document explains this project rather than satisfying a universal outline.

## Lifecycle

Do not delete discontinued or acquired products. Mark their lifecycle status and preserve them as history.

Use the lifecycle vocabulary defined in `data/taxonomy.json`. A transition that changes the product's surface or authority without ending the product is `active-transition`; a documented shutdown path is `sunsetting`; an ended or bounded prior lineage is `historical`.

## Naming

Use stable lowercase ASCII slugs. Prefer the current canonical product name for direct rebrands. Do not place project directories under category folders because categories can change.

## Required verification

Before submitting a landscape change:

```powershell
./scripts/verify-census.ps1 -Json
```

The command must confirm that discovery batches, candidate decisions and verification outcomes join correctly; every included candidate has exactly one dossier and verified-sample record; taxonomy identifiers and organization labels resolve; and evidence depth agrees with the dossier header.
