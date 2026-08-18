# Archischema

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

Archischema is a database-schema design environment whose visual graph and SQL source mode converge on one structured schema model. AI is a mutation route into that model, not a separate picture generator.

## Schema authority and projections

Tables, columns, keys, and relationships are represented as typed graph state in a Rust/Leptos application. The canvas and SQL DDL editor expose different ways to inspect and change the same design. Import and export translate at the boundary; the product's meaningful state is the schema graph that can be validated and re-projected.

## AI changes travel through operations

AI actions are converted into graph operations rather than applied as arbitrary DOM edits. That keeps generated changes inside the same constraints used by direct manipulation. A person can then inspect the affected entities and relationships before continuing.

## Collaboration and recovery

The repository includes CRDT-based LiveShare behavior and snapshots. These mechanisms matter because simultaneous schema edits and AI-produced operations need a mergeable state and a recovery point. They do not by themselves prove semantic database migration safety; exported DDL still needs deployment review.

## Pinned evidence

- Repository: [c0st1nus/Archischema](https://github.com/c0st1nus/Archischema)
- Inspected source tree: [`8fd599c5acd6b970629195e34f5bed843a817800`](https://github.com/c0st1nus/Archischema/tree/8fd599c5acd6b970629195e34f5bed843a817800)
- Immutable revision: [commit `8fd599c`](https://github.com/c0st1nus/Archischema/commit/8fd599c5acd6b970629195e34f5bed843a817800)
