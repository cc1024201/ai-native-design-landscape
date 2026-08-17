# RFlect

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

RFlect is an antenna measurement visualization and engineering-review workspace. Its desktop GUI and MCP surface convert chamber, VNA, Touchstone and CST data into comparable 2D/3D patterns, polarization/UWB/MIMO analyses and reviewable reports.

## Deterministic evidence remains separate from agent narrative

[`analysis_engine.py`](https://github.com/RFingAdam/RFlect/blob/32fd53f768919a419f0f03468c7e8d88bda33bc2/plot_antenna/analysis_engine.py) and the plotting modules own reproducible calculations and visualizations. Forty-one MCP tools import measurements, compare antennas and generate report structures; if an agent supplies narrative prose the report keeps it distinct from computed results.

Raw measurement files are authority. Interactive settings and batch analyses produce derived plots and DOCX evidence without pretending the model performed the RF math. This is included as visual engineering verification rather than delegated geometry creation.

## Evidence

- [Pinned repository](https://github.com/RFingAdam/RFlect/tree/32fd53f768919a419f0f03468c7e8d88bda33bc2)
- [MCP orchestration](https://github.com/RFingAdam/RFlect/blob/32fd53f768919a419f0f03468c7e8d88bda33bc2/rflect-mcp/tools/orchestration.py)
- [Report tools](https://github.com/RFingAdam/RFlect/blob/32fd53f768919a419f0f03468c7e8d88bda33bc2/rflect-mcp/tools/report_tools.py)
