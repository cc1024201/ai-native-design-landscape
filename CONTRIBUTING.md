# Contributing

This is a research landscape, not an awesome-list link dump.

## One project, one directory

Every tracked project lives at `projects/<project-slug>/README.md`.

The directory unit is an independently identifiable product, open-source project, or independently surfaced design workspace.

- A product feature or mode stays inside the owning product directory unless it has a distinct product/workspace identity.
- A direct rename or rebrand stays in one canonical directory; record previous names as aliases/metadata.
- Do not create duplicate directories for historical names of the same product.
- Keep acquired or discontinued products as historical entries instead of deleting them.

A project directory discusses only that project: product boundary, technical direction, public technical choices, artifact/source-of-truth model, implementation notes, research gaps and primary sources.

Cross-project taxonomy, comparison, market synthesis, coverage decisions and alias mapping belong only in the root `README.md`.

## Evidence standard

Use sources in this order:

1. official documentation;
2. official product/changelog/engineering posts;
3. official source repositories;
4. primary technical talks;
5. secondary reporting only when no primary source exists.

Do not guess a closed product's internal framework, renderer, data model, source mapping, persistence layer or agent orchestration.

For open-source projects, pin a commit SHA before making source-derived implementation claims.

## Lifecycle

Do not delete discontinued or acquired products. Mark their lifecycle status and preserve them as history.

## Naming

Use stable lowercase ASCII slugs. Prefer the current canonical product name for direct rebrands. Do not place project directories under category folders because categories can change.
