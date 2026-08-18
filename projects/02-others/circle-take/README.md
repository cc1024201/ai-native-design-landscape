# Circle Take

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

Circle Take defines AI filmmaking design as promotion among generated candidates. It organizes takes by shot, retains each generator recipe, runs local quality gates, supports synchronized comparison and makes the director's circled take—not the latest generation—the delivery decision.

## Quality evidence and creative judgment remain separate

The local gate has distinct [identity](https://github.com/wassermanproductions/circle-take/blob/45c0a46b51cc82cb91d0d2910c6c38e4e48a3996/python/circletake_gate/checks/identity.py), [temporal](https://github.com/wassermanproductions/circle-take/blob/45c0a46b51cc82cb91d0d2910c6c38e4e48a3996/python/circletake_gate/checks/temporal.py), anatomy, conformance and continuity checks. Their report can disqualify or explain a take but does not automatically promote it. The renderer's project store preserves ratings, prompt differences, selected spans and human circling; only circled candidates enter the print path.

[`exports.ts`](https://github.com/wassermanproductions/circle-take/blob/45c0a46b51cc82cb91d0d2910c6c38e4e48a3996/src/main/exports.ts) emits FCPXML, EDL or CSV selects and a separate reshoot list carrying the failed take's exact prompt, seed and reason. The [MCP bridge](https://github.com/wassermanproductions/circle-take/blob/45c0a46b51cc82cb91d0d2910c6c38e4e48a3996/mcp/circle-take-mcp.mjs) operates the same project and promotion state, so agent review cannot silently bypass the dailies decision.

## Evidence

- [Pinned repository](https://github.com/wassermanproductions/circle-take/tree/45c0a46b51cc82cb91d0d2910c6c38e4e48a3996)
- [Project persistence](https://github.com/wassermanproductions/circle-take/blob/45c0a46b51cc82cb91d0d2910c6c38e4e48a3996/src/main/project.ts)
- [Continuity gate](https://github.com/wassermanproductions/circle-take/blob/45c0a46b51cc82cb91d0d2910c6c38e4e48a3996/python/circletake_gate/checks/continuity.py)
