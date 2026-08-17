# CAD Solver

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

CAD Solver is a JavaScript BRep modeling kernel, browser viewer, minimal PDM vault and MCP product. It is not merely a STEP parser: agents can create and modify addressable faces and edges, evaluate geometry and deliver a standard engineering solid.

## Robustness evidence travels with the kernel

The command layer validates JSON modeling operations before execution. MCP groups expose primitives, profiles, booleans, blends, shells, patterns, measurements, mass properties, DFM and simulation-oriented checks. `cad_view_body` writes a self-contained human viewer while mesh payloads support sandboxed agent viewers.

PDM revisions, locks and history govern stored models. A robustness harness generates adversarial geometry and compares behavior against an oracle and parity pack. STEP save → re-import → re-tessellate tests check geometric consistency rather than only file existence.

```text
typed agent command or browser operation -> BRep topology graph
-> validation and robustness evidence -> PDM revision -> STEP / STL / viewer
```

The maintainer reports Colorado, United States.

## Evidence

- [Pinned repository and tool catalog](https://github.com/valentil/cad-solver/tree/3c469aeeba01de65c97445e15fc429db8f355ec1)
- [MCP package](https://github.com/valentil/cad-solver/tree/3c469aeeba01de65c97445e15fc429db8f355ec1/packages/mcp)
- [Command schema and executor](https://github.com/valentil/cad-solver/tree/3c469aeeba01de65c97445e15fc429db8f355ec1/commands)
- [Maintainer location evidence](https://github.com/valentil)
