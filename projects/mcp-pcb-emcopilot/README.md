# mcp-pcb-emcopilot

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

mcp-pcb-emcopilot is an EMC and signal-integrity review system for real PCB artifacts. It parses KiCad schematic and layout files, cross-references the BOM, applies market-specific preflight constraints and queues deeper simulations when a finding needs evidence.

## Three-way artifact correlation makes findings addressable

The [source package](https://github.com/RFingAdam/mcp-pcb-emcopilot/tree/bb7043c4269f162ce6e53c24ee0f17478b0faed1/src) resolves schematic nets, layout geometry and component identities into shared findings. Return-path, decoupling, crosstalk, plane-resonance and high-speed-interface analyzers operate on those parsed artifacts.

Cross-MCP intents can request regulatory limits, openEMS/NEC2 simulation or circuit work without erasing where a claim originated. Native KiCad files remain authority; reports and queues are review/correction evidence.

## Evidence

- [Pinned repository](https://github.com/RFingAdam/mcp-pcb-emcopilot/tree/bb7043c4269f162ce6e53c24ee0f17478b0faed1)
- [Source package](https://github.com/RFingAdam/mcp-pcb-emcopilot/tree/bb7043c4269f162ce6e53c24ee0f17478b0faed1/src)
- [Documentation](https://github.com/RFingAdam/mcp-pcb-emcopilot/tree/bb7043c4269f162ce6e53c24ee0f17478b0faed1/docs)
