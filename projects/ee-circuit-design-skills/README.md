# EE Circuit Design Skills

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

EE Circuit Design Skills gives agents a reviewable pre-engineering route from a circuit request to versioned SKiDL, an electrical-rule report, optional SPICE evidence, KiCad-compatible netlist, component verification and a human handoff. It explicitly stops before production approval.

## Traceability and netlist hygiene are release gates

Primary components must cite authoritative datasheets with revision and access date, and design constraints must trace back to those sources. Handoff netlists reject anonymous nets and undocumented unused pads; ERC waivers and SPICE applicability are recorded rather than suppressed. Graph, SVG and PNG projections help review connectivity but do not replace SKiDL and netlist authority.

Examples retain prompts, expected behavior, source, reports, waivers and handoff packets. Automated checks prove those files are reproducible; PCB DRC, footprint approval, EMC, safety and regulatory judgment remain explicitly human engineering work.

- [Pinned repository](https://github.com/ThanabordeeN/EE-Curcuit-Design-Skills/tree/cd9fd20a3ad00855d0ec63e09bd1a33f924530e1)
- [Skill contract](https://github.com/ThanabordeeN/EE-Curcuit-Design-Skills/blob/cd9fd20a3ad00855d0ec63e09bd1a33f924530e1/SKILL.md)
- [KiCad handoff policy](https://github.com/ThanabordeeN/EE-Curcuit-Design-Skills/blob/cd9fd20a3ad00855d0ec63e09bd1a33f924530e1/docs/07-kicad-handoff.md)
- [Maintainer location evidence](https://github.com/ThanabordeeN)
