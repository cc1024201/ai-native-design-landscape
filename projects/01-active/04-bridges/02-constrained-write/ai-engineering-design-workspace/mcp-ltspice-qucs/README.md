# mcp-ltspice-qucs

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

mcp-ltspice-qucs is a three-server circuit and RF design workbench. It lets an agent work at the intent layer—synthesize a filter, place a transmission zero or meet an emissions constraint—while real LTspice, ngspice, Qucs-S, qucsator-RF and Xyce runs supply evidence.

## Circuit IR and durable jobs keep optimization inspectable

The [source packages](https://github.com/RFingAdam/mcp-ltspice-qucs/tree/e170881d2dad50869c78a47ab361daae46937184/src) import/export LTspice ASC, SPICE and Qucs schematic/netlist files into a circuit IR. Analytical synthesis can propose values, but model-aware optimization can require an independent simulator before declaring a specification met.

Durable job artifacts, Touchstone interchange and explicit yield/spec criteria preserve the design–simulate–revise chain. The tool stops at the antenna and schematic-to-layout boundaries rather than claiming unsupported physical closure.

## Evidence

- [Pinned repository](https://github.com/RFingAdam/mcp-ltspice-qucs/tree/e170881d2dad50869c78a47ab361daae46937184)
- [Basic low-pass example](https://github.com/RFingAdam/mcp-ltspice-qucs/tree/e170881d2dad50869c78a47ab361daae46937184/examples/basic_lpf)
- [Circuit workbench guide](https://github.com/RFingAdam/mcp-ltspice-qucs/blob/e170881d2dad50869c78a47ab361daae46937184/docs/circuit-workbench.md)
