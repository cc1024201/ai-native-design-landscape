# SCAD WebMCP

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

SCAD WebMCP is a localhost browser workspace for agent-driven OpenSCAD. Source, exposed parameters, render status and export state live in one TanStack store; a Monaco editor and 16 WebMCP tools operate that shared project.

## The agent edits source rather than only sliders

[`tools.ts`](https://github.com/jherr/webmcp-openscad/blob/a3acb68578701001f0251459c75716a55aadfa10/src/mcp/tools.ts) exposes parameter, source, render and export operations through `navigator.modelContext`. [`openscad-worker.ts`](https://github.com/jherr/webmcp-openscad/blob/a3acb68578701001f0251459c75716a55aadfa10/src/worker/openscad-worker.ts) runs OpenSCAD WASM with bundled libraries. Changes auto-render and the UI reports duration, triangle count and failures before export.

```text
loaded .scad -> direct Monaco or agent source/parameter mutation
-> OpenSCAD WASM render -> viewport + render facts -> repair -> export
```

It is intentionally a local protocol demo, but the demo implements the complete editable loop. The maintainer reports Oregon, United States.

## Evidence

- [Pinned repository](https://github.com/jherr/webmcp-openscad/tree/a3acb68578701001f0251459c75716a55aadfa10)
- [WebMCP tools](https://github.com/jherr/webmcp-openscad/blob/a3acb68578701001f0251459c75716a55aadfa10/src/mcp/tools.ts)
- [WASM worker](https://github.com/jherr/webmcp-openscad/blob/a3acb68578701001f0251459c75716a55aadfa10/src/worker/openscad-worker.ts)
- [Maintainer location evidence](https://github.com/jherr)
