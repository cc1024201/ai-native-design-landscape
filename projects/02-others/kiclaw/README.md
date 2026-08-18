# KiClaw

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

KiClaw is a file-first MCP server for safe KiCad iteration. It inspects and snapshots a project, permits constrained edits, invokes KiCad's own checks and returns a post-mutation diff and evidence instead of treating tool success as completion.

## A snapshot bounds every mutation

The server keeps source access lightweight but delegates authoritative format and rule validation to KiCad where available. Extended edit operations are exposed through typed MCP tools; the companion skill tells an agent when to inspect, mutate, verify or stop.

The checked project is intentionally narrower than a full autonomous PCB designer. It establishes a guarded control loop and evidence protocol while leaving electrical intent and final fabrication approval outside the server.

- [Pinned repository](https://github.com/kiclawhq/kiclaw/tree/6f2a734946246f53f6cea576f58e669766bb6a1b)
- [MCP server](https://github.com/kiclawhq/kiclaw/blob/6f2a734946246f53f6cea576f58e669766bb6a1b/src/kiclaw/server.py)
- [Constrained edit implementation](https://github.com/kiclawhq/kiclaw/blob/6f2a734946246f53f6cea576f58e669766bb6a1b/src/kiclaw/edit_ext.py)
- [Organization profile checked; no location published](https://github.com/kiclawhq)
