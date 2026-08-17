# Konnect

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

Konnect is mixelpixx's Rust successor to KiCAD MCP Server for KiCad 10. Its distinguishing decision is to combine exact file-level schematic editing with KiCad's native IPC for live PCB operations, rather than treating all CAD control as one opaque script channel.

## Two mutation paths preserve the right authority

Schematic work is performed through a typed S-expression editor over `.kicad_sch`, with atomic file replacement. Live board operations use KiCad IPC protobuf messages over NNG, so changes can participate in the running editor's own operation and undo behavior. Verification and export tools call `kicad-cli`; a live schematic viewer provides visual evidence around the same project.

The repository exposes 187 tools grouped into 18 toolsets at the reviewed revision. The number is less important than the boundary: project files stay durable, KiCad remains the geometry and rule engine, and the MCP router selects bounded operations rather than asking a model to synthesize arbitrary UI automation.

## Evidence

- [Pinned repository](https://github.com/mixelpixx/Konnect/tree/5cd6454969d2d060ff8c65b480651a4341051eed)
- [Tool registry](https://github.com/mixelpixx/Konnect/blob/5cd6454969d2d060ff8c65b480651a4341051eed/crates/konnect-core/src/router/registry.rs)
- [KiCad IPC client](https://github.com/mixelpixx/Konnect/blob/5cd6454969d2d060ff8c65b480651a4341051eed/crates/konnect-ipc/src/client.rs)
- [Schematic editor](https://github.com/mixelpixx/Konnect/blob/5cd6454969d2d060ff8c65b480651a4341051eed/crates/konnect-schematic-editor/src/lib.rs)
