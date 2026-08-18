# kicad-tools Agent Skill by Michal Protasowicki

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

This independently maintained Agent Skills integration packages the upstream `kicad-tools` CLI for Copilot, Antigravity and other compatible hosts. It covers analysis, repair, routing, validation and fabrication workflows while bootstrapping the upstream package when needed.

## A portable workflow layer over an upstream engine

The skill owns environment setup, command selection, staged review and failure handling; `rjwalters/kicad-tools` owns the parser and mutation engine. The resulting native KiCad files remain authoritative. Because this repository has its own maintainer, installation and workflow contract, it is an independent companion rather than an alias of the upstream codebase.

It does not duplicate the upstream implementation claim. Any parser, router or DRC capability is limited to the installed upstream version.

- [Pinned repository](https://github.com/michpro/kicad-tools/tree/d66fb7d46d0edf23c7d23be531d4c91646247187)
- [Agent skill](https://github.com/michpro/kicad-tools/blob/d66fb7d46d0edf23c7d23be531d4c91646247187/SKILL.md)
- [Workflow reference](https://github.com/michpro/kicad-tools/blob/d66fb7d46d0edf23c7d23be531d4c91646247187/resources/workflows.md)
- [Maintainer profile checked; no location published](https://github.com/michpro)
