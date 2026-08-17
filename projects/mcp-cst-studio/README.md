# mcp-cst-studio

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

mcp-cst-studio gives an agent typed access to CST Studio Suite for antenna, RF/microwave and PCB design. It covers geometry through simulation and optimization rather than exposing only a raw scripting shell.

## One tool layer supports offline plans and live native execution

[`vba_builder.py`](https://github.com/RFingAdam/mcp-cst-studio/blob/eefdd333d3af3c2bc830d3bed59c54914a7ef64b/src/mcp_cst_studio/vba_builder.py) turns validated operations into inspectable VBA when CST is absent. With CST available, [`cst_client.py`](https://github.com/RFingAdam/mcp-cst-studio/blob/eefdd333d3af3c2bc830d3bed59c54914a7ef64b/src/mcp_cst_studio/cst_client.py) executes them directly against the native project.

Parametric templates calculate initial geometry from target frequency; tools then configure materials, ports, mesh and solvers, extract results and run sweeps/optimization. The CST project is canonical. The open wrapper is usable offline but live solving requires a commercial CST license.

## Evidence

- [Pinned repository](https://github.com/RFingAdam/mcp-cst-studio/tree/eefdd333d3af3c2bc830d3bed59c54914a7ef64b)
- [Geometry tools](https://github.com/RFingAdam/mcp-cst-studio/blob/eefdd333d3af3c2bc830d3bed59c54914a7ef64b/src/mcp_cst_studio/tools/geometry.py)
- [Optimization tools](https://github.com/RFingAdam/mcp-cst-studio/blob/eefdd333d3af3c2bc830d3bed59c54914a7ef64b/src/mcp_cst_studio/tools/optimization.py)
