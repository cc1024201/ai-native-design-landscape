# DCC-MCP Substance 3D Designer

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

This adapter embeds a Streamable HTTP server inside Substance 3D Designer and dispatches calls through Designer's Qt main thread. Its current surface is narrow but complete: inspect the active session and create a rendered procedural PBR material package.

## One bounded material pass

The [`designer-session` Skill](https://github.com/dcc-mcp/dcc-mcp-substance3d-designer/blob/c4a00cf448b9043262289e7d721249283d234230/src/dcc_mcp_substance3d_designer/skills/designer-session/SKILL.md) owns the artifact workflow. Host APIs are imported only while a tool runs so catalog discovery is safe outside Designer. The procedural package is created through the actual Designer session and its render path rather than synthesized as unrelated image files.

This is counted despite its small tool count because it crosses the essential boundary from session inspection into native procedural material creation and rendered delivery. The adapter uses its own package, plugin and release; the shared core is only transport and discovery.

## Evidence

- [Pinned adapter](https://github.com/dcc-mcp/dcc-mcp-substance3d-designer/tree/c4a00cf448b9043262289e7d721249283d234230)
- [Typed tools](https://github.com/dcc-mcp/dcc-mcp-substance3d-designer/blob/c4a00cf448b9043262289e7d721249283d234230/src/dcc_mcp_substance3d_designer/skills/designer-session/tools.yaml)
- [Main-thread dispatcher](https://github.com/dcc-mcp/dcc-mcp-substance3d-designer/blob/c4a00cf448b9043262289e7d721249283d234230/src/dcc_mcp_substance3d_designer/dispatcher.py)
