# kicad-cursor

> Research status: **Architecture-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

kicad-cursor is a chat-driven Cursor workspace that combines a design brief, datasheets, component selection, schematic and PCB MCP servers and an ERC/DRC verification skill.

## design.yaml is the conversational handoff

The agent reads `design.yaml`, selects parts from a shared library, mutates a live KiCad project through IPC and uses the official CLI for verification. Native `.kicad_sch` and `.kicad_pcb` files remain authoritative; constraints, BOM targets and reports support the path.

The checked repository hard-codes the maintainer's Windows global-library paths and requires WSL for part import. It therefore establishes a working personal architecture and reusable template, not a portable zero-configuration product.

- [Pinned repository](https://github.com/cyon1c/kicad-cursor/tree/ea4d359f6a5f733521add60b70a9b7abb8832deb)
- [Project skill](https://github.com/cyon1c/kicad-cursor/blob/ea4d359f6a5f733521add60b70a9b7abb8832deb/.cursor/skills/kicad-project/SKILL.md)
- [Verification skill](https://github.com/cyon1c/kicad-cursor/blob/ea4d359f6a5f733521add60b70a9b7abb8832deb/.cursor/skills/design-verify/SKILL.md)
- [Maintainer profile: United States](https://github.com/cyon1c)
