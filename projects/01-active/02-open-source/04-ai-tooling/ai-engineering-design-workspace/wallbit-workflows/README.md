# Wallbit Workflows

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

Wallbit Workflows is a three-repository authoring, registry, and execution system for finance-operation YAML rather than three independent products.

## Studio delegates YAML authorship

The Registry web application invokes Cursor Cloud Agents with the `wallbit-workflow-builder` skill. The skill teaches a fixed schema, supported run IDs, step inputs, and `${steps.<id>...}` references; generated YAML returns to a human-facing publish surface.

## Registry makes publication immutable

The Go API validates the same contracts as the CLI and rejects a repeated author, slug, and semantic-version tuple. Published content is hashed with SHA-256, giving a workflow version a durable identity beyond the Studio session.

## The CLI is the execution authority

`wallbit workflow validate/run/pull/publish` consumes the YAML. The runner resolves cross-step values and dispatches only allowlisted handlers, with fail-fast or continue policies, into real Wallbit finance API operations.

## Pinned evidence

- Studio and registry: [wallbit-workflows/wallbit-registry](https://github.com/wallbit-workflows/wallbit-registry) at [`bd645fe4d06536ea165508e5bb45629b71713dd1`](https://github.com/wallbit-workflows/wallbit-registry/tree/bd645fe4d06536ea165508e5bb45629b71713dd1)
- Runtime: [wallbit-workflows/wallbit-cli](https://github.com/wallbit-workflows/wallbit-cli) at [`835531d73087cd2688c27c7ed6a1321ffa06524f`](https://github.com/wallbit-workflows/wallbit-cli/tree/835531d73087cd2688c27c7ed6a1321ffa06524f)
- Authoring contract: [jeremyjsx/skills](https://github.com/jeremyjsx/skills) at [`2da17de3f02402a6a6bbff57159d4989f59b23c3`](https://github.com/jeremyjsx/skills/tree/2da17de3f02402a6a6bbff57159d4989f59b23c3)
