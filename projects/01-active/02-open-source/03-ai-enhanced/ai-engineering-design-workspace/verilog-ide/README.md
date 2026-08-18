# Verilog IDE

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

Verilog IDE treats hardware source as the authority and uses two different projections to decide whether a generated design is useful: simulation waveforms and a synthesized netlist.

## Model output enters an engineering toolchain

[`server.py`](https://github.com/SanjaySurampudi/verilog_ide/blob/3165dfe0609fe9db09bc480edc6f30797125b087/server.py) supports multiple model providers for RTL and testbench generation. It also exposes Icarus Verilog execution and Yosys synthesis rather than stopping at source completion.

## Validation changes the meaning of preview

[`script.js`](https://github.com/SanjaySurampudi/verilog_ide/blob/3165dfe0609fe9db09bc480edc6f30797125b087/Frontend/script.js) writes responses into browser editors, invokes simulation, renders waveform data and requests synthesis results. The visual evidence is derived from executable hardware semantics; it is not a decorative code preview.

Users can edit source and testbench, rerun the toolchain and download artifacts. No durable project database or parametric CAD kernel is present, so the architecture remains source-authority engineering design rather than parametric-model authority.

## Pinned record

- [Canonical repository](https://github.com/SanjaySurampudi/verilog_ide)
- [Inspected commit](https://github.com/SanjaySurampudi/verilog_ide/commit/3165dfe0609fe9db09bc480edc6f30797125b087)
- Commit: `3165dfe0609fe9db09bc480edc6f30797125b087`
