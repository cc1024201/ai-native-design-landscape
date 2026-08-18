# mcp-nec2-antenna

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

mcp-nec2-antenna is an agent interface to NEC2 wire-antenna design and simulation. It creates parameterized dipole, inverted-V, Yagi, vertical and loop models and exposes impedance and radiation evidence for design iteration.

## Native NEC cards separate design intent from simulation claims

The [package source](https://github.com/RFingAdam/mcp-nec2-antenna/tree/96b0e5bf9969b835ef2105b51a4fd287590bcc28/src) maps typed geometry and frequency inputs into NEC decks, invokes the solver and parses results. Model files and solver output remain reviewable instead of being compressed into an agent answer.

The ordinary loop is parameterize an antenna, simulate, inspect impedance/gain patterns and revise. That makes this a narrow engineering design product rather than a generic command wrapper.

## Evidence

- [Pinned repository](https://github.com/RFingAdam/mcp-nec2-antenna/tree/96b0e5bf9969b835ef2105b51a4fd287590bcc28)
- [Source package](https://github.com/RFingAdam/mcp-nec2-antenna/tree/96b0e5bf9969b835ef2105b51a4fd287590bcc28/src)
- [Examples](https://github.com/RFingAdam/mcp-nec2-antenna/tree/96b0e5bf9969b835ef2105b51a4fd287590bcc28/examples)
