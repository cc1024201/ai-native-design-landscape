# PartMode

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

PartMode is a browser parametric CAD studio designed so a human editor and an agent operate one schema-versioned document. The OpenCascade WASM kernel supplies exact BRep geometry; the application does not treat a triangulated viewport as sufficient proof of the model.

## Agent changes have a preview and commit boundary

[`studio-project-v5.js`](https://github.com/BOMWiki/partmode/blob/0144dad53e9b1f1d2deb2adf2ff4bd4cdc81cefd/src/static/studio-project-v5.js) defines the current parametric document. [`studio-agent-service.js`](https://github.com/BOMWiki/partmode/blob/0144dad53e9b1f1d2deb2adf2ff4bd4cdc81cefd/src/static/studio-agent-service.js) stages agent operations so the user can preview before commit. [`studio-brep-evidence.js`](https://github.com/BOMWiki/partmode/blob/0144dad53e9b1f1d2deb2adf2ff4bd4cdc81cefd/src/static/studio-brep-evidence.js) exposes exact geometry evidence back to the loop.

```text
human editor or typed MCP request -> proposed schema-5 document mutation
-> preview -> commit -> OpenCascade BRep solve
-> topology and measured evidence -> history -> STEP / STL / DXF / project export
```

This staged, evidence-bearing path is why PartMode is more than a text-to-mesh demo. No reliable first-party location was found.

## Evidence

- [Pinned repository](https://github.com/BOMWiki/partmode/tree/0144dad53e9b1f1d2deb2adf2ff4bd4cdc81cefd)
- [Architecture](https://github.com/BOMWiki/partmode/blob/0144dad53e9b1f1d2deb2adf2ff4bd4cdc81cefd/docs/architecture.md)
- [MCP surface](https://github.com/BOMWiki/partmode/blob/0144dad53e9b1f1d2deb2adf2ff4bd4cdc81cefd/src/mcp.ts)
- [Exact-geometry evidence](https://github.com/BOMWiki/partmode/blob/0144dad53e9b1f1d2deb2adf2ff4bd4cdc81cefd/src/static/studio-brep-evidence.js)
