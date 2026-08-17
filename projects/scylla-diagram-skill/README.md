# ScyllaDB Diagram Skill

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

The ScyllaDB Diagram Skill is a domain-specific agent workflow, not the source code of its companion visual editor. It guides an agent through architecture decisions and emits the editor's portable `.diagram.json` format.

## Conversation is constrained by database topology

The skill asks for workload, region, replication, node, connectivity, and operational facts needed for a ScyllaDB deployment. A live Mermaid preview gives the user a fast visual check during the interview. The final JSON preserves domain objects for later direct editing.

## The handoff artifact is decisive

`.diagram.json` is designed to open in the separately hosted ScyllaDB Diagram Editor. This repository proves the questioning, validation, preview, and export policy in `SKILL.md`; it does not expose the companion editor implementation, so editor internals remain an evidence boundary.

## A diagram is not capacity validation

The skill can make topology explicit and catch missing inputs. It cannot replace benchmarking, failure testing, or ScyllaDB operational review. The same agent instruction is packaged for Claude, Copilot, Cursor, Codex, and generic skill hosts.

## Pinned evidence

- Repository: [zseta/scylla-diagram-skill](https://github.com/zseta/scylla-diagram-skill)
- Inspected skill package: [`9465683f7ecef3b8f45e3c4b1acdc3864648d587`](https://github.com/zseta/scylla-diagram-skill/tree/9465683f7ecef3b8f45e3c4b1acdc3864648d587)
- Immutable revision: [commit `9465683`](https://github.com/zseta/scylla-diagram-skill/commit/9465683f7ecef3b8f45e3c4b1acdc3864648d587)
