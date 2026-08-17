# agent-svgtools

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

agent-svgtools gives coding agents a machine-readable feedback loop for semantic SVG authoring. It is neither a full design agent nor an auto-tracer: a Rust CLI renders and audits an agent-authored SVG against a raster target so the agent can localize and repair the worst mismatch.

## Scores point to defects; they do not accept the design

The CLI extracts colors, inspects SVG structure and external resources, renders at target resolution and reports pixel match, SSIM and ranked error regions. It can also emit heatmaps, side-by-side panels, onion-skin blends and coordinate grids for a vision model.

The SVG file remains authoritative. Raster references and diffs are evidence. Tracing is explicitly a disposable diagnostic and must not be promoted into the final semantic graph. This boundary prevents a high similarity score from rewarding path fragmentation or shared empty space.

Machine-first TOON/JSON output makes the tool useful inside iterative agents and CI, while threshold exit codes remain a geometric gate rather than proof of brand or perceptual quality.

- [Pinned repository](https://github.com/wyrd-company/agent-svgtools/tree/0c62023d5ffd543c81b6247159af4128051b7a3f)
- [Rust source](https://github.com/wyrd-company/agent-svgtools/tree/0c62023d5ffd543c81b6247159af4128051b7a3f/src)
- [Agent reconstruction benchmark](https://github.com/wyrd-company/agent-svgtools/tree/0c62023d5ffd543c81b6247159af4128051b7a3f/benchmarks/raster-to-svg/owl)
- [Organization profile checked; no location published](https://github.com/wyrd-company)
