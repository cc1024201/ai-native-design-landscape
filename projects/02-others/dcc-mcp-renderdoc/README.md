# DCC-MCP RenderDoc

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

DCC-MCP RenderDoc is a visual-verification adapter for graphics applications and games. It controls official RenderDoc capture paths and converts one `.rdc` frame into bounded machine-readable and human-reviewable evidence; it does not mutate the source game or scene.

## A capture is durable evidence, not a screenshot alone

The adapter can launch a specific executable, attach to an existing process or trigger a delayed capture through RenderDoc's official Target Control API. No shell is invoked. It rejects no-work captures but preserves the `.rdc` file so failure can be audited.

[`inspect_capture.py`](https://github.com/dcc-mcp/dcc-mcp-renderdoc/blob/2b0fa8468e03de12008c1a0ee06fd40bd8a2584a/src/dcc_mcp_renderdoc/skills/renderdoc-analysis/scripts/inspect_capture.py) reports driver, machine identity, chunk version, frame work, present counts and representative calls. Thumbnail, draw-call resources and Chrome trace exports create different review projections from the same immutable capture.

## Evidence

- [Pinned adapter](https://github.com/dcc-mcp/dcc-mcp-renderdoc/tree/2b0fa8468e03de12008c1a0ee06fd40bd8a2584a)
- [Capture-program implementation](https://github.com/dcc-mcp/dcc-mcp-renderdoc/blob/2b0fa8468e03de12008c1a0ee06fd40bd8a2584a/src/dcc_mcp_renderdoc/skills/renderdoc-capture/scripts/capture_program.py)
- [Thumbnail export](https://github.com/dcc-mcp/dcc-mcp-renderdoc/blob/2b0fa8468e03de12008c1a0ee06fd40bd8a2584a/src/dcc_mcp_renderdoc/skills/renderdoc-analysis/scripts/export_thumbnail.py)
- [Target Control boundary](https://github.com/dcc-mcp/dcc-mcp-renderdoc/blob/2b0fa8468e03de12008c1a0ee06fd40bd8a2584a/src/dcc_mcp_renderdoc/_target_control.py)
