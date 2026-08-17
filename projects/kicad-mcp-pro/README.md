# KiCad MCP Pro

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

KiCad MCP Pro is a staged agent interface to native KiCad design, review and manufacturing operations. It deliberately separates read-only review, controlled build, human-gated release and expert profiles instead of exposing hundreds of mutating tools as one undifferentiated surface.

## Native KiCad checks remain the release gate

The default profile starts with a bounded review set; write and manufacturing modes require explicit elevation. [Progressive disclosure](https://github.com/oaslananka/kicad-mcp-pro/blob/ae6cc34131b0cb95aa0877d0a649297af3bc8f58/docs/agents/progressive-disclosure.md) keeps the agent's visible capability surface aligned with that phase. Product-owned skills distinguish [schematic review](https://github.com/oaslananka/kicad-mcp-pro/blob/ae6cc34131b0cb95aa0877d0a649297af3bc8f58/.opencode/skills/schematic-review/SKILL.md), [PCB design](https://github.com/oaslananka/kicad-mcp-pro/blob/ae6cc34131b0cb95aa0877d0a649297af3bc8f58/.opencode/skills/pcb-design/SKILL.md) and [fabrication output](https://github.com/oaslananka/kicad-mcp-pro/blob/ae6cc34131b0cb95aa0877d0a649297af3bc8f58/.opencode/skills/fabrication-output/SKILL.md).

`.kicad_sch`, `.kicad_pcb` and project files are authoritative. ERC, DRC and export invoke KiCad's engines; first-order engineering estimates are explicitly not sign-off. The product's distinctive mechanism is permissioned progression from evidence to mutation to manufacturing handoff.

## Evidence

- [Pinned repository](https://github.com/oaslananka/kicad-mcp-pro/tree/ae6cc34131b0cb95aa0877d0a649297af3bc8f58)
- [Capability parity ledger](https://github.com/oaslananka/kicad-mcp-pro/blob/ae6cc34131b0cb95aa0877d0a649297af3bc8f58/docs/compatibility/capability-parity.generated.md)
- [Maintainer profile: Türkiye](https://github.com/oaslananka)
