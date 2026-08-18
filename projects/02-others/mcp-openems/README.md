# mcp-openems

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

mcp-openems exposes openEMS electromagnetic simulation as agent-callable engineering operations. It creates reproducible solver scripts and parameterized models for antennas, transmission lines, filters and vias, then returns simulation artifacts for a next design decision.

## Generated solver programs are inspectable authority

The [`server`](https://github.com/RFingAdam/mcp-openems/blob/51de136d6dd0c8450cbab2782f8e84dc5597b117/src/mcp_openems/server.py) validates design inputs before generating Python/openEMS jobs. Geometry, mesh, boundary and sweep parameters remain explicit; native output directories and result files retain the evidence needed to inspect a run.

The product does not pretend an LLM estimate is a field solution. An agent can vary a parameter and rerun the deterministic engine, making simulation evidence part of the engineering correction loop.

## Evidence

- [Pinned repository](https://github.com/RFingAdam/mcp-openems/tree/51de136d6dd0c8450cbab2782f8e84dc5597b117)
- [Package source](https://github.com/RFingAdam/mcp-openems/tree/51de136d6dd0c8450cbab2782f8e84dc5597b117/src/mcp_openems)
- [Examples](https://github.com/RFingAdam/mcp-openems/tree/51de136d6dd0c8450cbab2782f8e84dc5597b117/examples)
