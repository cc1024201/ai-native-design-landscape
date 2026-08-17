# DCC-MCP OpenUSD

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

DCC-MCP OpenUSD is a headless authoring and validation product for portable USD projects. It can run in a lightweight USDA text mode or through Pixar's `pxr` runtime; every result reports which mode actually produced it.

## Capability degrades explicitly rather than pretending

Both modes can create projects and stages, list and define prims, set transforms, add references, snapshot and validate. Material binding, cameras/lights, time-sampled animation, sublayers, payloads and variants require `pxr`; without it those calls fail with a precise runtime requirement.

[`create_stage.py`](https://github.com/dcc-mcp/dcc-mcp-openusd/blob/f3f61d92531c69925bc74d47a74682be0b241799/src/dcc_mcp_openusd/skills/openusd-stage/scripts/create_stage.py) establishes the authority. Composition and material Skills then mutate native USD semantics, and the validation package can create a USDZ-style archive. Host adapters remain responsible for rendering and application-specific import.

## Evidence

- [Pinned OpenUSD package](https://github.com/dcc-mcp/dcc-mcp-openusd/tree/f3f61d92531c69925bc74d47a74682be0b241799)
- [Material creation](https://github.com/dcc-mcp/dcc-mcp-openusd/blob/f3f61d92531c69925bc74d47a74682be0b241799/src/dcc_mcp_openusd/skills/openusd-material/scripts/create_material.py)
- [Composition Skill](https://github.com/dcc-mcp/dcc-mcp-openusd/blob/f3f61d92531c69925bc74d47a74682be0b241799/src/dcc_mcp_openusd/skills/openusd-composition/SKILL.md)
- [Snapshot and project semantics](https://github.com/dcc-mcp/dcc-mcp-openusd/blob/f3f61d92531c69925bc74d47a74682be0b241799/src/dcc_mcp_openusd/skills/openusd-project/scripts/snapshot_stage.py)
