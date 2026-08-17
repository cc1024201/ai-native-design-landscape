# cycleCAD

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

cycleCAD is a browser-first mechanical design workspace that combines text- and image-assisted part creation with a B-Rep editor, assemblies, simulation and manufacturability checks. The claim is unusually broad, so this record is anchored to implemented interfaces rather than the feature list alone.

## One model, several control planes

The browser loads OpenCascade geometry and persists projects in IndexedDB. [`bin/cyclecad-cli.js`](https://github.com/xupeiwust/cyclecad/blob/da7bef0f428fdfdc161d8569b1cef7b2db00a6f5/bin/cyclecad-cli.js) and [`server/mcp-server.js`](https://github.com/xupeiwust/cyclecad/blob/da7bef0f428fdfdc161d8569b1cef7b2db00a6f5/server/mcp-server.js) expose the same design operations through CLI and MCP/JSON-RPC, while the browser remains the visual inspection and correction surface. The authority is therefore the parametric/B-Rep project state, not a generated screenshot.

[`AGENT_API_MANIFEST.md`](https://github.com/xupeiwust/cyclecad/blob/da7bef0f428fdfdc161d8569b1cef7b2db00a6f5/AGENT_API_MANIFEST.md) enumerates agent-callable creation, analysis and export operations. Generative-design and simulation claims are kept at source-supported scope; this dossier does not treat every README roadmap item as complete.

The README names `vvlars-cmd/cyclecad` as a canonical upstream, but that address was unavailable at review time. This record counts only the currently inspectable `xupeiwust/cyclecad` lineage and leaves the upstream claim unresolved.

## Evidence

- [Pinned repository](https://github.com/xupeiwust/cyclecad/tree/da7bef0f428fdfdc161d8569b1cef7b2db00a6f5)
- [Browser application](https://github.com/xupeiwust/cyclecad/blob/da7bef0f428fdfdc161d8569b1cef7b2db00a6f5/index.html)
- [Agent API manifest](https://github.com/xupeiwust/cyclecad/blob/da7bef0f428fdfdc161d8569b1cef7b2db00a6f5/AGENT_API_MANIFEST.md)
