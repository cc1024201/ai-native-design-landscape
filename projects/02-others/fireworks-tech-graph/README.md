# Fireworks Tech Graph

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

Fireworks Tech Graph is an installable coding-agent skill for producing technical diagrams as editable SVG and derived PNG, GIF, or offline HTML assets under explicit engineering constraints.

## Diagram type selects a semantic contract

Architecture, deployment, sequence, C4, data-flow, reliability, and other diagram families have different required relationships and validation rules. A router chooses both the diagram contract and one of the supported visual styles rather than merely restyling a generic picture.

## Geometry is generated and checked

Source generators compute nodes, rails, ownership boundaries, labels, and connectors into SVG. Validators fail closed on overlaps, missing semantics, invalid hierarchy, or domain-specific omissions before raster or animated derivatives are delivered.

## SVG remains the correction boundary

PNG and GIF are presentation outputs; the SVG carries editable geometry and text. Offline HTML packages navigation or animation around that source. The skill's product value therefore lies in constrained visual materialization and verification, not a hosted canvas.

## Pinned evidence

- Repository: [yizhiyanhua-ai/fireworks-tech-graph](https://github.com/yizhiyanhua-ai/fireworks-tech-graph)
- Inspected skill router, diagram contracts, style generators, SVG geometry, and validation tree: [`50c819d68fd4fee330b3010988cd13e98b678d44`](https://github.com/yizhiyanhua-ai/fireworks-tech-graph/tree/50c819d68fd4fee330b3010988cd13e98b678d44)
- Immutable revision: [commit `50c819d`](https://github.com/yizhiyanhua-ai/fireworks-tech-graph/commit/50c819d68fd4fee330b3010988cd13e98b678d44)
