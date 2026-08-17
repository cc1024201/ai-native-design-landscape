# lineforge

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

lineforge is a transmission-line design studio with equal Python, CLI, MCP and chat-driven web surfaces. It calculates common geometries analytically and accepts arbitrary bitmap cross-sections for field solving, then exposes impedance, distributed parameters and field plots for iteration.

## One typed engineering model serves every surface

Geometry and material inputs resolve through shared Pydantic models and solvers rather than model-authored arithmetic. The [web studio](https://github.com/RFingAdam/lineforge/tree/60bfe63fd8f1e45cf2671d200a8d9474f1233d27/frontend) adds stack-up editing, chat and result/field visualization; the MCP server exposes fourteen tools over the same library. Long calculations use inspectable task IDs.

`.lineforge.json` preserves modern project input, while JSON/CSV/Touchstone and plots are derived engineering outputs. The maintainer's first-party profile identifies Milwaukee, United States.

## Evidence

- [Pinned repository](https://github.com/RFingAdam/lineforge/tree/60bfe63fd8f1e45cf2671d200a8d9474f1233d27)
- [Core source](https://github.com/RFingAdam/lineforge/tree/60bfe63fd8f1e45cf2671d200a8d9474f1233d27/src/lineforge)
- [Maintainer profile](https://github.com/RFingAdam)
