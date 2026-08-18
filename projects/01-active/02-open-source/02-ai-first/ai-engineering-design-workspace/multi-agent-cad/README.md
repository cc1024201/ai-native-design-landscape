# Multi-Agent CAD (MAC)

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

Multi-Agent CAD turns a concise requirement into printable build123d geometry through four bounded agents. Its technical thesis is that CAD reasoning can be compressed into typed intermediate artifacts instead of repeatedly feeding one agent the entire tool documentation and repair history.

## Four stages, three durable authorities

The Spec Planner writes `cad_brief.json`; the Geometric Architect writes `architect_plan.json`; the Python Coder produces executable build123d source; a repair stage responds to execution and QA failures. The brief and plan are cached, so a user can rerun the same intent with a fresh coding/repair attempt without discarding upstream decisions.

Executable Python is the construction authority, while the OpenCascade-backed build123d result determines whether that source resolves into valid solids. STEP/STL/GLB are delivery and preview derivatives. The web UI renders GLB for inspection and download but does not become the CAD model of record.

## Structured handoffs limit drift

LangGraph passes `CADBrief`, `ArchitectPlan` and QA reports between stages. This separates requirement interpretation, geometric strategy and executable repair, and lets failures return to the stage that owns them. It also makes the project's token-efficiency claim an orchestration property rather than evidence of geometric correctness.

## Evidence boundary

The repository includes benchmark outputs and reported feature-pass results, but this dossier treats those as project claims rather than a universal success rate. Printability, tolerance and manufacturing fitness still require domain validation beyond a successful render.

- [Pinned Multi-Agent CAD revision](https://github.com/Pan-Chera/Multi-Agent-CAD/tree/c8951141fd38876753ce0fc81f02b80ae19150c1)
- [LangGraph pipeline](https://github.com/Pan-Chera/Multi-Agent-CAD/blob/c8951141fd38876753ce0fc81f02b80ae19150c1/multi_agent_cad/graph.py)
- [Typed handoff schemas](https://github.com/Pan-Chera/Multi-Agent-CAD/blob/c8951141fd38876753ce0fc81f02b80ae19150c1/multi_agent_cad/schemas.py)
- [Web preview server](https://github.com/Pan-Chera/Multi-Agent-CAD/blob/c8951141fd38876753ce0fc81f02b80ae19150c1/multi_agent_cad/web/server.py)
