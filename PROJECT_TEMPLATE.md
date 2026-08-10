# Project name

> Research status: **Seed | Product-level | Architecture-level | Architecture-level / closed-source boundary reached | Source-level** · Last reviewed: **YYYY-MM-DD**

> Template note: this is a research aid, not a required table of contents. Keep the metadata and evidence anchors, then replace the middle with a structure derived from the project itself.

| Field | Value |
|---|---|
| Organization / team | |
| Category | |
| Status | |
| Source availability | |
| Previous names / aliases | |
| Canonical product URL | |
| Canonical source repository | |
| Pinned source revision | `commit SHA`, tag, release, or `N/A — closed source` |

## Design the dossier before writing it

Identify the few questions that actually explain this project:

1. What ordinary-user job or workflow gives the product its identity?
2. What durable artifact or source of truth crosses that workflow?
3. What mechanism is technically distinctive or causally decisive?
4. Where does identity, context, authority, fidelity or history break?
5. Which claims can be established from product behavior, public contracts, source code or commit history?

Turn those answers into project-specific headings. Prefer a causal narrative over a feature inventory.

Examples:

- a compile-time locator may be organized as `transform coverage → injected identity → runtime lookup → agent handoff → failure cases`;
- an annotation bridge may use `capture surface → target stability → context projection → persistence → agent consumption`;
- a code-native editor may use `canonical source → runtime projection → element identity → mutation path → undo/version boundary`;
- an agent workspace may use `user loop → execution authority → artifact production → preview/review → delivery/recovery`;
- a canvas editor may use `document graph → operations → renderer → collaboration → version semantics`.

These are examples, not replacement templates. A project can require a different sequence or a unique section that appears nowhere else in the repository.

## Optional investigation lenses

Use these to find blind spots. Do not turn them into headings merely because they are listed.

- product boundary, lifecycle and ordinary-user journey;
- technical direction and concrete public choices;
- durable artifacts, transient representations and identity model;
- agent invocation, context, tools, permissions and correction path;
- execution, renderer, preview transport and isolation;
- visual/canvas/DOM target identity and source-return mechanism;
- workspace, session, undo, version, collaboration and delivery semantics;
- implementation paths, regression tests and historical commits;
- discontinuities between UI claims and user-obtainable artifacts.

For closed-source products, leave undisclosed internals unknown. Replace implementation questions with observable product behavior, official contracts, changelogs and explicit unknowns.

`Architecture-level / closed-source boundary reached` is a completion state, not a substitute for source evidence. Use it only when the project's decisive user journey, working artifact authority, public runtime/protocol edges, delivery and persistence behavior, documented failures, meaningful live observations and remaining unknowns have all been traced for the current snapshot. If a material public check is still accessible within the current authorized scope, the dossier is not yet at that boundary. A check that requires new credentials, paid access, private user data or external coordination may remain explicitly access-blocked; record what was not tested and do not turn the gap into a product claim.

## Common evidence floor

The final dossier must contain these anchors, although their exact placement can vary:

- canonical product identity, lifecycle and aliases;
- primary sources close to the claims they support;
- an immutable revision for source-derived implementation claims;
- the project's decisive critical path and known failure boundaries;
- a clear separation of fact, inference and unknown;
- open research gaps and unperformed acceptance checks.

For source-available work, include an implementation map shaped around the project's questions. For example:

| Project-specific concern | Repository path | What it establishes |
|---|---|---|
| | | |

When history changes the conclusion, commit evidence should explain that architectural change rather than serve as a decorative chronology:

| Date | Commit | What changed in the project's causal model |
|---|---|---|
| | | |

## Evidence boundary

- **Fact:** directly established by a primary source, observed product behavior or pinned source code.
- **Inference:** a conclusion derived from facts; label it explicitly.
- **Unknown/unverified:** do not fill the gap by guessing.
- **Not established:** state important capabilities or guarantees that the evidence does not prove.

Cross-project comparison belongs in the repository root, never in the project dossier.

## Research gaps

- Add the next checks that could materially change the dossier's conclusions.

## Primary sources

- Prefer official product pages, documentation, changelogs and immutable source links.
