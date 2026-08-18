# Buildable

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

Buildable is not a hosted prompt-to-app service. It is a local product-structure compiler and agent skill pack: it turns intent into a typed app specification, selects either a runnable starter or a plan-only pack, and gives an external coding agent a bounded generation and review workflow.

## The specification precedes source

[`core/schemas/app-spec.schema.json`](https://github.com/suntay44/buildable-plugin-skills/blob/6a7078c5cea335dc1eb46bdc2c5283a24ae55b9e/core/schemas/app-spec.schema.json) defines the app's archetype, screens, entities, features, design profile, references, and guardrails. Planning material under `.buildable` is a decision artifact; it is not presented as the runnable app.

[`bin/buildable.mjs`](https://github.com/suntay44/buildable-plugin-skills/blob/6a7078c5cea335dc1eb46bdc2c5283a24ae55b9e/bin/buildable.mjs) classifies requests and implements the local CLI. [`commands/buildable-generate.md`](https://github.com/suntay44/buildable-plugin-skills/blob/6a7078c5cea335dc1eb46bdc2c5283a24ae55b9e/commands/buildable-generate.md) makes the artifact boundary explicit: a supported archetype copies build-verified starter source; a planned-only archetype emits an instruction pack that another agent must implement.

## Review closes the loop without owning deployment

The review command audits generated source against the saved spec, state coverage, accessibility, responsive layout, and optional build output. Preview uses the generated project's own development toolchain, with optional browser inspection. The default workflow intentionally does not add hosting or deployment; Buildable's deliverable is the local spec and source tree.

## Evidence and location

- [Canonical repository](https://github.com/suntay44/buildable-plugin-skills)
- [Inspected tree](https://github.com/suntay44/buildable-plugin-skills/tree/6a7078c5cea335dc1eb46bdc2c5283a24ae55b9e)
- [Build workflow](https://github.com/suntay44/buildable-plugin-skills/blob/6a7078c5cea335dc1eb46bdc2c5283a24ae55b9e/core/build-workflow.md)
- Commit: `6a7078c5cea335dc1eb46bdc2c5283a24ae55b9e`

No reliable public location was found for the maintainer; team region remains unknown.
