# Canopy

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

Canopy is a rendering bridge between coding agents and diagram formats. It is counted because an agent can create source, invoke deterministic render tools, and place the result back into the user's coding environment for correction.

## A renderer over many source languages

The implementation delegates roughly 27 diagram syntaxes to Kroki-compatible rendering rather than inventing one universal graph model. Mermaid, PlantUML, Graphviz, and other source files remain authoritative; the preview is a derived image. That choice favors portability over direct manipulation.

## The MCP edge closes the agent loop

Canopy exposes render-oriented MCP tools so Claude and other clients can submit diagram source, receive visual output, and iterate after an error. Inline preview in the editor makes the result visible next to the source. A model therefore gets visual feedback without owning the renderer or the user's filesystem.

## Save and export are explicit boundaries

The web/editor surface supports source editing, saving, and export. Rendering success proves syntactic acceptability, not semantic correctness. There is no evidence here of a shared native canvas, object-level collaboration, or reversible graph operations across all supported languages.

## Pinned evidence

- Repository: [Dev-Dipesh/canopy](https://github.com/Dev-Dipesh/canopy)
- Inspected tree: [`d1119e5451a5224cb32789fa78520446a7d7ebe6`](https://github.com/Dev-Dipesh/canopy/tree/d1119e5451a5224cb32789fa78520446a7d7ebe6)
- Immutable revision: [commit `d1119e5`](https://github.com/Dev-Dipesh/canopy/commit/d1119e5451a5224cb32789fa78520446a7d7ebe6)
