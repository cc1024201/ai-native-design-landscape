# Trace

> Research status: **Architecture-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

Trace is an independent KiCad-derived desktop PCB suite whose central technical choice is a dual representation: the agent edits structured `.trace_sch` and `.trace_pcb` text while the engineer works in the visual schematic and board editors. Standard `.kicad_sch` and `.kicad_pcb` files remain the retained project authority.

## An AI representation is compiled back into the professional editor

The [first-party architecture description](https://docs.buildwithtrace.com/concepts/under-the-hood) says conversion is debounced and the visual editor reloads after an agent write. The public repository exposes the grammar and both conversion directions for schematics and boards in [`trace/eeschema`](https://github.com/buildwithtrace/trace/tree/e48d9a7f52d65e900a801369903e3484ecf3e114/trace/eeschema) and [`trace/pcbnew`](https://github.com/buildwithtrace/trace/tree/e48d9a7f52d65e900a801369903e3484ecf3e114/trace/pcbnew). The hosted reasoning and complete desktop coordination layer are not sufficiently exposed to claim source-level reconstruction.

## Trust is coupled to every mutation

Ask mode is read-only; Agent mode writes and checks the design; Plan mode presents a multi-step plan for approval. Each AI edit creates local history and can also sync to cloud history. Per-message undo restores the pre-edit circuit by creating another version rather than deleting the old timeline. ERC and DRC run during iteration, and the final deliverables remain normal KiCad and manufacturing files.

This makes Trace different from a chat wrapper around an EDA API: the agent-facing syntax, visual projection, rule engine, history and fabrication export all refer to the same circuit.

## Evidence

- [Pinned repository](https://github.com/buildwithtrace/trace/tree/e48d9a7f52d65e900a801369903e3484ecf3e114)
- [How Trace Works](https://docs.buildwithtrace.com/concepts/how-trace-works)
- [Version history and rollback](https://docs.buildwithtrace.com/guides/version-history)
