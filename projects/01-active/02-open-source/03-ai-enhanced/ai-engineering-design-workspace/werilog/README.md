# Werilog

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

Werilog defines visual design around executable hardware description. Verilog source can be inspected as a schematic, simulated in the browser, and extended through an AI agent toward semi-automated XPU design.

## HDL is the authority

The diagram view derives interactive logic structure from Verilog modules. Assembly inspection provides another projection for RISC-V work. Because Icarus Verilog runs through WebAssembly, the user can test behavior without first installing a local hardware toolchain.

## The agent must survive compilation

Gemini-backed agent features can propose HDL and diagram changes, but generated work enters a real syntax and simulation environment. Compile and simulation results provide stronger feedback than a rendered block diagram, while still falling short of synthesis, timing closure, or silicon correctness.

## Design is a feedback loop

Source edit, schematic projection, simulation, and revision are the core loop. Teamwork is an aspiration in the current project description; it should not be counted as proven collaborative infrastructure until the source implements it.

## Pinned evidence

- Repository: [werispace/werilog](https://github.com/werispace/werilog)
- Inspected HDL environment: [`2783c6ea816f67e9b8adc463548bbf79f9d300f2`](https://github.com/werispace/werilog/tree/2783c6ea816f67e9b8adc463548bbf79f9d300f2)
- Immutable revision: [commit `2783c6e`](https://github.com/werispace/werilog/commit/2783c6ea816f67e9b8adc463548bbf79f9d300f2)
